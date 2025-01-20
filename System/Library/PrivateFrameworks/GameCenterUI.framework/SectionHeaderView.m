@interface SectionHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)accessibilitySectionHeaderLabel;
- (_TtC12GameCenterUI17SectionHeaderView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI17SectionHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SectionHeaderView

- (_TtC12GameCenterUI17SectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17SectionHeaderView *)SectionHeaderView.init(frame:)();
}

- (_TtC12GameCenterUI17SectionHeaderView)initWithCoder:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  CGSize v6 = SectionHeaderView.sizeThatFits(_:)((CGSize)__PAIR128__(v5, v4));

  double width = v6.width;
  double height = v6.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  SectionHeaderView.layoutSubviews()();
}

- (UILabel)accessibilitySectionHeaderLabel
{
  id v2 = sub_1AF4A42C8();

  return (UILabel *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17SectionHeaderView_sectionHeaderLabel));
}

@end