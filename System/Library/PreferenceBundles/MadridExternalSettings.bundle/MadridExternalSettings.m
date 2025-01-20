void sub_3DD0(uint64_t a1)
{
  void *v2;
  const void *v3;
  id v4;
  uint64_t vars8;

  v2 = [*(id *)(a1 + 32) sliderValues];
  objc_msgSend(v2, "objectAtIndex:", (int)objc_msgSend(*(id *)(a1 + 40), "intValue"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ([v4 integerValue]) {
    v3 = v4;
  }
  else {
    v3 = 0;
  }
  CFPreferencesSetAppValue(@"TimestampInterval", v3, @"com.apple.MobileSMS");
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  +[CNFInternalSettingsUtilities killMobileSMS];
}

void sub_4900(id a1)
{
}

void sub_4908(id a1)
{
}

void sub_51EC(id a1, IMUserNotification *a2)
{
  if (![(IMUserNotification *)a2 response])
  {
    v2 = +[NSArray arrayWithObjects:@"~/Library/Logs/Messages/", @"~/Library/Logs/CrashReporter/Messages/", @"~/Library/Logs/PersistentConnection/", @"~/Library/Logs/CrashReporter/LogTaxi/com.apple.madrid.NanoMadridLogTaxi/", 0];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          v7 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v6);
          v8 = +[NSFileManager defaultManager];
          v9 = [v7 stringByResolvingAndStandardizingPath];
          [v8 removeItemAtPath:v9 error:0];

          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
  }
}

void sub_548C(id a1)
{
  +[CNFInternalSettingsUtilities nukeKeychain];

  +[CNFInternalSettingsUtilities killEverything];
}

void sub_7A80(id a1, UITextField *a2)
{
}

void sub_7A90(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textFields];
  id v3 = [v2 firstObject];
  id v11 = [v3 text];

  if ([v11 length])
  {
    [*(id *)(a1 + 40) _setHandleAsChina:v11];
    id v4 = +[PSSpecifier preferenceSpecifierNamed:v11 target:*(void *)(a1 + 40) set:0 get:0 detail:0 cell:4 edit:0];
    id v5 = objc_alloc((Class)NSMutableArray);
    uint64_t v6 = OBJC_IVAR___PSListController__specifiers;
    id v7 = [v5 initWithArray:*(void *)(*(void *)(a1 + 40) + OBJC_IVAR___PSListController__specifiers)];
    objc_msgSend(v7, "insertObject:atIndex:", v4, (char *)objc_msgSend(v7, "count") - 1);
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = *(void **)(v8 + v6);
    *(void *)(v8 + v6) = v7;
    id v10 = v7;

    [*(id *)(a1 + 40) reload];
  }
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CNFGetAppBooleanValueForKey()
{
  return _CNFGetAppBooleanValueForKey();
}

uint64_t CNFGetSharedBooleanValueForKey()
{
  return _CNFGetSharedBooleanValueForKey();
}

uint64_t CNFGetSharedIntegerForKey()
{
  return _CNFGetSharedIntegerForKey();
}

uint64_t CNFIsPushLoggingEnabled()
{
  return _CNFIsPushLoggingEnabled();
}

uint64_t CNFRegistrationLogLevel()
{
  return _CNFRegistrationLogLevel();
}

uint64_t CNFSetAppBooleanValueForKey()
{
  return _CNFSetAppBooleanValueForKey();
}

uint64_t CNFSetBasebandLoggingEnabled()
{
  return _CNFSetBasebandLoggingEnabled();
}

uint64_t CNFSetPushLoggingEnabled()
{
  return _CNFSetPushLoggingEnabled();
}

uint64_t CNFSetRegistrationLogLevel()
{
  return _CNFSetRegistrationLogLevel();
}

uint64_t CNFSetSharedBooleanValueForKey()
{
  return _CNFSetSharedBooleanValueForKey();
}

uint64_t CNFSetSharedIntegerForKey()
{
  return _CNFSetSharedIntegerForKey();
}

uint64_t CNFSetiMessageLogLevel()
{
  return _CNFSetiMessageLogLevel();
}

uint64_t CNFSyncPreferences()
{
  return _CNFSyncPreferences();
}

uint64_t CNFSyncSharedPreferences()
{
  return _CNFSyncSharedPreferences();
}

uint64_t CNFiMessageLogLevel()
{
  return _CNFiMessageLogLevel();
}

uint64_t MarcoActionWithUserInfo()
{
  return _MarcoActionWithUserInfo();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PSRoundToPixel()
{
  return _PSRoundToPixel();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientSetProperty()
{
  return _WiFiManagerClientSetProperty();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return [a1 ID];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__getExternalChinaHandles(void *a1, const char *a2, ...)
{
  return [a1 _getExternalChinaHandles];
}

id objc_msgSend__startListeningForReturnKey(void *a1, const char *a2, ...)
{
  return [a1 _startListeningForReturnKey];
}

id objc_msgSend__stopListeningForReturnKey(void *a1, const char *a2, ...)
{
  return [a1 _stopListeningForReturnKey];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_automationOptions(void *a1, const char *a2, ...)
{
  return [a1 automationOptions];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return [a1 control];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return [a1 firstResponder];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_iMessageService(void *a1, const char *a2, ...)
{
  return [a1 iMessageService];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_killMobileSMS(void *a1, const char *a2, ...)
{
  return [a1 killMobileSMS];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loginIMHandle(void *a1, const char *a2, ...)
{
  return [a1 loginIMHandle];
}

id objc_msgSend_madridBasicLoggingDefaults(void *a1, const char *a2, ...)
{
  return [a1 madridBasicLoggingDefaults];
}

id objc_msgSend_maximumValue(void *a1, const char *a2, ...)
{
  return [a1 maximumValue];
}

id objc_msgSend_minimumValue(void *a1, const char *a2, ...)
{
  return [a1 minimumValue];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_nukeKeychain(void *a1, const char *a2, ...)
{
  return [a1 nukeKeychain];
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return [a1 publicToken];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return [a1 reload];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_remote(void *a1, const char *a2, ...)
{
  return [a1 remote];
}

id objc_msgSend_repetitions(void *a1, const char *a2, ...)
{
  return [a1 repetitions];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_signOutAllAccounts(void *a1, const char *a2, ...)
{
  return [a1 signOutAllAccounts];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_sliderValues(void *a1, const char *a2, ...)
{
  return [a1 sliderValues];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_stringByResolvingAndStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByResolvingAndStandardizingPath];
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return [a1 stroke];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textFields(void *a1, const char *a2, ...)
{
  return [a1 textFields];
}

id objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:");
}