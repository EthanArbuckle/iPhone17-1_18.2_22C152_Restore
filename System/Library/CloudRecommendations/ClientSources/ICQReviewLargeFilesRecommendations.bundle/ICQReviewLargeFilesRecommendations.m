void sub_2E0C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void (*v11)(void);
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *i;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  id v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_3348(v9, v10);
    }

    v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_5:
    v11();
    goto LABEL_22;
  }
  if (![v8 count])
  {
    v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v7;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "No recommendations available for Review Large Files because there are no files larger than %@ MB", buf, 0xCu);
    }

    v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  v43 = v7;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = v8;
  v13 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
  v44 = a1;
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(void *)v46;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = [*(id *)(*((void *)&v45 + 1) + 8 * i) documentSize];
        v15 += (uint64_t)[v18 integerValue];
      }
      v14 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }
  v40 = v8;

  v20 = objc_alloc((Class)CENativeModalRecommendationAction);
  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"REVIEW_LARGE_FILES_TIP_ACTION" value:&stru_41E8 table:@"Localizable"];
  v23 = [v20 initWithIdentifier:@"com.apple.quota-reviewLargeFiles" title:v22 detailControllerClass:objc_opt_class()];

  v24 = +[ICQUICoreSpotlightQueryHelper totalSizeStringForItems:v12];
  v25 = +[NSBundle bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"REVIEW_LARGE_FILES_TIP_MESSAGE" value:&stru_41E8 table:@"Localizable"];
  v41 = (void *)v24;
  v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v24);

  v28 = objc_alloc((Class)CERecommendation);
  v29 = +[NSBundle bundleForClass:objc_opt_class()];
  v30 = [v29 localizedStringForKey:@"REVIEW_LARGE_FILES_TIP_TITLE" value:&stru_41E8 table:@"Localizable"];
  v31 = [*(id *)(v44 + 32) bundleID];
  v32 = +[NSNumber numberWithInteger:v15];
  v33 = CERecommendationTypeDeclutter;
  v42 = v23;
  v50 = v23;
  v34 = +[NSArray arrayWithObjects:&v50 count:1];
  v35 = [v28 initWithIdentifier:@"com.apple.quota-reviewLargeFiles" title:v30 message:v27 bundleID:v31 storageRecoverable:v32 category:v33 actions:v34];

  v36 = _ICQGetLogSystem();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = [v12 count];
    *(_DWORD *)buf = 134217984;
    v53 = v37;
    _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Review Large Files recommendation found %ld items", buf, 0xCu);
  }

  v38 = *(void *)(v44 + 40);
  v49 = v35;
  v39 = +[NSArray arrayWithObjects:&v49 count:1];
  (*(void (**)(uint64_t, void *, void))(v38 + 16))(v38, v39, 0);

  v7 = v43;
  v8 = v40;
LABEL_22:
}

void sub_3304(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Recommendations feature flag is disabled. Skipping Review Large Files recommendation.", v1, 2u);
}

void sub_3348(void *a1, NSObject *a2)
{
  v3 = [a1 localizedDescription];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "No recommendations available for Review Large Files due to error: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t _ICQGetLogSystem()
{
  return __ICQGetLogSystem();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_documentSize(void *a1, const char *a2, ...)
{
  return [a1 documentSize];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isFeatureFlagEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFeatureFlagEnabled];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_updateThresholdsForLargeFilesWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateThresholdsForLargeFilesWithDictionary:");
}