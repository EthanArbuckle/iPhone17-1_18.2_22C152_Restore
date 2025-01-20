@interface BackdropGradientView
- (_TtC33com_apple_DocumentManager_ServiceP33_4FDFCF43D0C7B0532B18876A4AE0516220BackdropGradientView)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_ServiceP33_4FDFCF43D0C7B0532B18876A4AE0516220BackdropGradientView)initWithFrame:(CGRect)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)layoutSubviews;
@end

@implementation BackdropGradientView

- (_TtC33com_apple_DocumentManager_ServiceP33_4FDFCF43D0C7B0532B18876A4AE0516220BackdropGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10042347C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004224CC();
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BackdropGradientView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(BackdropGradientView *)&v6 effectiveAppearanceDidChange:v4];
  sub_100422624(v4);
}

- (_TtC33com_apple_DocumentManager_ServiceP33_4FDFCF43D0C7B0532B18876A4AE0516220BackdropGradientView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end