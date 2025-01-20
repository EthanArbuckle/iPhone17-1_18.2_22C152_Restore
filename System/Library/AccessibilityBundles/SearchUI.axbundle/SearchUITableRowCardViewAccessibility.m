@interface SearchUITableRowCardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SearchUITableRowCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUITableRowCardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICardSectionView", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKGridRowView", @"labels", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(SearchUITableRowCardViewAccessibility *)self safeValueForKey:@"contentView"];
  id v3 = [v2 safeArrayForKey:@"labels"];
  v4 = MEMORY[0x24565F960]();

  return v4;
}

@end