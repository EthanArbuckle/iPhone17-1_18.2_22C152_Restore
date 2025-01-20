@interface CertUIItemDetailsSummaryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CertUIItemDetailsSummaryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CertUIItemDetailsSummaryCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v11.receiver = self;
  v11.super_class = (Class)CertUIItemDetailsSummaryCellAccessibility;
  v3 = [(CertUIItemDetailsSummaryCellAccessibility *)&v11 accessibilityLabel];
  v4 = [(CertUIItemDetailsSummaryCellAccessibility *)self safeValueForKey:@"detailViews"];
  v5 = [MEMORY[0x263EFF980] array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__CertUIItemDetailsSummaryCellAccessibility_accessibilityLabel__block_invoke;
  v9[3] = &unk_265112438;
  id v6 = v5;
  id v10 = v6;
  [v4 enumerateObjectsUsingBlock:v9];
  if ([v6 count])
  {
    uint64_t v7 = [v6 componentsJoinedByString:@", "];

    v3 = (void *)v7;
  }

  return v3;
}

void __63__CertUIItemDetailsSummaryCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 accessibilityLabel];
  [v2 axSafelyAddObject:v3];
}

@end