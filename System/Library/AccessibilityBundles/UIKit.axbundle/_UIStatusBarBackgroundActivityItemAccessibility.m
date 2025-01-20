@interface _UIStatusBarBackgroundActivityItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axBackgroundActivityLabelByType:(uint64_t)a1;
- (id)_axBackgroundView;
- (id)_axStatusBarModern;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
- (uint64_t)_accessibilityHasRequestedForceUpdate;
- (uint64_t)_accessibilitySetHasRequestedForceUpdate:(uint64_t)result;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyLabelToBackground;
- (void)_axSetupIconViewWithUpdateData:(id)a3;
@end

@implementation _UIStatusBarBackgroundActivityItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarBackgroundActivityItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIStatusBarItemUpdate";
  objc_msgSend(location[0], "validateClass:");
  v7 = @"_UIStatusBarBackgroundActivityItem";
  v3 = @"_UIStatusBarIndicatorItem";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v5 = "@";
  [location[0] validateClass:@"_UIStatusBarBackgroundActivityItem" hasInstanceMethod:@"backgroundView" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"iconView", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"imageView", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"data", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarData", @"backgroundActivityEntry", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarDataBackgroundActivityEntry", @"type", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"applyUpdate:toDisplayItem:", v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"createDisplayItemForIdentifier:", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarItem", @"setNeedsUpdate", "v", 0);
  v6 = @"_UIStatusBarPillBackgroundActivityItem";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v6 isKindOfClass:v7];
  [location[0] validateClass:@"_UIStatusBarFullBackgroundActivityItem" isKindOfClass:v7];
  objc_storeStrong(v9, v8);
}

- (id)_axBackgroundActivityLabelByType:(uint64_t)a1
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  if (a1)
  {
    id v7 = 0;
    id location = 0;
    if (v8)
    {
      uint64_t v3 = v8;
      char v2 = 1;
    }
    else
    {
      uint64_t v3 = 0;
      char v2 = 0;
    }
    if ((v2 & 1) == 0)
    {
      switch(v3)
      {
        case 0:
          objc_storeStrong(&location, @"status.backgroundactivity.call.stewie");
          objc_storeStrong(&v7, @"Accessibility-stewie");
          break;
        case 1:
          objc_storeStrong(&location, @"status.backgroundactivity.call.stewie.disconnected");
          objc_storeStrong(&v7, @"Accessibility-stewie");
          break;
        case 2:
          objc_storeStrong(&location, @"status.backgroundactivity.callRinging");
          break;
        case 3:
          objc_storeStrong(&location, @"status.backgroundactivity.videoConferenceRinging");
          break;
        case 4:
          objc_storeStrong(&location, @"status.backgroundactivity.call.handoff");
          break;
        case 5:
          objc_storeStrong(&location, @"status.backgroundactivity.video.handoff");
          break;
        case 6:
          objc_storeStrong(&location, @"status.backgroundactivity.incall");
          break;
        case 7:
          objc_storeStrong(&location, @"status.backgroundactivity.videoconference");
          break;
        case 8:
          objc_storeStrong(&location, @"status.backgroundactivity.push.to.talk.active");
          break;
        case 9:
          objc_storeStrong(&location, @"status.backgroundactivity.push.to.talk.idle");
          break;
        case 10:
          objc_storeStrong(&location, @"status.backgroundactivity.web.rtc.video");
          break;
        case 11:
          objc_storeStrong(&location, @"status.backgroundactivity.web.rtc.audio");
          break;
        case 12:
          objc_storeStrong(&location, @"status.backgroundactivity.web.rtc.screen.video");
          break;
        case 13:
          objc_storeStrong(&location, @"status.backgroundactivity.web.rtc.screen.audio");
          break;
        case 14:
          objc_storeStrong(&location, @"status.backgroundactivity.navigation");
          break;
        case 15:
          objc_storeStrong(&location, @"status.backgroundactivity.location");
          break;
        case 16:
          objc_storeStrong(&location, @"status.backgroundactivity.nearby.interactions");
          break;
        case 17:
          objc_storeStrong(&location, @"status.backgroundactivity.audiorecording");
          break;
        case 18:
          objc_storeStrong(&location, @"status.backgroundactivity.hearingaidrecording");
          break;
        case 19:
          objc_storeStrong(&location, @"status.backgroundactivity.shareplay");
          break;
        case 20:
          objc_storeStrong(&location, @"status.backgroundactivity.shareplay.screen");
          break;
        case 21:
          objc_storeStrong(&location, @"status.backgroundactivity.shareplay.inactive");
          break;
        case 22:
          objc_storeStrong(&location, @"status.backgroundactivity.playground");
          break;
        case 23:
        case 25:
          objc_storeStrong(&location, @"status.backgroundactivity.videoout");
          break;
        case 24:
          objc_storeStrong(&location, @"status.backgroundactivity.screenshare");
          break;
        case 26:
          objc_storeStrong(&location, @"status.backgroundactivity.screenrecording");
          break;
        case 27:
          objc_storeStrong(&location, @"status.backgroundactivity.auto.airplay.ready");
          break;
        case 28:
          objc_storeStrong(&location, @"status.backgroundactivity.auto.airplay.play");
          break;
        case 29:
          objc_storeStrong(&location, @"status.backgroundactivity.sysdiagnose");
          break;
        case 30:
          objc_storeStrong(&location, @"status.backgroundactivity.diagnostics");
          break;
        case 31:
          objc_storeStrong(&location, @"status.backgroundactivity.logging");
          break;
        case 32:
          objc_storeStrong(&location, @"status.backgroundactivity.carplay");
          break;
        case 33:
          objc_storeStrong(&location, @"status.backgroundactivity.assistant");
          break;
        case 34:
          objc_storeStrong(&location, @"status.backgroundactivity.tethering");
          break;
        case 35:
          objc_storeStrong(&location, @"status.backgroundactivity.airprint");
          break;
        case 36:
          objc_storeStrong(&location, @"status.backgroundactivity.sos");
          break;
        case 37:
          objc_storeStrong(&location, @"status.backgroundactivity.devtools");
          break;
        default:
          JUMPOUT(0);
      }
    }
    if (v7) {
      id v10 = accessibilityLocalizedStringInTable(location, v7);
    }
    else {
      id v10 = accessibilityLocalizedString(location);
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v7, 0);
  }
  else
  {
    id v10 = 0;
  }
  v4 = v10;

  return v4;
}

