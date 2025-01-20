uint64_t sub_100004558(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  double v34;
  double v35;
  void *v36;
  void *v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  unsigned char v42[128];

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_27;
  }
  v4 = ELSSubDefaultQueueEntryType;
  v5 = [v3 objectForKeyedSubscript:ELSSubDefaultQueueEntryType];
  if (!v5) {
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  v6 = +[ELSWhitelist findEntryForParameterName:v5];

  if (!v6) {
    goto LABEL_26;
  }

  v5 = [v3 objectForKeyedSubscript:ELSParameterPayload];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
    v7 = [*(id *)(a1 + 32) parameterPayloads];
    if (!v7) {
      goto LABEL_26;
    }
    v8 = (void *)v7;
    v9 = [*(id *)(a1 + 32) parameterPayloads];
    v10 = [v9 allKeys];
    v11 = [v10 containsObject:v5];

    if ((v11 & 1) == 0)
    {
LABEL_26:

LABEL_27:
      v32 = 0;
      goto LABEL_28;
    }
  }

  v12 = [v3 objectForKeyedSubscript:ELSSubDefaultQueueEntryExecuteAfterDuration];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [v12 doubleValue];
      if (v34 < 0.0 || ([v12 doubleValue], v35 > 2419200.0))
      {

        goto LABEL_27;
      }
    }
  }

  v13 = [v3 objectForKeyedSubscript:ELSSubDefaultQueueEntryRetry];
  if (v13)
  {
    v14 = (void *)v13;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_27;
    }
  }
  v16 = [v3 objectForKeyedSubscript:v4];
  v17 = +[ELSWhitelist findEntryForParameterName:v16];

  v18 = [v3 objectForKeyedSubscript:ELSSubDefaultQueueEntryPlatform];
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_27;
    }
  }
  v19 = [v18 componentsSeparatedByString:@","];
  v20 = v19;
  if (v19 && [v19 count])
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v21 = v20;
    v22 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v22)
    {
      v23 = v22;
      v36 = v20;
      v37 = v18;
      v24 = *(void *)v39;
      while (2)
      {
        v25 = 0;
        do
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v25);
          v27 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          v28 = [v26 stringByTrimmingCharactersInSet:v27];

          v29 = [v17 platformAvailability];
          v30 = [v28 lowercaseString];
          v31 = [v29 containsObject:v30];

          if (!v31)
          {
            v32 = 0;
            goto LABEL_35;
          }
          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        v23 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v23) {
          continue;
        }
        break;
      }
      v32 = 1;
LABEL_35:
      v20 = v36;
      v18 = v37;
    }
    else
    {
      v32 = 1;
    }
  }
  else
  {
    v32 = 1;
  }

LABEL_28:
  return v32;
}

BOOL sub_100004964(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 objectForKeyedSubscript:ELSSubDefaultConsentHandleEntryHandle];
    BOOL v4 = 0;
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v4 = 1;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_100004CAC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inputs];
  id v3 = [v2 command];

  switch((unint64_t)v3)
  {
    case 0uLL:
      v6 = *(void **)(a1 + 32);
      uint64_t v7 = 1;
      goto LABEL_4;
    case 1uLL:
      v6 = *(void **)(a1 + 32);
      uint64_t v7 = 0;
LABEL_4:
      uint64_t v8 = 0;
      goto LABEL_8;
    case 2uLL:
      v6 = *(void **)(a1 + 32);
      uint64_t v7 = 0;
      goto LABEL_7;
    case 3uLL:
      v6 = *(void **)(a1 + 32);
      uint64_t v7 = 1;
LABEL_7:
      uint64_t v8 = 1;
LABEL_8:
      [v6 enrollWithFlush:v7 commit:v8];
      break;
    case 4uLL:
      v9 = *(void **)(a1 + 32);
      [v9 unenroll:v4, v5];
      break;
    default:
      return;
  }
}

void sub_100005138(id a1, ELSSnapshot *a2)
{
}

id sub_100005144(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithStatusCode:&off_1000084B0 metadata:0];
}

void sub_100005800(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 queue];

  if (v3)
  {
    uint64_t v4 = [v13 queue];
    id v5 = [v4 mutableCopy];

    [v5 addObjectsFromArray:*(void *)(a1 + 32)];
    v6 = +[NSArray arrayWithArray:v5];
    [v13 setQueue:v6];
  }
  else
  {
    [v13 setQueue:*(void *)(a1 + 32)];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v7 = [*(id *)(a1 + 40) aggregateMetadata];
    [v13 setMetadata:v7];

    uint64_t v8 = [*(id *)(a1 + 40) inputs];
    v9 = [v8 followUpOptions];
    [v13 setFollowUpOptions:v9];

    [v13 setStatus:2];
    v10 = [*(id *)(a1 + 40) inputs];
    [v13 setRetriesRemaining:[v10 retries]];

    v11 = [*(id *)(a1 + 40) inputs];
    v12 = [v11 consentHandles];
    [v13 setConsentHandles:v12];
  }
  else
  {
    [v13 setStatus:1];
  }
}

void sub_10000598C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 metadata];
  [v2 finishWithStatusCode:&off_1000084B0 metadata:v3];
}

void sub_100005F58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005F80()
{
  sub_100005F74();
  sub_100005F58((void *)&_mh_execute_header, v0, v1, "Enhanced logging already running, cannot enroll", v2, v3, v4, v5, v6);
}

void sub_100005FB4()
{
  sub_100005F74();
  sub_100005F58((void *)&_mh_execute_header, v0, v1, "Enhanced logging not already running, cannot unenroll", v2, v3, v4, v5, v6);
}

void sub_100005FE8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Enhanced logging already queued for: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100006080()
{
  sub_100005F74();
  sub_100005F58((void *)&_mh_execute_header, v0, v1, "Attempted to commit an empty queue to enhanced logging state", v2, v3, v4, v5, v6);
}

void sub_1000060B4()
{
  sub_100005F74();
  sub_100005F58((void *)&_mh_execute_header, v0, v1, "Could not open Apple Account Store", v2, v3, v4, v5, v6);
}

void sub_1000060E8()
{
  sub_100005F74();
  sub_100005F58((void *)&_mh_execute_header, v0, v1, "Could not find primary Apple Account", v2, v3, v4, v5, v6);
}

void sub_10000611C()
{
  sub_100005F74();
  sub_100005F58((void *)&_mh_execute_header, v0, v1, "Could not find primary Apple Account username", v2, v3, v4, v5, v6);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

id objc_msgSend_aggregateMetadata(void *a1, const char *a2, ...)
{
  return [a1 aggregateMetadata];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_consentHandles(void *a1, const char *a2, ...)
{
  return [a1 consentHandles];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_followUpOptions(void *a1, const char *a2, ...)
{
  return [a1 followUpOptions];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_parameterPayloads(void *a1, const char *a2, ...)
{
  return [a1 parameterPayloads];
}

id objc_msgSend_platformAvailability(void *a1, const char *a2, ...)
{
  return [a1 platformAvailability];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rawParameters(void *a1, const char *a2, ...)
{
  return [a1 rawParameters];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_retries(void *a1, const char *a2, ...)
{
  return [a1 retries];
}

id objc_msgSend_retry(void *a1, const char *a2, ...)
{
  return [a1 retry];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_specificationPayloads(void *a1, const char *a2, ...)
{
  return [a1 specificationPayloads];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}