@interface ASAccountSharingGroupMemberDataManagerClass
@end

@implementation ASAccountSharingGroupMemberDataManagerClass

Class __get_ASAccountSharingGroupMemberDataManagerClass_block_invoke(uint64_t a1)
{
  AuthenticationServicesLibrary();
  Class result = objc_getClass("_ASAccountSharingGroupMemberDataManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_ASAccountSharingGroupMemberDataManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  }
  else
  {
    v3 = (void *)__get_ASAccountSharingGroupMemberDataManagerClass_block_invoke_cold_1();
    return (Class)+[AKSignInWithAppleAvatarManager avatarImageForUserHandle:v5 diameter:v6];
  }
  return result;
}

uint64_t __get_ASAccountSharingGroupMemberDataManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke_2_cold_1(v0);
}

@end