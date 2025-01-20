@interface RangePillView
- (CGRect)bounds;
- (_TtC15HealthRecordsUI13RangePillView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI13RangePillView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation RangePillView

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RangePillView();
  [(RangePillView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RangePillView();
  v7 = (char *)v9.receiver;
  -[RangePillView setBounds:](&v9, sel_setBounds_, x, y, width, height);
  v8 = *(void (**)(id))&v7[OBJC_IVAR____TtC15HealthRecordsUI13RangePillView_onBoundsChange];
  if (v8)
  {
    swift_retain();
    v8(objc_msgSend(v7, sel_bounds, v9.receiver, v9.super_class));
    sub_1C221794C((uint64_t)v8);
  }
}

- (_TtC15HealthRecordsUI13RangePillView)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI13RangePillView *)sub_1C23709AC(a3);
}

- (_TtC15HealthRecordsUI13RangePillView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC15HealthRecordsUI13RangePillView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C221794C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC15HealthRecordsUI13RangePillView_onBoundsChange));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13RangePillView____lazy_storage___dotView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI13RangePillView____lazy_storage___innerDotView);
}

@end