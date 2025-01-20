@interface UberNavigationBarTitleView
- (_TtC22SubscribePageExtension18RoundChevronButton)accessibilityNonStandardDismissButton;
- (_TtC22SubscribePageExtension26UberNavigationBarTitleView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension26UberNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (void)didTapNonStandardDismissButton;
- (void)layoutSubviews;
@end

@implementation UberNavigationBarTitleView

- (_TtC22SubscribePageExtension26UberNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26UberNavigationBarTitleView *)sub_100378F78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26UberNavigationBarTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100379D18();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100379824();
}

- (void)didTapNonStandardDismissButton
{
  v2 = *(void (**)(uint64_t))&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC22SubscribePageExtension26UberNavigationBarTitleView_nonStandardDismissHandler];
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_10001A4E0((uint64_t)v2);
    v2(v3);
    sub_10001A4D0((uint64_t)v2);
  }
}

- (_TtC22SubscribePageExtension18RoundChevronButton)accessibilityNonStandardDismissButton
{
  return (_TtC22SubscribePageExtension18RoundChevronButton *)*(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC22SubscribePageExtension26UberNavigationBarTitleView_nonStandardDismissButton];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC22SubscribePageExtension26UberNavigationBarTitleView_nonStandardDismissHandler];

  sub_10001A4D0(v3);
}

@end