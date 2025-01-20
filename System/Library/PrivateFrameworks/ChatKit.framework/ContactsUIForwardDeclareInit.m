@interface ContactsUIForwardDeclareInit
@end

@implementation ContactsUIForwardDeclareInit

uint64_t ___ContactsUIForwardDeclareInit_block_invoke()
{
  _CKCNMeCardSharingOnboardingEditViewController = MEMORY[0x192FBA860](@"CNMeCardSharingOnboardingEditViewController", @"ContactsUI");
  _CKCNMeCardSharingOnboardingAudienceViewController = MEMORY[0x192FBA860](@"CNMeCardSharingOnboardingAudienceViewController", @"ContactsUI");
  _CKCNSharingProfileOnboardingFlowManager = MEMORY[0x192FBA860](@"CNSharingProfileOnboardingFlowManager", @"ContactsUI");
  uint64_t result = MEMORY[0x192FBA860](@"CNSharedProfileOnboardingController", @"ContactsUI");
  _CKCNSharedProfileOnboardingController = result;
  return result;
}

uint64_t ___ContactsUIForwardDeclareInit_block_invoke_0()
{
  uint64_t result = MEMORY[0x192FBA860](@"CNSharingProfileAvatarItemProvider", @"ContactsUI");
  _CKCNSharingProfileAvatarItemProvider = result;
  return result;
}

@end