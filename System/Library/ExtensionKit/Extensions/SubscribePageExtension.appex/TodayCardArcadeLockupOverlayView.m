@interface TodayCardArcadeLockupOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
@end

@implementation TodayCardArcadeLockupOverlayView

- (_TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView *)sub_10066F548(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100670D40();
}

- (double)_continuousCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  [(TodayCardArcadeLockupOverlayView *)&v3 _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(TodayCardArcadeLockupOverlayView *)&v6 _setContinuousCornerRadius:a3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView_backgroundEffectView], "_setCornerRadius:continuous:maskedCorners:", 1, 12, a3, v6.receiver, v6.super_class);
  id v5 = [*(id *)&v4[OBJC_IVAR____TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView_arcadeLockupView] layer];
  [v5 setMaskedCorners:12];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView_arcadeLockupView), "sizeThatFits:", a3.width, a3.height);
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10066FE0C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView_arcadeLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView_backgroundEffectView));
  swift_weakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension32TodayCardArcadeLockupOverlayView_impressionsUpdateBlock);

  sub_10001A4D0(v3);
}

@end