@interface _UISearchAtomViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UISearchAtomViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UISearchAtomView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UISearchAtomView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"selectionStyle", "q", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  return (id)[(_UISearchAtomViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"textLabel", a2, self];
}

- (unint64_t)accessibilityTraits
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)_UISearchAtomViewAccessibility;
  unint64_t v4 = [(_UISearchAtomViewAccessibility *)&v5 accessibilityTraits];
  if ([(_UISearchAtomViewAccessibility *)v7 safeIntegerForKey:@"selectionStyle"]) {
    uint64_t v3 = *MEMORY[0x263F1CF38];
  }
  else {
    uint64_t v3 = 0;
  }
  return v4 | v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end