@interface ASServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (ASServer)initWithUUID:(id)a3 client:(id)a4 activitySharingManager:(id)a5;
- (ASServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)taskUUID;
- (void)connectionInvalidated;
- (void)remote_acceptCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)remote_acceptInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)remote_clearFriendListWithCompletion:(id)a3;
- (void)remote_cloudKitAccountStatusWithCompletion:(id)a3;
- (void)remote_completeCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4;
- (void)remote_expireChangeTokenWithCompletion:(id)a3;
- (void)remote_fetchAllDataIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 completion:(id)a4;
- (void)remote_fetchAllDataWithCompletion:(id)a3;
- (void)remote_fetchAllFriendsWithCompletion:(id)a3;
- (void)remote_fetchAreMultipleDevicesSharingDataForSnapshotIndex:(id)a3 withCompletion:(id)a4;
- (void)remote_friendWithRemoteUUID:(id)a3 completion:(id)a4;
- (void)remote_handleNotificationResponse:(id)a3 completion:(id)a4;
- (void)remote_ignoreCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)remote_ignoreInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)remote_pushActivityDataWithCompletion:(id)a3;
- (void)remote_pushFakeActivityDataWithCompletion:(id)a3;
- (void)remote_queryAppBadgeCountWithCompletion:(id)a3;
- (void)remote_removeFriendWithUUID:(id)a3 completion:(id)a4;
- (void)remote_sendCompetitionRequestToFriendWithUUID:(id)a3 completion:(id)a4;
- (void)remote_sendInviteRequestToDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6;
- (void)remote_sendWithdrawInviteRequestToFriendWithUUID:(id)a3 completion:(id)a4;
- (void)remote_setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 completion:(id)a5;
- (void)remote_setMuteEnabled:(BOOL)a3 forFriendWithUUID:(id)a4 completion:(id)a5;
@end

@implementation ASServer

- (ASServer)initWithUUID:(id)a3 client:(id)a4 activitySharingManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ASServer;
  v11 = [(ASServer *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_activitySharingManager, a5);
    objc_storeStrong((id *)&v12->_client, a4);
    uint64_t v13 = [v8 copy];
    taskUUID = v12->_taskUUID;
    v12->_taskUUID = (NSUUID *)v13;

    uint64_t v15 = HKCreateSerialDispatchQueue();
    serialQueue = v12->_serialQueue;
    v12->_serialQueue = (OS_dispatch_queue *)v15;
  }
  return v12;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F0AE30](self, a2);
}

- (id)remoteInterface
{
  return 0;
}

- (void)connectionInvalidated
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ASServer_connectionInvalidated__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __33__ASServer_connectionInvalidated__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 16) connection];
  [v1 invalidate];
}

- (void)remote_sendInviteRequestToDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6
{
  activitySharingManager = self->_activitySharingManager;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  _SanitizedSuccessCompletion(a6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager sendInviteRequestToDestination:v12 callerID:v11 serviceIdentifier:v10 completion:v13];
}

- (void)remote_acceptInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  activitySharingManager = self->_activitySharingManager;
  id v6 = a3;
  _SanitizedSuccessCompletion(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager acceptInviteRequestFromFriendWithUUID:v6 completion:v7];
}

- (void)remote_sendWithdrawInviteRequestToFriendWithUUID:(id)a3 completion:(id)a4
{
  activitySharingManager = self->_activitySharingManager;
  id v6 = a3;
  _SanitizedSuccessCompletion(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager sendWithdrawInviteRequestToFriendWithUUID:v6 completion:v7];
}

- (void)remote_ignoreInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  activitySharingManager = self->_activitySharingManager;
  id v6 = a3;
  _SanitizedSuccessCompletion(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager ignoreInviteRequestFromFriendWithUUID:v6 completion:v7];
}

- (void)remote_setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  activitySharingManager = self->_activitySharingManager;
  id v8 = a4;
  _SanitizedSuccessCompletion(a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager setActivityDataVisible:v6 toFriendWithUUID:v8 completion:v9];
}

- (void)remote_setMuteEnabled:(BOOL)a3 forFriendWithUUID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  activitySharingManager = self->_activitySharingManager;
  id v8 = a4;
  _SanitizedSuccessCompletion(a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager setMuteEnabled:v6 forFriendWithUUID:v8 completion:v9];
}

- (void)remote_removeFriendWithUUID:(id)a3 completion:(id)a4
{
  activitySharingManager = self->_activitySharingManager;
  id v6 = a3;
  _SanitizedSuccessCompletion(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager removeFriendWithUUID:v6 completion:v7];
}

- (void)remote_pushActivityDataWithCompletion:(id)a3
{
  activitySharingManager = self->_activitySharingManager;
  _SanitizedSuccessCompletion(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager pushActivityDataToAllFriendsWithCompletion:v4];
}

