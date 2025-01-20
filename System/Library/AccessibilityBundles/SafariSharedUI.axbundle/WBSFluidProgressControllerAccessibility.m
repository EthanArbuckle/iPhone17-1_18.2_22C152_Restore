@interface WBSFluidProgressControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axHandleProgressUpdate:(id)a3;
- (void)_sendUpdateFluidProgressToObservers:(id)a3 progressState:(id)a4 source:(id)a5 updateAnimationPhase:(BOOL)a6;
- (void)_updateFluidProgressWithProgressStateSource:(id)a3;
- (void)finishFluidProgressWithProgressStateSource:(id)a3;
@end

@implementation WBSFluidProgressControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WBSFluidProgressController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBSFluidProgressController", @"finishFluidProgressWithProgressStateSource:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBSFluidProgressController", @"_updateFluidProgressWithProgressStateSource:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBSFluidProgressController", @"_sendUpdateFluidProgressToObservers:progressState:source:updateAnimationPhase:", "v", "@", "@", "@", "B", 0);
}

- (void)_sendUpdateFluidProgressToObservers:(id)a3 progressState:(id)a4 source:(id)a5 updateAnimationPhase:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = AXLogAppAccessibility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[WBSFluidProgressControllerAccessibility _sendUpdateFluidProgressToObservers:progressState:source:updateAnimationPhase:](v13);
  }

  v14.receiver = self;
  v14.super_class = (Class)WBSFluidProgressControllerAccessibility;
  [(WBSFluidProgressControllerAccessibility *)&v14 _sendUpdateFluidProgressToObservers:v12 progressState:v11 source:v10 updateAnimationPhase:v6];

  [(WBSFluidProgressControllerAccessibility *)self _axHandleProgressUpdate:v11];
}

- (void)finishFluidProgressWithProgressStateSource:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WBSFluidProgressControllerAccessibility;
  id v4 = a3;
  [(WBSFluidProgressControllerAccessibility *)&v7 finishFluidProgressWithProgressStateSource:v4];
  v5 = AXLogAppAccessibility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WBSFluidProgressControllerAccessibility finishFluidProgressWithProgressStateSource:](v5);
  }

  BOOL v6 = objc_msgSend(v4, "progressState", v7.receiver, v7.super_class);

  [(WBSFluidProgressControllerAccessibility *)self _axHandleProgressUpdate:v6];
}

- (void)_updateFluidProgressWithProgressStateSource:(id)a3
{
  id v4 = a3;
  v5 = AXLogAppAccessibility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WBSFluidProgressControllerAccessibility _updateFluidProgressWithProgressStateSource:](v4, v5);
  }

  v7.receiver = self;
  v7.super_class = (Class)WBSFluidProgressControllerAccessibility;
  [(WBSFluidProgressControllerAccessibility *)&v7 _updateFluidProgressWithProgressStateSource:v4];
  BOOL v6 = [v4 progressState];
  [(WBSFluidProgressControllerAccessibility *)self _axHandleProgressUpdate:v6];
}

- (void)_axHandleProgressUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 updateFluidProgressValue];
    v5 = AXLogAppAccessibility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = NSNumber;
      [v4 fluidProgressValue];
      objc_super v7 = objc_msgSend(v6, "numberWithDouble:");
      v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "hasCompletedLoad"));
      *(_DWORD *)buf = 138412802;
      v18 = v4;
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2424B3000, v5, OS_LOG_TYPE_INFO, "Update fluid progress: %@ %@ %@ ", buf, 0x20u);
    }
    if ([v4 hasCompletedLoad])
    {
      v9 = &unk_26F7A2248;
    }
    else
    {
      id v10 = NSNumber;
      [v4 fluidProgressValue];
      v9 = objc_msgSend(v10, "numberWithDouble:");
    }
    uint64_t v11 = objc_msgSend(v4, "loadURL", @"progress", @"url", v9);
    id v12 = (void *)v11;
    v13 = &stru_26F7A2078;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    v16[1] = v13;
    objc_super v14 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:2];
    UIAccessibilityPostNotification(0x430u, v14);

    UIAccessibilityPostNotification(*MEMORY[0x263F81458], v9);
  }
}

- (void)_sendUpdateFluidProgressToObservers:(os_log_t)log progressState:source:updateAnimationPhase:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2424B3000, log, OS_LOG_TYPE_DEBUG, "_sendUpdateFluidProgressToObservers", v1, 2u);
}

- (void)finishFluidProgressWithProgressStateSource:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2424B3000, log, OS_LOG_TYPE_DEBUG, "finishFluidProgressWithProgressStateSource", v1, 2u);
}

- (void)_updateFluidProgressWithProgressStateSource:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = NSNumber;
  [a1 estimatedProgress];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_debug_impl(&dword_2424B3000, a2, OS_LOG_TYPE_DEBUG, "_updateFluidProgressWithProgressStateSource %@", (uint8_t *)&v5, 0xCu);
}

@end