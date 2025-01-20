@interface MFSlider
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (_TtC16MagnifierSupport8MFSlider)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport8MFSlider)initWithFrame:(CGRect)a3;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
@end

@implementation MFSlider

- (_TtC16MagnifierSupport8MFSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2357021D4();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  [(MFSlider *)v8 bounds];
  CGRect v13 = CGRectInset(v12, *(CGFloat *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport8MFSlider_extraTouchInset), *(CGFloat *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport8MFSlider_extraTouchInset));
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  BOOL v9 = CGRectContainsPoint(v13, v11);

  return v9;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = self;
  [(MFSlider *)v8 alignmentRectInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  UIRoundToViewScale();
  v28.receiver = v8;
  v28.super_class = ObjectType;
  -[MFSlider trackRectForBounds:](&v28, sel_trackRectForBounds_, x, y, width, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v12 + v17;
  double v25 = v21 - (v12 + v14);
  double v26 = v10 + v19;
  double v27 = v23 * 0.5;
  result.size.height = v27;
  result.size.double width = v25;
  result.origin.double y = v26;
  result.origin.double x = v24;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_235702328(v6);

  return v9 & 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = self;
  sub_235701D4C((uint64_t)a3, (uint64_t)a4);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = (char *)v8.receiver;
  id v5 = a3;
  [(MFSlider *)&v8 cancelTrackingWithEvent:v5];
  id v6 = objc_msgSend(v4, sel__edgeFeedbackGenerator, v8.receiver, v8.super_class);
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(v6, sel_userInteractionCancelled);

    objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC16MagnifierSupport8MFSlider_tickFeedbackGenerator], sel_userInteractionCancelled);
  }
  else
  {
    __break(1u);
  }
}

- (void)drawRect:(CGRect)a3
{
  id v3 = self;
  sub_235702518();
}

- (_TtC16MagnifierSupport8MFSlider)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC16MagnifierSupport8MFSlider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport8MFSlider_trackColor));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport8MFSlider_tickFeedbackGenerator);
}

@end