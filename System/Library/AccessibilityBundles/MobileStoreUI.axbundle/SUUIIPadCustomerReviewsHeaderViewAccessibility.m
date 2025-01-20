@interface SUUIIPadCustomerReviewsHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (SUUIIPadCustomerReviewsHeaderViewAccessibility)initWithClientContext:(id)a3;
@end

@implementation SUUIIPadCustomerReviewsHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIIPadCustomerReviewsHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SUUIIPadCustomerReviewsHeaderViewAccessibility)initWithClientContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIIPadCustomerReviewsHeaderViewAccessibility;
  v3 = [(SUUIIPadCustomerReviewsHeaderViewAccessibility *)&v6 initWithClientContext:a3];
  v4 = [(SUUIIPadCustomerReviewsHeaderViewAccessibility *)v3 safeValueForKey:@"_titleLabel"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];

  return v3;
}

@end