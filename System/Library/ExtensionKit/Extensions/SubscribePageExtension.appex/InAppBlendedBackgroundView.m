@interface InAppBlendedBackgroundView
- (_TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InAppBlendedBackgroundView

- (_TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView *)sub_10028B684(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10028C0A8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10028BC24();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView_topLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView_bottomLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView_blurView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtensionP33_859961E758EAD625F14F631BC1D770E826InAppBlendedBackgroundView_shadowView);
}

@end