@interface SmallLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIEdgeInsets)layoutMargins;
- (_TtC12GameCenterUI11ArtworkView)accessibilityArtworkView;
- (_TtC12GameCenterUI15SmallLockupView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI15SmallLockupView)initWithFrame:(CGRect)a3;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel;
- (void)layoutSubviews;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation SmallLockupView

- (_TtC12GameCenterUI15SmallLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI15SmallLockupView *)sub_1AF41AC1C();
}

- (_TtC12GameCenterUI15SmallLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF41B11C();
}

- (UIEdgeInsets)layoutMargins
{
  v2 = self;
  double v3 = sub_1AF41B4A8();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double v3 = self;
  sub_1AF41B574();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  sub_1AF3A39CC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  double v9 = sub_1AF41B614(a4, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease();

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF41B7B8();
}

- (_TtC12GameCenterUI11ArtworkView)accessibilityArtworkView
{
  id v2 = sub_1AF41C610();

  return (_TtC12GameCenterUI11ArtworkView *)v2;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  id v2 = sub_1AF41C650();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  id v2 = sub_1AF41C690();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15SmallLockupView_headingLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15SmallLockupView_subtitleLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15SmallLockupView_selectedBackgroundColor));
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI15SmallLockupView_chevronView);
}

@end