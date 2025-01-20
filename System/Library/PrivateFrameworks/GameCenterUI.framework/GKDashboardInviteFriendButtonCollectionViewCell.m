@interface GKDashboardInviteFriendButtonCollectionViewCell
+ (CGSize)sizeWithFitting:(CGSize)a3 in:(id)a4;
- (BOOL)displayBackground;
- (BOOL)wantsAdditionalHorizontalPadding;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setDisplayBackground:(BOOL)a3;
- (void)setWantsAdditionalHorizontalPadding:(BOOL)a3;
- (void)updateTextColorWith:(id)a3;
@end

@implementation GKDashboardInviteFriendButtonCollectionViewCell

- (BOOL)displayBackground
{
  return sub_1AF65EFC8() & 1;
}

- (void)setDisplayBackground:(BOOL)a3
{
}

- (BOOL)wantsAdditionalHorizontalPadding
{
  return sub_1AF65F0D4() & 1;
}

- (void)setWantsAdditionalHorizontalPadding:(BOOL)a3
{
}

- (_TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell *)GKDashboardInviteFriendButtonCollectionViewCell.init(frame:)();
}

- (_TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF65F4DC();
}

+ (CGSize)sizeWithFitting:(CGSize)a3 in:(id)a4
{
  static GKDashboardInviteFriendButtonCollectionViewCell.size(fitting:in:)();
  double v5 = 200.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF65F628();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF65F6DC();
}

- (void)updateTextColorWith:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AF65F91C((uint64_t)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell_label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell_separator);
}

@end