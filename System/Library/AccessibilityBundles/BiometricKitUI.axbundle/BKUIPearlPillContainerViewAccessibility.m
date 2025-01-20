@interface BKUIPearlPillContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)fillPillsAroundAngle:(double)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityScrollStatus;
- (id)_accessibilityUnfilledDirections;
- (id)_axAnglesToCheck;
- (id)_axCurrentNudgeDirection;
- (id)_axDirectionForSection:(int64_t)a3;
- (id)_axImpactFeedbackGenerator;
- (id)_axLabelKeysForDirection;
- (id)_axLookKeysForDirection;
- (id)_axNudgeTimer;
- (id)_axPearlEnrollControllerShell;
- (id)_axSpokenDirections;
- (id)_axUnfilledDirections;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_axCurrentNudgeCount;
- (int64_t)_axSectionForAngle:(double)a3;
- (void)_accessibilitySetPearlEnrollViewController:(id)a3;
- (void)_axProvideNudge;
- (void)_axResetTimer;
- (void)_axStartTimer;
- (void)_axStopTimer;
- (void)_setAXCurrentNudgeCount:(int64_t)a3;
- (void)_setAXCurrentNudgeDirection:(id)a3;
- (void)_setAXImpactFeedbackGenerator:(id)a3;
- (void)_setAXNudgeTimer:(id)a3;
- (void)_setAXPearlEnrollControllerShell:(id)a3;
- (void)_setAXSpokenDirections:(id)a3;
- (void)_setAXUnfilledDirections:(id)a3;
- (void)animateToState:(int)a3 completion:(id)a4;
- (void)didMoveToWindow;
@end

@implementation BKUIPearlPillContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIPearlPillContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BKUIPearlPillView"];
  [v3 validateClass:@"BKUIPearlEnrollController"];
  [v3 validateClass:@"HPSSpatialProfileEnrollmentController"];
  [v3 validateClass:@"BKUIPearlPillContainerView" hasInstanceVariable:@"_pillViews" withType:"NSMutableArray"];
  [v3 validateClass:@"BKUIPearlPillContainerView" hasInstanceVariable:@"_numberOfVisiblePillViews" withType:"NSInteger"];
  [v3 validateClass:@"BKUIPearlEnrollViewController" hasInstanceVariable:@"_state" withType:"int"];
  [v3 validateClass:@"BKUIPearlEnrollViewController" hasInstanceVariable:@"_substate" withType:"int"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlPillContainerView", @"state", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlPillView", @"state", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlPillContainerView", @"_indexForPillAtAngle:", "q", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlPillContainerView", @"fillPillsAroundAngle:", "B", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlPillContainerView", @"animateToState:completion:", "v", "i", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"didMoveToWindow", "v", 0);
}

- (id)_axPearlEnrollControllerShell
{
}

- (void)_setAXPearlEnrollControllerShell:(id)a3
{
}

- (void)_accessibilitySetPearlEnrollViewController:(id)a3
{
  id v5 = a3;
  MEMORY[0x245644F10](@"BKUIPearlEnrollViewController");
  if (objc_opt_isKindOfClass())
  {
    v4 = objc_alloc_init(AXPearlWeakObjectShell);
    [(AXPearlWeakObjectShell *)v4 setWeakObjectReference:v5];
  }
  else
  {
    MEMORY[0x245644F10](@"HPSSpatialProfileEnrollmentController");
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    v4 = objc_alloc_init(AXPearlWeakObjectShell);
    [(AXPearlWeakObjectShell *)v4 setWeakSpatialProfileReference:v5];
  }
  [(BKUIPearlPillContainerViewAccessibility *)self _setAXPearlEnrollControllerShell:v4];

LABEL_6:
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlPillContainerViewAccessibility;
  [(BKUIPearlPillContainerViewAccessibility *)&v5 didMoveToWindow];
  id v3 = self;
  v4 = [(BKUIPearlPillContainerViewAccessibility *)v3 window];

  if (!v4)
  {
    [(BKUIPearlPillContainerViewAccessibility *)v3 _axStopTimer];
    [(BKUIPearlPillContainerViewAccessibility *)v3 _setAXNudgeTimer:0];
  }
}

- (BOOL)isAccessibilityElement
{
  return [(BKUIPearlPillContainerViewAccessibility *)self safeIntForKey:@"state"]
       - 5 < 4;
}

