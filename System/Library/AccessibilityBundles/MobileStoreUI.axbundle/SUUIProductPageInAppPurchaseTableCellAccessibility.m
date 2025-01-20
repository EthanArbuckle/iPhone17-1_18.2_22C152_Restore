@interface SUUIProductPageInAppPurchaseTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SUUIProductPageInAppPurchaseTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIProductPageInAppPurchaseTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIProductPageInAppPurchaseTableCell", @"indexString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIProductPageInAppPurchaseTableCell", @"productName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIProductPageInAppPurchaseTableCell", @"priceString", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SUUIProductPageInAppPurchaseTableCellAccessibility *)self safeValueForKey:@"indexString"];
  v4 = [(SUUIProductPageInAppPurchaseTableCellAccessibility *)self safeValueForKey:@"productName"];
  v7 = [(SUUIProductPageInAppPurchaseTableCellAccessibility *)self safeValueForKey:@"priceString"];
  v5 = __UIAXStringForVariables();

  return v5;
}

@end