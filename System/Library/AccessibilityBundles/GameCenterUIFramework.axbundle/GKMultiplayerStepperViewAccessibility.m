@interface GKMultiplayerStepperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityAutomationType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityUpdateStepperWithValue:(int64_t)a3;
- (void)layoutSubviews;
@end

@implementation GKMultiplayerStepperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.GKMultiplayerStepperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.GKMultiplayerStepperView", @"accessibilityDownButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.GKMultiplayerStepperView", @"accessibilityUpButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.GKMultiplayerStepperView", @"accessibilityUpdateStepperWithValue:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.GKMultiplayerStepperView", @"layoutSubviews", "v", 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 79;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerStepperViewAccessibility;
  [(GKMultiplayerStepperViewAccessibility *)&v3 layoutSubviews];
  [(GKMultiplayerStepperViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)GKMultiplayerStepperViewAccessibility;
  [(GKMultiplayerStepperViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(GKMultiplayerStepperViewAccessibility *)self safeValueForKey:@"accessibilityDownButton"];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_5];
  v4 = [(GKMultiplayerStepperViewAccessibility *)self safeValueForKey:@"accessibilityUpButton"];
  [v4 _setAccessibilityLabelBlock:&__block_literal_global_294];
  [v3 _setAccessibilityAdditionalTraitsBlock:&__block_literal_global_300];
  [v4 _setAccessibilityAdditionalTraitsBlock:&__block_literal_global_302];
}

id __83__GKMultiplayerStepperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return AXGameCenterUIFrameworkLocString(@"REMOVE_PLAYERS");
}

id __83__GKMultiplayerStepperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return AXGameCenterUIFrameworkLocString(@"ADD_PLAYERS");
}

uint64_t __83__GKMultiplayerStepperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return *MEMORY[0x263F1CF40];
}

uint64_t __83__GKMultiplayerStepperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return *MEMORY[0x263F1CF40];
}

- (void)accessibilityUpdateStepperWithValue:(int64_t)a3
{
  v4 = (void *)MEMORY[0x263F21660];
  objc_super v5 = NSString;
  v6 = AXGameCenterUIFrameworkLocString(@"PLAYER_COUNT");
  v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, a3);
  v8 = [v4 axAttributedStringWithString:v7];

  [v8 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
  id v9 = v8;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __77__GKMultiplayerStepperViewAccessibility_accessibilityUpdateStepperWithValue___block_invoke(uint64_t a1)
{
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return AXGameCenterUIFrameworkLocString(@"MULTIPLAYER_CONTROL");
}

@end