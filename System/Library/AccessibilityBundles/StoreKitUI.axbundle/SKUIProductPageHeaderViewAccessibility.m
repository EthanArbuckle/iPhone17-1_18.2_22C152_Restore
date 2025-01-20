@interface SKUIProductPageHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestReverseOrder;
- (CGRect)accessibilityFrame:(id)a3;
- (SKUIProductPageHeaderViewAccessibility)initWithClientContext:(id)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setNumberOfUserRatings:(int64_t)a3;
- (void)setUserRating:(double)a3;
@end

@implementation SKUIProductPageHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIProductPageHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageHeaderView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageHeaderView", @"initWithClientContext:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageHeaderView", @"setUserRating:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageHeaderView", @"setIconImage:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageHeaderView", @"setNumberOfUserRatings:", "v", "q", 0);
  [v3 validateClass:@"SKUIProductPageHeaderView" hasInstanceVariable:@"_ageBandLabel" withType:"UILabel"];
  [v3 validateClass:@"SKUIProductPageHeaderView" hasInstanceVariable:@"_iconImageView" withType:"UIImageView"];
  [v3 validateClass:@"SKUIProductPageHeaderView" hasInstanceVariable:@"_userRatingLabel" withType:"UILabel"];
  [v3 validateClass:@"SKUIProductPageHeaderView" hasInstanceVariable:@"_titleLabel" withType:"SKUIProductPageHeaderLabel"];
  [v3 validateClass:@"SKUIProductPageHeaderView" hasInstanceVariable:@"_artistButton" withType:"UIButton"];
  [v3 validateClass:@"SKUIProductPageHeaderView" hasInstanceVariable:@"_itemOfferButton" withType:"SKUIItemOfferButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageHeaderView", @"inAppPurchasesString", "@", 0);
}

- (SKUIProductPageHeaderViewAccessibility)initWithClientContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIProductPageHeaderViewAccessibility;
  id v3 = [(SKUIProductPageHeaderViewAccessibility *)&v7 initWithClientContext:a3];
  v4 = [(SKUIProductPageHeaderViewAccessibility *)v3 safeValueForKey:@"_shareButton"];
  v5 = accessibilitySKUILocalizedString(@"share.button");
  [v4 setAccessibilityLabel:v5];

  return v3;
}

- (void)setIconImage:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SKUIProductPageHeaderViewAccessibility;
  [(SKUIProductPageHeaderViewAccessibility *)&v10 setIconImage:a3];
  v4 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_iconImageView"];
  [v4 setIsAccessibilityElement:1];

  v5 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_iconImageView"];
  v6 = NSString;
  objc_super v7 = accessibilitySKUILocalizedString(@"icon.image.with.title");
  v8 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"title"];
  v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);
  [v5 setAccessibilityLabel:v9];
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIProductPageHeaderViewAccessibility;
  -[SKUIProductPageHeaderViewAccessibility setNumberOfUserRatings:](&v9, sel_setNumberOfUserRatings_);
  if (a3 >= 1)
  {
    v5 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_userRatingLabel"];
    v6 = NSString;
    objc_super v7 = accessibilitySKUILocalizedString(@"USER_RATING_COUNT");
    v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, a3);
    [v5 setAccessibilityLabel:v8];
  }
}

- (void)setUserRating:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIProductPageHeaderViewAccessibility;
  [(SKUIProductPageHeaderViewAccessibility *)&v5 setUserRating:a3];
  v4 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_userRatingStarsView"];
  [v4 setIsAccessibilityElement:1];
}

- (CGRect)accessibilityFrame:(id)a3
{
  v4 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  objc_super v5 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_userRatingLabel"];
  [v4 accessibilityFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 accessibilityFrame];
  v29.origin.CGFloat x = v14;
  v29.origin.CGFloat y = v15;
  v29.size.CGFloat width = v16;
  v29.size.CGFloat height = v17;
  v26.origin.CGFloat x = v7;
  v26.origin.CGFloat y = v9;
  v26.size.CGFloat width = v11;
  v26.size.CGFloat height = v13;
  CGRect v27 = CGRectUnion(v26, v29);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;

  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)accessibilityLabel:(id)a3
{
  v4 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  objc_super v5 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_userRatingStarsView"];
  double v6 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_userRatingLabel"];
  CGFloat v7 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"inAppPurchasesString"];
  double v8 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_ageBandLabel"];
  CGFloat v9 = [(SKUIProductPageHeaderViewAccessibility *)self _accessibilityValueForKey:@"facebookCount"];
  uint64_t v10 = [v9 integerValue];

  if (v10 < 1)
  {
    CGFloat v13 = 0;
  }
  else
  {
    CGFloat v11 = NSString;
    double v12 = accessibilitySKUILocalizedString(@"FACEBOOK_FRIEND_LIKE_COUNT");
    CGFloat v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  }
  CGFloat v14 = [v4 accessibilityLabel];
  CGFloat v15 = [v8 accessibilityLabel];
  CGFloat v16 = [v5 accessibilityLabel];
  v18 = [v6 accessibilityLabel];
  __UIAXStringForVariables();
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263F81490];
  v4 = [(SKUIProductPageHeaderViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v4)
  {
    v4 = [MEMORY[0x263EFF980] array];
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    [v5 setAccessibilityDelegate:self];
    [v4 addObject:v5];
    [(SKUIProductPageHeaderViewAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:*v3];
  }
  double v6 = (void *)[v4 mutableCopy];
  CGFloat v7 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_artistButton"];
  double v8 = v7;
  if (v7 && [v7 _accessibilityViewIsVisible]) {
    [v6 axSafelyAddObject:v8];
  }
  CGFloat v9 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_shareButton"];
  uint64_t v10 = v9;
  if (v9 && [v9 _accessibilityViewIsVisible]) {
    [v6 axSafelyAddObject:v10];
  }
  CGFloat v11 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_iconImageView"];
  double v12 = v11;
  if (v11 && [v11 _accessibilityViewIsVisible]) {
    [v6 insertObject:v12 atIndex:0];
  }
  CGFloat v13 = [(SKUIProductPageHeaderViewAccessibility *)self safeValueForKey:@"_itemOfferButton"];
  CGFloat v14 = v13;
  if (v13 && [v13 _accessibilityViewIsVisible]) {
    [v6 axSafelyAddObject:v14];
  }

  return v6;
}

@end