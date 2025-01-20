@interface _MFAtomFieldEditorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanBeFirstResponder;
- (id)_axAtomTextViewAncestor;
- (id)accessibilityPlaceholderValue;
- (unint64_t)accessibilityTraits;
@end

@implementation _MFAtomFieldEditorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MFAtomFieldEditor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFAtomTextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFAtomTextView", @"placeholderLabel", "@", 0);
  [v3 validateClass:@"_MFAtomFieldEditor" isKindOfClass:@"UIView"];
  if (AXProcessIsSpringBoard()) {
    [v3 validateClass:@"SBHomeScreenWindow" isKindOfClass:@"UIWindow"];
  }
}

- (id)_axAtomTextViewAncestor
{
  v2 = [(_MFAtomFieldEditorAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Mfatomtextview_1.isa)];
  id v3 = __UIAccessibilitySafeClass();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)_MFAtomFieldEditorAccessibility;
  [(_MFAtomFieldEditorAccessibility *)&v7 accessibilityTraits];
  uint64_t v3 = _AXTraitsRemoveTrait();
  v4 = [(_MFAtomFieldEditorAccessibility *)self _axAtomTextViewAncestor];
  unint64_t v5 = [v4 accessibilityTraits] | v3;

  return v5;
}

- (id)accessibilityPlaceholderValue
{
  v2 = [(_MFAtomFieldEditorAccessibility *)self _axAtomTextViewAncestor];
  uint64_t v3 = [v2 safeValueForKey:@"placeholderLabel"];
  v4 = __UIAccessibilitySafeClass();

  if ([v4 _accessibilityViewIsVisible])
  {
    unint64_t v5 = [v4 accessibilityLabel];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_accessibilityCanBeFirstResponder
{
  if (_accessibilityCanBeFirstResponder_onceToken != -1) {
    dispatch_once(&_accessibilityCanBeFirstResponder_onceToken, &__block_literal_global_5);
  }
  char v8 = 0;
  objc_opt_class();
  uint64_t v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 window];
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MFAtomFieldEditorAccessibility;
    BOOL v5 = [(_MFAtomFieldEditorAccessibility *)&v7 _accessibilityCanBeFirstResponder];
  }

  return v5;
}

@end