@interface PreviewDetailsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setupViewsAndConstraints;
@end

@implementation PreviewDetailsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PreviewDetailsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PreviewDetailsViewControllerAccessibility", @"setupViewsAndConstraints", "v", 0);
  [v3 validateClass:@"PreviewDetailsViewController" hasInstanceVariable:@"_filenameTextField" withType:"UITextField"];
}

- (void)setupViewsAndConstraints
{
  v2.receiver = self;
  v2.super_class = (Class)PreviewDetailsViewControllerAccessibility;
  [(PreviewDetailsViewControllerAccessibility *)&v2 setupViewsAndConstraints];
}

@end