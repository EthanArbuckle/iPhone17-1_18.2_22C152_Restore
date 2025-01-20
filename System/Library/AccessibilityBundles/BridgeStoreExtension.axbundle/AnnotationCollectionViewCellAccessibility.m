@interface AnnotationCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInstructionsHint;
- (BOOL)_accessibilityPerformLinkAction:(id)a3;
- (BOOL)_axIsAnnotationCellExpanded;
- (BOOL)_axIsSummaryExpandable;
- (BOOL)isAccessibilityElement;
- (id)_axLinkLabel;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AnnotationCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.AnnotationCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.AnnotationCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.AnnotationCollectionViewCell", @"accessibilitySummaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.AnnotationCollectionViewCell", @"accessibilityDetailItems", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(AnnotationCollectionViewCellAccessibility *)self _axIsAnnotationCellExpanded])
  {
    id v3 = [(AnnotationCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel"];
    v4 = [(AnnotationCollectionViewCellAccessibility *)self safeArrayForKey:@"accessibilityDetailItems"];
    v7 = AXLabelForElements();
    v5 = __UIAXStringForVariables();
  }
  else
  {
    v5 = [(AnnotationCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilitySummaryLabel"];
  }

  return v5;
}

- (BOOL)_axIsAnnotationCellExpanded
{
  return [(AnnotationCollectionViewCellAccessibility *)self safeBoolForKey:@"accessibilityCellIsExpanded"];
}

- (id)_axLinkLabel
{
  return (id)[(AnnotationCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityLinkLabel"];
}

- (id)accessibilityCustomActions
{
  id v3 = (void *)MEMORY[0x263EFF980];
  v10.receiver = self;
  v10.super_class = (Class)AnnotationCollectionViewCellAccessibility;
  v4 = [(AnnotationCollectionViewCellAccessibility *)&v10 accessibilityCustomActions];
  v5 = [v3 arrayWithArray:v4];

  if ([(AnnotationCollectionViewCellAccessibility *)self _axIsAnnotationCellExpanded])
  {
    v6 = [(AnnotationCollectionViewCellAccessibility *)self _axLinkLabel];
    v7 = [v6 accessibilityLabel];

    if ([v7 length])
    {
      v8 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v7 target:self selector:sel__accessibilityPerformLinkAction_];
      [v5 axSafelyAddObject:v8];
    }
  }

  return v5;
}

- (BOOL)_accessibilityPerformLinkAction:(id)a3
{
  return 1;
}

uint64_t __77__AnnotationCollectionViewCellAccessibility__accessibilityPerformLinkAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityLinkLabelTapped];
}

- (BOOL)_axIsSummaryExpandable
{
  return [(AnnotationCollectionViewCellAccessibility *)self safeBoolForKey:@"accessibilityIsSummaryExpandable"];
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)AnnotationCollectionViewCellAccessibility;
  unint64_t v3 = [(AnnotationCollectionViewCellAccessibility *)&v5 accessibilityTraits];
  if ([(AnnotationCollectionViewCellAccessibility *)self _axIsSummaryExpandable]
    && ![(AnnotationCollectionViewCellAccessibility *)self _axIsAnnotationCellExpanded])
  {
    v3 |= *MEMORY[0x263F1CEE8];
  }
  return v3;
}

- (id)accessibilityHint
{
  if ([(AnnotationCollectionViewCellAccessibility *)self _axIsSummaryExpandable]
    && ![(AnnotationCollectionViewCellAccessibility *)self _axIsAnnotationCellExpanded])
  {
    unint64_t v3 = accessibilityAppStoreLocalizedString(@"expand.annotation.cell");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AnnotationCollectionViewCellAccessibility;
    unint64_t v3 = [(AnnotationCollectionViewCellAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  return [(AnnotationCollectionViewCellAccessibility *)self _axIsSummaryExpandable]
      && ![(AnnotationCollectionViewCellAccessibility *)self _axIsAnnotationCellExpanded];
}

@end