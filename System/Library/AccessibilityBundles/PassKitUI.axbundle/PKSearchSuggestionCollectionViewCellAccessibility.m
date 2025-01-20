@interface PKSearchSuggestionCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PKSearchSuggestionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSearchSuggestionCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKSearchSuggestionCollectionViewCell" hasInstanceVariable:@"_labelSuggestion" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
  [v3 validateClass:@"PKSearchSuggestionCollectionViewCell" hasInstanceVariable:@"_imageViewIcon" withType:"UIImageView"];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(PKSearchSuggestionCollectionViewCellAccessibility *)self safeValueForKey:@"_imageViewIcon"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 image];
  v6 = [v5 imageAsset];
  v7 = [v6 safeStringForKey:@"assetName"];

  v8 = [(PKSearchSuggestionCollectionViewCellAccessibility *)self safeValueForKey:@"_labelSuggestion"];
  v9 = [v8 accessibilityLabel];
  int v10 = [v7 isEqualToString:@"mappin.and.ellipse"];
  if (v10)
  {
    v11 = accessibilityLocalizedString(@"map.search.result");
  }
  else
  {
    v11 = 0;
  }
  if (([v7 isEqualToString:@"magnifyingglass"] & 1) == 0)
  {
    v12 = __UIAXStringForVariables();
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v14 = accessibilityLocalizedString(@"search.result");
  v12 = __UIAXStringForVariables();

  if (v10) {
LABEL_8:
  }

LABEL_9:

  return v12;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end