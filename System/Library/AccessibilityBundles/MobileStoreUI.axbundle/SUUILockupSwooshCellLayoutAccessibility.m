@interface SUUILockupSwooshCellLayoutAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SUUILockupSwooshCellLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUILockupSwooshCellLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUILockupSwooshCellLayout", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUILockupSwooshCellLayout", @"artistName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUILockupSwooshCellLayout", @"category", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUILockupSwooshCellLayout", @"price", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SUUILockupSwooshCellLayoutAccessibility *)self safeValueForKey:@"title"];
  v4 = [(SUUILockupSwooshCellLayoutAccessibility *)self safeValueForKey:@"artistName"];
  v5 = [(SUUILockupSwooshCellLayoutAccessibility *)self safeValueForKey:@"category"];
  v8 = [(SUUILockupSwooshCellLayoutAccessibility *)self safeValueForKey:@"price"];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end