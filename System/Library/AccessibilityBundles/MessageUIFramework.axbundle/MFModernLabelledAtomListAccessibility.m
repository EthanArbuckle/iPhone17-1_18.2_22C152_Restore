@interface MFModernLabelledAtomListAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilitySpeakThisIgnoresAccessibilityElementStatus;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilitySpeakThisString;
- (id)accessibilityElements;
- (unint64_t)accessibilityTraits;
@end

@implementation MFModernLabelledAtomListAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFModernLabelledAtomList";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFModernLabelledAtomList", @"labelText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFModernLabelledAtomList", @"atomDisplayStrings", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFModernLabelledAtomList", @"label", "@", 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return 0;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (BOOL)_accessibilitySpeakThisIgnoresAccessibilityElementStatus
{
  return 1;
}

- (id)_accessibilitySpeakThisString
{
  id v3 = [(MFModernLabelledAtomListAccessibility *)self safeValueForKey:@"labelText"];
  v4 = [(MFModernLabelledAtomListAccessibility *)self safeValueForKey:@"atomDisplayStrings"];
  v5 = __UIAccessibilitySafeClass();

  v8 = [v5 componentsJoinedByString:@", "];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityElements
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 subviews];
  v4 = (void *)[v3 mutableCopy];

  v5 = [v2 safeUIViewForKey:@"label"];
  if (v5)
  {
    uint64_t v6 = [v4 indexOfObject:v5];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v4 removeObjectAtIndex:v6];
      [v4 insertObject:v5 atIndex:0];
    }
  }

  return v4;
}

@end