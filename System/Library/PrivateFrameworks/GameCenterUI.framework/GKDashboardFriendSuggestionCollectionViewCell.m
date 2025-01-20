@interface GKDashboardFriendSuggestionCollectionViewCell
+ (CGSize)sizeWithFitting:(CGSize)a3 in:(id)a4;
+ (double)horizontalPadding;
- (BOOL)displayBackground;
- (BOOL)wantsAdditionalHorizontalPadding;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)tapHandler;
- (void)applyWithSuggestedFriend:(id)a3 previouslyInvited:(BOOL)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDisplayBackground:(BOOL)a3;
- (void)setInviteButtonTitleColor:(id)a3;
- (void)setTapHandler:(id)a3;
- (void)setWantsAdditionalHorizontalPadding:(BOOL)a3;
@end

@implementation GKDashboardFriendSuggestionCollectionViewCell

+ (double)horizontalPadding
{
  return 12.0;
}

- (BOOL)displayBackground
{
  return sub_1AF3D70D0() & 1;
}

- (void)setDisplayBackground:(BOOL)a3
{
}

- (BOOL)wantsAdditionalHorizontalPadding
{
  return sub_1AF3D71DC() & 1;
}

- (void)setWantsAdditionalHorizontalPadding:(BOOL)a3
{
}

- (_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell *)GKDashboardFriendSuggestionCollectionViewCell.init(frame:)();
}

- (_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3D74F0();
}

+ (CGSize)sizeWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  double v5 = static GKDashboardFriendSuggestionCollectionViewCell.size(fitting:in:)(a4);
  double v7 = v6;
  swift_unknownObjectRelease();
  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF3D768C();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)tapHandler
{
  uint64_t v2 = sub_1AF3D77DC();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF4D234C;
    v6[3] = &block_descriptor_21;
    double v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void)setTapHandler:(id)a3
{
  double v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    double v4 = sub_1AF36A5A0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  double v6 = self;
  sub_1AF3D78D4((uint64_t)v4, v5);
}

- (void)applyWithSuggestedFriend:(id)a3 previouslyInvited:(BOOL)a4
{
  id v7 = a3;
  double v8 = self;
  sub_1AF3D7A68(a3, a4);
}

- (void)setInviteButtonTitleColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AF3D80FC(v4);
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  sub_1AF3D81A4();
}

- (void)prepareForReuse
{
  uint64_t v2 = self;
  sub_1AF3D836C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell_friendSuggestionLockupView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell_tapHandler);

  sub_1AF368930(v3);
}

@end