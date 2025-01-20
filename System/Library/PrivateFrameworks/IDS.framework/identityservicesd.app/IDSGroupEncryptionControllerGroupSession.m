@interface IDSGroupEncryptionControllerGroupSession
- (_TtC17identityservicesd38IDSGroupRootMaterialExchangeController)rootExchangeController;
- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)mkmController;
- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)skmController;
- (_TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession)init;
- (void)setKeyMaterialIsNeededForParticipant:(id)a3 forMKM:(BOOL)a4 forSKM:(BOOL)a5;
- (void)setRootExchangeController:(id)a3;
@end

@implementation IDSGroupEncryptionControllerGroupSession

- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)mkmController
{
  return (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_mkmController);
}

- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)skmController
{
  return (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_skmController);
}

- (_TtC17identityservicesd38IDSGroupRootMaterialExchangeController)rootExchangeController
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_rootExchangeController);
  swift_beginAccess();
  return (_TtC17identityservicesd38IDSGroupRootMaterialExchangeController *)*v2;
}

- (void)setRootExchangeController:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1004EC3EC(a3);
}

- (void)setKeyMaterialIsNeededForParticipant:(id)a3 forMKM:(BOOL)a4 forSKM:(BOOL)a5
{
  id v8 = a3;
  v9 = self;
  sub_1004E3820(v8, a4, a5);
}

- (_TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession)init
{
  result = (_TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_l;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_q));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_mkmController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_skmController));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_rootExchangeController));
  sub_100461218((uint64_t)self + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_participantProvider);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_identityController));
  sub_10044C6AC((uint64_t)self + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_cryptoHandler);
  swift_bridgeObjectRelease();
  sub_10044C150((uint64_t)self+ OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_materialCurrentlySentToAVC, &qword_100A44A50);
  sub_10044C150((uint64_t)self+ OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_materialCurrentlySentToFramework, &qword_100A44A50);
}

@end