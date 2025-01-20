@interface SKUILockupSwooshCellLayoutAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SKUILockupSwooshCellLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUILockupSwooshCellLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUILockupSwooshCellLayout", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUILockupSwooshCellLayout", @"artistName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUILockupSwooshCellLayout", @"category", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUILockupSwooshCellLayout", @"price", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SKUILockupSwooshCellLayoutAccessibility *)self safeValueForKey:@"title"];
  v4 = [(SKUILockupSwooshCellLayoutAccessibility *)self safeValueForKey:@"artistName"];
  v5 = [(SKUILockupSwooshCellLayoutAccessibility *)self safeValueForKey:@"category"];
  v8 = [(SKUILockupSwooshCellLayoutAccessibility *)self safeValueForKey:@"price"];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end