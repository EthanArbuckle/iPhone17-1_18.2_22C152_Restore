@interface SKUIIPadCustomerReviewsHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (SKUIIPadCustomerReviewsHeaderViewAccessibility)initWithClientContext:(id)a3;
@end

@implementation SKUIIPadCustomerReviewsHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIIPadCustomerReviewsHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SKUIIPadCustomerReviewsHeaderViewAccessibility)initWithClientContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIIPadCustomerReviewsHeaderViewAccessibility;
  v3 = [(SKUIIPadCustomerReviewsHeaderViewAccessibility *)&v6 initWithClientContext:a3];
  v4 = [(SKUIIPadCustomerReviewsHeaderViewAccessibility *)v3 safeValueForKey:@"_titleLabel"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];

  return v3;
}

@end