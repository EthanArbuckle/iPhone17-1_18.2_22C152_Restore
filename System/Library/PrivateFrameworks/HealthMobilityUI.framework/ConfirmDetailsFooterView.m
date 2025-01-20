@interface ConfirmDetailsFooterView
- (_TtC16HealthMobilityUI24ConfirmDetailsFooterView)initWithCoder:(id)a3;
- (_TtC16HealthMobilityUI24ConfirmDetailsFooterView)initWithFrame:(CGRect)a3;
@end

@implementation ConfirmDetailsFooterView

- (_TtC16HealthMobilityUI24ConfirmDetailsFooterView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel) = 0;
  id v4 = a3;

  result = (_TtC16HealthMobilityUI24ConfirmDetailsFooterView *)sub_1E0B06B38();
  __break(1u);
  return result;
}

- (_TtC16HealthMobilityUI24ConfirmDetailsFooterView)initWithFrame:(CGRect)a3
{
  result = (_TtC16HealthMobilityUI24ConfirmDetailsFooterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView_configuration;
  uint64_t v4 = sub_1E0B06558();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel);
}

@end