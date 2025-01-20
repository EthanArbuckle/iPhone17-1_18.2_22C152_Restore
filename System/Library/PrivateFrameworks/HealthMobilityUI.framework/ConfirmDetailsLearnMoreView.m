@interface ConfirmDetailsLearnMoreView
- (_TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView)initWithCoder:(id)a3;
- (_TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)learnMoreTapped;
- (void)tintColorDidChange;
@end

@implementation ConfirmDetailsLearnMoreView

- (_TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer) = 0;
  id v5 = a3;

  result = (_TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView *)sub_1E0B06B38();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  id v3 = sub_1E0AFDB08();
  id v4 = sub_1E0AFDD84();
  objc_msgSend(v3, sel_removeGestureRecognizer_, v4);

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for ConfirmDetailsLearnMoreView();
  [(ConfirmDetailsLearnMoreView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_1E0ACD748((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate);
  id v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_configuration;
  uint64_t v4 = sub_1E0B06558();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel));
  objc_super v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer);
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ConfirmDetailsLearnMoreView();
  id v2 = v5.receiver;
  [(ConfirmDetailsLearnMoreView *)&v5 tintColorDidChange];
  id v3 = sub_1E0AFDB08();
  id v4 = objc_msgSend(v2, sel_tintColor, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setTextColor_, v4);
}

- (void)learnMoreTapped
{
  id v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate;
  if (MEMORY[0x1E4E3C5D0]((char *)self + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    objc_super v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (_TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView)initWithFrame:(CGRect)a3
{
  result = (_TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end