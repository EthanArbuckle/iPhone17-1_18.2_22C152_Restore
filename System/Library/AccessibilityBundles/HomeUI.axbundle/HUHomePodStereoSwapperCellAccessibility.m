@interface HUHomePodStereoSwapperCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (HUHomePodStereoSwapperCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HUHomePodStereoSwapperCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUHomePodStereoSwapperCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUHomePodStereoSwapperCell" hasInstanceVariable:@"_swapButton" withType:"UIButton"];
  [v3 validateClass:@"HUHomePodStereoSwapperCell" hasInstanceVariable:@"_leftHomePod" withType:"HUHomePodDetailView"];
  [v3 validateClass:@"HUHomePodStereoSwapperCell" hasInstanceVariable:@"_rightHomePod" withType:"HUHomePodDetailView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUHomePodStereoSwapperCell", @"initWithStyle:reuseIdentifier:", "q", "@", 0);
}

- (HUHomePodStereoSwapperCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HUHomePodStereoSwapperCellAccessibility;
  v4 = [(HUHomePodStereoSwapperCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(HUHomePodStereoSwapperCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HUHomePodStereoSwapperCellAccessibility;
  [(HUHomePodStereoSwapperCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HUHomePodStereoSwapperCellAccessibility *)self safeValueForKey:@"_swapButton"];
  v4 = accessibilityHomeLocalizedString(@"swap.speakers");
  [v3 setAccessibilityLabel:v4];
}

@end