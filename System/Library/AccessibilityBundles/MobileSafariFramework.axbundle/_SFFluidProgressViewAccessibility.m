@interface _SFFluidProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)_progressBarBoundsForValue:(double)a3;
- (id)_axProgressTimer;
- (void)_axCheckProgress;
- (void)_axHandleProgressComplete;
- (void)_axHandleProgressStart:(id)a3;
- (void)_axSetProgressTimer:(id)a3;
- (void)_finishProgressBarWithDuration:(double)a3;
- (void)fluidProgressController:(id)a3 setProgressToCurrentPosition:(id)a4;
- (void)fluidProgressController:(id)a3 startFluidProgressBar:(id)a4 animateFillFade:(BOOL)a5;
- (void)fluidProgressController:(id)a3 updateFluidProgressBar:(id)a4 completion:(id)a5;
- (void)fluidProgressControllerFinishProgressBar:(id)a3 animateFillFade:(BOOL)a4;
@end

@implementation _SFFluidProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFFluidProgressView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFFluidProgressView", @"fluidProgressController:setProgressToCurrentPosition:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFFluidProgressView", @"fluidProgressControllerFinishProgressBar:animateFillFade:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFFluidProgressView", @"fluidProgressController:startFluidProgressBar:animateFillFade:", "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFFluidProgressView", @"_finishProgressBarWithDuration:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFFluidProgressView", @"fluidProgressController:updateFluidProgressBar:completion:", "v", "@", "@", "@?", 0);
  [v3 validateClass:@"WBSFluidProgressState"];
  [v3 validateClass:@"_SFFluidProgressView" hasInstanceVariable:@"_clippingView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBSFluidProgressState", @"fluidProgressValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBSFluidProgressState", @"hasCompletedLoad", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFFluidProgressView", @"_progressBarBoundsForValue:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "d", 0);
}

- (id)_axProgressTimer
{
}

- (void)_axSetProgressTimer:(id)a3
{
}

