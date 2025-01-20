@interface AXPeerPaymentGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPeerPaymentGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = objc_alloc_init(AXPeerPaymentGlue);
    MEMORY[0x270F9A758]();
  }
}

uint64_t __50__AXPeerPaymentGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __50__AXPeerPaymentGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MessagesExtension PeerPayment AX"];
  [v2 setOverrideProcessName:@"MessagesExtension PeerPayment"];

  return MEMORY[0x270F0A270]();
}

void __50__AXPeerPaymentGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PKPeerPaymentMessagesAmountStepperViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPeerPaymentNumberPadActionButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPeerPaymentMessagesNumberPadViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPeerPaymentMessagesContentViewAccessibility" canInteractWithTargetClass:1];
}

@end