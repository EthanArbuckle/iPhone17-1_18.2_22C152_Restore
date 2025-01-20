@interface MOSuggestionSheetMosaicCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MOSuggestionSheetMosaicCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MomentsUIService.MOSuggestionSheetMosaicCell";
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
  v2 = [(MOSuggestionSheetMosaicCellAccessibility *)self safeSwiftValueForKey:@"assetView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)MOSuggestionSheetMosaicCellAccessibility;
  unint64_t v3 = [(MOSuggestionSheetMosaicCellAccessibility *)&v7 accessibilityTraits];
  v4 = [(MOSuggestionSheetMosaicCellAccessibility *)self safeSwiftValueForKey:@"assetView"];
  unint64_t v5 = [v4 accessibilityTraits] | v3;

  return v5;
}

- (id)accessibilityCustomActions
{
  v2 = [(MOSuggestionSheetMosaicCellAccessibility *)self safeSwiftValueForKey:@"assetView"];
  unint64_t v3 = [v2 accessibilityCustomActions];

  return v3;
}

@end