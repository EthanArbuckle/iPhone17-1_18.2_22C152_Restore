@interface MPAddKeepLocalControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCustomActionLabel;
- (id)_accessibilityCustomActionLabelForControlStatus:(int64_t)a3;
- (id)_accessibilityLabelForStatusType:(int64_t)a3;
- (id)_accessibilityValueForStatusType:(int64_t)a3 andDownloadProgress:(double)a4;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetCustomActionLabel:(id)a3;
- (void)setControlStatus:(MPAddKeepLocalControlStatus)a3 animated:(BOOL)a4;
@end

@implementation MPAddKeepLocalControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPAddKeepLocalControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityCustomActionLabel
{
}

- (void)_accessibilitySetCustomActionLabel:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAddKeepLocalControl", @"controlStatus", "{MPAddKeepLocalControlStatus=qd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAddKeepLocalControl", @"setControlStatus:animated:", "v", "{MPAddKeepLocalControlStatus=qd}", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(MPAddKeepLocalControlAccessibility *)self accessibilityValue];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(MPAddKeepLocalControlAccessibility *)self accessibilityLabel];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(MPAddKeepLocalControlAccessibility *)self controlStatus];

  return [(MPAddKeepLocalControlAccessibility *)self _accessibilityLabelForStatusType:v3];
}

- (id)accessibilityValue
{
  uint64_t v4 = [(MPAddKeepLocalControlAccessibility *)self controlStatus];

  return [(MPAddKeepLocalControlAccessibility *)self _accessibilityValueForStatusType:v4 andDownloadProgress:v3];
}

- (id)_accessibilityLabelForStatusType:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = @"add.button";
LABEL_5:
    v5 = accessibilityMPLocalizedString(v4);
    return v5;
  }
  if (a3 == 2)
  {
    uint64_t v4 = @"download.button";
    goto LABEL_5;
  }
  v5 = 0;
  return v5;
}

- (id)_accessibilityValueForStatusType:(int64_t)a3 andDownloadProgress:(double)a4
{
  if (a3 == 3)
  {
    v7 = accessibilityMPLocalizedString(@"waiting.download");
  }
  else if (a3 == 4)
  {
    uint64_t v4 = NSString;
    v5 = accessibilityMPLocalizedString(@"downloading");
    v6 = AXFormatFloatWithPercentage();
    v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_accessibilityCustomActionLabelForControlStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = accessibilityMPLocalizedString(off_2650A2D88[a3 - 1]);
  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)MPAddKeepLocalControlAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(MPAddKeepLocalControlAccessibility *)&v7 accessibilityTraits];
  uint64_t v4 = [(MPAddKeepLocalControlAccessibility *)self controlStatus];
  uint64_t v5 = *MEMORY[0x263F1CF68];
  if (v4 != 4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (void)setControlStatus:(MPAddKeepLocalControlStatus)a3 animated:(BOOL)a4
{
  int64_t var0 = a3.var0;
  v7.receiver = self;
  v7.super_class = (Class)MPAddKeepLocalControlAccessibility;
  -[MPAddKeepLocalControlAccessibility setControlStatus:animated:](&v7, sel_setControlStatus_animated_, a3.var0, *(void *)&a3.var1, a4);
  v6 = [(MPAddKeepLocalControlAccessibility *)self _accessibilityCustomActionLabelForControlStatus:var0];
  [(MPAddKeepLocalControlAccessibility *)self _accessibilitySetCustomActionLabel:v6];
}

@end