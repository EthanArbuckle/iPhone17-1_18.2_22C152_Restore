@interface BackdropGradientView
- (_TtC14RecentsAvocadoP33_3CB4899455714676C9B7EFD2E63F86A320BackdropGradientView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocadoP33_3CB4899455714676C9B7EFD2E63F86A320BackdropGradientView)initWithFrame:(CGRect)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)layoutSubviews;
@end

@implementation BackdropGradientView

- (_TtC14RecentsAvocadoP33_3CB4899455714676C9B7EFD2E63F86A320BackdropGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003E49F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003E3A48();
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BackdropGradientView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(BackdropGradientView *)&v6 effectiveAppearanceDidChange:v4];
  sub_1003E3BA0(v4);
}

- (_TtC14RecentsAvocadoP33_3CB4899455714676C9B7EFD2E63F86A320BackdropGradientView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end