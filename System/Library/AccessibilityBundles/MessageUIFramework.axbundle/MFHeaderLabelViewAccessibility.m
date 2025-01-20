@interface MFHeaderLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
@end

@implementation MFHeaderLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFHeaderLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v2 = [(MFHeaderLabelViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Mfcomposemulti.isa)];

  return v2 != 0;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  v3 = [(MFHeaderLabelViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Mfcomposemulti.isa)];

  if (v3) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)MFHeaderLabelViewAccessibility;
  return [(MFHeaderLabelViewAccessibility *)&v5 accessibilityRespondsToUserInteraction];
}

- (id)accessibilityHint
{
  v2 = [(MFHeaderLabelViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Mfcomposemulti.isa)];

  if (v2)
  {
    v3 = accessibilityLocalizedString(@"combined.header.hint");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end