@interface CARFolderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityUserTestingChildrenFromSBRootFolderView;
- (id)automationElements;
@end

@implementation CARFolderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CARFolderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CARFolderView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"CARFolderView" isKindOfClass:@"SBFolderView"];
  [v3 validateClass:@"CARTodayViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_CARDashboardHomeViewController", @"todayViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"pageControl", "@", 0);
}

- (id)_accessibilityUserTestingChildrenFromSBRootFolderView
{
  v7.receiver = self;
  v7.super_class = (Class)CARFolderViewAccessibility;
  id v3 = [(CARFolderViewAccessibility *)&v7 automationElements];
  v4 = AXGuaranteedMutableArray();

  v5 = [(CARFolderViewAccessibility *)self safeValueForKey:@"pageControl"];
  [v4 removeObject:v5];

  return v4;
}

- (id)automationElements
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 subviews];

  return v3;
}

@end