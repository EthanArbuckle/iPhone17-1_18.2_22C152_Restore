@interface SBHAddWidgetSheetAppCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SBHAddWidgetSheetAppCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHAddWidgetSheetAppCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBHAddWidgetDetailSheetViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHAddWidgetSheetAppCollectionViewCell", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHAddWidgetSheetAppCollectionViewCell", @"detailTextLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SBHAddWidgetSheetAppCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"textLabel, detailTextLabel"];
}

- (unint64_t)accessibilityTraits
{
  char v11 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 superview];
  v5 = [v4 _accessibilityViewController];
  NSClassFromString(&cfstr_Sbhaddwidgetde_3.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  v10.receiver = self;
  v10.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCellAccessibility;
  unint64_t v7 = [(SBHAddWidgetSheetAppCollectionViewCellAccessibility *)&v10 accessibilityTraits];
  v8 = (void *)MEMORY[0x263F1CEF8];
  if ((isKindOfClass & 1) == 0) {
    v8 = (void *)MEMORY[0x263F1CEE8];
  }
  return *v8 | v7;
}

@end