- (id)accessibilityLabel
{
  v8.receiver = self;
  v8.super_class = (Class)BKUIPearlPillContainerViewAccessibility;
  id v3 = [(BKUIPearlPillContainerViewAccessibility *)&v8 accessibilityLabel];
  int v4 = [(BKUIPearlPillContainerViewAccessibility *)self safeIntForKey:@"state"];
  if ((v4 - 5) >= 2)
  {
    if ((v4 - 7) > 1) {
      goto LABEL_6;
    }
    objc_super v5 = @"pearl.scan.second";
  }
  else
  {
    objc_super v5 = @"pearl.scan.first";
  }
  uint64_t v6 = accessibilityLocalizedString(v5);

  id v3 = (void *)v6;
LABEL_6:

  return v3;
}

- (id)_axAnglesToCheck
{
  return &unk_26F63D348;
}

- (id)_axDirectionForSection:(int64_t)a3
{
  int v4 = [(BKUIPearlPillContainerViewAccessibility *)self _axAnglesToCheck];
  objc_super v5 = v4;
  if (a3 < 0 || [v4 count] <= (unint64_t)a3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v5 objectAtIndex:a3];
  }

  return v6;
}

- (id)_axLabelKeysForDirection
{
  v5[8] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26F63D360;
  v4[1] = &unk_26F63D370;
  v5[0] = @"pearl.direction.right";
  v5[1] = @"pearl.direction.up.right";
  v4[2] = &unk_26F63D380;
  v4[3] = &unk_26F63D390;
  v5[2] = @"pearl.direction.up";
  v5[3] = @"pearl.direction.up.left";
  v4[4] = &unk_26F63D3A0;
  v4[5] = &unk_26F63D3B0;
  v5[4] = @"pearl.direction.left";
  v5[5] = @"pearl.direction.down.left";
  v4[6] = &unk_26F63D3C0;
  v4[7] = &unk_26F63D3D0;
  v5[6] = @"pearl.direction.down";
  v5[7] = @"pearl.direction.down.right";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];

  return v2;
}

- (id)_axLookKeysForDirection
{
  v5[8] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26F63D360;
  v4[1] = &unk_26F63D370;
  v5[0] = @"pearl.direction.look.right";
  v5[1] = @"pearl.direction.look.up.right";
  v4[2] = &unk_26F63D380;
  v4[3] = &unk_26F63D390;
  v5[2] = @"pearl.direction.look.up";
  v5[3] = @"pearl.direction.look.up.left";
  v4[4] = &unk_26F63D3A0;
  v4[5] = &unk_26F63D3B0;
  v5[4] = @"pearl.direction.look.left";
  v5[5] = @"pearl.direction.look.down.left";
  v4[6] = &unk_26F63D3C0;
  v4[7] = &unk_26F63D3D0;
  v5[6] = @"pearl.direction.look.down";
  v5[7] = @"pearl.direction.look.down.right";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];

  return v2;
}

- (int64_t)_axSectionForAngle:(double)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = -1;
  AXPerformSafeBlock();
  int64_t v3 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

float __62__BKUIPearlPillContainerViewAccessibility__axSectionForAngle___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) _indexForPillAtAngle:*(double *)(a1 + 48)];
  float result = (double)(unint64_t)[*(id *)(a1 + 32) safeUnsignedIntegerForKey:@"_numberOfVisiblePillViews"]* 0.125;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 / vcvtps_u32_f32(result);
  return result;
}

- (id)_axUnfilledDirections
{
}

- (void)_setAXUnfilledDirections:(id)a3
{
}

- (id)_accessibilityUnfilledDirections
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int64_t v3 = [(BKUIPearlPillContainerViewAccessibility *)self _axUnfilledDirections];
  if (!v3)
  {
    int64_t v3 = [MEMORY[0x263EFF980] array];
    int v4 = [(BKUIPearlPillContainerViewAccessibility *)self _axAnglesToCheck];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "floatValue", v10, v11, v12, v13, v14);
          uint64_t v10 = MEMORY[0x263EF8330];
          uint64_t v11 = 3221225472;
          v12 = __75__BKUIPearlPillContainerViewAccessibility__accessibilityUnfilledDirections__block_invoke;
          v13 = &unk_26510E630;
          v14 = self;
          id v15 = v3;
          AXPerformSafeBlock();
        }
        uint64_t v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v10, 3221225472, __75__BKUIPearlPillContainerViewAccessibility__accessibilityUnfilledDirections__block_invoke, &unk_26510E630, self);
      }
      while (v6);
    }
    [(BKUIPearlPillContainerViewAccessibility *)self _setAXUnfilledDirections:v3];
  }

  return v3;
}

