@interface PKPerformActionEnterValueViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation PKPerformActionEnterValueViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPerformActionEnterValueView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

@end