@interface _CNAtomTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvisibility;
- (BOOL)_accessibilityUseInactiveTextViewValueForParent:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)accessibilityAttributedValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation _CNAtomTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_CNAtomTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"_isTextViewCollapsed", "B", 0);
  [v3 validateClass:@"CNComposeRecipientTextView" hasInstanceVariable:@"_inactiveTextView" withType:"UITextView"];
  [v3 validateClass:@"CNComposeRecipientTextView"];
  [v3 validateClass:@"_CNAtomTextView" isKindOfClass:@"UITextView"];
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(_CNAtomTextViewAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    v4 = [(_CNAtomTextViewAccessibility *)self accessibilityUserDefinedLabel];
    goto LABEL_15;
  }
  v4 = [MEMORY[0x263F089D8] string];
  v5 = [(_CNAtomTextViewAccessibility *)self accessibilityIdentifier];
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
  v10.super_class = (Class)_CNAtomTextViewAccessibility;
  v8 = [(_CNAtomTextViewAccessibility *)&v10 accessibilityLabel];
  if (v8) {
    [v4 appendString:v8];
  }

LABEL_15:

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  unint64_t v3 = [(_CNAtomTextViewAccessibility *)self accessibilityTraits];
  if ((*MEMORY[0x263F81398] & v3) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)_CNAtomTextViewAccessibility;
    [(_CNAtomTextViewAccessibility *)&v7 accessibilityActivationPoint];
  }
  else
  {
    uint64_t v6 = [(_CNAtomTextViewAccessibility *)self accessibilityFrame];
    MEMORY[0x270F0A3B0](v6);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityValue
{
  unint64_t v3 = [(_CNAtomTextViewAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Cncomposerecip_5.isa)];
  if ([(_CNAtomTextViewAccessibility *)self _accessibilityUseInactiveTextViewValueForParent:v3])
  {
    double v4 = [v3 safeValueForKey:@"_inactiveTextView"];
    double v5 = [v4 accessibilityValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_CNAtomTextViewAccessibility;
    double v5 = [(_CNAtomTextViewAccessibility *)&v7 accessibilityValue];
  }

  return v5;
}

- (id)accessibilityAttributedValue
{
  unint64_t v3 = [(_CNAtomTextViewAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Cncomposerecip_5.isa)];
  if ([(_CNAtomTextViewAccessibility *)self _accessibilityUseInactiveTextViewValueForParent:v3])
  {
    double v4 = [v3 safeValueForKey:@"_inactiveTextView"];
    double v5 = [v4 accessibilityAttributedValue];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_CNAtomTextViewAccessibility;
    double v5 = [(_CNAtomTextViewAccessibility *)&v15 accessibilityAttributedValue];
    if (AXDoesRequestingClientDeserveAutomation())
    {
      uint64_t v6 = (void *)[v5 mutableCopy];
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      v14[3] = 0;
      uint64_t v7 = [v5 length];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __60___CNAtomTextViewAccessibility_accessibilityAttributedValue__block_invoke;
      v11[3] = &unk_265117840;
      id v8 = v6;
      id v12 = v8;
      v13 = v14;
      objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v11);
      id v9 = v8;

      _Block_object_dispose(v14, 8);
      double v5 = v9;
    }
  }

  return v5;
}

- (BOOL)_accessibilityUseInactiveTextViewValueForParent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_CNAtomTextViewAccessibility *)self accessibilityTraits];
  uint64_t v6 = *MEMORY[0x263F21A30];
  char v7 = [v4 safeBoolForKey:@"_isTextViewCollapsed"];

  if ((v6 & ~v5) != 0) {
    return v7;
  }
  else {
    return 0;
  }
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)_CNAtomTextViewAccessibility;
  [(_CNAtomTextViewAccessibility *)&v3 accessibilityTraits];
  return _AXTraitsRemoveTrait();
}

- (_NSRange)_accessibilitySelectedTextRange
{
  objc_super v3 = [(_CNAtomTextViewAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Cncomposerecip_5.isa)];
  if ([(_CNAtomTextViewAccessibility *)self _accessibilityUseInactiveTextViewValueForParent:v3])
  {
    id v4 = [v3 safeValueForKey:@"_inactiveTextView"];
    id v5 = (id)[v4 _accessibilitySelectedTextRange];
    NSUInteger v7 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_CNAtomTextViewAccessibility;
    id v5 = [(_CNAtomTextViewAccessibility *)&v11 _accessibilitySelectedTextRange];
    NSUInteger v7 = v8;
  }

  NSUInteger v9 = (NSUInteger)v5;
  NSUInteger v10 = v7;
  result.length = v10;
  result.location = v9;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = [(_CNAtomTextViewAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Cncomposerecip_5.isa)];
  if ([(_CNAtomTextViewAccessibility *)self _accessibilityUseInactiveTextViewValueForParent:v6])
  {
    NSUInteger v7 = [v6 safeValueForKey:@"_inactiveTextView"];
    objc_msgSend(v7, "_accessibilityBoundsForRange:", location, length);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)_CNAtomTextViewAccessibility;
    -[_CNAtomTextViewAccessibility _accessibilityBoundsForRange:](&v24, sel__accessibilityBoundsForRange_, location, length);
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
  }

  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

@end