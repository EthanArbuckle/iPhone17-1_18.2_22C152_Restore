@interface MusicLibraryAddKeepLocalControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityisStatusStructValidated;
- (BOOL)isAccessibilityElement;
- (NSString)_accessibilityCustomActionLabel;
- (id)_accessibilityCustomActionLabelForControlStatus:(int64_t)a3;
- (id)_accessibilityLabelForStatusType:(int64_t)a3;
- (id)_accessibilityValueForStatusType:(int64_t)a3 andDownloadProgress:(double)a4;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetCustomActionLabel:(id)a3;
- (void)_updateControlStatusProperties;
- (void)setControlStatus:(MusicLibraryAddKeepLocalControlStatus)a3 animated:(BOOL)a4;
- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4;
@end

@implementation MusicLibraryAddKeepLocalControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicLibraryAddKeepLocalControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSString)_accessibilityCustomActionLabel
{
  return (NSString *)objc_getAssociatedObject(self, &__MusicLibraryAddKeepLocalControlAccessibility___accessibilityCustomActionLabel);
}

- (void)_accessibilitySetCustomActionLabel:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicLibraryAddKeepLocalControl", @"controlStatus", "{MusicLibraryAddKeepLocalControlStatus=qd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicLibraryAddKeepLocalControl", @"setControlStatus:animated:", "v", "{MusicLibraryAddKeepLocalControlStatus=qd}", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicLibraryAddKeepLocalControl", @"_updateControlStatusProperties", "v", 0);
  [v3 validateClass:@"MusicLibraryAddKeepLocalControl" hasInstanceVariable:@"_controlTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"MusicLibraryAddKeepLocalControl" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicLibraryAddKeepLocalControl", @"setTitle:forControlStatusType:", "v", "@", "q", 0);
}

- (BOOL)_accessibilityisStatusStructValidated
{
  v2 = [MEMORY[0x263F229D0] sharedInstance];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__MusicLibraryAddKeepLocalControlAccessibility__accessibilityisStatusStructValidated__block_invoke;
  block[3] = &unk_265144198;
  id v8 = v2;
  uint64_t v3 = _accessibilityisStatusStructValidated_onceToken;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&_accessibilityisStatusStructValidated_onceToken, block);
  }
  char v5 = _accessibilityisStatusStructValidated_validated;

  return v5;
}

uint64_t __85__MusicLibraryAddKeepLocalControlAccessibility__accessibilityisStatusStructValidated__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "validateClass:hasInstanceMethod:withFullSignature:", @"MusicLibraryAddKeepLocalControl", @"controlStatus", "{MusicLibraryAddKeepLocalControlStatus=qd}", 0);
  _accessibilityisStatusStructValidated_validated = result;
  if (result) {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "validateClass:hasInstanceMethod:withFullSignature:", @"MusicLibraryAddKeepLocalControl", @"setControlStatus:animated:", "v", "{MusicLibraryAddKeepLocalControlStatus=qd}", "B", 0);
  }
  _accessibilityisStatusStructValidated_validated = result;
  return result;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3 = [(MusicLibraryAddKeepLocalControlAccessibility *)self accessibilityValue];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(MusicLibraryAddKeepLocalControlAccessibility *)self accessibilityLabel];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(MusicLibraryAddKeepLocalControlAccessibility *)self safeValueForKey:@"_controlTitleLabel"];
  BOOL v4 = [v3 accessibilityLabel];

  if (!v4)
  {
    if ([(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityisStatusStructValidated])
    {
      BOOL v4 = [(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityLabelForStatusType:*(void *)[(MusicLibraryAddKeepLocalControlAccessibility *)self safeIvarForKey:@"_controlStatus"]];
    }
    else
    {
      BOOL v4 = 0;
    }
  }

  return v4;
}

- (id)accessibilityValue
{
  if ([(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityisStatusStructValidated])
  {
    uint64_t v3 = [(MusicLibraryAddKeepLocalControlAccessibility *)self safeIvarForKey:@"_controlStatus"];
    BOOL v4 = [(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityValueForStatusType:*(void *)v3 andDownloadProgress:*(double *)(v3 + 8)];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_accessibilityLabelForStatusType:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v4 = @"add.to.playlist";
LABEL_5:
    char v5 = accessibilityLocalizedString(v4);
    return v5;
  }
  if (a3 == 2)
  {
    BOOL v4 = @"download.button";
    goto LABEL_5;
  }
  char v5 = 0;
  return v5;
}

- (id)_accessibilityValueForStatusType:(int64_t)a3 andDownloadProgress:(double)a4
{
  if (a3 == 3)
  {
    v7 = accessibilityLocalizedString(@"waiting.download");
  }
  else if (a3 == 4)
  {
    BOOL v4 = NSString;
    char v5 = accessibilityLocalizedString(@"downloading.percentage");
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
  if ((unint64_t)(a3 - 1) > 4)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = accessibilityLocalizedString(off_2651442E0[a3 - 1]);
  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)MusicLibraryAddKeepLocalControlAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(MusicLibraryAddKeepLocalControlAccessibility *)&v8 accessibilityTraits];
  if ([(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityisStatusStructValidated])
  {
    if (*(void *)[(MusicLibraryAddKeepLocalControlAccessibility *)self safeIvarForKey:@"_controlStatus"] == 4)uint64_t v4 = *MEMORY[0x263F1CF68]; {
    else
    }
      uint64_t v4 = 0;
    v3 |= v4;
  }
  int v5 = [(MusicLibraryAddKeepLocalControlAccessibility *)self safeBoolForKey:@"userInteractionEnabled"];
  uint64_t v6 = *MEMORY[0x263F1CF20];
  if (v5) {
    uint64_t v6 = 0;
  }
  return v6 | v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  if ([(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityisStatusStructValidated])
  {
    unint64_t v3 = [(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityCustomActionLabelForControlStatus:*(void *)[(MusicLibraryAddKeepLocalControlAccessibility *)self safeIvarForKey:@"_controlStatus"]];
    [(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilitySetCustomActionLabel:v3];
  }
  v4.receiver = self;
  v4.super_class = (Class)MusicLibraryAddKeepLocalControlAccessibility;
  [(MusicLibraryAddKeepLocalControlAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
}

- (void)_updateControlStatusProperties
{
  v3.receiver = self;
  v3.super_class = (Class)MusicLibraryAddKeepLocalControlAccessibility;
  [(MusicLibraryAddKeepLocalControlAccessibility *)&v3 _updateControlStatusProperties];
  [(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setControlStatus:(MusicLibraryAddKeepLocalControlStatus)a3 animated:(BOOL)a4
{
  int64_t var0 = a3.var0;
  v7.receiver = self;
  v7.super_class = (Class)MusicLibraryAddKeepLocalControlAccessibility;
  -[MusicLibraryAddKeepLocalControlAccessibility setControlStatus:animated:](&v7, sel_setControlStatus_animated_, a3.var0, *(void *)&a3.var1, a4);
  if ([(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityisStatusStructValidated])
  {
    uint64_t v6 = [(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityCustomActionLabelForControlStatus:var0];
    [(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilitySetCustomActionLabel:v6];
  }
}

- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MusicLibraryAddKeepLocalControlAccessibility;
  [(MusicLibraryAddKeepLocalControlAccessibility *)&v5 setTitle:a3 forControlStatusType:a4];
  [(MusicLibraryAddKeepLocalControlAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end