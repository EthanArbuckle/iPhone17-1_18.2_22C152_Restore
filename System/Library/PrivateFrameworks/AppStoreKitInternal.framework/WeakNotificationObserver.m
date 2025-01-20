@interface WeakNotificationObserver
- (_TtC19AppStoreKitInternal24WeakNotificationObserver)init;
- (void)dealloc;
- (void)didReceiveWithNotification:(id)a3;
@end

@implementation WeakNotificationObserver

- (void)dealloc
{
  v3 = (void *)MEMORY[0x1E4E54870]((char *)self + OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_center, a2);
  v4 = self;
  if (v3)
  {
    objc_msgSend(v3, sel_removeObserver_, v4);
  }
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for WeakNotificationObserver();
  [(WeakNotificationObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_scheduler);
  swift_release();
  swift_unknownObjectWeakDestroy();
}

- (void)didReceiveWithNotification:(id)a3
{
  uint64_t v4 = sub_1E1D56898();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)v17 - v9;
  sub_1E1D56848();
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_block);
  uint64_t v11 = *(void *)&self->scheduler[OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_block];
  uint64_t v13 = *(void *)&self->scheduler[OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_scheduler + 16];
  v17[1] = *(void *)&self->scheduler[OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_scheduler + 24];
  v17[0] = __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_scheduler), v13);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  *(void *)(v15 + 24) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, v7, v4);
  v16 = self;
  swift_retain();
  sub_1E1D5A0E8();

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

- (_TtC19AppStoreKitInternal24WeakNotificationObserver)init
{
  result = (_TtC19AppStoreKitInternal24WeakNotificationObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end