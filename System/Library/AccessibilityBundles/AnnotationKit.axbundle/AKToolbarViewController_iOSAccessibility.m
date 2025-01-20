@interface AKToolbarViewController_iOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_buildBasicItems;
@end

@implementation AKToolbarViewController_iOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKToolbarViewController_iOS";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKToolbarViewController_iOS", @"undoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKToolbarViewController_iOS", @"redoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKToolbarViewController_iOS", @"_buildBasicItems", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)AKToolbarViewController_iOSAccessibility;
  [(AKToolbarViewController_iOSAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AKToolbarViewController_iOSAccessibility *)self safeValueForKey:@"undoButton"];
  v4 = accessibilityLocalizedString(@"undo.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(AKToolbarViewController_iOSAccessibility *)self safeValueForKey:@"redoButton"];
  v6 = accessibilityLocalizedString(@"redo.button");
  [v5 setAccessibilityLabel:v6];
}

- (void)_buildBasicItems
{
  v3.receiver = self;
  v3.super_class = (Class)AKToolbarViewController_iOSAccessibility;
  [(AKToolbarViewController_iOSAccessibility *)&v3 _buildBasicItems];
  [(AKToolbarViewController_iOSAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end