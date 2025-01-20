@interface BackdropGradientView
- (_TtC18DocumentAppIntentsP33_EAB45A8399E497AD530DA73E0F5D88FE20BackdropGradientView)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntentsP33_EAB45A8399E497AD530DA73E0F5D88FE20BackdropGradientView)initWithFrame:(CGRect)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)layoutSubviews;
@end

@implementation BackdropGradientView

- (_TtC18DocumentAppIntentsP33_EAB45A8399E497AD530DA73E0F5D88FE20BackdropGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10020093C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001FF98C();
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BackdropGradientView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(BackdropGradientView *)&v6 effectiveAppearanceDidChange:v4];
  sub_1001FFAE4(v4);
}

- (_TtC18DocumentAppIntentsP33_EAB45A8399E497AD530DA73E0F5D88FE20BackdropGradientView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end