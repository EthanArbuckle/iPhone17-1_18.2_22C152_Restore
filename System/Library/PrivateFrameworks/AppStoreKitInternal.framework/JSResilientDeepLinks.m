@interface JSResilientDeepLinks
- (BOOL)hasResilientDeepLinks;
- (BOOL)isResilientDeepLink:(id)a3;
- (_TtC19AppStoreKitInternal20JSResilientDeepLinks)init;
- (void)removeAllDeepLinks;
- (void)removeDeepLink:(id)a3;
@end

@implementation JSResilientDeepLinks

- (BOOL)isResilientDeepLink:(id)a3
{
  uint64_t v4 = sub_1E1D5BE58();
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1E19C84A0(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (BOOL)hasResilientDeepLinks
{
  v2 = self;
  uint64_t v3 = swift_retain();
  char v4 = _s19AppStoreKitInternal27ResilientDeepLinkControllerO03haseF5Links3bagSbAA14ASKBagContractC_tFZ_0(v3);

  swift_release();
  return v4 & 1;
}

- (void)removeDeepLink:(id)a3
{
  uint64_t v3 = sub_1E1D5BE58();
  sub_1E18A6F14(v3, v4);
  swift_bridgeObjectRelease();
}

- (void)removeAllDeepLinks
{
  sub_1E1D5A5D8();
  swift_allocObject();
  uint64_t v3 = self;
  sub_1E1D5A5B8();
  v4[3] = &type metadata for ResilientDeepLinkController.DeepLinkPreferenceKey;
  v4[4] = sub_1E165D69C();
  v4[0] = 0xD000000000000014;
  v4[1] = 0x80000001E1DBBCB0;
  sub_1E1D5A598();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  swift_allocObject();
  sub_1E1D5A5B8();
  sub_1E1D5A5A8();

  swift_release();
}

- (_TtC19AppStoreKitInternal20JSResilientDeepLinks)init
{
  result = (_TtC19AppStoreKitInternal20JSResilientDeepLinks *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end