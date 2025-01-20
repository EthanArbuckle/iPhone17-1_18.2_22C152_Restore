@interface PBA_SBUICallToActionLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScannerShouldUseActivateInPointMode;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PBA_SBUICallToActionLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUICallToActionLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBADeviceUnlockViewController", @"_homeButtonPressed:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBADataRecoveryViewController", @"_pushPasscodeView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUICallToActionLabel", @"label", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PBA_SBUICallToActionLabelAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PBA_SBUICallToActionLabelAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)_accessibilityScannerShouldUseActivateInPointMode
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke;
  v8[3] = &unk_265146B60;
  v8[4] = &v13;
  v8[5] = &v9;
  v2 = [(PBA_SBUICallToActionLabelAccessibility *)self _accessibilityFindAncestor:v8 startWithSelf:0];
  objc_super v3 = v2;
  if (*((unsigned char *)v14 + 24))
  {
    v4 = v7;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke_2;
    v7[3] = &unk_265146B88;
    v7[4] = v2;
    AXPerformSafeBlock();
LABEL_5:

    goto LABEL_6;
  }
  if (*((unsigned char *)v10 + 24))
  {
    v4 = v6;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke_3;
    v6[3] = &unk_265146B88;
    v6[4] = v2;
    AXPerformSafeBlock();
    goto LABEL_5;
  }
LABEL_6:

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PBA_SBUICallToActionLabelAccessibility *)self safeValueForKey:@"label"];
  objc_super v3 = [v2 accessibilityLabel];

  return v3;
}

@end