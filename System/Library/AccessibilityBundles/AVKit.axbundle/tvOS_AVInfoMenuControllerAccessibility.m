@interface tvOS_AVInfoMenuControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
@end

@implementation tvOS_AVInfoMenuControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVInfoMenuController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVInfoMenuController", @"viewControllers", "@", 0);
  [v3 validateClass:@"AVInfoPanelMetadataViewController" isKindOfClass:@"UIViewController"];
}

- (id)accessibilityHeaderElements
{
  objc_opt_class();
  id v3 = [(tvOS_AVInfoMenuControllerAccessibility *)self safeValueForKey:@"viewControllers"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 axFilterObjectsUsingBlock:&__block_literal_global_0];
  v6 = [v5 firstObject];

  v7 = [v6 accessibilityHeaderElements];

  return v7;
}

@end