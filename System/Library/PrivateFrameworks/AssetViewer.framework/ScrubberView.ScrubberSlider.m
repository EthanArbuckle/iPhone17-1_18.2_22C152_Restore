@interface ScrubberView.ScrubberSlider
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (_TtCC11AssetViewer12ScrubberView14ScrubberSlider)initWithCoder:(id)a3;
- (_TtCC11AssetViewer12ScrubberView14ScrubberSlider)initWithFrame:(CGRect)a3;
- (id)createThumbView;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation ScrubberView.ScrubberSlider

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_1E28B34DC(a4, a3);
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v9 = self;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRectGetMidY(v18);
  UIFloorToViewScale();
  double v11 = v10;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v12 = (CGRectGetWidth(v19) + -8.0) * a5;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v20);

  double v14 = MinX + v12;
  double v15 = 9.0;
  double v16 = 9.0;
  double v17 = v11;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat v9 = CGRectGetMidY(v16) + -2.5;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat v10 = CGRectGetWidth(v17);

  double v11 = 5.0;
  double v12 = MinX;
  double v13 = v9;
  double v14 = v10;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (id)createThumbView
{
  v2 = self;
  v3 = sub_1E28B3778();

  return v3;
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ScrubberView.ScrubberSlider();
  v2 = (char *)v6.receiver;
  [(ScrubberView.ScrubberSlider *)&v6 tintColorDidChange];
  v3 = *(void **)&v2[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_sliderThumbView];
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(v2, sel_thumbTintColor, v6.receiver, v6.super_class);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    v2 = v4;
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_1E28B3950(v6, (uint64_t)a4);

  return a4 & 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_1E28B3A78(v6, (uint64_t)a4);

  return a4 & 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  CGFloat v9 = self;
  sub_1E28B3C3C(a3, (uint64_t)a4);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ScrubberView.ScrubberSlider();
  id v4 = a3;
  id v5 = v10.receiver;
  [(ScrubberView.ScrubberSlider *)&v10 cancelTrackingWithEvent:v4];
  id v6 = &v5[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_trackedLocationOfTouch];
  uint64_t v7 = *(void *)&v5[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_trackedLocationOfTouch];
  uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_trackedLocationOfTouch + 8];
  char v9 = v5[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_trackedLocationOfTouch + 16];
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  sub_1E28B3320(v7, v8, v9);
  v5[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_thumbShouldReturnToTouch] = 0;
}

- (_TtCC11AssetViewer12ScrubberView14ScrubberSlider)initWithFrame:(CGRect)a3
{
  return (_TtCC11AssetViewer12ScrubberView14ScrubberSlider *)sub_1E28B3E58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC11AssetViewer12ScrubberView14ScrubberSlider)initWithCoder:(id)a3
{
  return (_TtCC11AssetViewer12ScrubberView14ScrubberSlider *)sub_1E28B3F50(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_sliderThumbView));
}

@end