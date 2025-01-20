id sub_3BEC(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t vars8;

  v1 = a1;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:v1 value:&stru_8260 table:@"IMiCloudSettingsPlugin"];

  return v3;
}

void sub_4938(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _disablementOptionForUserNotificationResponse:v3];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "User chose disablement option {%ld} in IMUserNotificationCenter completion.", (uint8_t *)&v6, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void sub_5BFC(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x5B94);
  }
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(exc_buf);
}

void sub_5C5C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = [v10 error];

  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [v10 error];
        int v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "request quota with error: %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else
  {
    if (v12)
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = 67109120;
        LODWORD(v17) = [v10 hasMaxTier];
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "request quota returned: hasMaxTier: %d", (uint8_t *)&v16, 8u);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v10 hasMaxTier];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_5E04(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x5DA4);
  }
  _Unwind_Resume(a1);
}

uint64_t IMCloudKitIsEligibleToToggleMiCSwitch()
{
  return _IMCloudKitIsEligibleToToggleMiCSwitch();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__deviceNameString(void *a1, const char *a2, ...)
{
  return [a1 _deviceNameString];
}

id objc_msgSend__promptUserIfTheyWantToDisableOrCancel(void *a1, const char *a2, ...)
{
  return [a1 _promptUserIfTheyWantToDisableOrCancel];
}

id objc_msgSend__setupIMListener(void *a1, const char *a2, ...)
{
  return [a1 _setupIMListener];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_eligibleToToggleMiCSwitch(void *a1, const char *a2, ...)
{
  return [a1 eligibleToToggleMiCSwitch];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_fetchAccountStatusAndUpdateMiCSwitchEligibility(void *a1, const char *a2, ...)
{
  return [a1 fetchAccountStatusAndUpdateMiCSwitchEligibility];
}

id objc_msgSend_hasMaxTier(void *a1, const char *a2, ...)
{
  return [a1 hasMaxTier];
}

id objc_msgSend_hasSetupListener(void *a1, const char *a2, ...)
{
  return [a1 hasSetupListener];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mocAccountsMatch(void *a1, const char *a2, ...)
{
  return [a1 mocAccountsMatch];
}

id objc_msgSend_performAdditionalStorageRequiredCheck(void *a1, const char *a2, ...)
{
  return [a1 performAdditionalStorageRequiredCheck];
}

id objc_msgSend_purchasedMaxQuotaTier(void *a1, const char *a2, ...)
{
  return [a1 purchasedMaxQuotaTier];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_setupIMCloudKitHooks(void *a1, const char *a2, ...)
{
  return [a1 setupIMCloudKitHooks];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stringGUID(void *a1, const char *a2, ...)
{
  return [a1 stringGUID];
}

id objc_msgSend_tryToDisableAllDevices(void *a1, const char *a2, ...)
{
  return [a1 tryToDisableAllDevices];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:");
}