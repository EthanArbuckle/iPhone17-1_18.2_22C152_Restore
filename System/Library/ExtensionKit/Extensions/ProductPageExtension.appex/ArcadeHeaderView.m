@interface ArcadeHeaderView
- (_TtC20ProductPageExtension16ArcadeHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
@end

@implementation ArcadeHeaderView

- (_TtC20ProductPageExtension16ArcadeHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16ArcadeHeaderView *)sub_10010D7AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10010DE80();
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension15TitleHeaderView_titleLabel);
  v3 = self;
  [(ArcadeHeaderView *)v3 addSubview:v2];
  [v2 setNeedsLayout];
  [v2 layoutIfNeeded];
  [v2 removeFromSuperview];
  [(ArcadeHeaderView *)v3 setNeedsLayout];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension16ArcadeHeaderView_effect;
  uint64_t v4 = sub_10076CF40();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension16ArcadeHeaderView_gradientLayer);
}

@end