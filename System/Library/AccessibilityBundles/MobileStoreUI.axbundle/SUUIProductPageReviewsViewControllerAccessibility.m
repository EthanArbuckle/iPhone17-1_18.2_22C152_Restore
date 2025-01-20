@interface SUUIProductPageReviewsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setFacebookLikeStatus:(id)a3;
@end

@implementation SUUIProductPageReviewsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIProductPageReviewsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIProductPageReviewsViewController", @"setFacebookLikeStatus:", "v", "@", 0);
  [v3 validateClass:@"SUUIProductPageReviewsViewController" hasInstanceVariable:@"_headerViewController" withType:"SUUIProductPageHeaderViewController"];
  [v3 validateClass:@"SUUIReviewsFacebookViewController" hasInstanceVariable:@"_facebookLikeStatus" withType:"SUUIFacebookLikeStatus"];
  [v3 validateClass:@"SUUIProductPageReviewsViewController" hasInstanceVariable:@"_facebookViewController" withType:"SUUIReviewsFacebookViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIFacebookLikeStatus", @"friendNames", "@", 0);
}

- (void)setFacebookLikeStatus:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIProductPageReviewsViewControllerAccessibility;
  [(SUUIProductPageReviewsViewControllerAccessibility *)&v13 setFacebookLikeStatus:v4];
  v5 = [(SUUIProductPageReviewsViewControllerAccessibility *)self safeValueForKey:@"_facebookViewController"];
  v6 = [v5 safeValueForKey:@"_facebookLikeStatus"];
  v7 = [v6 safeValueForKey:@"friendNames"];
  uint64_t v8 = [v7 count];

  v9 = [(SUUIProductPageReviewsViewControllerAccessibility *)self safeValueForKey:@"_headerViewController"];
  v10 = [v9 safeValueForKey:@"view"];
  v11 = __UIAccessibilitySafeClass();

  v12 = [NSNumber numberWithInteger:v8];
  [v11 _accessibilitySetRetainedValue:v12 forKey:@"facebookCount"];
}

@end