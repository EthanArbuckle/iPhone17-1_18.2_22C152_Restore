@interface MultiCornerGradientView
- (_TtC20ProductPageExtension23MultiCornerGradientView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23MultiCornerGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MultiCornerGradientView

- (_TtC20ProductPageExtension23MultiCornerGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23MultiCornerGradientView *)sub_100724010(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23MultiCornerGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10072459C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1007241F4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23MultiCornerGradientView_baseGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23MultiCornerGradientView_secondaryGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23MultiCornerGradientView_secondaryGradientMaskView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension23MultiCornerGradientView_bottomRightOverlayView);
}

@end