@interface AXInvertColors_PassKitUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_PassKitUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentTransactionView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"PKPhoneHeroImageView"];
  [v3 validateClass:@"PKPassView"];
  [v3 validateClass:@"PKPeerPaymentBubbleView"];
  [v3 validateClass:@"PKPaymentTransactionView" hasInstanceVariable:@"_primaryImageView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"PKCompactNavigationContainerController", @"dimmingColor", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PKPhoneHeroImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PKPassViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PKPeerPaymentBubbleViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PKPaymentTransactionViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PKCompactNavigationContainerControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end