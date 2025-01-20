@interface CNPlatterBackBarButtonItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CNPlatterBackBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPlatterBackBarButtonItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F81370];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"back.button");
}

@end