@interface AISFlowTask
- (BOOL)completed;
- (_TtC12AppleIDSetup11AISFlowTask)init;
- (void)complete;
- (void)dealloc;
- (void)setCompleted:(BOOL)a3;
- (void)waitUntilLoadedWithCompletionHandler:(id)a3;
@end

@implementation AISFlowTask

- (BOOL)completed
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_completed;
  swift_beginAccess();
  return *v2;
}

- (void)setCompleted:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_completed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)complete
{
  v2 = self;
  sub_248044024();
}

- (void)waitUntilLoadedWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9520);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2481753D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2692D8138;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2692D8140;
  v12[5] = v11;
  v13 = self;
  sub_248109968((uint64_t)v7, (uint64_t)&unk_2692D9540, (uint64_t)v12);
  swift_release();
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_cachedTask))
  {
    v3 = self;
    swift_retain();
    sub_2481754A0();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AISFlowTask();
  [(AISFlowTask *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_2480442C4((uint64_t)self + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_cachedContinuation);
  swift_release();
}

- (_TtC12AppleIDSetup11AISFlowTask)init
{
  v3 = (char *)self + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_cachedContinuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D80D0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_cachedTask) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_completed) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AISFlowTask();
  return [(AISFlowTask *)&v6 init];
}

@end