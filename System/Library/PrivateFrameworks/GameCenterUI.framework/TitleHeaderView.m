@interface TitleHeaderView
- (BOOL)_disableRasterizeInAnimations;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (UIView)accessibilityAccessoryView;
- (UIView)accessoryView;
- (_TtC12GameCenterUI11ArtworkView)iconArtworkView;
- (_TtC12GameCenterUI15TitleHeaderView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI15TitleHeaderView)initWithFrame:(CGRect)a3;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel;
- (void)didTapWithAccessoryView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setIconArtworkView:(id)a3;
@end

@implementation TitleHeaderView

- (_TtC12GameCenterUI15TitleHeaderView)initWithFrame:(CGRect)a3
{
  sub_1AF6D3CB0();
  return result;
}

- (_TtC12GameCenterUI15TitleHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6D4130();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (UIView)accessoryView
{
  v2 = sub_1AF6D4510();

  return (UIView *)v2;
}

- (void)setAccessoryView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF6D459C(a3);
}

- (_TtC12GameCenterUI11ArtworkView)iconArtworkView
{
  v2 = sub_1AF6D47A8();

  return (_TtC12GameCenterUI11ArtworkView *)v2;
}

- (void)setIconArtworkView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF6D4834(a3);
}

- (void)didTapWithAccessoryView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF6D4BB0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_1AF6D4CB0(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF6D5098();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AF6D60E8();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1AF6D6234();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AF7AE0E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  double v7 = self;
  sub_1AF6D64C0(v4, v6);
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  id v2 = sub_1AF6D6564();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (UIView)accessibilityAccessoryView
{
  id v2 = sub_1AF6D4510();

  return (UIView *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_detailLabel));
  sub_1AF6DA228((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_style, (void (*)(void))type metadata accessor for TitleHeaderView.Style);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_accessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_iconArtworkView));
  sub_1AF379794((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_accessory, &qword_1E9AC51C8);
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_accessoryAction));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_separatorLineView);
}

@end