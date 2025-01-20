@interface ConfirmDetailsLearnMoreView
- (_TtC5Heart27ConfirmDetailsLearnMoreView)initWithCoder:(id)a3;
- (_TtC5Heart27ConfirmDetailsLearnMoreView)initWithFrame:(CGRect)a3;
- (void)learnMoreTapped;
@end

@implementation ConfirmDetailsLearnMoreView

- (_TtC5Heart27ConfirmDetailsLearnMoreView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel) = 0;
  id v5 = a3;

  result = (_TtC5Heart27ConfirmDetailsLearnMoreView *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (void)learnMoreTapped
{
  v2 = self;
  sub_240A5D1A8();
}

- (_TtC5Heart27ConfirmDetailsLearnMoreView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Heart27ConfirmDetailsLearnMoreView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_240A484BC((uint64_t)self + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel));
  v3 = (char *)self + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView_configuration;
  uint64_t v4 = sub_240BB5BD0();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end