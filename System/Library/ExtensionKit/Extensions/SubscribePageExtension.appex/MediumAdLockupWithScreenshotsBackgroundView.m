@interface MediumAdLockupWithScreenshotsBackgroundView
- (NSArray)accessibilityElements;
- (_TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityElements:(id)a3;
@end

@implementation MediumAdLockupWithScreenshotsBackgroundView

- (_TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView *)sub_100083288(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100084B9C();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MediumAdLockupWithScreenshotsBackgroundView();
  v2 = (char *)v4.receiver;
  [(MediumAdLockupWithScreenshotsBackgroundView *)&v4 layoutSubviews];
  sub_100081614();
  sub_100081494();
  id v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_baseGradientView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (NSArray)accessibilityElements
{
  sub_10000FB44((uint64_t *)&unk_100936E10);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1007B8540;
  objc_super v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_lockupView);
  *(void *)(v3 + 56) = type metadata accessor for TodayCardLockupView();
  *(void *)(v3 + 32) = v4;
  id v5 = v4;
  v6.super.isa = sub_1007677F0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (void)setAccessibilityElements:(id)a3
{
  if (a3)
  {
    sub_100767800();
    objc_super v4 = self;
    v5.super.isa = sub_1007677F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    NSArray v6 = self;
    v5.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MediumAdLockupWithScreenshotsBackgroundView();
  [(MediumAdLockupWithScreenshotsBackgroundView *)&v7 setAccessibilityElements:v5.super.isa];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_baseGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_riverContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_joeColorGradientOverlayContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_joeColorGradientOverlaySolidView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_joeColorGradientOverlayGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView____lazy_storage___topOverlayGradientView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_lockupView);
}

@end