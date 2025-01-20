@interface InCallControlsIgnoreLMIRequestsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_axCellSwitch;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation InCallControlsIgnoreLMIRequestsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.InCallControlsIgnoreLMIRequestsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_opt_class();
  v3 = [v2 contentConfiguration];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];

  return v5;
}

- (id)accessibilityValue
{
  v2 = NSString;
  v3 = [(InCallControlsIgnoreLMIRequestsCellAccessibility *)self _axCellSwitch];
  v4 = objc_msgSend(v2, "stringWithFormat:", @"%d", objc_msgSend(v3, "isOn"));

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)InCallControlsIgnoreLMIRequestsCellAccessibility;
  return *MEMORY[0x263F81418] | [(InCallControlsIgnoreLMIRequestsCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)accessibilityActivate
{
  v2 = [(InCallControlsIgnoreLMIRequestsCellAccessibility *)self _axCellSwitch];
  objc_msgSend(v2, "setOn:animated:", objc_msgSend(v2, "isOn") ^ 1, 1);

  return v2 != 0;
}

- (id)_axCellSwitch
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_super v3 = [v2 accessories];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__InCallControlsIgnoreLMIRequestsCellAccessibility__axCellSwitch__block_invoke;
  v6[3] = &unk_265119F30;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__InCallControlsIgnoreLMIRequestsCellAccessibility__axCellSwitch__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  uint64_t v7 = __UIAccessibilityCastAsClass();
  v8 = [v7 customView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [v7 customView];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

@end