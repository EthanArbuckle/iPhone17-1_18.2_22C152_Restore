@interface SearchResultTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axRatingDescription;
- (id)accessibilityLabel;
@end

@implementation SearchResultTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SearchResultTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_SearchResultTableViewCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"_SearchResultTableViewCell" hasInstanceVariable:@"_secondLabel" withType:"UILabel"];
  [v3 validateClass:@"_SearchResultTableViewCell" hasInstanceVariable:@"_secondPartLabel" withType:"UILabel"];
  [v3 validateClass:@"_SearchResultTableViewCell" hasInstanceVariable:@"_thirdLabel" withType:"UILabel"];
  [v3 validateClass:@"_SearchResultTableViewCell" hasInstanceVariable:@"_contextualInformationLabel" withType:"UILabel"];
  [v3 validateClass:@"_SearchResultTableViewCell" hasInstanceVariable:@"_mapItem" withType:"MKMapItem"];
  [v3 validateClass:@"_SearchResultTableViewCell" hasInstanceVariable:@"_transitInfoLabel" withType:"MKTransitInfoLabelView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SearchResultTableViewCell", @"ratingsAttributedString", "@", 0);
}

- (id)_axRatingDescription
{
  v2 = [(SearchResultTableViewCellAccessibility *)self safeValueForKey:@"_mapItem"];
  id v3 = __UIAccessibilitySafeClass();

  LODWORD(v2) = [v3 _hasUserRatingScore];
  [v3 _normalizedUserRatingScore];
  if (v2)
  {
    v14 = UIAXStarRatingStringForRating();
    v15 = @"__AXStringForVariablesSentinel";
    v4 = __UIAXStringForVariables();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(v3, "_reviewsAttribution", v14, v15);
  v6 = [v5 providerName];

  uint64_t v7 = [v3 _sampleSizeForUserRatingScore];
  uint64_t v8 = [v6 length];
  v9 = NSString;
  if (v8)
  {
    v10 = AXMapsLocString(@"REVIEWS_COUNT_WITH_PROVIDER_FORMAT");
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v7, v6);
  }
  else
  {
    v10 = AXMapsLocString(@"REVIEWS_COUNT_FORMAT");
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v7, v16);
  v11 = };

  v12 = __AXStringForVariables();

  return v12;
}

- (id)accessibilityLabel
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(SearchResultTableViewCellAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  v5 = [(SearchResultTableViewCellAccessibility *)self safeUIViewForKey:@"_secondLabel"];
  v6 = [(SearchResultTableViewCellAccessibility *)self safeUIViewForKey:@"_secondPartLabel"];
  uint64_t v7 = [(SearchResultTableViewCellAccessibility *)self safeUIViewForKey:@"_thirdLabel"];
  uint64_t v8 = [(SearchResultTableViewCellAccessibility *)self safeUIViewForKey:@"_transitInfoLabel"];
  v9 = [(SearchResultTableViewCellAccessibility *)self safeUIViewForKey:@"_contextualInformationLabel"];
  v10 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 6, v4, v5, v6, v7, v8, v9);

  objc_opt_class();
  v11 = [(SearchResultTableViewCellAccessibility *)self safeValueForKey:@"ratingsAttributedString"];
  v12 = __UIAccessibilityCastAsClass();

  v13 = [v12 string];

  char v26 = 0;
  objc_opt_class();
  v14 = [(SearchResultTableViewCellAccessibility *)self safeValueForKey:@"_mapItem"];
  v15 = __UIAccessibilityCastAsClass();

  uint64_t v16 = [v15 _priceRangeString];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __60__SearchResultTableViewCellAccessibility_accessibilityLabel__block_invoke;
  v22[3] = &unk_26512D928;
  id v23 = v13;
  v24 = self;
  id v25 = v16;
  id v17 = v16;
  id v18 = v13;
  v19 = objc_msgSend(v10, "ax_flatMappedArrayUsingBlock:", v22);
  v20 = MEMORY[0x245653050]();

  return v20;
}

id __60__SearchResultTableViewCellAccessibility_accessibilityLabel__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  if ([v4 _accessibilityViewIsVisible])
  {
    v5 = [v4 text];
    if ([a1[4] length])
    {
      uint64_t v6 = [v5 rangeOfString:a1[4]];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = v6;
        uint64_t v9 = v7;
        v10 = [a1[5] _axRatingDescription];
        uint64_t v11 = objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v8, v9, v10);

        v5 = (void *)v11;
      }
    }
    if ([a1[6] length])
    {
      uint64_t v12 = [v5 rangeOfString:a1[6]];
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v14 = v12;
        uint64_t v15 = v13;
        uint64_t v16 = UIAXPriceRangeDescription();
        uint64_t v17 = objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v14, v15, v16);

        v5 = (void *)v17;
      }
    }
    id v18 = AXStringByReplacingMiddleDots(v5);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

@end