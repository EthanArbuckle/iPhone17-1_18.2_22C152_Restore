@interface ASAccountSharingGroupOnBoardingCreateGroupContent
@end

@implementation ASAccountSharingGroupOnBoardingCreateGroupContent

void __87___ASAccountSharingGroupOnBoardingCreateGroupContent__bulletListItemImageConfiguration__block_invoke()
{
  v0 = (void *)MEMORY[0x263F82818];
  id v3 = [MEMORY[0x263F82760] _preferredFontForTextStyle:*MEMORY[0x263F835E0] weight:*MEMORY[0x263F83648]];
  uint64_t v1 = [v0 configurationWithFont:v3];
  v2 = (void *)_bulletListItemImageConfiguration_imageConfiguration;
  _bulletListItemImageConfiguration_imageConfiguration = v1;
}

@end