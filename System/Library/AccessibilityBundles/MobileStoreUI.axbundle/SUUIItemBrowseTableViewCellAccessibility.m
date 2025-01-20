@interface SUUIItemBrowseTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SUUIItemBrowseTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIItemBrowseTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemBrowseTableViewCell", @"layout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemBrowseCellLayout", @"category", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemBrowseCellLayout", @"numberOfUserRatings", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemBrowseCellLayout", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIItemBrowseCellLayout", @"indexNumberString", "@", 0);
  [v3 validateClass:@"SUUIItemBrowseCellLayout" hasInstanceVariable:@"_userRating" withType:"d"];
}

- (id)accessibilityLabel
{
  v2 = [(SUUIItemBrowseTableViewCellAccessibility *)self safeValueForKey:@"layout"];
  id v3 = [v2 safeValueForKey:@"title"];
  v4 = [v2 safeValueForKey:@"_userRating"];
  [v4 floatValue];

  v5 = [v2 safeValueForKey:@"category"];
  uint64_t v6 = [v2 safeIntegerForKey:@"numberOfUserRatings"];
  v7 = NSString;
  v8 = accessibilityLocalizedString(@"USER_RATING_COUNT");
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);

  v10 = [v2 safeValueForKey:@"indexNumberString"];
  v13 = UIAXStarRatingStringForRating();
  v11 = __UIAXStringForVariables();

  return v11;
}

@end