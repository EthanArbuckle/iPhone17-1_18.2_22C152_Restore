@interface TLKStoreButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TLKStoreButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKStoreButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(TLKStoreButtonAccessibility *)self safeValueForKey:@"label"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end