@interface STUIStatusBarBackgroundActivityItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axBackgroundActivityLabelByBackgroundActivityID:(uint64_t)a1;
- (id)_axBackgroundView;
- (id)_axStatusBarModern;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyLabelToBackground;
- (void)_axSetupIconViewWithUpdateData:(id)a3;
@end

@implementation STUIStatusBarBackgroundActivityItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarBackgroundActivityItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBarItemUpdate"];
  [v3 validateClass:@"STUIStatusBarBackgroundActivityItem" isKindOfClass:@"STUIStatusBarIndicatorItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarBackgroundActivityItem", @"backgroundView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarBackgroundActivityItem", @"iconView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarIndicatorItem", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarItemUpdate", @"data", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarData", @"backgroundActivityEntry", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarDataBackgroundActivityEntry", @"backgroundActivityIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarBackgroundActivityItem", @"applyUpdate:toDisplayItem:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarBackgroundActivityItem", @"createDisplayItemForIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarItem", @"setNeedsUpdate", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarPillBackgroundActivityItem", @"combinedView", "@", 0);
  [v3 validateClass:@"STUIStatusBarPillBackgroundActivityItem" isKindOfClass:@"STUIStatusBarBackgroundActivityItem"];
  [v3 validateClass:@"STUIStatusBarPillBackgroundActivityItem" isKindOfClass:@"STUIStatusBarBackgroundActivityItem"];
  [v3 validateClass:@"STUIStatusBar_Wrapper" isKindOfClass:@"UIStatusBar_Base"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIStatusBar_Base", @"forceUpdate:", "v", "B", 0);
}