- (CGRect)_progressBarBoundsForValue:(double)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)_SFFluidProgressViewAccessibility;
  -[_SFFluidProgressViewAccessibility _progressBarBoundsForValue:](&v20, sel__progressBarBoundsForValue_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(_SFFluidProgressViewAccessibility *)self _accessibilityViewIsVisible]&& vabdd_f64(*(double *)&_progressBarBoundsForValue__LastProgressValue, a3) > 0.05)
  {
    v13 = AXLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v22 = a3;
      _os_log_impl(&dword_2422E7000, v13, OS_LOG_TYPE_INFO, "Sending fluid progress notification in progressBar: %f", buf, 0xCu);
    }

    UIAccessibilityNotifications v14 = *MEMORY[0x263F81458];
    v15 = [NSNumber numberWithDouble:a3];
    UIAccessibilityPostNotification(v14, v15);

    _progressBarBoundsForValue__LastProgressValue = *(void *)&a3;
  }
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_finishProgressBarWithDuration:(double)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)_SFFluidProgressViewAccessibility;
  -[_SFFluidProgressViewAccessibility _finishProgressBarWithDuration:](&v7, sel__finishProgressBarWithDuration_);
  if ([(_SFFluidProgressViewAccessibility *)self _accessibilityViewIsVisible])
  {
    double v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v6 = [NSNumber numberWithDouble:a3];
      *(_DWORD *)buf = 138412546;
      double v9 = v6;
      __int16 v10 = 2112;
      double v11 = self;
      _os_log_impl(&dword_2422E7000, v5, OS_LOG_TYPE_INFO, "Progress bar done after: %@ %@", buf, 0x16u);
    }
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (void)fluidProgressController:(id)a3 updateFluidProgressBar:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFFluidProgressViewAccessibility;
  [(_SFFluidProgressViewAccessibility *)&v13 fluidProgressController:a3 updateFluidProgressBar:v8 completion:a5];
  [v8 fluidProgressValue];
  if (v9 > 0.0
    && [(_SFFluidProgressViewAccessibility *)self _accessibilityViewIsVisible])
  {
    [(_SFFluidProgressViewAccessibility *)self _axHandleProgressStart:v8];
    __int16 v10 = AXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2422E7000, v10, OS_LOG_TYPE_INFO, "Fluid progress notification posted", buf, 2u);
    }
  }
  else if ([v8 safeBoolForKey:@"hasCompletedLoad"])
  {
    [(_SFFluidProgressViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"StartedFluidProgress"];
    double v11 = AXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2422E7000, v11, OS_LOG_TYPE_INFO, "Completed load, marking started", buf, 2u);
    }

    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (void)_axCheckProgress
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  buf[0] = 0;
  id v3 = [(_SFFluidProgressViewAccessibility *)self safeValueForKey:@"_state"];
  v4 = __UIAccessibilitySafeClass();

  double v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    [v4 fluidProgressValue];
    *(_DWORD *)buf = 134217984;
    double v18 = v6;
    _os_log_impl(&dword_2422E7000, v5, OS_LOG_TYPE_INFO, "Check progress in axtimer: %f", buf, 0xCu);
  }

  [v4 fluidProgressValue];
  if (!v4) {
    goto LABEL_8;
  }
  double v8 = v7;
  double v9 = [(_SFFluidProgressViewAccessibility *)self safeUIViewForKey:@"_clippingView"];
  if (![v9 _accessibilityViewIsVisible]
    || ([v4 fluidProgressValue], v10 == 1.0)
    || [v4 hasCompletedLoad])
  {

LABEL_8:
    [(_SFFluidProgressViewAccessibility *)self _axHandleProgressComplete];
    goto LABEL_9;
  }
  int v11 = [v4 hasCanceledLoad];

  if (v11) {
    goto LABEL_8;
  }
  if (v8 > 0.0)
  {
    uint64_t v12 = AXLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v18 = v8;
      _os_log_impl(&dword_2422E7000, v12, OS_LOG_TYPE_INFO, "Sending fluid progress notification in setProgress: %f", buf, 0xCu);
    }

    [(_SFFluidProgressViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"StartedFluidProgress"];
    UIAccessibilityNotifications v13 = *MEMORY[0x263F81458];
    UIAccessibilityNotifications v14 = [NSNumber numberWithDouble:v8];
    UIAccessibilityPostNotification(v13, v14);

    v15 = [(_SFFluidProgressViewAccessibility *)self _axProgressTimer];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53___SFFluidProgressViewAccessibility__axCheckProgress__block_invoke;
    v16[3] = &unk_265135E88;
    v16[4] = self;
    [v15 afterDelay:v16 processBlock:0.1];
  }
LABEL_9:
}

