@interface UberNavigationBarTitleView
- (_TtC20ProductPageExtension18RoundChevronButton)accessibilityNonStandardDismissButton;
- (_TtC20ProductPageExtension26UberNavigationBarTitleView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension26UberNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (void)didTapNonStandardDismissButton;
- (void)layoutSubviews;
@end

@implementation UberNavigationBarTitleView

- (_TtC20ProductPageExtension26UberNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension26UberNavigationBarTitleView *)sub_1001B1678(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension26UberNavigationBarTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001B2418();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001B1F24();
}

- (void)didTapNonStandardDismissButton
{
  v2 = *(void (**)(uint64_t))&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension26UberNavigationBarTitleView_nonStandardDismissHandler];
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_1000194C0((uint64_t)v2);
    v2(v3);
    sub_1000194B0((uint64_t)v2);
  }
}

- (_TtC20ProductPageExtension18RoundChevronButton)accessibilityNonStandardDismissButton
{
  return (_TtC20ProductPageExtension18RoundChevronButton *)*(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension26UberNavigationBarTitleView_nonStandardDismissButton];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension26UberNavigationBarTitleView_nonStandardDismissHandler];

  sub_1000194B0(v3);
}

@end