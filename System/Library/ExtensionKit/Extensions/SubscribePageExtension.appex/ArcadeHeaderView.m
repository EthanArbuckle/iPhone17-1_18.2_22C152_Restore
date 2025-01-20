@interface ArcadeHeaderView
- (_TtC22SubscribePageExtension16ArcadeHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
@end

@implementation ArcadeHeaderView

- (_TtC22SubscribePageExtension16ArcadeHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension16ArcadeHeaderView *)sub_1006DDCB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006DE384();
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15TitleHeaderView_titleLabel);
  v3 = self;
  [(ArcadeHeaderView *)v3 addSubview:v2];
  [v2 setNeedsLayout];
  [v2 layoutIfNeeded];
  [v2 removeFromSuperview];
  [(ArcadeHeaderView *)v3 setNeedsLayout];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeHeaderView_effect;
  uint64_t v4 = sub_100758B00();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeHeaderView_gradientLayer);
}

@end