@interface MultiCornerGradientView
- (_TtC18ASMessagesProvider23MultiCornerGradientView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider23MultiCornerGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MultiCornerGradientView

- (_TtC18ASMessagesProvider23MultiCornerGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider23MultiCornerGradientView *)sub_569778(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider23MultiCornerGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_569D04();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_56995C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider23MultiCornerGradientView_baseGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider23MultiCornerGradientView_secondaryGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider23MultiCornerGradientView_secondaryGradientMaskView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider23MultiCornerGradientView_bottomRightOverlayView);
}

@end