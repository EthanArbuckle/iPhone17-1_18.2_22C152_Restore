@interface ASActivitySharingClient
- (ASActivitySharingClient)init;
- (_ASActivitySharingClient)activitySharingClient;
- (void)acceptCompetitionInviteFromFriendUUID:(id)a3 completion:(id)a4;
- (void)acceptFriendInviteFromFriendUUID:(id)a3 completion:(id)a4;
- (void)activateWithCompletionHandler:(id)a3;
- (void)allFriendsWithCompletion:(id)a3;
- (void)appBadgeCountWithCompletion:(id)a3;
- (void)areMultipleDevicesSharingDataForSnapshotIndex:(id)a3 completion:(id)a4;
- (void)completeCompetitionWithFriendUUID:(id)a3 completion:(id)a4;
- (void)expireChangeTokenWithCompletion:(id)a3;
- (void)fetchActivityDataIfGreaterThanLastFetchElapsedMinimum:(unint64_t)a3 completion:(id)a4;
- (void)friendWithRemoteRelationshipUUID:(id)a3 completion:(id)a4;
- (void)handleNotificationResponse:(id)a3 completion:(id)a4;
- (void)ignoreCompetitionInviteFromFriendUUID:(id)a3 completion:(id)a4;
- (void)ignoreFriendInviteFromFriendUUID:(id)a3 completion:(id)a4;
- (void)immediateFetchActivityDataWithCompletion:(id)a3;
- (void)invalidateWithCompletionHandler:(id)a3;
- (void)isCloudKitAccountActiveWithCompletion:(id)a3;
- (void)pushActivityDataWithCompletion:(id)a3;
- (void)pushFakeActivityDataWithCompletion:(id)a3;
- (void)removeAllFriendsWithCompletion:(id)a3;
- (void)removeFriendWithUUID:(id)a3 completion:(id)a4;
- (void)sendCompetitionInviteToFriendUUID:(id)a3 completion:(id)a4;
- (void)sendFriendInviteToDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6;
- (void)setActivityDataVisible:(BOOL)a3 friendUUID:(id)a4 completion:(id)a5;
- (void)setMuteEnabled:(BOOL)a3 friendUUID:(id)a4 completion:(id)a5;
- (void)withdrawFriendInviteToFriendUUID:(id)a3 completion:(id)a4;
@end

@implementation ASActivitySharingClient

- (void)isCloudKitAccountActiveWithCompletion:(id)a3
{
}

- (void)appBadgeCountWithCompletion:(id)a3
{
  id v4 = a3;
  activitySharingClient = self->_activitySharingClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__ASActivitySharingClient_appBadgeCountWithCompletion___block_invoke;
  v7[3] = &unk_2652142E8;
  id v8 = v4;
  id v6 = v4;
  [(_ASActivitySharingClient *)activitySharingClient appBadgeCountWithCompletion:v7];
}

uint64_t __55__ASActivitySharingClient_appBadgeCountWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (ASActivitySharingClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASActivitySharingClient;
  v2 = [(ASActivitySharingClient *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_ASActivitySharingClient);
    activitySharingClient = v2->_activitySharingClient;
    v2->_activitySharingClient = v3;
  }
  return v2;
}

- (_ASActivitySharingClient)activitySharingClient
{
  return self->_activitySharingClient;
}

- (void)activateWithCompletionHandler:(id)a3
{
}

- (void)invalidateWithCompletionHandler:(id)a3
{
}

- (void)sendFriendInviteToDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6
{
}

- (void)acceptFriendInviteFromFriendUUID:(id)a3 completion:(id)a4
{
}

- (void)withdrawFriendInviteToFriendUUID:(id)a3 completion:(id)a4
{
}

- (void)ignoreFriendInviteFromFriendUUID:(id)a3 completion:(id)a4
{
}

- (void)setMuteEnabled:(BOOL)a3 friendUUID:(id)a4 completion:(id)a5
{
}

- (void)setActivityDataVisible:(BOOL)a3 friendUUID:(id)a4 completion:(id)a5
{
}

- (void)sendCompetitionInviteToFriendUUID:(id)a3 completion:(id)a4
{
}

- (void)acceptCompetitionInviteFromFriendUUID:(id)a3 completion:(id)a4
{
}

- (void)ignoreCompetitionInviteFromFriendUUID:(id)a3 completion:(id)a4
{
}

- (void)completeCompetitionWithFriendUUID:(id)a3 completion:(id)a4
{
}

- (void)pushActivityDataWithCompletion:(id)a3
{
}

- (void)immediateFetchActivityDataWithCompletion:(id)a3
{
}

- (void)fetchActivityDataIfGreaterThanLastFetchElapsedMinimum:(unint64_t)a3 completion:(id)a4
{
}

- (void)expireChangeTokenWithCompletion:(id)a3
{
}

- (void)areMultipleDevicesSharingDataForSnapshotIndex:(id)a3 completion:(id)a4
{
  activitySharingClient = self->_activitySharingClient;
  id v6 = a4;
  -[_ASActivitySharingClient areMultipleDevicesSharingDataForSnapshotIndex:completion:](activitySharingClient, "areMultipleDevicesSharingDataForSnapshotIndex:completion:", (int)[a3 intValue], v6);
}

- (void)allFriendsWithCompletion:(id)a3
{
}

- (void)friendWithRemoteRelationshipUUID:(id)a3 completion:(id)a4
{
}

- (void)removeFriendWithUUID:(id)a3 completion:(id)a4
{
}

- (void)removeAllFriendsWithCompletion:(id)a3
{
}

- (void)handleNotificationResponse:(id)a3 completion:(id)a4
{
}

- (void)pushFakeActivityDataWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end