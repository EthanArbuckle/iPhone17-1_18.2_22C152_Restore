double MailTableCellTextLeftForLevel(uint64_t a1)
{
  if (a1 < 1) {
    return 59.0;
  }
  if (a1 == 1) {
    return 90.0;
  }
  return (float)((float)(a1 - 1) * 30.0) + 90.0;
}

double MailTableCellImageCenterForLevel(uint64_t a1)
{
  if (a1 < 1)
  {
    double v1 = 49.5;
  }
  else if (a1 == 1)
  {
    double v1 = 80.5;
  }
  else
  {
    double v1 = (float)((float)(a1 - 1) * 30.0) + 90.0 + -9.5;
  }
  double v2 = 32.0;
  if (a1) {
    double v2 = 23.0;
  }
  return v1 + v2 * -0.5;
}

uint64_t __ScheduleSettingsDataclassIsFetchy_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t result = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x263EFB438], *MEMORY[0x263EFB3F0], *MEMORY[0x263EFB3E0], *MEMORY[0x263EFB478], *MEMORY[0x263EFB3C0], *MEMORY[0x263EFB460], 0);
  ScheduleSettingsDataclassIsFetchy_fetchyDataclassSet = result;
  return result;
}

uint64_t _DAFoldersThatExternalClientsCareAboutChanged(uint64_t a1, void *a2)
{
  return [a2 _reloadFoldersAndSpecifiersForced:0];
}

uint64_t _DAFolderHierarchyChanged(uint64_t a1, void *a2)
{
  return [a2 _reloadFoldersAndSpecifiersForced:1];
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void NSLog(NSString *format, ...)
{
}

uint64_t PCSettingsGetClassPollInterval()
{
  return MEMORY[0x270F535E0]();
}

uint64_t PCSettingsGetClassPushEnabled()
{
  return MEMORY[0x270F535E8]();
}

uint64_t PCSettingsPurgeDictionariesExceptForCurrent()
{
  return MEMORY[0x270F53600]();
}

uint64_t PCSettingsSetClassPollInterval()
{
  return MEMORY[0x270F53608]();
}

uint64_t PCSettingsSetClassPushEnabled()
{
  return MEMORY[0x270F53610]();
}

uint64_t PCSettingsSetStyle()
{
  return MEMORY[0x270F53618]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x270F5D188]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F06270]();
}

uint64_t _PCSettingsGetStyle()
{
  return MEMORY[0x270F53620]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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