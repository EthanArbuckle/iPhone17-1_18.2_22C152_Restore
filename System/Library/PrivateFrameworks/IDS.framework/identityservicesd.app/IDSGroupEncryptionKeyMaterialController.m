@interface IDSGroupEncryptionKeyMaterialController
- (IDSGroupEncryptionKeyMaterial)currentObjcMaterial;
- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)init;
- (void)dealloc;
- (void)ensureKey;
@end

@implementation IDSGroupEncryptionKeyMaterialController

- (void)dealloc
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_state);
  uint64_t v3 = v2 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(void *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  v5 = self;
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_100434AD8(v3);
  os_unfair_lock_unlock(v4);
  swift_release();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for IDSGroupEncryptionKeyMaterialController(0);
  [(IDSGroupEncryptionKeyMaterialController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_l;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_q));
  swift_bridgeObjectRelease();
  sub_10044C6AC((uint64_t)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_cryptoHandler);
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_persistenceManager);
}

- (IDSGroupEncryptionKeyMaterial)currentObjcMaterial
{
  uint64_t v3 = sub_100431F80(&qword_100A44A50);
  __chkstk_darwin(v3 - 8, v4);
  objc_super v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for IDSGroupEncryptionKeyMaterialContent();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x118);
  v13 = self;
  v12();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_10044C150((uint64_t)v6, &qword_100A44A50);
    id v14 = 0;
  }
  else
  {
    sub_10043243C((uint64_t)v6, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for IDSGroupEncryptionKeyMaterialContent);
    id v14 = sub_10048391C();
    sub_1004324A4((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for IDSGroupEncryptionKeyMaterialContent);
  }

  return (IDSGroupEncryptionKeyMaterial *)v14;
}

- (void)ensureKey
{
  uint64_t v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_state)
                          + ((*(unsigned int *)(**(void **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_state)
                                              + 48)
                            + 3) & 0x1FFFFFFFCLL));
  uint64_t v3 = self;
  os_unfair_lock_lock(v2);
  sub_1004415B4();
  os_unfair_lock_unlock(v2);
}

- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)init
{
  result = (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end