void __75__BKUIPearlPillContainerViewAccessibility__accessibilityUnfilledDirections__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _indexForPillAtAngle:*(double *)(a1 + 56)];
  objc_opt_class();
  int64_t v3 = [*(id *)(a1 + 32) safeValueForKey:@"_pillViews"];
  int v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 objectAtIndex:v2];
  MEMORY[0x245644F10](@"BKUIPearlPillView");
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 safeUnsignedIntegerForKey:@"state"] == 2) {
    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
  }
}

- (id)accessibilityValue
{
  int v3 = [(BKUIPearlPillContainerViewAccessibility *)self safeIntForKey:@"state"];
  if (v3 == 8 || v3 == 6)
  {
    v9 = accessibilityLocalizedString(@"pearl.scan.completed");
  }
  else
  {
    uint64_t v5 = [(BKUIPearlPillContainerViewAccessibility *)self _accessibilityUnfilledDirections];
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = [(BKUIPearlPillContainerViewAccessibility *)self _axLookKeysForDirection];
    uint64_t v8 = [v7 objectForKey:v6];
    v9 = accessibilityLocalizedString(v8);
  }

  return v9;
}

- (id)_accessibilityScrollStatus
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)BKUIPearlPillContainerViewAccessibility;
  int v3 = [(BKUIPearlPillContainerViewAccessibility *)&v25 _accessibilityScrollStatus];
  int v4 = [(BKUIPearlPillContainerViewAccessibility *)self _accessibilityUnfilledDirections];
  if ([v4 count])
  {
    v20 = v3;
    uint64_t v5 = accessibilityLocalizedString(@"pearl.direction.incomplete");
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v19 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        uint64_t v11 = v5;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
          v13 = [(BKUIPearlPillContainerViewAccessibility *)self _axLabelKeysForDirection];
          v14 = [v13 objectForKey:v12];

          long long v17 = accessibilityLocalizedString(v14);
          long long v18 = @"__AXStringForVariablesSentinel";
          uint64_t v5 = __UIAXStringForVariables();

          ++v10;
          uint64_t v11 = v5;
        }
        while (v8 != v10);
        uint64_t v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16, v17, @"__AXStringForVariablesSentinel");
      }
      while (v8);
    }

    uint64_t v15 = __UIAXStringForVariables();

    int v3 = (void *)v15;
    int v4 = v19;
  }

  return v3;
}

- (id)_axSpokenDirections
{
}

- (void)_setAXSpokenDirections:(id)a3
{
}

- (id)_axImpactFeedbackGenerator
{
}

- (void)_setAXImpactFeedbackGenerator:(id)a3
{
}

- (BOOL)fillPillsAroundAngle:(double)a3
{
  v16.receiver = self;
  v16.super_class = (Class)BKUIPearlPillContainerViewAccessibility;
  BOOL v5 = -[BKUIPearlPillContainerViewAccessibility fillPillsAroundAngle:](&v16, sel_fillPillsAroundAngle_);
  if (v5 && UIAccessibilityIsVoiceOverRunning())
  {
    double v6 = 6.28318531;
    if (a3 + 0.392699082 >= 0.0) {
      double v6 = 0.0;
    }
    uint64_t v7 = [(BKUIPearlPillContainerViewAccessibility *)self _axDirectionForSection:[(BKUIPearlPillContainerViewAccessibility *)self _axSectionForAngle:a3 + 0.392699082 + v6]];
    id v8 = [(BKUIPearlPillContainerViewAccessibility *)self _axSpokenDirections];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(BKUIPearlPillContainerViewAccessibility *)self _setAXSpokenDirections:v8];
    }
    if (([v8 containsObject:v7] & 1) == 0)
    {
      uint64_t v9 = [(BKUIPearlPillContainerViewAccessibility *)self _accessibilityUnfilledDirections];
      [v9 removeObject:v7];
      [(BKUIPearlPillContainerViewAccessibility *)self _setAXUnfilledDirections:v9];
      [v8 addObject:v7];
      [v8 count];
      uint64_t v10 = NSString;
      uint64_t v11 = accessibilityLocalizedString(@"pearl.progress.percent");
      uint64_t v12 = AXFormatFloatWithPercentage();
      v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

      UIAccessibilitySpeak();
      v14 = [(BKUIPearlPillContainerViewAccessibility *)self _axImpactFeedbackGenerator];
      if (!v14)
      {
        v14 = (void *)[objc_alloc(MEMORY[0x263F1C6D8]) initWithStyle:0];
        [(BKUIPearlPillContainerViewAccessibility *)self _setAXImpactFeedbackGenerator:v14];
      }
      [v14 impactOccurred];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21978]);
      [(BKUIPearlPillContainerViewAccessibility *)self _axResetTimer];
    }
  }
  return v5;
}

- (id)_axNudgeTimer
{
}

- (void)_setAXNudgeTimer:(id)a3
{
}

