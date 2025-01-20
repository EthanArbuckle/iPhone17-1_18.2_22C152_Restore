@interface OnBoardingKitInit
@end

@implementation OnBoardingKitInit

uint64_t ___OnBoardingKitInit_block_invoke()
{
  _CKOBWelcomeController = MEMORY[0x192FBA860](@"OBWelcomeController", @"OnBoardingKit");
  _CKOBBoldTrayButton = MEMORY[0x192FBA860](@"OBBoldTrayButton", @"OnBoardingKit");
  _CKOBLinkTrayButton = MEMORY[0x192FBA860](@"OBLinkTrayButton", @"OnBoardingKit");
  uint64_t result = MEMORY[0x192FBA860](@"OBWelcomeFullCenterContentController", @"OnboardingKit");
  _CKOBWelcomeFullCenterContentController = result;
  return result;
}

@end