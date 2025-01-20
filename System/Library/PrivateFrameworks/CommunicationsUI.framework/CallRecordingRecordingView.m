@interface CallRecordingRecordingView
- (_TtC16CommunicationsUI26CallRecordingRecordingView)initWithCoder:(id)a3;
- (_TtC16CommunicationsUI26CallRecordingRecordingView)initWithFrame:(CGRect)a3;
- (void)handleTapContainer;
- (void)handleTapStopRecording;
@end

@implementation CallRecordingRecordingView

- (_TtC16CommunicationsUI26CallRecordingRecordingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24A63D0B0();
}

- (void)handleTapContainer
{
  id v3 = (char *)self + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingRecordingView_delegate;
  swift_beginAccess();
  if (MEMORY[0x24C5CA6B0](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (void)handleTapStopRecording
{
  id v3 = (char *)self + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingRecordingView_delegate;
  swift_beginAccess();
  if (MEMORY[0x24C5CA6B0](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (_TtC16CommunicationsUI26CallRecordingRecordingView)initWithFrame:(CGRect)a3
{
  result = (_TtC16CommunicationsUI26CallRecordingRecordingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingRecordingView_config);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingRecordingView_backgroundView));
  sub_24A6109C0((uint64_t)self + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingRecordingView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingRecordingView____lazy_storage___stopButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingRecordingView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingRecordingView____lazy_storage___stopwatch));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingRecordingView_waveform);
}

@end