@interface AXInvertColors_InCallService
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_InCallService

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioCallViewController", @"setBackgroundImage:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioCallViewController", @"backgroundImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioControlsButton", @"updateRoundViewColorAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioControlsButton", @"roundView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioControlsButton", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"_BNBannerSceneComponentProviderSecureWindow"];
  [v3 validateClass:@"ConversationKit.ConversationHUDViewController" isKindOfClass:@"UIViewController"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PHBottomBarInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PHCallParticipantsViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PHAudioCallControlsViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PHAudioControlsButtonInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PHAudioCallViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PHBottomBarButton__InCallService__InvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PHInCallRootViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"ICSSecureWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"ParticipantVideoViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"BNBannerSceneComponentProviderSecureWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"ConversationHUDViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 2;
}

@end