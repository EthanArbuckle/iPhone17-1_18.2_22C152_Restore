@interface SKUIReviewInAppRatingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation SKUIReviewInAppRatingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIReviewInAppRatingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setState:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIReviewInAppRatingViewControllerAccessibility;
  [(SKUIReviewInAppRatingViewControllerAccessibility *)&v3 setState:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end