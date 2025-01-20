@interface ProcessMonitor
- (_TtC12DrawingBoard14ProcessMonitor)init;
- (void)processManager:(id)a3 didRemoveProcess:(id)a4;
@end

@implementation ProcessMonitor

- (_TtC12DrawingBoard14ProcessMonitor)init
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC12DrawingBoard14ProcessMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849960);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24CFD34A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_24CFD3488();
  id v11 = a4;
  v12 = self;
  id v13 = v11;
  id v14 = a3;
  uint64_t v15 = sub_24CFD3478();
  v16 = (void *)swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  v16[2] = v15;
  v16[3] = v17;
  v16[4] = v12;
  v16[5] = v13;
  sub_24CF9A4D8((uint64_t)v9, (uint64_t)&unk_269849980, (uint64_t)v16);

  swift_release();
}

@end