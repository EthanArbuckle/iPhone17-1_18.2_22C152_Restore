@interface BuddyPosedDeviceSelectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation BuddyPosedDeviceSelectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyPosedDeviceSelectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyPosedDeviceSelectionView", @"leftContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyPosedDeviceSelectionView", @"centerContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyPosedDeviceSelectionView", @"rightContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyPosedDeviceSelectionView", @"leftPosedView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyPosedDeviceSelectionView", @"centerPosedView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyPosedDeviceSelectionView", @"rightPosedView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v18.receiver = self;
  v18.super_class = (Class)BuddyPosedDeviceSelectionViewAccessibility;
  [(BuddyPosedDeviceSelectionViewAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BuddyPosedDeviceSelectionViewAccessibility *)self safeUIViewForKey:@"leftContainer"];
  v4 = [(BuddyPosedDeviceSelectionViewAccessibility *)self safeUIViewForKey:@"centerContainer"];
  v5 = [(BuddyPosedDeviceSelectionViewAccessibility *)self safeUIViewForKey:@"rightContainer"];
  v6 = [(BuddyPosedDeviceSelectionViewAccessibility *)self safeUIViewForKey:@"leftPosedView"];
  v7 = [(BuddyPosedDeviceSelectionViewAccessibility *)self safeUIViewForKey:@"centerPosedView"];
  v8 = [(BuddyPosedDeviceSelectionViewAccessibility *)self safeUIViewForKey:@"rightPosedView"];
  [v3 _accessibilitySetUserDefinedMediaAnalysisOptions:&unk_26F7B4530];
  [v4 _accessibilitySetUserDefinedMediaAnalysisOptions:&unk_26F7B4530];
  [v5 _accessibilitySetUserDefinedMediaAnalysisOptions:&unk_26F7B4530];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v16[3] = &unk_26514E3A8;
  id v17 = v6;
  id v9 = v6;
  [v3 setAccessibilityActivationPointBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v14[3] = &unk_26514E3A8;
  id v15 = v7;
  id v10 = v7;
  [v4 setAccessibilityActivationPointBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v12[3] = &unk_26514E3A8;
  id v13 = v8;
  id v11 = v8;
  [v5 setAccessibilityActivationPointBlock:v12];
}

uint64_t __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityActivationPoint];
}

uint64_t __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityActivationPoint];
}

uint64_t __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityActivationPoint];
}

@end