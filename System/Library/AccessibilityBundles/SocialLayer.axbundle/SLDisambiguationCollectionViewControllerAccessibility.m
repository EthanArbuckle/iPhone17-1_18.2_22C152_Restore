@interface SLDisambiguationCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation SLDisambiguationCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SLDisambiguationCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityPerformEscape
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

@end