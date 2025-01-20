@interface SKUILockupItemCellLayoutAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SKUILockupItemCellLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUILockupItemCellLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUILockupItemCellLayout", @"numberOfUserRatings", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUILockupItemCellLayout", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUILockupItemCellLayout", @"categoryString", "@", 0);
  [v3 validateClass:@"SKUILockupMetadataView" hasInstanceVariable:@"_userRatingImageView" withType:"UIImageView"];
  [v3 validateClass:@"SKUILockupItemCellLayout" hasInstanceVariable:@"_metadataView" withType:"SKUILockupMetadataView"];
}

- (id)accessibilityLabel
{
  id v3 = [(SKUILockupItemCellLayoutAccessibility *)self safeValueForKey:@"numberOfUserRatings"];
  uint64_t v4 = [v3 integerValue];

  if (v4 < 1)
  {
    v7 = 0;
  }
  else
  {
    v5 = NSString;
    v6 = accessibilitySKUILocalizedString(@"USER_RATING_COUNT");
    v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
  }
  v8 = [(SKUILockupItemCellLayoutAccessibility *)self safeValueForKey:@"title"];
  v9 = [(SKUILockupItemCellLayoutAccessibility *)self safeValueForKey:@"categoryString"];
  v10 = [(SKUILockupItemCellLayoutAccessibility *)self safeValueForKey:@"_metadataView"];
  v11 = [v10 safeValueForKey:@"_userRatingImageView"];
  v14 = [v11 accessibilityLabel];
  v12 = __UIAXStringForVariables();

  return v12;
}

@end