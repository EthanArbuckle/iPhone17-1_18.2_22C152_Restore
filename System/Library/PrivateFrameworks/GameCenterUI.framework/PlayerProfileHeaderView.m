@interface PlayerProfileHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityFriendStatusLabel;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC12GameCenterUI23PlayerProfileHeaderView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI23PlayerProfileHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlayerProfileHeaderView

- (_TtC12GameCenterUI23PlayerProfileHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI23PlayerProfileHeaderView *)sub_1AF725EB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI23PlayerProfileHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF726460();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
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
  swift_unknownObjectRetain();
  double v5 = self;
  sub_1AF726744();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF726C88();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF726F38(a3);
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  id v2 = sub_1AF727F98();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityFriendStatusLabel
{
  id v2 = sub_1AF727FD8();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23PlayerProfileHeaderView_profileAvatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23PlayerProfileHeaderView_friendsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23PlayerProfileHeaderView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI23PlayerProfileHeaderView_subtitleLabel);
}

@end