@interface MapsDebugCollectionHeaderFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MapsDebugCollectionHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MapsDebugCollectionHeaderFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapsDebugCollectionHeaderFooterView", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapsDebugCollectionHeaderFooterView", @"isFooter", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(MapsDebugCollectionHeaderFooterViewAccessibility *)self safeValueForKey:@"textLabel"];
  id v3 = [v2 text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)accessibilityLabel
{
  v2 = [(MapsDebugCollectionHeaderFooterViewAccessibility *)self safeValueForKey:@"textLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CF18];
  int v3 = [(MapsDebugCollectionHeaderFooterViewAccessibility *)self safeBoolForKey:@"isFooter"];
  uint64_t v4 = *MEMORY[0x263F1CEF8];
  if (v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

@end