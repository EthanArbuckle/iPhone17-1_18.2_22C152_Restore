@interface _MFAtomTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvisibility;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation _MFAtomTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MFAtomTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(_MFAtomTextViewAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    v4 = [(_MFAtomTextViewAccessibility *)self accessibilityUserDefinedLabel];
    goto LABEL_15;
  }
  v4 = [MEMORY[0x263F089D8] string];
  v5 = [(_MFAtomTextViewAccessibility *)self accessibilityIdentifier];
  if ([v5 isEqualToString:@"toField"])
  {
    v6 = @"to.text";
LABEL_11:
    v7 = accessibilityLocalizedString(v6);
    [v4 appendString:v7];

    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"subjectField"])
  {
    v6 = @"subject.text";
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"ccField"])
  {
    v6 = @"cc.text";
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"bccField"])
  {
    v6 = @"bcc.text";
    goto LABEL_11;
  }
LABEL_12:
  v10.receiver = self;
  v10.super_class = (Class)_MFAtomTextViewAccessibility;
  v8 = [(_MFAtomTextViewAccessibility *)&v10 accessibilityLabel];
  if (v8) {
    [v4 appendString:v8];
  }

LABEL_15:

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  unint64_t v3 = [(_MFAtomTextViewAccessibility *)self accessibilityTraits];
  if ((*MEMORY[0x263F81398] & v3) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)_MFAtomTextViewAccessibility;
    [(_MFAtomTextViewAccessibility *)&v7 accessibilityActivationPoint];
  }
  else
  {
    uint64_t v6 = [(_MFAtomTextViewAccessibility *)self accessibilityFrame];
    MEMORY[0x270F0A3B0](v6);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityValue
{
  LOBYTE(v11) = 0;
  objc_opt_class();
  unint64_t v3 = [(_MFAtomTextViewAccessibility *)self safeValueForKey:@"atoms"];
  double v4 = __UIAccessibilityCastAsClass();

  double v5 = [(_MFAtomTextViewAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Mfcomposerecip_4.isa)];
  if ([v5 safeBoolForKey:@"_isTextViewCollapsed"])
  {
    uint64_t v6 = [v5 safeValueForKey:@"_inactiveTextView"];
    objc_super v7 = [v6 accessibilityValue];
  }
  else if ([v4 count])
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    id v16 = [MEMORY[0x263EFF980] array];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50___MFAtomTextViewAccessibility_accessibilityValue__block_invoke;
    v10[3] = &unk_2650A4030;
    v10[4] = &v11;
    [v4 enumerateObjectsUsingBlock:v10];
    objc_super v7 = [(id)v12[5] componentsJoinedByString:@", "];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_MFAtomTextViewAccessibility;
    objc_super v7 = [(_MFAtomTextViewAccessibility *)&v9 accessibilityValue];
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)_MFAtomTextViewAccessibility;
  [(_MFAtomTextViewAccessibility *)&v3 accessibilityTraits];
  return _AXTraitsRemoveTrait();
}

@end