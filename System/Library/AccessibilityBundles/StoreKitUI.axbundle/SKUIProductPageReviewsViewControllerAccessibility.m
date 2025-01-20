@interface SKUIProductPageReviewsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setFacebookLikeStatus:(id)a3;
@end

@implementation SKUIProductPageReviewsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIProductPageReviewsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageReviewsViewController", @"setFacebookLikeStatus:", "v", "@", 0);
  [v3 validateClass:@"SKUIProductPageReviewsViewController" hasInstanceVariable:@"_headerViewController" withType:"SKUIProductPageHeaderViewController"];
  [v3 validateClass:@"SKUIReviewsFacebookViewController" hasInstanceVariable:@"_facebookLikeStatus" withType:"SKUIFacebookLikeStatus"];
  [v3 validateClass:@"SKUIProductPageReviewsViewController" hasInstanceVariable:@"_facebookViewController" withType:"SKUIReviewsFacebookViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIFacebookLikeStatus", @"friendNames", "@", 0);
}

- (void)setFacebookLikeStatus:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageReviewsViewControllerAccessibility;
  [(SKUIProductPageReviewsViewControllerAccessibility *)&v13 setFacebookLikeStatus:v4];
  v5 = [(SKUIProductPageReviewsViewControllerAccessibility *)self safeValueForKey:@"_facebookViewController"];
  v6 = [v5 safeValueForKey:@"_facebookLikeStatus"];
  v7 = [v6 safeValueForKey:@"friendNames"];
  uint64_t v8 = [v7 count];

  v9 = [(SKUIProductPageReviewsViewControllerAccessibility *)self safeValueForKey:@"_headerViewController"];
  v10 = [v9 safeValueForKey:@"view"];
  v11 = __UIAccessibilitySafeClass();

  v12 = [NSNumber numberWithInteger:v8];
  [v11 _accessibilitySetRetainedValue:v12 forKey:@"facebookCount"];
}

@end