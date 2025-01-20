@interface SBFolderControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityCancelSBAXClosingFolderTimer;
- (void)_accessibilitySBAXClosingFolderTimerFired:(id)a3;
- (void)_accessibilityScheduleSBAXClosingFolderTimer;
- (void)_cancelCloseFolderTimer;
- (void)_closeFolderTimerFired;
- (void)_setCloseFolderTimerIfNecessary;
- (void)folderViewDidEndScrolling:(id)a3;
- (void)scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:(id)a3;
@end

@implementation SBFolderControllerAccessibility

- (void)folderViewDidEndScrolling:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBFolderControllerAccessibility;
  [(SBFolderControllerAccessibility *)&v10 folderViewDidEndScrolling:a3];
  v3 = AXSBIconControllerSharedInstance();
  v4 = [v3 _axDragManager];
  v5 = [v4 _axGrabbedIcons];

  if ([v5 count] && !SBAXPerformingAXDrag)
  {
    uint64_t v6 = [v3 _accessibilityIconListIndex] + 1;
    v7 = NSString;
    v8 = accessibilityLocalizedString(@"icon.finished.scroll");
    v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);

    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"SBFolderController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"folderViewDidEndScrolling:", "v", "@", 0);
}

- (void)scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = AXSBIconControllerSharedInstance();
  uint64_t v6 = [v5 _accessibilityIconListIndex];

  if (v6)
  {
    UIAccessibilityNotifications v7 = *MEMORY[0x263F1CE68];
    v8 = accessibilityLocalizedString(@"home");
    UIAccessibilityPostNotification(v7, v8);
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
  v9.receiver = self;
  v9.super_class = (Class)SBFolderControllerAccessibility;
  [(SBFolderControllerAccessibility *)&v9 scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:v4];
}

void __102__SBFolderControllerAccessibility_scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler___block_invoke()
{
  UIAccessibilityNotifications v0 = *MEMORY[0x263F1CE68];
  accessibilityLocalizedString(@"home");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);
}

- (void)_closeFolderTimerFired
{
  v2.receiver = self;
  v2.super_class = (Class)SBFolderControllerAccessibility;
  [(SBFolderControllerAccessibility *)&v2 _closeFolderTimerFired];
  SBAXIconCloseFolderTimerStatus = 0;
}

- (void)_setCloseFolderTimerIfNecessary
{
  id v3 = [(SBFolderControllerAccessibility *)self safeValueForKey:@"_closeFolderTimer"];

  v16.receiver = self;
  v16.super_class = (Class)SBFolderControllerAccessibility;
  [(SBFolderControllerAccessibility *)&v16 _setCloseFolderTimerIfNecessary];
  if (!SBAXPerformingAXDrag)
  {
    id v4 = [(SBFolderControllerAccessibility *)self safeValueForKey:@"_closeFolderTimer"];
    if (!v3 && UIAccessibilityIsVoiceOverRunning())
    {
      v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:5.0];
      [v4 setFireDate:v5];

      [(SBFolderControllerAccessibility *)self _accessibilityScheduleSBAXClosingFolderTimer];
    }
    SBAXIconCloseFolderTimerStatus = 1;
    SBHAXCancelSBAXIconMoveSpeakTimer();
    if (v4)
    {
      uint64_t v6 = AXSBHIconManagerFromSharedIconController();
      UIAccessibilityNotifications v7 = [v6 safeValueForKey:@"openedFolder"];

      if (v7)
      {
        v8 = NSString;
        objc_super v9 = accessibilityLocalizedString(@"dragged.outside.folder");
        objc_super v10 = [v7 safeValueForKey:@"displayName"];
        v11 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);

        v12 = NSString;
        v13 = accessibilityLocalizedString(@"dragged.outside.folder.hint");
        v14 = objc_msgSend(v12, "localizedStringWithFormat:", v13, 5);

        LODWORD(v13) = *MEMORY[0x263F1CDC8];
        v15 = __UIAXStringForVariables();
        UIAccessibilityPostNotification((UIAccessibilityNotifications)v13, v15);
      }
    }
  }
}

- (void)_cancelCloseFolderTimer
{
  v3.receiver = self;
  v3.super_class = (Class)SBFolderControllerAccessibility;
  [(SBFolderControllerAccessibility *)&v3 _cancelCloseFolderTimer];
  [(SBFolderControllerAccessibility *)self _accessibilityCancelSBAXClosingFolderTimer];
  SBAXIconCloseFolderTimerStatus = 2;
}

- (void)_accessibilitySBAXClosingFolderTimerFired:(id)a3
{
}

- (void)_accessibilityCancelSBAXClosingFolderTimer
{
  [(id)SBAXClosingFolderTimer invalidate];
  objc_super v2 = (void *)SBAXClosingFolderTimer;
  SBAXClosingFolderTimer = 0;
}

- (void)_accessibilityScheduleSBAXClosingFolderTimer
{
  if (SBAXClosingFolderTimer) {
    [(SBFolderControllerAccessibility *)self _accessibilityCancelSBAXClosingFolderTimer];
  }
  SBAXClosingFolderTimer = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__accessibilitySBAXClosingFolderTimerFired_ selector:0 userInfo:1 repeats:1.25];

  MEMORY[0x270F9A758]();
}

@end