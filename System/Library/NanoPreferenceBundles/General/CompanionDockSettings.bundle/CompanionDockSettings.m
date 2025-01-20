id sub_33D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_3BA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_3E58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    return objc_msgSend(v1, "reloadSpecifier:animated:");
  }
  else {
    return [v1 reloadSpecifiers];
  }
}

void sub_3F90(uint64_t a1, void *a2)
{
  id v34 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232), a2);
  uint64_t v4 = +[NSMutableArray array];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v4;

  uint64_t v7 = +[NSMutableArray array];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 248);
  *(void *)(v8 + 248) = v7;

  v10 = +[NSMutableArray array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v11 = *(id *)(*(void *)(a1 + 32) + 232);
  id v12 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*(void *)(a1 + 32) + 232) objectForKeyedSubscript:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v13);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v17 = *(id *)(a1 + 40);
  id v18 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v40;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*(void *)(a1 + 32) + 232) objectForKeyedSubscript:*(void *)(*((void *)&v39 + 1) + 8 * (void)j)];
        v23 = v22;
        if (v22)
        {
          v24 = *(void **)(*(void *)(a1 + 32) + 240);
          v25 = [v22 bundleIdentifier];
          [v24 addObject:v25];

          [v10 removeObject:v23];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v19);
  }

  [v10 sortUsingComparator:&stru_8250];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v26 = v10;
  id v27 = [v26 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v36;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*(void *)(a1 + 32) + 248);
        v32 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)k) bundleID];
        [v31 addObject:v32];
      }
      id v28 = [v26 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v28);
  }

  uint64_t v33 = *(void *)(a1 + 48);
  if (v33) {
    (*(void (**)(void))(v33 + 16))();
  }
}

int64_t sub_42F4(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

id sub_4368(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_445C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_4B00(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 232);
  id v4 = a2;
  id v7 = [v3 objectForKeyedSubscript:v4];
  uint64_t v5 = [v7 localizedName];
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:*(void *)(a1 + 32) set:"_setActiveState:forSpecifier:" get:"_activeStateForSpecifier:" detail:0 cell:-1 edit:0];

  [v6 setApp:v7];
  [v6 setIdentifier:v4];
  [v6 setProperty:v4 forKey:PSLazyIconAppID];

  [v6 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [*(id *)(*(void *)(a1 + 32) + 216) addObject:v6];
}

void sub_579C(uint64_t a1, char a2)
{
  v3 = +[NSNumber numberWithBool:a2 & 1];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not find destination index for setting specifier: %@ to active: %@", (uint8_t *)&v4, 0x16u);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_MRUOrderingSpecifier(void *a1, const char *a2, ...)
{
  return [a1 MRUOrderingSpecifier];
}

id objc_msgSend__hasMaximumNumberOfActiveApps(void *a1, const char *a2, ...)
{
  return [a1 _hasMaximumNumberOfActiveApps];
}

id objc_msgSend__prepareSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _prepareSpecifiers];
}

id objc_msgSend__saveSettings(void *a1, const char *a2, ...)
{
  return [a1 _saveSettings];
}

id objc_msgSend__updateOrderingFooterForSelectedSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _updateOrderingFooterForSelectedSpecifier];
}

id objc_msgSend_activeGroupSectionIndex(void *a1, const char *a2, ...)
{
  return [a1 activeGroupSectionIndex];
}

id objc_msgSend_app(void *a1, const char *a2, ...)
{
  return [a1 app];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_favorites(void *a1, const char *a2, ...)
{
  return [a1 favorites];
}

id objc_msgSend_favoritesOrderingSpecifier(void *a1, const char *a2, ...)
{
  return [a1 favoritesOrderingSpecifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inactiveGroupSectionIndex(void *a1, const char *a2, ...)
{
  return [a1 inactiveGroupSectionIndex];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_maximumFavorites(void *a1, const char *a2, ...)
{
  return [a1 maximumFavorites];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_orderingGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 orderingGroupSpecifier];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_spinnerSpecifier(void *a1, const char *a2, ...)
{
  return [a1 spinnerSpecifier];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_useMRUOrdering(void *a1, const char *a2, ...)
{
  return [a1 useMRUOrdering];
}