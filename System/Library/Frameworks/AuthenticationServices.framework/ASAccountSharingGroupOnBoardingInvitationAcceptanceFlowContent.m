@interface ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent
@end

@implementation ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent

void __100___ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent__bulletListItemImageConfiguration__block_invoke()
{
  v0 = (void *)MEMORY[0x263F82818];
  id v3 = [MEMORY[0x263F82760] _preferredFontForTextStyle:*MEMORY[0x263F835E0] weight:*MEMORY[0x263F83648]];
  uint64_t v1 = [v0 configurationWithFont:v3];
  v2 = (void *)_bulletListItemImageConfiguration_imageConfiguration_0;
  _bulletListItemImageConfiguration_imageConfiguration_0 = v1;
}

@end