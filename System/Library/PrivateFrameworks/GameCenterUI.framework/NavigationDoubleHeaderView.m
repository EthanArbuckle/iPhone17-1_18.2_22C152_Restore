@interface NavigationDoubleHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)subtitleText;
- (NSString)titleText;
- (_TtC12GameCenterUI26NavigationDoubleHeaderView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI26NavigationDoubleHeaderView)initWithFrame:(CGRect)a3;
- (double)titleAlpha;
- (void)layoutSubviews;
- (void)setSubtitleText:(id)a3;
- (void)setTitleAlpha:(double)a3;
- (void)setTitleText:(id)a3;
@end

@implementation NavigationDoubleHeaderView

- (NSString)titleText
{
  return (NSString *)sub_1AF37032C(self, (uint64_t)a2, (void (*)(void))NavigationDoubleHeaderView.titleText.getter);
}

- (void)setTitleText:(id)a3
{
}

- (NSString)subtitleText
{
  return (NSString *)sub_1AF37032C(self, (uint64_t)a2, (void (*)(void))NavigationDoubleHeaderView.subtitleText.getter);
}

- (void)setSubtitleText:(id)a3
{
}

- (double)titleAlpha
{
  v2 = self;
  NavigationDoubleHeaderView.titleAlpha.getter();
  double v4 = v3;

  return v4;
}

- (void)setTitleAlpha:(double)a3
{
  double v4 = self;
  NavigationDoubleHeaderView.titleAlpha.setter(a3);
}

- (_TtC12GameCenterUI26NavigationDoubleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI26NavigationDoubleHeaderView *)NavigationDoubleHeaderView.init(frame:)();
}

- (_TtC12GameCenterUI26NavigationDoubleHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF370AB0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = NavigationDoubleHeaderView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  NavigationDoubleHeaderView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26NavigationDoubleHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26NavigationDoubleHeaderView_subtitleLabel));
  sub_1AF3726B0((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI26NavigationDoubleHeaderView____lazy_storage___layout, &qword_1E9AC37D8);
}

@end