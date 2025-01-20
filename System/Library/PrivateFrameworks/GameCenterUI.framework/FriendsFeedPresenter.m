@interface FriendsFeedPresenter
- (_TtC12GameCenterUI20FriendsFeedPresenter)initWithGame:(id)a3;
- (_TtC12GameCenterUI20FriendsFeedPresenter)initWithPlayerId:(id)a3;
- (void)loadMoreActivityFeedWithContinuationToken:(id)a3;
- (void)updateSnapshot;
@end

@implementation FriendsFeedPresenter

- (_TtC12GameCenterUI20FriendsFeedPresenter)initWithGame:(id)a3
{
  id v4 = a3;
  return (_TtC12GameCenterUI20FriendsFeedPresenter *)sub_1AF44E8A0(a3);
}

- (void)updateSnapshot
{
  v2 = self;
  sub_1AF44FDDC();
}

- (void)loadMoreActivityFeedWithContinuationToken:(id)a3
{
  sub_1AF7AE0E0();
  id v4 = self;
  sub_1AF44FF80();

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI20FriendsFeedPresenter)initWithPlayerId:(id)a3
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  sub_1AF45005C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1AF3A4630((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI20FriendsFeedPresenter_requiredData, &qword_1E9AC3898);

  swift_release();
}

@end