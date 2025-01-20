@interface CATErrorDescriptionsWithCodeAndUserInfo
@end

@implementation CATErrorDescriptionsWithCodeAndUserInfo

uint64_t ___CATErrorDescriptionsWithCodeAndUserInfo_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = _CATErrorDescriptionsWithCodeAndUserInfo_bundle;
  _CATErrorDescriptionsWithCodeAndUserInfo_bundle = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end