- (void)remote_pushFakeActivityDataWithCompletion:(id)a3
{
  activitySharingManager = self->_activitySharingManager;
  _SanitizedSuccessCompletion(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager pushFakeActivityDataToAllFriendsWithCompletion:v4];
}

- (void)remote_fetchAllDataWithCompletion:(id)a3
{
  activitySharingManager = self->_activitySharingManager;
  _SanitizedSuccessCompletion(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager fetchAllDataWithCompletion:v4];
}

- (void)remote_fetchAllDataIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 completion:(id)a4
{
  activitySharingManager = self->_activitySharingManager;
  _SanitizedSuccessCompletion(a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager fetchAllDataIfTimeSinceLastFetchIsGreaterThan:a3 completion:v6];
}

- (void)remote_cloudKitAccountStatusWithCompletion:(id)a3
{
  activitySharingManager = self->_activitySharingManager;
  _SanitizedBoolCompletion(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager cloudKitAccountStatusWithCompletion:v4];
}

- (void)remote_clearFriendListWithCompletion:(id)a3
{
}

- (void)remote_fetchAreMultipleDevicesSharingDataForSnapshotIndex:(id)a3 withCompletion:(id)a4
{
  activitySharingManager = self->_activitySharingManager;
  id v6 = a3;
  _SanitizedBoolCompletion(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager fetchAreMultipleDevicesSharingDataForSnapshotIndex:v6 withCompletion:v7];
}

- (void)remote_sendCompetitionRequestToFriendWithUUID:(id)a3 completion:(id)a4
{
  activitySharingManager = self->_activitySharingManager;
  id v6 = a3;
  _SanitizedSuccessCompletion(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager sendCompetitionRequestToFriendWithUUID:v6 completion:v7];
}

- (void)remote_acceptCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  activitySharingManager = self->_activitySharingManager;
  id v6 = a3;
  _SanitizedSuccessCompletion(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager acceptCompetitionRequestFromFriendWithUUID:v6 completion:v7];
}

- (void)remote_ignoreCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  activitySharingManager = self->_activitySharingManager;
  id v6 = a3;
  _SanitizedSuccessCompletion(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager ignoreCompetitionRequestFromFriendWithUUID:v6 completion:v7];
}

- (void)remote_completeCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4
{
  activitySharingManager = self->_activitySharingManager;
  id v6 = a3;
  _SanitizedSuccessCompletion(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager completeCompetitionWithFriendWithUUID:v6 completion:v7];
}

- (void)remote_expireChangeTokenWithCompletion:(id)a3
{
  activitySharingManager = self->_activitySharingManager;
  _SanitizedSuccessCompletion(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ASActivitySharingManager *)activitySharingManager expireChangeTokenWithCompletion:v4];
}

- (void)remote_fetchAllFriendsWithCompletion:(id)a3
{
  activitySharingManager = self->_activitySharingManager;
  id v4 = (void (**)(id, void *, uint64_t, void))a3;
  id v6 = [(ASActivitySharingManager *)activitySharingManager allFriends];
  v5 = ASCodableFriendListFromFriends();
  v4[2](v4, v5, 1, 0);
}

- (void)remote_friendWithRemoteUUID:(id)a3 completion:(id)a4
{
}

- (void)remote_handleNotificationResponse:(id)a3 completion:(id)a4
{
}

- (void)remote_queryAppBadgeCountWithCompletion:(id)a3
{
}

+ (id)taskIdentifier
{
  return (id)MEMORY[0x270F0AC28](a1, a2);
}

+ (id)requiredEntitlements
{
  return &unk_26FBA7EE0;
}

- (ASServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [ASServer alloc];
  id v11 = [v8 profile];
  id v12 = +[ASActivitySharingProfileExtension activitySharingManagerForProfile:v11];
  id v13 = [(ASServer *)v10 initWithUUID:v9 client:v8 activitySharingManager:v12];

  return v13;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [v10 profile];
  id v12 = +[ASActivitySharingProfileExtension activitySharingManagerForProfile:v11];

  if (v12)
  {
    id v13 = [[ASServer alloc] initWithUUID:v9 client:v10 activitySharingManager:v12];
  }
  else
  {
    ASLoggingInitialize();
    v14 = *MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
      +[ASServer createTaskServerWithUUID:configuration:client:delegate:error:](v14);
    }
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:0 userInfo:0];
    if (v15)
    {
      if (a7) {
        *a7 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v13 = 0;
  }

  return v13;
}

- (id)taskUUID
{
  return self->_taskUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_activitySharingManager, 0);
}

+ (void)createTaskServerWithUUID:(os_log_t)log configuration:client:delegate:error:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "ASActivitySharingManager not found", v1, 2u);
}

@end