- (void)_axApplyLabelToBackground
{
  id v24 = a1;
  if (a1)
  {
    id v23 = (id)[v24 _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
    NSClassFromString(&cfstr_Uistatusbarite_3.isa);
    if (objc_opt_isKindOfClass())
    {
      id v4 = (id)[v23 safeValueForKeyPath:@"data.backgroundActivityEntry"];
      v5 = (void *)[v4 safeIntegerForKey:@"type"];

      v22[1] = v5;
      v22[0] = -[_UIStatusBarBackgroundActivityItemAccessibility _axBackgroundActivityLabelByType:]((uint64_t)v24, (uint64_t)v5);
      NSClassFromString(&cfstr_Uistatusbarpil_1.isa);
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (NSClassFromString(&cfstr_Uistatusbarful.isa), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v21 = (id)[v24 safeUIViewForKey:@"backgroundView"];
        objc_initWeak(&location, v21);
        id v3 = v21;
        uint64_t v13 = MEMORY[0x263EF8330];
        int v14 = -1073741824;
        int v15 = 0;
        v16 = __76___UIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke;
        v17 = &unk_2650AFB00;
        id v18 = v22[0];
        objc_copyWeak(&v19, &location);
        [v3 _setAccessibilityLabelBlock:&v13];
        id v2 = (id)[v24 safeUIViewForKey:@"combinedView"];
        uint64_t v6 = MEMORY[0x263EF8330];
        int v7 = -1073741824;
        int v8 = 0;
        uint64_t v9 = __76___UIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke_2;
        id v10 = &unk_2650AFB00;
        id v11 = v22[0];
        objc_copyWeak(&v12, &location);
        [v2 _setAccessibilityLabelBlock:&v6];

        objc_destroyWeak(&v12);
        objc_storeStrong(&v11, 0);
        objc_destroyWeak(&v19);
        objc_storeStrong(&v18, 0);
        objc_destroyWeak(&location);
        objc_storeStrong(&v21, 0);
      }
      else
      {
        id v1 = (id)[v24 safeUIViewForKey:@"backgroundView"];
        [v1 setAccessibilityLabel:v22[0]];
      }
      objc_storeStrong(v22, 0);
    }
    objc_storeStrong(&v23, 0);
  }
}

- (uint64_t)_accessibilityHasRequestedForceUpdate
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_accessibilitySetHasRequestedForceUpdate:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarBackgroundActivityItemAccessibility;
  [(_UIStatusBarBackgroundActivityItemAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v10 = (id)[(_UIStatusBarBackgroundActivityItemAccessibility *)v13 _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
  if (!v10
    && (-[_UIStatusBarBackgroundActivityItemAccessibility _accessibilityHasRequestedForceUpdate]((uint64_t)v13) & 1) == 0)
  {
    -[_UIStatusBarBackgroundActivityItemAccessibility _accessibilitySetHasRequestedForceUpdate:]((uint64_t)v13);
    queue = MEMORY[0x263EF83A0];
    uint64_t v4 = MEMORY[0x263EF8330];
    int v5 = -1073741824;
    int v6 = 0;
    int v7 = __93___UIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    int v8 = &unk_2650ADF18;
    uint64_t v9 = v13;
    dispatch_async(queue, &v4);

    objc_storeStrong((id *)&v9, 0);
  }
  -[_UIStatusBarBackgroundActivityItemAccessibility _axApplyLabelToBackground](v13);
  id v3 = (id)[(_UIStatusBarBackgroundActivityItemAccessibility *)v13 safeUIViewForKey:@"imageView"];
  [v3 setIsAccessibilityElement:0];
  [(_UIStatusBarBackgroundActivityItemAccessibility *)v13 _axSetupIconViewWithUpdateData:v10];
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v10, 0);
}

- (id)_axBackgroundView
{
  return (id)[(_UIStatusBarBackgroundActivityItemAccessibility *)self safeUIViewForKey:@"backgroundView", a2, self];
}

- (id)_axStatusBarModern
{
  id v3 = [(_UIStatusBarBackgroundActivityItemAccessibility *)self _axBackgroundView];
  id v4 = (id)[v3 _accessibilityAncestorIsKindOf:objc_opt_class()];

  return v4;
}

- (void)_axSetupIconViewWithUpdateData:(id)a3
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  NSClassFromString(&cfstr_Uistatusbarful.isa);
  if (objc_opt_isKindOfClass())
  {
    char v30 = 0;
    id v29 = (id)[(_UIStatusBarBackgroundActivityItemAccessibility *)v33 safeUIViewForKey:@"iconView"];
    if (location[0])
    {
      id v17 = (id)[location[0] safeValueForKeyPath:@"data.backgroundActivityEntry"];
      uint64_t v18 = [v17 safeIntegerForKey:@"type"];

      uint64_t v28 = v18;
      if (v18 == 6 || v28 == 7)
      {
        id v27 = [(_UIStatusBarBackgroundActivityItemAccessibility *)v33 _axBackgroundView];
        id v26 = [(_UIStatusBarBackgroundActivityItemAccessibility *)v33 _axStatusBarModern];
        if (v27)
        {
          [v26 frame];
          v25[9] = v4;
          v25[10] = v5;
          v25[11] = v3;
          v25[12] = v6;
          if (*(double *)&v3 != 0.0)
          {
            objc_msgSend(v26, "frame", *(double *)&v3);
            v25[5] = v7;
            v25[6] = v8;
            v25[7] = v9;
            v25[8] = v10;
            double v16 = *(double *)&v9;
            [v27 frame];
            v25[1] = v11;
            v25[2] = v12;
            v25[3] = v13;
            v25[4] = v14;
            if (v16 == *(double *)&v13)
            {
              objc_msgSend(v29, "_setIsAccessibilityElementBlock:", &__block_literal_global_59, v16);
              v25[0] = -[_UIStatusBarBackgroundActivityItemAccessibility _axBackgroundActivityLabelByType:]((uint64_t)v33, v28);
              id v15 = v29;
              uint64_t v19 = MEMORY[0x263EF8330];
              int v20 = -1073741824;
              int v21 = 0;
              v22 = __82___UIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke_2;
              id v23 = &unk_2650AE4B8;
              id v24 = v25[0];
              [v15 _setAccessibilityLabelBlock:&v19];
              char v30 = 1;
              objc_storeStrong(&v24, 0);
              objc_storeStrong(v25, 0);
            }
          }
        }
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v27, 0);
      }
    }
    if ((v30 & 1) == 0)
    {
      objc_msgSend(v29, "_setIsAccessibilityElementBlock:");
      [v29 _setAccessibilityLabelBlock:0];
    }
    objc_storeStrong(&v29, 0);
    int v31 = 0;
  }
  else
  {
    int v31 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)_UIStatusBarBackgroundActivityItemAccessibility;
  id v6 = [(_UIStatusBarBackgroundActivityItemAccessibility *)&v5 createDisplayItemForIdentifier:location[0]];
  -[_UIStatusBarBackgroundActivityItemAccessibility _axApplyLabelToBackground](v8);
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  objc_super v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v7.receiver = v11;
  v7.super_class = (Class)_UIStatusBarBackgroundActivityItemAccessibility;
  id v8 = [(_UIStatusBarBackgroundActivityItemAccessibility *)&v7 applyUpdate:location[0] toDisplayItem:v9];
  [(_UIStatusBarBackgroundActivityItemAccessibility *)v11 _accessibilitySetRetainedValue:location[0] forKey:@"AccessibilityStatusBarUpdateData"];
  [(_UIStatusBarBackgroundActivityItemAccessibility *)v11 _accessibilityLoadAccessibilityInformation];
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v6;
}

@end