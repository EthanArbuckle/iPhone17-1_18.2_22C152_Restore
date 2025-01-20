@interface IconArtworkGridView
- (CGRect)frame;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension19IconArtworkGridView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension19IconArtworkGridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
@end

@implementation IconArtworkGridView

- (_TtC22SubscribePageExtension19IconArtworkGridView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension19IconArtworkGridView *)sub_100215380(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension19IconArtworkGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100217C2C();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(IconArtworkGridView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v22.receiver = self;
  v22.super_class = ObjectType;
  v9 = self;
  [(IconArtworkGridView *)&v22 frame];
  double v11 = v10;
  double v13 = v12;
  v21.receiver = v9;
  v21.super_class = ObjectType;
  -[IconArtworkGridView setFrame:](&v21, "setFrame:", x, y, width, height);
  v20.receiver = v9;
  v20.super_class = ObjectType;
  [(IconArtworkGridView *)&v20 frame];
  if (v11 != v15 || v13 != v14)
  {
    sub_100215ADC();
    v19.receiver = v9;
    v19.super_class = ObjectType;
    [(IconArtworkGridView *)&v19 frame];
    sub_100215C4C(v17, v18);
  }
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_10021600C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain();
  objc_super v6 = self;
  double v7 = sub_100217D4C(width);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100217E54((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension19IconArtworkGridView_layoutMetrics);
  double v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension19IconArtworkGridView_config;

  sub_10001A5F4((uint64_t)v3);
}

@end