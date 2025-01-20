@interface BackdropGradientView
- (_TtC17RecentsAppPopoverP33_9CD08BEFCE825E3F60264C23CA86E2BF20BackdropGradientView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopoverP33_9CD08BEFCE825E3F60264C23CA86E2BF20BackdropGradientView)initWithFrame:(CGRect)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)layoutSubviews;
@end

@implementation BackdropGradientView

- (_TtC17RecentsAppPopoverP33_9CD08BEFCE825E3F60264C23CA86E2BF20BackdropGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000FF748();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000FE6A8();
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BackdropGradientView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(BackdropGradientView *)&v6 effectiveAppearanceDidChange:v4];
  sub_1000FE800(v4);
}

- (_TtC17RecentsAppPopoverP33_9CD08BEFCE825E3F60264C23CA86E2BF20BackdropGradientView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end