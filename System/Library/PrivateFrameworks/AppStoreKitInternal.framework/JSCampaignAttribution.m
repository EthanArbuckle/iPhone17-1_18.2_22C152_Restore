@interface JSCampaignAttribution
- (_TtC19AppStoreKitInternal21JSCampaignAttribution)init;
- (id)processRedirectURL:(id)a3;
@end

@implementation JSCampaignAttribution

- (id)processRedirectURL:(id)a3
{
  sub_1E1D5BE58();
  sub_1E1A3D718();
  v4 = self;
  v5 = (void *)sub_1E1D5CC88();
  v6 = (void *)sub_1E1D5CC98();

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC19AppStoreKitInternal21JSCampaignAttribution)init
{
  result = (_TtC19AppStoreKitInternal21JSCampaignAttribution *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal21JSCampaignAttribution_accounts;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end