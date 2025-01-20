@interface SBUILegibilityLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvisibility;
- (BOOL)_accessibilityViewIsVisible;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityParentView;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOption;
@end

@implementation SBUILegibilityLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUILegibilityLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBFLockScreenDateView"];
  [v3 validateClass:@"SBUILegibilityLabel" hasInstanceVariable:@"_lookasideLabel" withType:"UILabel"];
  [v3 validateClass:@"SBFLockScreenDateView" isKindOfClass:@"UIView"];
  if (NSClassFromString(&cfstr_Sbflockscreend_0.isa)) {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFLockScreenDateViewAccessibility", @"_axTimeLabelFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  }
}

- (id)accessibilityLabel
{
  id v3 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
  int v4 = [v3 containsString:@"LockScreenTimeLabel"];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F21660];
    v6 = [MEMORY[0x263EFF910] date];
    v7 = AXDateStringForFormat();
    v8 = [v5 axAttributedStringWithString:v7];

    uint64_t v9 = *MEMORY[0x263EFFB40];
    v10 = (void *)MEMORY[0x263F21708];
LABEL_5:
    [v8 setAttribute:v9 forKey:*v10];
    goto LABEL_7;
  }
  v11 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
  int v12 = [v11 containsString:@"LockScreenDateLabel"];

  if (v12)
  {
    v13 = (void *)MEMORY[0x263F21660];
    v14 = [(SBUILegibilityLabelAccessibility *)self safeValueForKey:@"_lookasideLabel"];
    v15 = [v14 accessibilityLabel];
    v8 = [v13 axAttributedStringWithString:v15];

    uint64_t v9 = *MEMORY[0x263EFFB40];
    v10 = (void *)MEMORY[0x263F21718];
    goto LABEL_5;
  }
  v16 = [(SBUILegibilityLabelAccessibility *)self safeValueForKey:@"_lookasideLabel"];
  v8 = [v16 accessibilityLabel];

LABEL_7:

  return v8;
}

- (BOOL)_accessibilityOverridesInvisibility
{
  id v3 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"HomeAffordanceLabel"];

  if (v4) {
    return 1;
  }
  v5 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
  if ([v5 isEqualToString:@"LockScreenTimeLabel"])
  {
  }
  else
  {
    v6 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
    int v7 = [v6 isEqualToString:@"LockScreenDateLabel"];

    if (!v7) {
      goto LABEL_7;
    }
  }
  [(SBUILegibilityLabelAccessibility *)self alpha];
  if (v8 > 0.0) {
    return 1;
  }
LABEL_7:
  v10.receiver = self;
  v10.super_class = (Class)SBUILegibilityLabelAccessibility;
  return [(SBUILegibilityLabelAccessibility *)&v10 _accessibilityOverridesInvisibility];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v5 = [(SBUILegibilityLabelAccessibility *)self _accessibilityWindow];
  NSClassFromString(&cfstr_Sbcoversheetwi.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3 == 1 && (isKindOfClass & 1) != 0)
  {
    int v7 = accessibilitySBLocalizedString(@"did.show.today.view.announcement");
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
  v10.receiver = self;
  v10.super_class = (Class)SBUILegibilityLabelAccessibility;
  BOOL v8 = [(SBUILegibilityLabelAccessibility *)&v10 accessibilityScroll:a3];

  return v8;
}

- (BOOL)_accessibilityViewIsVisible
{
  id v3 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"HomeAffordanceLabel"];

  if (v4) {
    return 1;
  }
  v5 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
  if ([v5 isEqualToString:@"LockScreenTimeLabel"])
  {
  }
  else
  {
    v6 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
    int v7 = [v6 isEqualToString:@"LockScreenDateLabel"];

    if (!v7) {
      goto LABEL_7;
    }
  }
  [(SBUILegibilityLabelAccessibility *)self alpha];
  if (v8 > 0.0) {
    return 1;
  }
LABEL_7:
  v10.receiver = self;
  v10.super_class = (Class)SBUILegibilityLabelAccessibility;
  return [(SBUILegibilityLabelAccessibility *)&v10 _accessibilityViewIsVisible];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"HomeAffordanceLabel"];

  if (v4) {
    return 1;
  }
  v5 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
  if ([v5 isEqualToString:@"LockScreenTimeLabel"])
  {
  }
  else
  {
    v6 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
    int v7 = [v6 isEqualToString:@"LockScreenDateLabel"];

    if (!v7) {
      return 1;
    }
  }
  double v8 = [(SBUILegibilityLabelAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbflockscreend.isa)];

  return v8 != 0;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CF48];
  id v3 = [(SBUILegibilityLabelAccessibility *)self accessibilityContainer];
  NSClassFromString(&cfstr_Ncnotification.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v5 = *MEMORY[0x263F1CEF8];
  if ((isKindOfClass & 1) == 0) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

- (CGRect)accessibilityFrame
{
  id v3 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"LockScreenTimeLabel"];

  if (v4)
  {
    uint64_t v5 = [(SBUILegibilityLabelAccessibility *)self _accessibilityParentView];
    NSClassFromString(&cfstr_Sbflockscreend.isa);
    if (objc_opt_isKindOfClass())
    {
      [v5 safeCGRectForKey:@"_axTimeLabelFrame"];
      CGFloat x = v19.origin.x;
      CGFloat y = v19.origin.y;
      CGFloat width = v19.size.width;
      CGFloat height = v19.size.height;
      if (!CGRectIsNull(v19))
      {

        goto LABEL_6;
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SBUILegibilityLabelAccessibility;
  [(SBUILegibilityLabelAccessibility *)&v18 accessibilityFrame];
  CGFloat x = v10;
  CGFloat y = v11;
  CGFloat width = v12;
  CGFloat height = v13;
LABEL_6:
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  id v3 = [(SBUILegibilityLabelAccessibility *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"LockScreenTimeLabel"];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBUILegibilityLabelAccessibility;
  return [(SBUILegibilityLabelAccessibility *)&v6 accessibilityRespondsToUserInteraction];
}

- (unsigned)_accessibilityMediaAnalysisOption
{
  return 0;
}

- (id)_accessibilityParentView
{
  id v3 = [(SBUILegibilityLabelAccessibility *)self accessibilityContainer];
  if (v3
    && (NSClassFromString(&cfstr_Sbflockscreend.isa), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUILegibilityLabelAccessibility;
    id v4 = [(SBUILegibilityLabelAccessibility *)&v7 _accessibilityParentView];
  }
  uint64_t v5 = v4;

  return v5;
}

@end