- (id)_axBackgroundActivityLabelByBackgroundActivityID:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (_axBackgroundActivityLabelByBackgroundActivityID__onceToken != -1) {
      dispatch_once(&_axBackgroundActivityLabelByBackgroundActivityID__onceToken, &__block_literal_global_0);
    }
    v4 = [(id)_axBackgroundActivityLabelByBackgroundActivityID__ActivityToLabelMap objectForKeyedSubscript:v3];
    v5 = v4;
    if (v4)
    {
      v6 = accessibilityLocalizedString(v4);
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __101__STUIStatusBarBackgroundActivityItemAccessibility__axBackgroundActivityLabelByBackgroundActivityID___block_invoke()
{
  v23[46] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F7C3E8];
  v22[0] = *MEMORY[0x263F7C3E0];
  v22[1] = v0;
  v23[0] = @"status.backgroundactivity.call.stewie";
  v23[1] = @"status.backgroundactivity.call.stewie.disconnected";
  uint64_t v1 = *MEMORY[0x263F7C438];
  v22[2] = *MEMORY[0x263F7C358];
  v22[3] = v1;
  v23[2] = @"status.backgroundactivity.callRinging";
  v23[3] = @"status.backgroundactivity.videoConferenceRinging";
  uint64_t v2 = *MEMORY[0x263F7C430];
  v22[4] = *MEMORY[0x263F7C350];
  v22[5] = v2;
  v23[4] = @"status.backgroundactivity.call.handoff";
  v23[5] = @"status.backgroundactivity.video.handoff";
  uint64_t v3 = *MEMORY[0x263F7C3B0];
  v22[6] = *MEMORY[0x263F7C3A8];
  v22[7] = v3;
  v23[6] = @"status.backgroundactivity.incall";
  v23[7] = @"status.backgroundactivity.videoconference";
  uint64_t v4 = *MEMORY[0x263F7C3A0];
  v22[8] = *MEMORY[0x263F7C320];
  v22[9] = v4;
  v23[8] = @"status.backgroundactivity.push.to.talk.active";
  v23[9] = @"status.backgroundactivity.push.to.talk.idle";
  uint64_t v5 = *MEMORY[0x263F7C448];
  v22[10] = *MEMORY[0x263F7C450];
  v22[11] = v5;
  v23[10] = @"status.backgroundactivity.web.rtc.video";
  v23[11] = @"status.backgroundactivity.web.rtc.audio";
  uint64_t v6 = *MEMORY[0x263F7C388];
  v22[12] = *MEMORY[0x263F7C390];
  v22[13] = v6;
  v23[12] = @"status.backgroundactivity.web.rtc.screen.video";
  v23[13] = @"status.backgroundactivity.web.rtc.screen.audio";
  uint64_t v7 = *MEMORY[0x263F7C348];
  v22[14] = *MEMORY[0x263F7C3C0];
  v22[15] = v7;
  v23[14] = @"status.backgroundactivity.navigation";
  v23[15] = @"status.backgroundactivity.location";
  uint64_t v8 = *MEMORY[0x263F7C3D8];
  v22[16] = *MEMORY[0x263F7C3C8];
  v22[17] = v8;
  v23[16] = @"status.backgroundactivity.nearby.interactions";
  v23[17] = @"status.backgroundactivity.audiorecording";
  uint64_t v9 = *MEMORY[0x263F7C408];
  v22[18] = *MEMORY[0x263F7C398];
  v22[19] = v9;
  v23[18] = @"status.backgroundactivity.hearingaidrecording";
  v23[19] = @"status.backgroundactivity.shareplay";
  uint64_t v10 = *MEMORY[0x263F7C410];
  v22[20] = *MEMORY[0x263F7C418];
  v22[21] = v10;
  v23[20] = @"status.backgroundactivity.shareplay.screen";
  v23[21] = @"status.backgroundactivity.shareplay.inactive";
  uint64_t v11 = *MEMORY[0x263F7C440];
  v22[22] = *MEMORY[0x263F7C3D0];
  v22[23] = v11;
  v23[22] = @"status.backgroundactivity.playground";
  v23[23] = @"status.backgroundactivity.videoout";
  uint64_t v12 = *MEMORY[0x263F7C400];
  v22[24] = *MEMORY[0x263F7C3F8];
  v22[25] = v12;
  v23[24] = @"status.backgroundactivity.screenshare";
  v23[25] = @"status.backgroundactivity.videoout";
  uint64_t v13 = *MEMORY[0x263F7C340];
  v22[26] = *MEMORY[0x263F7C3F0];
  v22[27] = v13;
  v23[26] = @"status.backgroundactivity.screenrecording";
  v23[27] = @"status.backgroundactivity.auto.airplay.ready";
  uint64_t v14 = *MEMORY[0x263F7C420];
  v22[28] = *MEMORY[0x263F7C338];
  v22[29] = v14;
  v23[28] = @"status.backgroundactivity.auto.airplay.play";
  v23[29] = @"status.backgroundactivity.sysdiagnose";
  uint64_t v15 = *MEMORY[0x263F7C3B8];
  v22[30] = *MEMORY[0x263F7C380];
  v22[31] = v15;
  v23[30] = @"status.backgroundactivity.diagnostics";
  v23[31] = @"status.backgroundactivity.logging";
  uint64_t v16 = *MEMORY[0x263F7C330];
  v22[32] = *MEMORY[0x263F7C368];
  v22[33] = v16;
  v23[32] = @"status.backgroundactivity.carplay";
  v23[33] = @"status.backgroundactivity.assistant";
  uint64_t v17 = *MEMORY[0x263F7C328];
  v22[34] = *MEMORY[0x263F7C428];
  v22[35] = v17;
  v23[34] = @"status.backgroundactivity.tethering";
  v23[35] = @"status.backgroundactivity.airprint";
  uint64_t v18 = *MEMORY[0x263F7C378];
  v22[36] = *MEMORY[0x263F7C370];
  v22[37] = v18;
  v23[36] = @"status.backgroundactivity.sos";
  v23[37] = @"status.backgroundactivity.devtools";
  v22[38] = @"com.apple.mediaremoted.background-activity.routed-video";
  v22[39] = @"com.apple.mediaremoted.background-activity.routed-audio-pulse";
  v23[38] = @"status.backgroundactivity.mediaremote.video";
  v23[39] = @"status.backgroundactivity.mediaremote.video";
  v22[40] = @"com.apple.mediaremoted.background-activity.routed-audio";
  v22[41] = @"com.apple.mediaremoted.background-activity.routed-video-pulse";
  v23[40] = @"status.backgroundactivity.mediaremote.audio";
  v23[41] = @"status.backgroundactivity.mediaremote.audio";
  v22[42] = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-video";
  v22[43] = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-audio";
  v23[42] = @"status.backgroundactivity.continuitycapture.video";
  v23[43] = @"status.backgroundactivity.continuitycapture.audio";
  uint64_t v19 = *MEMORY[0x263F7C360];
  v22[44] = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-none";
  v22[45] = v19;
  v23[44] = @"status.backgroundactivity.continuitycapture.none";
  v23[45] = @"status.backgroundactivity.call.screening";
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:46];
  v21 = (void *)_axBackgroundActivityLabelByBackgroundActivityID__ActivityToLabelMap;
  _axBackgroundActivityLabelByBackgroundActivityID__ActivityToLabelMap = v20;
}

