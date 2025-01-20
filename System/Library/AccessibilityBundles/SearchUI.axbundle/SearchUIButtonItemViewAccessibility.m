@interface SearchUIButtonItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SearchUIButtonItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIButtonItemView";
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
  v3 = [(SearchUIButtonItemViewAccessibility *)self safeValueForKey:@"iconView"];
  v4 = [v3 _accessibilityFindDescendant:&__block_literal_global_0];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 accessibilityLabel];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIButtonItemViewAccessibility;
    uint64_t v6 = [(SearchUIButtonItemViewAccessibility *)&v9 accessibilityLabel];
  }
  v7 = (void *)v6;

  return v7;
}

uint64_t __57__SearchUIButtonItemViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end