- (void)_axHandleProgressStart:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(_SFFluidProgressViewAccessibility *)self _accessibilityViewIsVisible])
  {
    [(_SFFluidProgressViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"StartedFluidProgress"];
    v18[0] = @"progress";
    double v5 = NSNumber;
    [v4 fluidProgressValue];
    double v6 = objc_msgSend(v5, "numberWithDouble:");
    v18[1] = @"url";
    v19[0] = v6;
    uint64_t v7 = [v4 loadURL];
    double v8 = (void *)v7;
    double v9 = &stru_26F71AB80;
    if (v7) {
      double v9 = (__CFString *)v7;
    }
    v19[1] = v9;
    double v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    UIAccessibilityPostNotification(0x430u, v10);

    UIAccessibilityNotifications v11 = *MEMORY[0x263F81458];
    uint64_t v12 = NSNumber;
    [v4 fluidProgressValue];
    UIAccessibilityNotifications v13 = objc_msgSend(v12, "numberWithDouble:");
    UIAccessibilityPostNotification(v11, v13);

    UIAccessibilityNotifications v14 = AXLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      [v4 fluidProgressValue];
      int v16 = 134217984;
      uint64_t v17 = v15;
      _os_log_impl(&dword_2422E7000, v14, OS_LOG_TYPE_INFO, "Marking fluid progress in start: %f", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)fluidProgressController:(id)a3 startFluidProgressBar:(id)a4 animateFillFade:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_SFFluidProgressViewAccessibility;
  [(_SFFluidProgressViewAccessibility *)&v17 fluidProgressController:a3 startFluidProgressBar:v8 animateFillFade:v5];
  if ([(_SFFluidProgressViewAccessibility *)self _accessibilityViewIsVisible])
  {
    double v9 = AXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2422E7000, v9, OS_LOG_TYPE_INFO, "Start fluid progress", buf, 2u);
    }

    double v10 = [(_SFFluidProgressViewAccessibility *)self _axProgressTimer];

    if (!v10)
    {
      id v11 = objc_alloc(MEMORY[0x263F22868]);
      uint64_t v12 = (void *)[v11 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
      [(_SFFluidProgressViewAccessibility *)self _axSetProgressTimer:v12];
    }
    [v8 fluidProgressValue];
    if (v13 > 0.0) {
      [(_SFFluidProgressViewAccessibility *)self _axHandleProgressStart:v8];
    }
    UIAccessibilityNotifications v14 = [(_SFFluidProgressViewAccessibility *)self _axProgressTimer];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __99___SFFluidProgressViewAccessibility_fluidProgressController_startFluidProgressBar_animateFillFade___block_invoke;
    v15[3] = &unk_265135E88;
    v15[4] = self;
    [v14 afterDelay:v15 processBlock:0.1];
  }
}

- (void)fluidProgressControllerFinishProgressBar:(id)a3 animateFillFade:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_SFFluidProgressViewAccessibility;
  [(_SFFluidProgressViewAccessibility *)&v7 fluidProgressControllerFinishProgressBar:a3 animateFillFade:a4];
  BOOL v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_2422E7000, v5, OS_LOG_TYPE_INFO, "Fluid progress finish", v6, 2u);
  }

  [(_SFFluidProgressViewAccessibility *)self _axHandleProgressComplete];
}

- (void)_axHandleProgressComplete
{
  if ([(_SFFluidProgressViewAccessibility *)self _accessibilityBoolValueForKey:@"StartedFluidProgress"])
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81458], &unk_26F721190);
    id v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_2422E7000, v3, OS_LOG_TYPE_INFO, "Posting finish notification during finish progress", v4, 2u);
    }
  }
  [(_SFFluidProgressViewAccessibility *)self _accessibilitySetBoolValue:0 forKey:@"StartedFluidProgress"];
}

- (void)fluidProgressController:(id)a3 setProgressToCurrentPosition:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)_SFFluidProgressViewAccessibility;
  id v6 = a4;
  [(_SFFluidProgressViewAccessibility *)&v13 fluidProgressController:a3 setProgressToCurrentPosition:v6];
  objc_msgSend(v6, "fluidProgressValue", v13.receiver, v13.super_class);
  double v8 = v7;

  double v9 = AXLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2422E7000, v9, OS_LOG_TYPE_INFO, "Fluid progress updated position", buf, 2u);
  }

  if ([(_SFFluidProgressViewAccessibility *)self _accessibilityViewIsVisible]&& v8 > 0.0)
  {
    double v10 = AXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v15 = v8;
      _os_log_impl(&dword_2422E7000, v10, OS_LOG_TYPE_INFO, "Sending fluid progress notification in setProgress: %f", buf, 0xCu);
    }

    [(_SFFluidProgressViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"StartedFluidProgress"];
    UIAccessibilityNotifications v11 = *MEMORY[0x263F81458];
    uint64_t v12 = [NSNumber numberWithDouble:v8];
    UIAccessibilityPostNotification(v11, v12);
  }
}

@end