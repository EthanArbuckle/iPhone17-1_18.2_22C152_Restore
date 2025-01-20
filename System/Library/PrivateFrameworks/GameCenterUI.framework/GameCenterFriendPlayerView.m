@interface GameCenterFriendPlayerView
- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithFrame:(CGRect)a3;
- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithHandle:(id)a3 player:(id)a4;
- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithRelationshipResult:(id)a3;
@end

@implementation GameCenterFriendPlayerView

- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithHandle:(id)a3 player:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1AF7AE0E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC12GameCenterUI26GameCenterFriendPlayerView *)GameCenterFriendPlayerView.init(handle:player:)(v5, v7, a4);
}

- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithRelationshipResult:(id)a3
{
  return (_TtC12GameCenterUI26GameCenterFriendPlayerView *)GameCenterFriendPlayerView.init(relationshipResult:)(a3);
}

- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithCoder:(id)a3
{
}

- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithFrame:(CGRect)a3
{
}

@end