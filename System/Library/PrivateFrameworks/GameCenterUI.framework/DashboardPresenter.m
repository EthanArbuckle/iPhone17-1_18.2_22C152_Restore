@interface DashboardPresenter
+ (void)presentLeaderboardsFrom:(id)a3 request:(id)a4 gameRecord:(id)a5 leaderboard:(id)a6 leaderboardSet:(id)a7 animated:(BOOL)a8;
+ (void)processLeaderboardRequestFrom:(id)a3 request:(id)a4 gameRecord:(id)a5;
- (BOOL)didScrollToIndexPath;
- (BOOL)displayInSplitView;
- (BOOL)shouldUseLargeTitle;
- (GKGameRecord)gameRecord;
- (NSIndexPath)scrollToIndexPath;
- (NSString)title;
- (_TtC12GameCenterUI18DashboardPresenter)initWithPlayerId:(id)a3;
- (void)fetchDashboardRequiredDataWithForce:(BOOL)a3;
- (void)fetchGameRecordAfterAuthenticationFor:(id)a3;
- (void)handleViewDidLoad;
- (void)loadMoreActivityFeedWithContinuationToken:(id)a3;
- (void)presentAchievementsFrom:(id)a3 request:(id)a4 gameRecord:(id)a5;
- (void)presentChallengesFrom:(id)a3 gameRecord:(id)a4 shouldShowPlayForChallenge:(BOOL)a5;
- (void)presentLeaderboardsFrom:(id)a3 request:(id)a4 gameBundleID:(id)a5;
- (void)presentPlayerProfileFrom:(id)a3 request:(id)a4 animated:(BOOL)a5;
- (void)setDidScrollToIndexPath:(BOOL)a3;
- (void)setDisplayInSplitView:(BOOL)a3;
- (void)setGameRecord:(id)a3;
- (void)setScrollToIndexPath:(id)a3;
- (void)setShouldUseLargeTitle:(BOOL)a3;
- (void)updateSnapshot;
@end

@implementation DashboardPresenter

- (BOOL)shouldUseLargeTitle
{
  return sub_1AF6B22C4() & 1;
}

- (void)setShouldUseLargeTitle:(BOOL)a3
{
}

- (NSString)title
{
  v2 = self;
  sub_1AF4223C8();
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

- (GKGameRecord)gameRecord
{
  v2 = sub_1AF6B23B0();

  return (GKGameRecord *)v2;
}

- (void)setGameRecord:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF6B243C((uint64_t)a3);
}

- (BOOL)displayInSplitView
{
  return sub_1AF6B2450() & 1;
}

- (void)setDisplayInSplitView:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1AF6AFEC0(a3);
}

- (NSIndexPath)scrollToIndexPath
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC5F20);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF6B2724();
  uint64_t v5 = sub_1AF7A9A60();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_1AF7A99D0();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }

  return (NSIndexPath *)v6;
}

- (void)setScrollToIndexPath:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC5F20);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1AF7A99E0();
    uint64_t v8 = sub_1AF7A9A60();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_1AF7A9A60();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  sub_1AF6B284C((uint64_t)v7);
}

- (BOOL)didScrollToIndexPath
{
  return sub_1AF6B28D0() & 1;
}

- (void)setDidScrollToIndexPath:(BOOL)a3
{
}

- (void)handleViewDidLoad
{
  uint64_t v2 = self;
  sub_1AF6AFB34();
}

- (void)fetchDashboardRequiredDataWithForce:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1AF6AFC00(a3);
}

- (void)fetchGameRecordAfterAuthenticationFor:(id)a3
{
}

- (void)updateSnapshot
{
  uint64_t v2 = self;
  sub_1AF6B24DC();
}

+ (void)processLeaderboardRequestFrom:(id)a3 request:(id)a4 gameRecord:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_1AF6B0160(v8, a4, v10);
}

+ (void)presentLeaderboardsFrom:(id)a3 request:(id)a4 gameRecord:(id)a5 leaderboard:(id)a6 leaderboardSet:(id)a7 animated:(BOOL)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  sub_1AF6B5D48();
}

- (void)presentLeaderboardsFrom:(id)a3 request:(id)a4 gameBundleID:(id)a5
{
  sub_1AF7AE0E0();
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  sub_1AF6B0028();

  swift_bridgeObjectRelease();
}

- (void)presentAchievementsFrom:(id)a3 request:(id)a4 gameRecord:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  sub_1AF6B0410();
}

- (void)presentChallengesFrom:(id)a3 gameRecord:(id)a4 shouldShowPlayForChallenge:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_1AF6B089C();
}

- (void)presentPlayerProfileFrom:(id)a3 request:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_1AF6B0BEC();
}

- (void)loadMoreActivityFeedWithContinuationToken:(id)a3
{
}

- (_TtC12GameCenterUI18DashboardPresenter)initWithPlayerId:(id)a3
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  sub_1AF6B6E84();
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18DashboardPresenter_gameRecord));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1AF395058((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI18DashboardPresenter_scrollToIndexPath, &qword_1E9AC5F20);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1AF395058((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI18DashboardPresenter_requiredData, &qword_1E9AC3898);

  swift_release();
}

@end