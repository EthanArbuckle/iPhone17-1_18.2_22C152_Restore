@interface MetadataRibbonStarRatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MetadataRibbonStarRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.MetadataRibbonStarRatingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.MetadataRibbonStarRatingView", @"accessibilityStarRatingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.MetadataRibbonStarRatingView", @"accessibilityRatingCountLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MetadataRibbonStarRatingViewAccessibility *)self safeValueForKey:@"accessibilityRatingCountLabel"];
  v4 = [(MetadataRibbonStarRatingViewAccessibility *)self safeValueForKey:@"accessibilityStarRatingView"];
  v5 = [v3 accessibilityLabel];

  if (v5)
  {
    v6 = NSString;
    v7 = accessibilityAppStoreLocalizedString(@"user.ratings");
    v8 = [v3 accessibilityLabel];
    v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

    __UIAXStringForVariables();
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_26F60FFA8;
  }

  return v10;
}

@end