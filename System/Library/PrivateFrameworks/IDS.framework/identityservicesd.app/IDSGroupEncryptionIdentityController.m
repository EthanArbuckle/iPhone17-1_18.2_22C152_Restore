@interface IDSGroupEncryptionIdentityController
- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)init;
- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)initWithConfig:(id)a3;
- (id)ensurePublicIdentityForDevice:(id)a3;
- (void)resetPreKey;
@end

@implementation IDSGroupEncryptionIdentityController

- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)initWithConfig:(id)a3
{
  id v3 = a3;
  v4 = (_TtC17identityservicesd36IDSGroupEncryptionIdentityController *)sub_10051663C((uint64_t)v3);

  return v4;
}

- (id)ensurePublicIdentityForDevice:(id)a3
{
  uint64_t v5 = sub_100431F80(&qword_100A451F0);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(id))((swift_isaMask & (uint64_t)self->super.isa) + 0x138);
  id v10 = a3;
  v11 = self;
  v9(a3);
  uint64_t v12 = type metadata accessor for IDSGroupEncryptionFullIdentity(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v8, 1, v12) == 1)
  {
    sub_1005169CC((uint64_t)v8);
    id v13 = 0;
  }
  else
  {
    id v13 = sub_1005359BC();
    sub_1004EDCD8((uint64_t)v8, type metadata accessor for IDSGroupEncryptionFullIdentity);
  }

  return v13;
}

- (void)resetPreKey
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x90);
  v4 = self;
  id v3 = (os_unfair_lock_s *)(v2() + 16);
  os_unfair_lock_lock(v3);
  sub_100482E74();
  os_unfair_lock_unlock(v3);

  swift_release();
}

- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)init
{
  result = (_TtC17identityservicesd36IDSGroupEncryptionIdentityController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd36IDSGroupEncryptionIdentityController_l;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd36IDSGroupEncryptionIdentityController_q));
  swift_release();
  sub_1005169CC((uint64_t)self + OBJC_IVAR____TtC17identityservicesd36IDSGroupEncryptionIdentityController_identity);
  sub_1005169CC((uint64_t)self + OBJC_IVAR____TtC17identityservicesd36IDSGroupEncryptionIdentityController_previousIdentity);

  swift_bridgeObjectRelease();
}

@end