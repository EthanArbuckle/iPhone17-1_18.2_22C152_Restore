@interface MultiCornerGradientView
- (_TtC22SubscribePageExtension23MultiCornerGradientView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension23MultiCornerGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MultiCornerGradientView

- (_TtC22SubscribePageExtension23MultiCornerGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension23MultiCornerGradientView *)sub_10005C0E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension23MultiCornerGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10005D6D0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10005C3B4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_baseGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_secondaryGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_secondaryGradientMaskView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_bottomRightOverlayView);
}

@end