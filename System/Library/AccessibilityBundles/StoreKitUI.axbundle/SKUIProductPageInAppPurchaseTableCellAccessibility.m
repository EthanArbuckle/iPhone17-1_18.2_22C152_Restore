@interface SKUIProductPageInAppPurchaseTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SKUIProductPageInAppPurchaseTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIProductPageInAppPurchaseTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageInAppPurchaseTableCell", @"indexString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageInAppPurchaseTableCell", @"productName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageInAppPurchaseTableCell", @"priceString", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SKUIProductPageInAppPurchaseTableCellAccessibility *)self safeValueForKey:@"indexString"];
  v4 = [(SKUIProductPageInAppPurchaseTableCellAccessibility *)self safeValueForKey:@"productName"];
  v7 = [(SKUIProductPageInAppPurchaseTableCellAccessibility *)self safeValueForKey:@"priceString"];
  v5 = __UIAXStringForVariables();

  return v5;
}

@end