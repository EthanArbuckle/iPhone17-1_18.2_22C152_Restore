@interface SKUIStarRatingViewElementViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SKUIStarRatingViewElementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIStarRatingViewElementView";
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
  v3 = [(SKUIStarRatingViewElementViewAccessibility *)self safeValueForKey:@"_textLayout"];
  v4 = [v3 safeValueForKey:@"attributedString"];
  v5 = [v4 safeValueForKey:@"string"];

  v6 = [v5 componentsSeparatedByString:@" "];
  uint64_t v7 = [v6 count];

  if (v7 == 1)
  {
    v8 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[^0-9]", &stru_26F441D68, 1024, 0, objc_msgSend(v5, "length"));

    v9 = NSString;
    v10 = accessibilitySKUILocalizedString(@"USER_RATING_COUNT");
    v5 = objc_msgSend(v9, "localizedStringWithFormat:", v10, objc_msgSend(v8, "integerValue"));
  }
  v11 = [(SKUIStarRatingViewElementViewAccessibility *)self safeValueForKey:@"_starRatingImage"];
  v12 = [v11 accessibilityLabel];
  v13 = __UIAXStringForVariables();

  return v13;
}

@end