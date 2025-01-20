@interface SKUIItemBrowseCellLayoutAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SKUIItemBrowseCellLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIItemBrowseCellLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUIItemBrowseCellLayout" hasInstanceVariable:@"_cellContentView" withType:"_SKUIItemBrowseCellContentView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SKUIItemBrowseCellContentView", @"userRatingImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SKUIItemBrowseCellContentView", @"userRatingLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SKUIItemBrowseCellContentView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SKUIItemBrowseCellContentView", @"subtitleLabel", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(SKUIItemBrowseCellLayoutAccessibility *)self safeValueForKey:@"_cellContentView"];
  id v3 = [v2 safeValueForKey:@"userRatingLabel"];
  v4 = [v3 accessibilityLabel];

  if ([v4 length])
  {
    v5 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    v6 = [v5 invertedSet];
    v7 = [v4 stringByTrimmingCharactersInSet:v6];

    uint64_t v8 = [v7 integerValue];
    v9 = NSString;
    v10 = accessibilitySKUILocalizedString(@"USER_RATING_COUNT");
    uint64_t v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);

    v4 = (void *)v11;
  }
  v12 = [v2 safeValueForKey:@"titleLabel"];
  v13 = [v12 accessibilityLabel];
  v14 = [v2 safeValueForKey:@"subtitleLabel"];
  v15 = [v14 accessibilityLabel];
  v16 = [v2 safeValueForKey:@"userRatingImageView"];
  v19 = [v16 accessibilityLabel];
  v17 = __UIAXStringForVariables();

  return v17;
}

@end