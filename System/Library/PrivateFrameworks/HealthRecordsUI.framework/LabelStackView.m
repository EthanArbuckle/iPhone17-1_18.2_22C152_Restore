@interface LabelStackView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15HealthRecordsUI14LabelStackView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI14LabelStackView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LabelStackView

- (_TtC15HealthRecordsUI14LabelStackView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI14LabelStackView_labels) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI14LabelStackView_interItemSpacing) = (Class)0x4010000000000000;
  id v4 = a3;

  result = (_TtC15HealthRecordsUI14LabelStackView *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C23B99E0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  sub_1C23B9E08();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC15HealthRecordsUI14LabelStackView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC15HealthRecordsUI14LabelStackView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI14LabelStackView_font);
}

@end