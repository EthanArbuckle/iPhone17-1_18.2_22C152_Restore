@interface IDSGroupPushMaterialExchangeController
- (_TtC17identityservicesd38IDSGroupPushMaterialExchangeController)init;
@end

@implementation IDSGroupPushMaterialExchangeController

- (_TtC17identityservicesd38IDSGroupPushMaterialExchangeController)init
{
  result = (_TtC17identityservicesd38IDSGroupPushMaterialExchangeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_l;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100461218((uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10044C150((uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_desiredPublicIdentity, &qword_100A45640);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_10044C6AC((uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_cryptoHandler);
  v5 = (char *)self
     + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_cachedKeyPropagationProvider;

  sub_100461218((uint64_t)v5);
}

@end