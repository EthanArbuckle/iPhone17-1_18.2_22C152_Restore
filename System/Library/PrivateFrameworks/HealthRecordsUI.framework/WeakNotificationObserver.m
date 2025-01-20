@interface WeakNotificationObserver
- (_TtC15HealthRecordsUI24WeakNotificationObserver)init;
- (void)dealloc;
- (void)didReceiveWithNotification:(id)a3;
@end

@implementation WeakNotificationObserver

- (void)dealloc
{
  v3 = (void *)MEMORY[0x1C875A200]((char *)self + OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_center, a2);
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
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_scheduler);
  swift_release();
  swift_unknownObjectWeakDestroy();
}

- (void)didReceiveWithNotification:(id)a3
{
  uint64_t v4 = sub_1C254C580();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v18 - v9;
  sub_1C254C540();
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_block);
  uint64_t v11 = *(void *)&self->scheduler[OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_block];
  uint64_t v13 = *(void *)&self->scheduler[OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_scheduler + 24];
  uint64_t v19 = *(void *)&self->scheduler[OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_scheduler + 16];
  v18 = __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_scheduler), v19);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  *(void *)(v15 + 24) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, v7, v4);
  v16 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v13 + 8);
  v17 = self;
  swift_retain();
  v16(sub_1C2435160, v15, v19, v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

- (_TtC15HealthRecordsUI24WeakNotificationObserver)init
{
  result = (_TtC15HealthRecordsUI24WeakNotificationObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end