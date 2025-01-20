@interface AXFaceTimeGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXFaceTimeGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __47__AXFaceTimeGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_321 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_330];
}

uint64_t __47__AXFaceTimeGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"PHHandsetDialerNameLabelView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHHandsetDialerLCDView", @"delegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAbstractDialerView", @"delegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHHandsetDialerLCDView", @"deleteCharacter", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHHandsetDialerLCDView", @"setText: needsFormat:", "v", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAbstractDialerView", @"lcdView", "@", 0);
  [v2 validateClass:@"PHAbstractDialerView" hasInstanceVariable:@"_addContactButton" withType:"UIControl"];
  [v2 validateClass:@"PHAbstractDialerView" hasInstanceVariable:@"_deleteButton" withType:"UIControl"];
  [v2 validateClass:@"PHAbstractDialerView" hasInstanceVariable:@"_callButton" withType:"UIControl"];
  [v2 validateClass:@"PHHandsetDialerLCDView" hasInstanceVariable:@"_numberTextField" withType:"PHLCDViewTextField"];
  [v2 validateClass:@"PHLCDViewTextField" isKindOfClass:@"UITextField"];

  return 1;
}

uint64_t __47__AXFaceTimeGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Facetime AX Bundle"];
  [v2 setOverrideProcessName:@"Facetime"];

  return MEMORY[0x270F0A270]();
}

void __47__AXFaceTimeGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PhoneContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"FaceTimeApplicationAccesssibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobilePhoneUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobilePhoneUILabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHAbstractDialerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHHandsetDialerLCDViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHLCDViewTextFieldAccessibility" canInteractWithTargetClass:1];
}

@end