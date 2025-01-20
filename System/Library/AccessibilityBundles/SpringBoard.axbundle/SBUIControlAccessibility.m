@interface SBUIControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation SBUIControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(SBUIControlAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"ShowcaseBlockingView"];

  if (v4)
  {
    if (AXSpringBoardIsAssistantVisible()) {
      UIAXPrivateLocalizedString();
    }
    else {
    v5 = accessibilityLocalizedString(@"dismiss.app.switcher.label");
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUIControlAccessibility;
    v5 = [(SBUIControlAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

- (id)accessibilityHint
{
  v3 = [(SBUIControlAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"ShowcaseBlockingView"];

  if (v4)
  {
    if (AXSpringBoardIsAssistantVisible()) {
      UIAXPrivateLocalizedString();
    }
    else {
    v5 = accessibilityLocalizedString(@"dismiss.app.switcher.hint");
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUIControlAccessibility;
    v5 = [(SBUIControlAccessibility *)&v7 accessibilityHint];
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  v3 = [(SBUIControlAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"ShowcaseBlockingView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBUIControlAccessibility;
  return [(SBUIControlAccessibility *)&v6 isAccessibilityElement];
}

@end