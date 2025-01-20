@interface IDSGlobalLinkP2PKeyNegotiatorController
- (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController)init;
- (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController)initWithIdentityProvider:(id)a3 groupMetadataProvider:(id)a4;
- (void)dealloc;
- (void)negotiatorForGroup:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation IDSGlobalLinkP2PKeyNegotiatorController

- (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController)initWithIdentityProvider:(id)a3 groupMetadataProvider:(id)a4
{
  return (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController *)sub_1004D5C8C(a3, (uint64_t)a4);
}

- (void)dealloc
{
  v2 = self;
  sub_1004D6098();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController_logger;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_1004D5EC8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController_stopListening));

  swift_unknownObjectRelease();
}

- (void)negotiatorForGroup:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100431F80(&qword_100A45350);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_100726600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100A471E8;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100A471F8;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_10045C1AC((uint64_t)v10, (uint64_t)&unk_100A47208, (uint64_t)v15);
  swift_release();
}

- (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController)init
{
  result = (_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end