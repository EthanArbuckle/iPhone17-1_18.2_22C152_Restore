void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id ea_getFormattedDatePrint(void *a1, BOOL *a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v4 setFormatOptions:1907];
  v5 = [v4 dateFromString:v3];
  v6 = v5;
  if (!v5)
  {
    id v11 = v3;
    goto LABEL_14;
  }
  [v5 timeIntervalSinceNow];
  *a2 = v7 < 0.0;
  v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.cmas.bundle"];
  if ([v8 isDateInToday:v6])
  {
    v10 = @"TODAY";
  }
  else if ([v8 isDateInTomorrow:v6])
  {
    v10 = @"TOMORROW";
  }
  else
  {
    if (([v8 isDateInYesterday:v6] & 1) == 0)
    {
      id v13 = objc_alloc_init(MEMORY[0x263F08790]);
LABEL_12:
      [v13 setLocalizedDateFormatFromTemplate:@"MMMMd"];
      v12 = [v13 stringFromDate:v6];
      goto LABEL_13;
    }
    v10 = @"YESTERDAY";
  }
  v12 = [v9 localizedStringForKey:v10 value:&stru_26DA418D0 table:0];
  id v13 = objc_alloc_init(MEMORY[0x263F08790]);
  if (!v12) {
    goto LABEL_12;
  }
LABEL_13:
  [v13 setDateFormat:@"hh:mm a"];
  v14 = [v13 stringFromDate:v6];
  id v11 = [v12 stringByAppendingFormat:@", %@", v14];

LABEL_14:
  return v11;
}

void *ea_isValidString(void *result)
{
  if (result) {
    return (void *)([result length] != 0);
  }
  return result;
}

uint64_t ea_getEpochTimestamp()
{
  v0 = NSNumber;
  v1 = [MEMORY[0x263EFF910] date];
  [v1 timeIntervalSince1970];
  v2 = objc_msgSend(v0, "numberWithDouble:");
  uint64_t v3 = [v2 integerValue];

  return v3;
}

id ea_getHashForString(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v1 = (const char *)[a1 UTF8String];
    CC_LONG v2 = strlen(v1);
    CC_SHA256(v1, v2, md);
    uint64_t v3 = [MEMORY[0x263F089D8] stringWithCapacity:32];
    for (uint64_t i = 0; i != 16; ++i)
      objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void ea_sendSafetyAlertTapIndication(void *a1, uint64_t a2)
{
  v9[3] = *MEMORY[0x263EF8340];
  v9[0] = a1;
  v8[0] = @"WeaMessage";
  v8[1] = @"WeaHash";
  id v3 = a1;
  id v4 = ea_getHashForString(v3);
  v9[1] = v4;
  v8[2] = @"UserInteractionType";
  v5 = [NSNumber numberWithInt:a2];
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  uint64_t v7 = [MEMORY[0x263F66938] sharedInterface];

  [v7 onUserTappedOnWeaWithInfo:v6];
}

void EARegisterUserNotificationsLogging()
{
  if (EARegisterUserNotificationsLogging_onceToken != -1) {
    dispatch_once(&EARegisterUserNotificationsLogging_onceToken, &__block_literal_global_0);
  }
}

uint64_t __EARegisterUserNotificationsLogging_block_invoke()
{
  EALogDefault = (uint64_t)os_log_create((const char *)EALogSubsystem, "Default");
  return MEMORY[0x270F9A758]();
}

void EAHandleCellBroadcastMessageReceivedNotification(int a1, uint64_t a2, CFTypeRef cf, uint64_t a4, const void *a5)
{
  CFRetain(cf);
  CFRetain(a5);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __EAHandleCellBroadcastMessageReceivedNotification_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = a5;
  block[5] = a2;
  block[6] = cf;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __EAHandleCellBroadcastMessageReceivedNotification_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  CC_LONG v2 = EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_2266B8000, v2, OS_LOG_TYPE_DEFAULT, "Received broadcast message notification %{public}@", (uint8_t *)&v4, 0xCu);
  }
  if (*(void *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 40) _cellBroadcastMessageReceived:*(void *)(a1 + 32)];
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t TURemoveTelephonyCenterObserver()
{
  return MEMORY[0x270F7CB78]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}