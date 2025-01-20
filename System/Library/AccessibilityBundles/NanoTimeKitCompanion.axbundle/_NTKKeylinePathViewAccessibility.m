@interface _NTKKeylinePathViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)accessibilityActivate;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCustomActions;
- (id)_accessibilityEditPageView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityIncrement;
@end

@implementation _NTKKeylinePathViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_NTKKeylinePathView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_NTKKeylinePathView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  if (accessibilityFaceLibraryTabEditorEnabled())
  {
    char v7 = 0;
    objc_opt_class();
    id v3 = __UIAccessibilityCastAsClass();
    BOOL v4 = accessibilityHandleActivateOnKeylineView(v3);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_NTKKeylinePathViewAccessibility;
    return [(_NTKKeylinePathViewAccessibility *)&v6 accessibilityActivate];
  }
  return v4;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = accessibilityLabelForKeylineView(v2);

  return v3;
}

- (id)accessibilityValue
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = accessibilityValueForKeylineView(v2);

  return v3;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  accessibilityHandleFocusOnKeylineView();
}

- (id)accessibilityHint
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = accessibilityHintForKeylineView(v2);

  return v3;
}

- (id)_accessibilityCustomActions
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  UIAccessibilityTraits v3 = accessibilityTraitsForKeylineView(v2);

  return v3;
}

- (void)accessibilityIncrement
{
  id v2 = [(_NTKKeylinePathViewAccessibility *)self _accessibilityEditPageView];
  _accessibilityEditComplicationPickerView(v2, 1);
}

- (void)accessibilityDecrement
{
  id v2 = [(_NTKKeylinePathViewAccessibility *)self _accessibilityEditPageView];
  _accessibilityEditComplicationPickerView(v2, 0);
}

- (id)_accessibilityEditPageView
{
  uint64_t v3 = AXSafeClassFromString();

  return [(_NTKKeylinePathViewAccessibility *)self _accessibilityAncestorIsKindOf:v3];
}

- (BOOL)canBecomeFocused
{
  if ([(_NTKKeylinePathViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)_NTKKeylinePathViewAccessibility;
  return [(_NTKKeylinePathViewAccessibility *)&v4 canBecomeFocused];
}

@end