@interface BLSHCriticalAssertTester
- (BLSHCriticalAssertTester)initWithNotificationName:(id)a3;
- (void)_triggerTestCriticalAssert:(id)a3;
@end

@implementation BLSHCriticalAssertTester

- (BLSHCriticalAssertTester)initWithNotificationName:(id)a3
{
  v4 = (__CFString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)BLSHCriticalAssertTester;
  v5 = [(BLSHCriticalAssertTester *)&v8 init];
  if (v5)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_triggerTestCriticalAssert, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v5;
}

- (void)_triggerTestCriticalAssert:(id)a3
{
  id v5 = a3;
  v6 = [NSString stringWithFormat:@"Test Critical Assert did fail: %@", v5];
  BLSHRecordCriticalAssertFailure(v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__BLSHCriticalAssertTester__triggerTestCriticalAssert___block_invoke;
  v10[3] = &unk_2645324E8;
  v12 = self;
  SEL v13 = a2;
  id v11 = v5;
  id v7 = v5;
  objc_super v8 = (void (**)(void))MEMORY[0x223C5E2B0](v10);
  if (BLSHIsUnitTestRunning())
  {
    v8[2](v8);
  }
  else
  {
    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    dispatch_after(v9, MEMORY[0x263EF83A0], v8);
  }
}

void __55__BLSHCriticalAssertTester__triggerTestCriticalAssert___block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"BLSHCriticalAssertDidFailNotification", 0, 0, 4u);
  v3 = [NSString stringWithFormat:@"Test Critical Assert did fail: %@", *(void *)(a1 + 32)];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544642;
    dispatch_time_t v9 = v4;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    v15 = @"BLSHCriticalAssertTester.m";
    __int16 v16 = 1024;
    int v17 = 27;
    __int16 v18 = 2114;
    v19 = v3;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v3 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

@end