@interface TVFocusableTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isAccessibilityExplorerElement;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)_accessibilityExplorerElementReadPriority;
@end

@implementation TVFocusableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVFocusableTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  v3 = [(TVFocusableTextViewAccessibility *)self safeValueForKey:@"descriptionTextView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];
  BOOL v6 = [v5 length] != 0;

  [v4 setIsAccessibilityElement:v6];
  return v6;
}

- (BOOL)_isAccessibilityExplorerElement
{
  return [(TVFocusableTextViewAccessibility *)self _accessibilityIsFrameOutOfBoundsConsideringScrollParents:0] ^ 1;
}

- (unint64_t)_accessibilityExplorerElementReadPriority
{
  Class v3 = NSClassFromString(&cfstr_Tvrelatedconte.isa);
  v4 = [(TVFocusableTextViewAccessibility *)self _accessibilityAncestorIsKindOf:v3];
  unint64_t v7 = 0;
  if (v4)
  {
    v5 = [(id)*MEMORY[0x263F1D020] _accessibilityNativeFocusElement];
    BOOL v6 = [v5 _accessibilityAncestorIsKindOf:v3];

    if (v4 == v6) {
      unint64_t v7 = 1;
    }
  }

  return v7;
}

- (id)accessibilityLabel
{
  v2 = [(TVFocusableTextViewAccessibility *)self safeValueForKey:@"descriptionTextView"];
  Class v3 = __UIAccessibilitySafeClass();

  v4 = [v3 accessibilityValue];

  return v4;
}

@end