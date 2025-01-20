@interface PlayerProfilePresenter
+ (BOOL)isSettings;
+ (int64_t)friendRequestsItemTag;
- (BOOL)displayInSplitView;
- (BOOL)isDeeplinked;
- (BOOL)isSignedIn;
- (BOOL)showRemoveFriendOption;
- (BOOL)wantsHiddenNavigationBar;
- (BOOL)wantsHiddenTitle;
- (NSArray)additionalRightBarButtonItems;
- (NSString)title;
- (_TtC12GameCenterUI17NicknamePresenter)nicknamePresenter;
- (_TtC12GameCenterUI22PlayerProfilePresenter)initWithPlayerId:(id)a3;
- (id)contextMenuAction;
- (void)addFriends;
- (void)didSignOut;
- (void)loadMoreActivityFeedWithContinuationToken:(id)a3;
- (void)profileSettings;
- (void)removeFriend;
- (void)reportPlayer;
- (void)setAllowsNearByMultiplayerInvites:(BOOL)a3;
- (void)setDisplayInSplitView:(BOOL)a3;
- (void)setIsDeeplinked:(BOOL)a3;
- (void)setNicknamePresenter:(id)a3;
- (void)showAvatarEditor;
- (void)showRecentlyPlayedWithFriends;
- (void)signIntoGameCenter;
- (void)updateSnapshot;
- (void)viewFriendRequests;
@end

@implementation PlayerProfilePresenter

+ (BOOL)isSettings
{
  return sub_1AF68F5D0() & 1;
}

+ (int64_t)friendRequestsItemTag
{
  return 8004;
}

- (BOOL)wantsHiddenNavigationBar
{
  v2 = self;
  char v3 = sub_1AF68FC34();

  return v3 & 1;
}

- (BOOL)showRemoveFriendOption
{
  return sub_1AF68FCF8();
}

- (BOOL)wantsHiddenTitle
{
  v2 = self;
  char v3 = sub_1AF68FD98();

  return v3 & 1;
}

- (NSString)title
{
  v2 = self;
  sub_1AF68FE14();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isSignedIn
{
  v2 = self;
  char v3 = sub_1AF690040();

  return v3 & 1;
}

- (BOOL)isDeeplinked
{
  return sub_1AF6907F4() & 1;
}

- (void)setIsDeeplinked:(BOOL)a3
{
}

- (_TtC12GameCenterUI17NicknamePresenter)nicknamePresenter
{
  v2 = sub_1AF690F10();

  return (_TtC12GameCenterUI17NicknamePresenter *)v2;
}

- (void)setNicknamePresenter:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF690F9C(a3);
}

- (BOOL)displayInSplitView
{
  return sub_1AF6918EC() & 1;
}

- (void)setDisplayInSplitView:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1AF691954(a3);
}

- (id)contextMenuAction
{
  v2 = self;
  sub_1AF691A24();

  sub_1AF36A648(0, &qword_1E9ACE280);
  char v3 = (void *)sub_1AF7AE2A0();
  swift_bridgeObjectRelease();

  return v3;
}

- (NSArray)additionalRightBarButtonItems
{
  v2 = self;
  id v3 = sub_1AF692314();

  if (v3)
  {
    sub_1AF36A648(0, (unint64_t *)&unk_1E9AC6050);
    uint64_t v4 = (void *)sub_1AF7AE2A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)viewFriendRequests
{
  v2 = self;
  sub_1AF692B1C();
}

- (void)addFriends
{
  v2 = self;
  sub_1AF6934FC();
}

- (void)reportPlayer
{
  v2 = self;
  sub_1AF69397C();
}

- (void)removeFriend
{
  v2 = self;
  sub_1AF693E0C();
}

- (void)showRecentlyPlayedWithFriends
{
  v2 = self;
  sub_1AF6942E4();
}

- (void)profileSettings
{
  v2 = self;
  sub_1AF694680();
}

- (void)updateSnapshot
{
  v2 = self;
  sub_1AF69756C();
}

- (void)setAllowsNearByMultiplayerInvites:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1AF69786C(a3);
}

- (void)signIntoGameCenter
{
  v2 = self;
  sub_1AF697B30();
}

- (void)showAvatarEditor
{
  v2 = self;
  sub_1AF697F94();
}

- (void)didSignOut
{
  v2 = self;
  sub_1AF6980D8();
}

- (void)loadMoreActivityFeedWithContinuationToken:(id)a3
{
  sub_1AF7AE0E0();
  uint64_t v4 = self;
  sub_1AF6982E0();

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI22PlayerProfilePresenter)initWithPlayerId:(id)a3
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  sub_1AF6983BC();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22PlayerProfilePresenter_nicknamePresenter));
  sub_1AF397E18((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI22PlayerProfilePresenter_nicknameUpdatedSubscription, &qword_1E9ACD388);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF36EF54((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI22PlayerProfilePresenter_requiredData, (uint64_t)v3);
  sub_1AF39A048(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1AF36F0F8);
  swift_release();
  swift_release();
}

@end