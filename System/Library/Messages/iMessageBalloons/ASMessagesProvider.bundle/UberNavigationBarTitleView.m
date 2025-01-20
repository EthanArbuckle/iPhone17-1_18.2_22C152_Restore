@interface UberNavigationBarTitleView
- (_TtC18ASMessagesProvider18RoundChevronButton)accessibilityNonStandardDismissButton;
- (_TtC18ASMessagesProvider26UberNavigationBarTitleView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider26UberNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (void)didTapNonStandardDismissButton;
- (void)layoutSubviews;
@end

@implementation UberNavigationBarTitleView

- (_TtC18ASMessagesProvider26UberNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider26UberNavigationBarTitleView *)sub_628698(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider26UberNavigationBarTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_628E04();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_628A20();
}

- (void)didTapNonStandardDismissButton
{
  v2 = *(void (**)(uint64_t))&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC18ASMessagesProvider26UberNavigationBarTitleView_nonStandardDismissHandler];
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_13318((uint64_t)v2);
    v2(v3);
    sub_13308((uint64_t)v2);
  }
}

- (_TtC18ASMessagesProvider18RoundChevronButton)accessibilityNonStandardDismissButton
{
  return (_TtC18ASMessagesProvider18RoundChevronButton *)*(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC18ASMessagesProvider26UberNavigationBarTitleView_nonStandardDismissButton];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC18ASMessagesProvider26UberNavigationBarTitleView_nonStandardDismissHandler];

  sub_13308(v3);
}

@end