- (void)_axApplyLabelToBackground
{
  if (a1)
  {
    uint64_t v2 = [a1 _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
    MEMORY[0x245665C20](@"STUIStatusBarItemUpdate");
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = [v2 safeValueForKeyPath:@"data.backgroundActivityEntry"];
      uint64_t v4 = [v3 safeStringForKey:@"backgroundActivityIdentifier"];

      uint64_t v5 = -[STUIStatusBarBackgroundActivityItemAccessibility _axBackgroundActivityLabelByBackgroundActivityID:]((uint64_t)a1, v4);
      MEMORY[0x245665C20](@"STUIStatusBarBackgroundActivityItem");
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (MEMORY[0x245665C20](@"STUIStatusBarFullBackgroundActivityItem"), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v6 = [a1 safeUIViewForKey:@"backgroundView"];
        objc_initWeak(&location, v6);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __77__STUIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke;
        v13[3] = &unk_26515C888;
        id v7 = v5;
        id v14 = v7;
        objc_copyWeak(&v15, &location);
        [v6 _setAccessibilityLabelBlock:v13];
        uint64_t v8 = [a1 safeUIViewForKey:@"combinedView"];
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __77__STUIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke_2;
        v10[3] = &unk_26515C888;
        id v11 = v7;
        objc_copyWeak(&v12, &location);
        [v8 _setAccessibilityLabelBlock:v10];

        objc_destroyWeak(&v12);
        objc_destroyWeak(&v15);

        objc_destroyWeak(&location);
      }
      else
      {
        uint64_t v9 = [a1 safeUIViewForKey:@"backgroundView"];
        [v9 setAccessibilityLabel:v5];
      }
    }
  }
}

id __77__STUIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = AXStatusBarPillTimeView(WeakRetained);
  uint64_t v5 = [v2 accessibilityLabel];
  uint64_t v3 = __UIAXStringForVariables();

  return v3;
}

id __77__STUIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = AXStatusBarPillTimeView(WeakRetained);
  uint64_t v5 = [v2 accessibilityLabel];
  uint64_t v3 = __UIAXStringForVariables();

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarBackgroundActivityItemAccessibility;
  [(STUIStatusBarBackgroundActivityItemAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = [(STUIStatusBarBackgroundActivityItemAccessibility *)self _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
  if (!v3)
  {
    if (!self)
    {
LABEL_5:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __94__STUIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
      block[3] = &unk_26515C8B0;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
      goto LABEL_6;
    }
    if ((__UIAccessibilityGetAssociatedBool() & 1) == 0)
    {
      __UIAccessibilitySetAssociatedBool();
      goto LABEL_5;
    }
  }
LABEL_6:
  -[STUIStatusBarBackgroundActivityItemAccessibility _axApplyLabelToBackground](self);
  uint64_t v4 = [(STUIStatusBarBackgroundActivityItemAccessibility *)self safeUIViewForKey:@"imageView"];
  [v4 setIsAccessibilityElement:0];
  [(STUIStatusBarBackgroundActivityItemAccessibility *)self _axSetupIconViewWithUpdateData:v3];
}

uint64_t __94__STUIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) safeValueForKey:@"setNeedsUpdate"];
  AXPerformSafeBlock();
  MEMORY[0x245665C20](@"STUIStatusBarPillBackgroundActivityItem");
  uint64_t result = objc_opt_isKindOfClass();
  if (result) {
    return AXPerformSafeBlock();
  }
  return result;
}

