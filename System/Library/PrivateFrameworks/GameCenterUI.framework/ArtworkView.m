@interface ArtworkView
- (BOOL)accessibilityIgnoresInvertColors;
- (CGRect)frame;
- (UIColor)backgroundColor;
- (_TtC12GameCenterUI11ArtworkView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI11ArtworkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation ArtworkView

- (_TtC12GameCenterUI11ArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI11ArtworkView *)sub_1AF4D694C();
}

- (_TtC12GameCenterUI11ArtworkView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF4D6B8C();
}

- (UIColor)backgroundColor
{
  v2 = self;
  id v3 = sub_1AF4D7190();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF4D722C(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF4D727C();
}

- (CGRect)frame
{
  v2 = self;
  sub_1AF4D7760();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double v3 = self;
  sub_1AF4D780C();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI11ArtworkView_shadowView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI11ArtworkView_internalBackgroundColor));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI11ArtworkView_artworkTintColor);
}

@end