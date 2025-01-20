@interface MetadataRibbonStarRatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MetadataRibbonStarRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.MetadataRibbonStarRatingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(MetadataRibbonStarRatingViewAccessibility *)self safeValueForKey:@"accessibilityRatingCountLabel"];
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
    v10 = &stru_26F61CF50;
  }

  return v10;
}

@end