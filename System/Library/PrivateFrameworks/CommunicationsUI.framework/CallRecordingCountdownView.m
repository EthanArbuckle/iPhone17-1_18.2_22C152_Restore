@interface CallRecordingCountdownView
- (_TtC16CommunicationsUI26CallRecordingCountdownView)initWithCoder:(id)a3;
- (_TtC16CommunicationsUI26CallRecordingCountdownView)initWithFrame:(CGRect)a3;
- (void)handleTapClose;
@end

@implementation CallRecordingCountdownView

- (_TtC16CommunicationsUI26CallRecordingCountdownView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24A610918();
}

- (void)handleTapClose
{
  id v3 = (char *)self + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate;
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

- (_TtC16CommunicationsUI26CallRecordingCountdownView)initWithFrame:(CGRect)a3
{
  result = (_TtC16CommunicationsUI26CallRecordingCountdownView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_config);
  sub_24A6109C0((uint64_t)self + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI26CallRecordingCountdownView____lazy_storage___subtitleLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end