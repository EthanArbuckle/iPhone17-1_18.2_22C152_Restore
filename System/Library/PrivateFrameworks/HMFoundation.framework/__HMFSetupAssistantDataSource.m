@interface __HMFSetupAssistantDataSource
- (BOOL)isMigrating;
- (HMFSystemInfoMigrationDataSourceDelegate)delegate;
- (__HMFSetupAssistantDataSource)init;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation __HMFSetupAssistantDataSource

- (void)setDelegate:(id)a3
{
}

- (__HMFSetupAssistantDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)__HMFSetupAssistantDataSource;
  v2 = [(__HMFSetupAssistantDataSource *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    if (SetupAssistantLibraryCore())
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef BYSetupAssistantFinishedDarwinNotification = (const __CFString *)getBYSetupAssistantFinishedDarwinNotification();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)__migrationFinishedCallback, BYSetupAssistantFinishedDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return v3;
}

- (void)dealloc
{
  v2 = self;
  if (SetupAssistantLibraryCore())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef BYSetupAssistantFinishedDarwinNotification = (const __CFString *)getBYSetupAssistantFinishedDarwinNotification();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v2, BYSetupAssistantFinishedDarwinNotification, 0);
  }

  v5.receiver = v2;
  v5.super_class = (Class)__HMFSetupAssistantDataSource;
  [(__HMFSetupAssistantDataSource *)&v5 dealloc];
}

- (BOOL)isMigrating
{
  uint64_t v2 = SetupAssistantLibraryCore();
  if (v2)
  {
    uint64_t v7 = 0;
    objc_super v8 = &v7;
    uint64_t v9 = 0x2020000000;
    v3 = (uint64_t (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
    v10 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
    if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
    {
      v4 = (void *)SetupAssistantLibrary();
      v8[3] = (uint64_t)dlsym(v4, "BYSetupAssistantNeedsToRun");
      getBYSetupAssistantNeedsToRunSymbolLoc_ptr = (_UNKNOWN *)v8[3];
      v3 = (uint64_t (*)(void))v8[3];
    }
    _Block_object_dispose(&v7, 8);
    if (!v3)
    {
      dlerror();
      objc_super v5 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v7, 8);
      _Unwind_Resume(v5);
    }
    LOBYTE(v2) = v3();
  }
  return v2;
}

- (HMFSystemInfoMigrationDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFSystemInfoMigrationDataSourceDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end