void sub_2FF0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  id v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(a1);
    v12 = +[AXSubsystemVisualAlerts sharedInstance];
    v13 = [v12 ignoreLogging];

    if ((v13 & 1) == 0)
    {
      v14 = +[AXSubsystemVisualAlerts identifier];
      v15 = AXLoggerForFacility();

      v16 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = AXColorizeFormatLog();
        v18 = _AXStringForArgs();
        if (os_log_type_enabled(v15, v16))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_0, v15, v16, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
    }

    objc_end_catch();
    JUMPOUT(0x2EE8);
  }
  _Unwind_Resume(a1);
}

void sub_33A8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    v12 = +[AXSubsystemVisualAlerts sharedInstance];
    unsigned __int8 v13 = [v12 ignoreLogging];

    if ((v13 & 1) == 0)
    {
      v14 = +[AXSubsystemVisualAlerts identifier];
      v15 = AXLoggerForFacility();

      os_log_type_t v16 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = AXColorizeFormatLog();
        v18 = _AXStringForArgs();
        if (os_log_type_enabled(v15, v16))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_0, v15, v16, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
    }

    objc_end_catch();
    JUMPOUT(0x32A0);
  }
  _Unwind_Resume(a1);
}

uint64_t AXColorizeFormatLog()
{
  return _AXColorizeFormatLog();
}

uint64_t AXLoggerForFacility()
{
  return _AXLoggerForFacility();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return _AXOSLogLevelFromAXLogLevel();
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXStringForArgs()
{
  return __AXStringForArgs();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return [a1 ignoreLogging];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedVisualAlertManager(void *a1, const char *a2, ...)
{
  return [a1 sharedVisualAlertManager];
}

id objc_msgSend_unlockForConfiguration(void *a1, const char *a2, ...)
{
  return [a1 unlockForConfiguration];
}