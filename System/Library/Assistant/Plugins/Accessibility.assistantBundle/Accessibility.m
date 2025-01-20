void sub_2F5C(uint64_t a1, void *a2)
{
  AXAssistantCallCompletionWithSpeakThisError(*(void **)(a1 + 32), a2);
}

void sub_3014(uint64_t a1, void *a2)
{
}

void sub_30CC(uint64_t a1, void *a2)
{
}

void sub_3188(uint64_t a1, void *a2)
{
}

void sub_3240(uint64_t a1, void *a2)
{
}

BOOL AXAssistantSendMissingSettingFailure(void *a1)
{
  v1 = a1;
  int v2 = _AXSSpeakThisEnabled();
  if (!v2)
  {
    id v3 = objc_alloc((Class)SACommandFailed);
    id v4 = [v3 initWithErrorCode:SAAXScreenReaderSettingNotEnabledErrorCode];
    v5 = [v4 dictionary];
    v1[2](v1, v5);
  }
  return v2 == 0;
}

void AXAssistantCallCompletionWithSpeakThisError(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4)
  {
LABEL_14:
    id v11 = (id)objc_opt_new();
    goto LABEL_15;
  }
  v5 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    v16 = "AXAssistantCallCompletionWithSpeakThisError";
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s Error when performing command: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  v6 = [v4 domain];
  unsigned int v7 = [v6 isEqualToString:STSErrorDomain];

  if (v7)
  {
    id v8 = [v4 code];
    v9 = (uint64_t *)&SAAXScreenReaderNothingToSpeakErrorCode;
    switch((unint64_t)v8)
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        v9 = (uint64_t *)&SAAXScreenReaderNothingBeingSpokenErrorCode;
        goto LABEL_11;
      case 3uLL:
        v9 = (uint64_t *)&SAAXScreenReaderSpeedAtMaxRateErrorCode;
        goto LABEL_11;
      case 4uLL:
        v9 = (uint64_t *)&SAAXScreenReaderSpeedAtMinRateErrorCode;
LABEL_11:
        uint64_t v10 = *v9;
        if (*v9 == 1337) {
          goto LABEL_12;
        }
        goto LABEL_8;
      case 5uLL:
      case 6uLL:
LABEL_12:
        v12 = AFSiriLogContextService;
        if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315138;
          v16 = "AXAssistantCallCompletionWithSpeakThisError";
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "%s Ignored error and returned success, since it wasn't important.", (uint8_t *)&v15, 0xCu);
        }
        break;
      default:
        goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v10 = 0;
LABEL_8:
  id v11 = [objc_alloc((Class)SACommandFailed) initWithErrorCode:v10];
LABEL_15:
  v13 = v11;
  v14 = [v11 dictionary];
  v3[2](v3, v14);
}

void sub_35C0(uint64_t a1, void *a2)
{
}

void sub_3678(uint64_t a1, void *a2)
{
}

uint64_t _AXSSpeakThisEnabled()
{
  return __AXSSpeakThisEnabled();
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_speakThisWithOptions_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speakThisWithOptions:errorHandler:");
}