@interface BKUserEventTimerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsTimerDisabled;
- (double)_axDesiredTimeout;
- (int)_axDesiredMode;
- (void)_axSetDesiredMode:(int)a3;
- (void)_axSetDesiredTimeout:(double)a3;
- (void)_axSetTimerDisabled:(BOOL)a3;
- (void)resetTimer:(double)a3 mode:(int)a4;
@end

@implementation BKUserEventTimerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUserEventTimer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_axSetDesiredTimeout:(double)a3
{
  _DesiredTimeout = *(void *)&a3;
}

- (double)_axDesiredTimeout
{
  return *(double *)&_DesiredTimeout;
}

- (void)_axSetDesiredMode:(int)a3
{
  _DesiredMode = a3;
}

- (int)_axDesiredMode
{
  return _DesiredMode;
}

- (BOOL)_axIsTimerDisabled
{
  return _IsTimerDisabled;
}

- (void)_axSetTimerDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(BKUserEventTimerAccessibility *)self _axIsTimerDisabled] != a3)
  {
    v5 = AXLogBackboardServer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      _os_log_impl(&dword_241F5C000, v5, OS_LOG_TYPE_DEFAULT, "setting idle timer disabled: %d", buf, 8u);
    }

    if (v3)
    {
      *(void *)buf = 0;
      v17 = buf;
      uint64_t v18 = 0x2020000000;
      uint64_t v19 = 0;
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      int v15 = 0;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __53__BKUserEventTimerAccessibility__axSetTimerDisabled___block_invoke;
      v11[3] = &unk_26510BB10;
      v11[4] = self;
      v11[5] = buf;
      v11[6] = &v12;
      v6 = (void (**)(void))MEMORY[0x2456443D0](v11);
      v7 = [(BKUserEventTimerAccessibility *)self safeValueForKey:@"_queue"];
      v8 = __UIAccessibilityCastAsProtocol();

      if (v8)
      {
        dispatch_sync(v8, v6);
      }
      else
      {
        v10 = AXLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          -[BKUserEventTimerAccessibility _axSetTimerDisabled:](v10);
        }

        v6[2](v6);
      }
      [(BKUserEventTimerAccessibility *)self _axSetDesiredTimeout:*((double *)v17 + 3)];
      [(BKUserEventTimerAccessibility *)self _axSetDesiredMode:*((unsigned int *)v13 + 6)];
      [(BKUserEventTimerAccessibility *)self resetTimer:0 mode:-1.0];
      _IsTimerDisabled = v3;

      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      _IsTimerDisabled = 0;
      [(BKUserEventTimerAccessibility *)self _axDesiredTimeout];
      [(BKUserEventTimerAccessibility *)self resetTimer:[(BKUserEventTimerAccessibility *)self _axDesiredMode] mode:v9];
    }
  }
}

void __53__BKUserEventTimerAccessibility__axSetTimerDisabled___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"_currentTimeout"];
  [v2 doubleValue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;

  id v4 = [*(id *)(a1 + 32) safeValueForKey:@"_currentMode"];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 intValue];
}

- (void)resetTimer:(double)a3 mode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(BKUserEventTimerAccessibility *)self _axIsTimerDisabled])
  {
    v7 = AXLogBackboardServer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v10 = a3;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_241F5C000, v7, OS_LOG_TYPE_DEFAULT, "Someone asked to reset idle timer but it is disabled by accessibility. timeout: %f mode: %d", buf, 0x12u);
    }

    [(BKUserEventTimerAccessibility *)self _axSetDesiredTimeout:a3];
    [(BKUserEventTimerAccessibility *)self _axSetDesiredMode:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BKUserEventTimerAccessibility;
    [(BKUserEventTimerAccessibility *)&v8 resetTimer:v4 mode:a3];
  }
}

- (void)_axSetTimerDisabled:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_241F5C000, log, OS_LOG_TYPE_FAULT, "Couldn't get the internal queue for BKUserEventTimer. This can lead to us accidentally making the timer get stuck off.", v1, 2u);
}

@end