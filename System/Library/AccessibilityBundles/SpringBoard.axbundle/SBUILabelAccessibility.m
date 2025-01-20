@interface SBUILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityViewIsVisible;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SBUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(SBUILabelAccessibility *)self accessibilityIdentification];
  if (([v3 isEqualToString:@"LockScreenTimeLabel"] & 1) != 0
    || [v3 isEqualToString:@"LockScreenDateLabel"])
  {
    unsigned __int8 v4 = [(SBUILabelAccessibility *)self _accessibilityViewIsVisible];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUILabelAccessibility;
    unsigned __int8 v4 = [(SBUILabelAccessibility *)&v7 isAccessibilityElement];
  }
  BOOL v5 = v4;

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(SBUILabelAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"AirPlay"];

  if (!v4) {
    goto LABEL_3;
  }
  BOOL v5 = [(SBUILabelAccessibility *)self accessibilityLabel];
  v12.receiver = self;
  v12.super_class = (Class)SBUILabelAccessibility;
  v6 = [(SBUILabelAccessibility *)&v12 accessibilityLabel];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0) {
    [(SBUILabelAccessibility *)&v11 accessibilityLabel];
  }
  else {
LABEL_3:
  }
  v8 = [(SBUILabelAccessibility *)&v10 accessibilityValue];

  return v8;
}

- (id)accessibilityLabel
{
  v3 = [(SBUILabelAccessibility *)self accessibilityIdentification];
  if ([v3 isEqualToString:@"LockScreenTimeLabel"])
  {
    int v4 = [MEMORY[0x263EFF910] date];
    BOOL v5 = AXDateStringForFormat();
  }
  else
  {
    v6 = [(SBUILabelAccessibility *)self accessibilityIdentifier];
    int v7 = [v6 isEqualToString:@"AirPlay"];

    if (v7)
    {
      uint64_t v8 = accessibilityLocalizedString(@"airplay.button");
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)SBUILabelAccessibility;
      uint64_t v8 = [(SBUILabelAccessibility *)&v10 accessibilityLabel];
    }
    BOOL v5 = (void *)v8;
  }

  return v5;
}

- (BOOL)_accessibilityViewIsVisible
{
  v3 = [(SBUILabelAccessibility *)self accessibilityIdentification];
  if (([v3 isEqualToString:@"LockScreenTimeLabel"] & 1) != 0
    || [v3 isEqualToString:@"LockScreenDateLabel"])
  {
    int v4 = [(SBUILabelAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Cstimerview.isa)];
    unsigned __int8 v5 = [v4 _accessibilityViewIsVisible];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUILabelAccessibility;
    unsigned __int8 v5 = [(SBUILabelAccessibility *)&v7 _accessibilityViewIsVisible];
  }

  return v5;
}

- (CGRect)accessibilityFrame
{
  v20.receiver = self;
  v20.super_class = (Class)SBUILabelAccessibility;
  [(SBUILabelAccessibility *)&v20 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(SBUILabelAccessibility *)self _accessibilityBoolValueForKey:@"UseSuperviewAsFrame"])
  {
    objc_super v11 = [(SBUILabelAccessibility *)self superview];
    [v11 accessibilityFrame];
    double v4 = v12;
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

@end