@interface MescalBagContract
- (_TtC9JetEngine17MescalBagContract)init;
- (id)mescalCertificateURL;
- (id)mescalPrimingURL;
- (id)mescalSetupURL;
- (id)mescalSignSapRequests;
- (id)mescalSignSapResponses;
- (id)mescalSignedActions;
@end

@implementation MescalBagContract

- (id)mescalCertificateURL
{
  return sub_19F08B9B4((char *)self, (uint64_t)a2, 0xD000000000000013, 0x800000019F26FA10, (SEL *)&selRef_URLForKey_);
}

- (id)mescalSetupURL
{
  return sub_19F08B9B4((char *)self, (uint64_t)a2, 0x7061732D6E676973, 0xEE0070757465732DLL, (SEL *)&selRef_URLForKey_);
}

- (id)mescalPrimingURL
{
  return sub_19F08B9B4((char *)self, (uint64_t)a2, 0x6C7255656D697270, 0xE800000000000000, (SEL *)&selRef_URLForKey_);
}

- (id)mescalSignedActions
{
  return sub_19F08B9B4((char *)self, (uint64_t)a2, 0x612D64656E676973, 0xEE00736E6F697463, (SEL *)&selRef_dictionaryForKey_);
}

- (id)mescalSignSapRequests
{
  return sub_19F08B9B4((char *)self, (uint64_t)a2, 0xD000000000000010, 0x800000019F26FA30, (SEL *)&selRef_dictionaryForKey_);
}

- (id)mescalSignSapResponses
{
  return sub_19F08B9B4((char *)self, (uint64_t)a2, 0xD000000000000011, 0x800000019F26FA50, (SEL *)&selRef_dictionaryForKey_);
}

- (_TtC9JetEngine17MescalBagContract)init
{
  result = (_TtC9JetEngine17MescalBagContract *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end