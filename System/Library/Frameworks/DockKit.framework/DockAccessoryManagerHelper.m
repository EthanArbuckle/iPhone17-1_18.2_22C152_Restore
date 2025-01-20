@interface DockAccessoryManagerHelper
- (_TtC7DockKit26DockAccessoryManagerHelper)init;
- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6;
- (void)xpcDisconnected;
@end

@implementation DockAccessoryManagerHelper

- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388]();
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24334A730();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;
  v14[8] = a6;
  id v15 = a3;
  v16 = self;
  id v17 = v15;
  sub_243323308((uint64_t)v12, (uint64_t)&unk_268D93420, (uint64_t)v14);

  swift_release();
}

- (void)xpcDisconnected
{
  v2 = self;
  sub_24331B12C();
}

- (_TtC7DockKit26DockAccessoryManagerHelper)init
{
  result = (_TtC7DockKit26DockAccessoryManagerHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_243322990(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_callback));
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger;
  uint64_t v4 = sub_24334A5B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

@end