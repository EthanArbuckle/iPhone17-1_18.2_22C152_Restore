@interface SUUILockupItemCellLayoutAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SUUILockupItemCellLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUILockupItemCellLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUILockupItemCellLayout", @"numberOfUserRatings", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUILockupItemCellLayout", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUILockupItemCellLayout", @"categoryString", "@", 0);
  [v3 validateClass:@"SUUILockupMetadataView" hasInstanceVariable:@"_userRatingImageView" withType:"UIImageView"];
  [v3 validateClass:@"SUUILockupItemCellLayout" hasInstanceVariable:@"_metadataView" withType:"SUUILockupMetadataView"];
}

- (id)accessibilityLabel
{
  id v3 = [(SUUILockupItemCellLayoutAccessibility *)self safeValueForKey:@"numberOfUserRatings"];
  uint64_t v4 = [v3 integerValue];

  if (v4 < 1)
  {
    v7 = 0;
  }
  else
  {
    v5 = NSString;
    v6 = accessibilityLocalizedString(@"USER_RATING_COUNT");
    v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
  }
  v8 = [(SUUILockupItemCellLayoutAccessibility *)self safeValueForKey:@"title"];
  v9 = [(SUUILockupItemCellLayoutAccessibility *)self safeValueForKey:@"categoryString"];
  v10 = [(SUUILockupItemCellLayoutAccessibility *)self safeValueForKey:@"_metadataView"];
  v11 = [v10 safeValueForKey:@"_userRatingImageView"];
  v14 = [v11 accessibilityLabel];
  v12 = __UIAXStringForVariables();

  return v12;
}

@end