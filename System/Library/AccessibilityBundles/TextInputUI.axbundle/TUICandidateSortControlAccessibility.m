@interface TUICandidateSortControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)layoutSubviews;
@end

@implementation TUICandidateSortControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUICandidateSortControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUICandidateSortControl", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUICandidateSortControl", @"segmentedControl", "@", 0);
  [v3 validateClass:@"UISegmentedControl" hasInstanceVariable:@"_segments" withType:"NSMutableArray"];
}

- (void)layoutSubviews
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TUICandidateSortControlAccessibility;
  [(TUICandidateSortControlAccessibility *)&v14 layoutSubviews];
  id v3 = UIAccessibilityLanguageForCurrentInputMode();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(TUICandidateSortControlAccessibility *)self safeValueForKey:@"segmentedControl", 0];
  v5 = [v4 safeArrayForKey:@"_segments"];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setAccessibilityLanguage:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

@end