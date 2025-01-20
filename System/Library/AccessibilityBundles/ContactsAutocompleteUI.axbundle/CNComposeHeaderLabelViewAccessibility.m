@interface CNComposeHeaderLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
- (id)accessibilityHint;
@end

@implementation CNComposeHeaderLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNComposeHeaderLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  v3 = [(CNComposeHeaderLabelViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Mfcomposemulti.isa)];

  if (v3) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)CNComposeHeaderLabelViewAccessibility;
  return [(CNComposeHeaderLabelViewAccessibility *)&v5 accessibilityRespondsToUserInteraction];
}

- (id)accessibilityHint
{
  v3 = [(CNComposeHeaderLabelViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Mfcomposemulti.isa)];

  if (v3)
  {
    v4 = accessibilityLocalizedString(@"combined.header.hint");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNComposeHeaderLabelViewAccessibility;
    v4 = [(CNComposeHeaderLabelViewAccessibility *)&v6 accessibilityHint];
  }

  return v4;
}

@end