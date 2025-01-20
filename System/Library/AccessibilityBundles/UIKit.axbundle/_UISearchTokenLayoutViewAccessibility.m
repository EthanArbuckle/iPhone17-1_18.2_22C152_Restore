@interface _UISearchTokenLayoutViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UISearchTokenLayoutViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UISearchTokenLayoutView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UISearchTokenLayoutView", @"delegateView", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  return (id)[(_UISearchTokenLayoutViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"delegateView", a2, self];
}

- (unint64_t)accessibilityTraits
{
  id v3 = (id)[(_UISearchTokenLayoutViewAccessibility *)self safeValueForKey:@"delegateView"];
  unint64_t v4 = [v3 accessibilityTraits];

  return v4;
}

- (BOOL)isAccessibilityElement
{
  id v3 = (id)[(_UISearchTokenLayoutViewAccessibility *)self safeValueForKey:@"delegateView"];
  char v4 = [v3 isAccessibilityElement];

  return v4 & 1;
}

@end