- (void)_axStartTimer
{
  [(BKUIPearlPillContainerViewAccessibility *)self _axStopTimer];
  id v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__axProvideNudge selector:0 userInfo:1 repeats:4.0];
  [(BKUIPearlPillContainerViewAccessibility *)self _setAXNudgeTimer:v3];
}

- (void)_axStopTimer
{
  id v2 = [(BKUIPearlPillContainerViewAccessibility *)self _axNudgeTimer];
  [v2 invalidate];
}

- (void)_axResetTimer
{
  [(BKUIPearlPillContainerViewAccessibility *)self _axStopTimer];

  [(BKUIPearlPillContainerViewAccessibility *)self _axStartTimer];
}

- (id)_axCurrentNudgeDirection
{
}

- (void)_setAXCurrentNudgeDirection:(id)a3
{
}

- (int64_t)_axCurrentNudgeCount
{
  return MEMORY[0x270F0A458](self, &__BKUIPearlPillContainerViewAccessibility___axCurrentNudgeCount);
}

- (void)_setAXCurrentNudgeCount:(int64_t)a3
{
}

- (void)_axProvideNudge
{
  id v15 = [(BKUIPearlPillContainerViewAccessibility *)self _axPearlEnrollControllerShell];
  id v3 = [v15 weakObjectReference];
  if (v3)
  {
    int v4 = v3;
    if (([v3 safeIntForKey:@"_state"] & 0xFFFFFFFD) != 5
      || [v4 safeIntForKey:@"_substate"])
    {
      goto LABEL_15;
    }
  }
  else
  {
    int v4 = [v15 weakSpatialProfileReference];
    if (!v4) {
      goto LABEL_15;
    }
  }
  BOOL v5 = [(BKUIPearlPillContainerViewAccessibility *)self _accessibilityUnfilledDirections];
  if ([v5 count])
  {
    double v6 = [v5 firstObject];
    uint64_t v7 = [(BKUIPearlPillContainerViewAccessibility *)self _axCurrentNudgeDirection];
    if (v6 != v7)
    {
      [(BKUIPearlPillContainerViewAccessibility *)self _setAXCurrentNudgeDirection:v6];
      [(BKUIPearlPillContainerViewAccessibility *)self _setAXCurrentNudgeCount:0];
    }
    uint64_t v8 = [(BKUIPearlPillContainerViewAccessibility *)self _axCurrentNudgeCount];
    uint64_t v9 = [(BKUIPearlPillContainerViewAccessibility *)self _axLookKeysForDirection];
    uint64_t v10 = [v9 objectForKey:v6];
    uint64_t v11 = accessibilityLocalizedString(v10);

    if (v8 < 3)
    {
      UIAccessibilitySpeakIfNotSpeaking();
    }
    else
    {
      uint64_t v12 = NSString;
      v13 = accessibilityLocalizedString(@"pearl.direction.recenter");
      v14 = objc_msgSend(v12, "stringWithFormat:", v13, v11);
      UIAccessibilitySpeakIfNotSpeaking();
    }
    [(BKUIPearlPillContainerViewAccessibility *)self _setAXCurrentNudgeCount:v8 + 1];
  }
  else
  {
    [(BKUIPearlPillContainerViewAccessibility *)self _axStopTimer];
    [(BKUIPearlPillContainerViewAccessibility *)self _setAXCurrentNudgeDirection:0];
    [(BKUIPearlPillContainerViewAccessibility *)self _setAXCurrentNudgeCount:0];
  }

LABEL_15:
}

- (void)animateToState:(int)a3 completion:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BKUIPearlPillContainerViewAccessibility;
  [(BKUIPearlPillContainerViewAccessibility *)&v7 animateToState:*(void *)&a3 completion:a4];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    switch(a3)
    {
      case 5:
      case 7:
        [(BKUIPearlPillContainerViewAccessibility *)self _axStartTimer];
        break;
      case 6:
        [(BKUIPearlPillContainerViewAccessibility *)self _axStopTimer];
        double v6 = [(BKUIPearlPillContainerViewAccessibility *)self _axSpokenDirections];
        [v6 removeAllObjects];
        [(BKUIPearlPillContainerViewAccessibility *)self _setAXUnfilledDirections:0];
        [(BKUIPearlPillContainerViewAccessibility *)self _setAXCurrentNudgeDirection:0];
        [(BKUIPearlPillContainerViewAccessibility *)self _setAXCurrentNudgeCount:0];

        break;
      case 8:
        [(BKUIPearlPillContainerViewAccessibility *)self _axStopTimer];
        break;
      default:
        return;
    }
  }
}

@end