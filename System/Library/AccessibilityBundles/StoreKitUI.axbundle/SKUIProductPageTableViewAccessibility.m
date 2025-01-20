@interface SKUIProductPageTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySupplementaryHeaderViews;
@end

@implementation SKUIProductPageTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIProductPageTableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v2 = [(SKUIProductPageTableViewAccessibility *)self safeValueForKey:@"subviews"];
  v3 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_2];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

BOOL __79__SKUIProductPageTableViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSClassFromString(&cfstr_Skuiscreenshot.isa);
    if (objc_opt_isKindOfClass() & 1) == 0 && ([v2 _accessibilityViewIsVisible]) {
      BOOL v3 = 1;
    }
  }

  return v3;
}

@end