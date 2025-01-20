@interface UIPresenterObserver
- (_TtC12DrawingBoard19UIPresenterObserver)init;
- (void)scenePresenter:(id)a3 hostingWillChange:(BOOL)a4;
@end

@implementation UIPresenterObserver

- (void)scenePresenter:(id)a3 hostingWillChange:(BOOL)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849960);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24CFD34A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_24CFD3488();
  v10 = self;
  swift_unknownObjectRetain();
  uint64_t v11 = sub_24CFD3478();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v13;
  *(void *)(v12 + 32) = v10;
  *(unsigned char *)(v12 + 40) = a4;
  sub_24CF9A4D8((uint64_t)v8, (uint64_t)&unk_269848E88, v12);
  swift_unknownObjectRelease();

  swift_release();
}

- (_TtC12DrawingBoard19UIPresenterObserver)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter) = 0;
  sub_24CFD2F08();
  v6.receiver = self;
  v6.super_class = ObjectType;
  v4 = [(UIPresenterObserver *)&v6 init];
  swift_release();
  return v4;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver___observationRegistrar;
  uint64_t v4 = sub_24CFD2F18();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end