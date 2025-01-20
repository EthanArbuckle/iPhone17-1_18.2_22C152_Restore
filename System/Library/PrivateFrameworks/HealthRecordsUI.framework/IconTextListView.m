@interface IconTextListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15HealthRecordsUI16IconTextListView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI16IconTextListView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation IconTextListView

- (_TtC15HealthRecordsUI16IconTextListView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI16IconTextListView_items) = (Class)MEMORY[0x1E4FBC860];
  id v4 = a3;

  result = (_TtC15HealthRecordsUI16IconTextListView *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C2499894();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  double v5 = sub_1C2499EE8(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1C2499FE4(a3);
}

- (_TtC15HealthRecordsUI16IconTextListView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC15HealthRecordsUI16IconTextListView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16IconTextListView_textStyle));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI16IconTextListView_font);
}

@end