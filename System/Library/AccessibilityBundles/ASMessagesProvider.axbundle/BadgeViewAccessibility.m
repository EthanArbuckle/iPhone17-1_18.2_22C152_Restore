@interface BadgeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation BadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.BadgeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.BadgeView", @"accessibilityValueLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.BadgeView", @"accessibilityCaptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.BadgeView", @"accessibilityHeadingLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.BadgeView", @"accessibilityValueView", "@", 0);
  [v3 validateClass:@"ASMessagesProvider.BadgeView" hasSwiftField:@"valueView" withSwiftType:"Optional<UIView>"];
  [v3 validateClass:@"AppStoreKitInternal.ArtworkView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(BadgeViewAccessibility *)self safeValueForKey:@"accessibilityValueLabel"];
  v4 = [v3 accessibilityLabel];

  if ([v4 length])
  {
    uint64_t v33 = 0;
    v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(\\d*\\.\\d*)" options:1 error:&v33];
    v6 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    if ([v6 count])
    {
      v7 = [v6 objectAtIndexedSubscript:0];
      uint64_t v8 = [v7 range];
      v10 = objc_msgSend(v4, "substringWithRange:", v8, v9);
      [v10 doubleValue];

      UIAXStarRatingStringForRatingWithGranularity();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = v4;
    }
    v32 = v11;
  }
  else
  {
    v32 = 0;
  }
  v12 = [(BadgeViewAccessibility *)self safeValueForKey:@"accessibilityValueView"];
  v13 = accessibilityAppStorePrefixForTarget();
  objc_opt_class();
  v14 = [(BadgeViewAccessibility *)self safeSwiftValueForKey:@"valueView"];
  v15 = __UIAccessibilityCastAsClass();

  v30 = v15;
  if (v15)
  {
    v16 = [v15 image];
    v17 = [v16 imageAsset];

    v18 = [v17 safeStringForKey:@"assetName"];
    if (([v18 isEqualToString:@"AgeRating10"] & 1) != 0
      || ([v18 isEqualToString:@"AgeRating10-Official"] & 1) != 0)
    {
      v19 = @"age.rating.10";
    }
    else if (([v18 isEqualToString:@"AgeRating12"] & 1) != 0 {
           || ([v18 isEqualToString:@"AgeRating12-Official"] & 1) != 0)
    }
    {
      v19 = @"age.rating.12";
    }
    else if (([v18 isEqualToString:@"AgeRating14"] & 1) != 0 {
           || ([v18 isEqualToString:@"AgeRating14-Official"] & 1) != 0)
    }
    {
      v19 = @"age.rating.14";
    }
    else if (([v18 isEqualToString:@"AgeRating16"] & 1) != 0 {
           || ([v18 isEqualToString:@"AgeRating16-Official"] & 1) != 0)
    }
    {
      v19 = @"age.rating.16";
    }
    else if (([v18 isEqualToString:@"AgeRating18"] & 1) != 0 {
           || ([v18 isEqualToString:@"AgeRating18-Official"] & 1) != 0)
    }
    {
      v19 = @"age.rating.18";
    }
    else
    {
      if (([v18 isEqualToString:@"AgeRatingL"] & 1) == 0
        && ![v18 isEqualToString:@"AgeRatingL-Official"])
      {
        v15 = 0;
        goto LABEL_27;
      }
      v19 = @"age.rating.L";
    }
    v15 = accessibilityAppStoreLocalizedString(v19);
LABEL_27:
  }
  v20 = [(BadgeViewAccessibility *)self safeValueForKey:@"accessibilityHeadingLabel"];
  v21 = [v20 accessibilityLabel];
  v31 = v13;
  v22 = [v13 stringByAppendingString:@".ArtworkView"];
  MEMORY[0x24563EC60]();
  char isKindOfClass = objc_opt_isKindOfClass();
  v24 = v12;
  if (isKindOfClass)
  {
    v25 = 0;
  }
  else
  {
    v25 = [v12 accessibilityLabel];
  }
  v26 = [(BadgeViewAccessibility *)self safeValueForKey:@"accessibilityCaptionLabel"];
  v29 = [v26 accessibilityLabel];
  v27 = __UIAXStringForVariables();

  if ((isKindOfClass & 1) == 0) {

  }
  return v27;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)BadgeViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(BadgeViewAccessibility *)&v3 accessibilityTraits];
}

@end