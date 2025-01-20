@interface AXTelephonyUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTelephonyUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_388 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_394];

    _Failover = [objc_allocWithZone((Class)AXTelephonyUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __50__AXTelephonyUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"TPButton"];
  [v2 validateClass:@"TPLCDTextView"];
  [v2 validateClass:@"TPPhonePad"];
  [v2 validateClass:@"TPNumberPad"];
  [v2 validateClass:@"TPNumberPadButton"];
  [v2 validateClass:@"TPSetPINKeyPadButton"];
  [v2 validateClass:@"TPBottomDoubleButtonBar" isKindOfClass:@"TPBottomSingleButtonBar"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPLCDView", @"text", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPLCDView", @"secondLineText", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPLCDView", @"label", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPLCDTextView", @"sizeToFit", "{CGSize=dd}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPLCDTextView", @"textRect", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPPhonePad", @"_buttonForKeyAtIndex:", "@", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPPhonePad", @"_keyForPoint:", "i", "{CGPoint=dd}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPPhonePad", @"_rectForKey:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPLCDTextView", @"text", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPBottomSingleButtonBar", @"button", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPBottomDoubleButtonBar", @"button2", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TPNumberPadButton", @"character", "q", 0);
  [v2 validateClass:@"TPLCDView" hasInstanceVariable:@"_textView" withType:"TPLCDTextView"];
  [v2 validateClass:@"TPLCDView" hasInstanceVariable:@"_labelView" withType:"TPLCDTextView"];
  [v2 validateClass:@"TPNumberPad" hasInstanceVariable:@"_buttons" withType:"NSMutableArray"];
  [v2 validateClass:@"TPSlidingButton" hasInstanceVariable:@"_acceptButton" withType:"_UIActionSlider"];

  return 1;
}

uint64_t __50__AXTelephonyUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"TelephonyUI"];
  [v2 setOverrideProcessName:@"TelephonyUI"];

  return MEMORY[0x270F0A270]();
}

void __50__AXTelephonyUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"TPLCDTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPPhonePadAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPLCDViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPNumberPadButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPSetPINKeyPadButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPNumberPadAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPSlidingButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPSimpleNumberPadAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIButtonAccessibility__TelephonyUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPSetPINViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPPasscodeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPPillViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPDialerNumberPadAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MessageIndicatorViewAccessibility" canInteractWithTargetClass:1];
}

@end