void __94__STUIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeUIViewForKey:@"backgroundView"];
  id v1 = [v2 _accessibilityAncestorIsKindOf:MEMORY[0x245665C20](@"STUIStatusBar_Wrapper")];
  [v1 forceUpdate:1];
}

void __94__STUIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeUIViewForKey:@"combinedView"];
  id v1 = [v2 _accessibilityAncestorIsKindOf:MEMORY[0x245665C20](@"STUIStatusBar_Wrapper")];
  [v1 forceUpdate:1];
}

- (id)_axBackgroundView
{
  return (id)[(STUIStatusBarBackgroundActivityItemAccessibility *)self safeUIViewForKey:@"backgroundView"];
}

- (id)_axStatusBarModern
{
  id v2 = [(STUIStatusBarBackgroundActivityItemAccessibility *)self _axBackgroundView];
  uint64_t v3 = [v2 _accessibilityAncestorIsKindOf:MEMORY[0x245665C20](@"STUIStatusBar_Wrapper")];

  return v3;
}

- (void)_axSetupIconViewWithUpdateData:(id)a3
{
  id v4 = a3;
  MEMORY[0x245665C20](@"STUIStatusBarPillBackgroundActivityItem");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(STUIStatusBarBackgroundActivityItemAccessibility *)self safeUIViewForKey:@"iconView"];
    if (v4)
    {
      objc_super v6 = [v4 safeValueForKeyPath:@"data.backgroundActivityEntry"];
      id v7 = [v6 safeStringForKey:@"backgroundActivityIdentifier"];

      if (([(id)*MEMORY[0x263F7C3A8] isEqualToString:v7] & 1) != 0
        || [(id)*MEMORY[0x263F7C3B0] isEqualToString:v7])
      {
        uint64_t v8 = [(STUIStatusBarBackgroundActivityItemAccessibility *)self _axBackgroundView];
        uint64_t v9 = [(STUIStatusBarBackgroundActivityItemAccessibility *)self _axStatusBarModern];
        [v9 safeCGRectForKey:@"frame"];
        if (v8)
        {
          double v11 = v10;
          if (v10 != 0.0)
          {
            [v8 frame];
            if (v11 == v12)
            {
              [v5 _setIsAccessibilityElementBlock:&__block_literal_global_502];
              uint64_t v13 = -[STUIStatusBarBackgroundActivityItemAccessibility _axBackgroundActivityLabelByBackgroundActivityID:]((uint64_t)self, v7);
              v15[0] = MEMORY[0x263EF8330];
              v15[1] = 3221225472;
              v15[2] = __83__STUIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke_2;
              v15[3] = &unk_26515C8F8;
              id v16 = v13;
              id v14 = v13;
              [v5 _setAccessibilityLabelBlock:v15];

LABEL_12:
              goto LABEL_13;
            }
          }
        }
      }
    }
    [v5 _setIsAccessibilityElementBlock:0];
    [v5 _setAccessibilityLabelBlock:0];
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __83__STUIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke()
{
  return 1;
}

id __83__STUIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarBackgroundActivityItemAccessibility;
  id v4 = [(STUIStatusBarBackgroundActivityItemAccessibility *)&v6 createDisplayItemForIdentifier:a3];
  -[STUIStatusBarBackgroundActivityItemAccessibility _axApplyLabelToBackground](self);

  return v4;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarBackgroundActivityItemAccessibility;
  id v6 = a3;
  id v7 = [(STUIStatusBarBackgroundActivityItemAccessibility *)&v9 applyUpdate:v6 toDisplayItem:a4];
  [(STUIStatusBarBackgroundActivityItemAccessibility *)self _accessibilitySetRetainedValue:v6, @"AccessibilityStatusBarUpdateData", v9.receiver, v9.super_class forKey];

  [(STUIStatusBarBackgroundActivityItemAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v7;
}

@end