@interface _UILegibilityLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)description;
@end

@implementation _UILegibilityLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UILegibilityLabel";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UILegibilityLabel", @"string", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  return (id)[(_UILegibilityLabelAccessibility *)self safeValueForKey:@"string", a2, self];
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(_UILegibilityLabelAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v5 = v2 == 0;

  if (v5) {
    return [(_UILegibilityLabelAccessibility *)self _accessibilityViewIsVisible] & 1;
  }
  id v4 = (id)[(_UILegibilityLabelAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (id)description
{
  v9 = self;
  SEL v8 = a2;
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_UILegibilityLabelAccessibility;
  id v5 = [(_UILegibilityLabelAccessibility *)&v7 description];
  id v4 = [(_UILegibilityLabelAccessibility *)v9 accessibilityLabel];
  id v6 = (id)[v3 stringWithFormat:@"%@ (%@)", v5, v4];

  return v6;
}

@end