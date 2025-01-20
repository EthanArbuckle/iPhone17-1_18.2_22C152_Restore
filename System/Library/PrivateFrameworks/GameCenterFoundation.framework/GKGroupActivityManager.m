@interface GKGroupActivityManager
- (BOOL)isEligibleForGroupSession;
- (_TtC20GameCenterFoundation22GKGroupActivityManager)init;
- (_TtC20GameCenterFoundation22GKGroupActivityManager)initWithMatchmakingSupport:(id)a3;
- (id)sharingControllerItemProviderWithGame:(id)a3 error:(id *)a4;
- (void)activateWithGame:(GKGame *)a3 completionHandler:(id)a4;
- (void)applicationWillTerminate;
- (void)endWithCompletionHandler:(id)a3;
- (void)leaveWithCompletionHandler:(id)a3;
- (void)playerDisconnectWithPlayer:(GKPlayer *)a3 completionHandler:(id)a4;
- (void)resetWithCompletionHandler:(id)a3;
- (void)startGame;
- (void)startLookingForSessions;
- (void)update;
@end

@implementation GKGroupActivityManager

- (_TtC20GameCenterFoundation22GKGroupActivityManager)initWithMatchmakingSupport:(id)a3
{
  return (_TtC20GameCenterFoundation22GKGroupActivityManager *)GKGroupActivityManager.init(matchmakingSupport:)((uint64_t)a3);
}

- (BOOL)isEligibleForGroupSession
{
  v2 = self;
  char v3 = sub_1C2DFD5AC();

  return v3 & 1;
}

- (void)applicationWillTerminate
{
  v2 = self;
  sub_1C2DFD620();
}

- (void)activateWithGame:(GKGame *)a3 completionHandler:(id)a4
{
}

- (void)startLookingForSessions
{
  v2 = self;
  sub_1C2DFECA4();
}

- (void)startGame
{
  v2 = self;
  sub_1C2DFF014();
}

- (id)sharingControllerItemProviderWithGame:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1C2DFF840(v5);

  return v7;
}

- (void)endWithCompletionHandler:(id)a3
{
}

- (void)leaveWithCompletionHandler:(id)a3
{
}

- (void)resetWithCompletionHandler:(id)a3
{
}

- (void)update
{
  v2 = self;
  sub_1C2E02CF8();
}

- (void)playerDisconnectWithPlayer:(GKPlayer *)a3 completionHandler:(id)a4
{
}

- (_TtC20GameCenterFoundation22GKGroupActivityManager)init
{
}

- (void).cxx_destruct
{
  sub_1C2E0D6DC((uint64_t)self + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_matchmakingSupport);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_managerSupport);
  swift_release();
  sub_1C2E0DB30((uint64_t)self + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_groupSession, &qword_1EA338530);
  sub_1C2E0DB30((uint64_t)self + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_messenger, &qword_1EA338550);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_previousMatchRequest));
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_cachedDevicePushToken);
  unint64_t v4 = *(void *)&self->matchmakingSupport[OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_cachedDevicePushToken];

  sub_1C2DFD1C0(v3, v4);
}

@end