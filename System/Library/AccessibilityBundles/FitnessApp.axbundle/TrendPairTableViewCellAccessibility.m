@interface TrendPairTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TrendPairTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.TrendPairTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)TrendPairTableViewCellAccessibility;
  [(TrendPairTableViewCellAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  v3 = [(TrendPairTableViewCellAccessibility *)self _accessibilityFindUnsortedDescendantsPassingTest:&__block_literal_global_3];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setIsAccessibilityElement:0];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

BOOL __81__TrendPairTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id a1, id a2, BOOL *a3)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end