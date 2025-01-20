@interface MAGAngelDetectionManager
- (_TtC14MagnifierAngel24MAGAngelDetectionManager)init;
@end

@implementation MAGAngelDetectionManager

- (_TtC14MagnifierAngel24MAGAngelDetectionManager)init
{
  result = (_TtC14MagnifierAngel24MAGAngelDetectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_personDetectionManager));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_sceneRenderer));
  v3 = (char *)self + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  uint64_t v4 = type metadata accessor for Date();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end