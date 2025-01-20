@interface TodayCardInfoLayerView
- (NSString)accessibilityLabel;
- (_TtC22SubscribePageExtension22TodayCardInfoLayerView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension22TodayCardInfoLayerView)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation TodayCardInfoLayerView

- (_TtC22SubscribePageExtension22TodayCardInfoLayerView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension22TodayCardInfoLayerView *)sub_100584890(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension22TodayCardInfoLayerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100587900();
}

- (double)_continuousCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  [(TodayCardInfoLayerView *)&v3 _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TodayCardInfoLayerView *)&v5 _setContinuousCornerRadius:a3];
  sub_100584E20();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100585D54();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_100586410((uint64_t)a4, x, y);

  return v10;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_100698F58();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1007675C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1007675F0();
    v6 = self;
    a3 = sub_1007675C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TodayCardInfoLayerView *)&v8 setAccessibilityLabel:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_labelsView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_overlayContainer));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_protectionUpdateBlock));
  swift_unknownObjectRelease();
  swift_weakDestroy();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_preferredGradientType);
}

@end