@interface BackdropGradientView
- (_TtC11SaveToFilesP33_014C4A9191E34EA0CA7CA28329DBE58520BackdropGradientView)initWithCoder:(id)a3;
- (_TtC11SaveToFilesP33_014C4A9191E34EA0CA7CA28329DBE58520BackdropGradientView)initWithFrame:(CGRect)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)layoutSubviews;
@end

@implementation BackdropGradientView

- (_TtC11SaveToFilesP33_014C4A9191E34EA0CA7CA28329DBE58520BackdropGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100425978();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004249C8();
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BackdropGradientView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(BackdropGradientView *)&v6 effectiveAppearanceDidChange:v4];
  sub_100424B20(v4);
}

- (_TtC11SaveToFilesP33_014C4A9191E34EA0CA7CA28329DBE58520BackdropGradientView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end