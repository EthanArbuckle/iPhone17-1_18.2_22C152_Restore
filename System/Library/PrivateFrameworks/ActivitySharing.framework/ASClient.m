@interface ASClient
- (ASClient)initWithHealthStore:(id)a3;
- (id)_clientQueueSuccessCompletion:(id)a3;
- (id)exportedInterface;
- (void)_remoteProxy:(id)a3 errorHandler:(id)a4;
- (void)acceptCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)acceptInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)allFriendsWithCompletion:(id)a3;
- (void)clearFriendListWithCompletion:(id)a3;
- (void)cloudKitAccountStatusWithCompletion:(id)a3;
- (void)completeCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4;
- (void)expireChangeTokenWithCompletion:(id)a3;
- (void)fetchAllDataIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 completion:(id)a4;
- (void)fetchAllDataWithCompletion:(id)a3;
- (void)fetchAreMultipleDevicesSharingDataForSnapshotIndex:(id)a3 withCompletion:(id)a4;
- (void)friendWithRemoteUUID:(id)a3 completion:(id)a4;
- (void)handleNotificationResponse:(id)a3 completion:(id)a4;
- (void)ignoreCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)ignoreInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)pushActivityDataToAllFriendsWithCompletion:(id)a3;
- (void)pushFakeActivityDataToAllFriendsWithCompletion:(id)a3;
- (void)queryAppBadgeCountWithCompletion:(id)a3;
- (void)removeFriendWithUUID:(id)a3 completion:(id)a4;
- (void)sendCompetitionRequestToFriendWithUUID:(id)a3 completion:(id)a4;
- (void)sendInviteRequestToDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6;
- (void)sendWithdrawInviteRequestToFriendWithUUID:(id)a3 completion:(id)a4;
- (void)setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 completion:(id)a5;
- (void)setMuteEnabled:(BOOL)a3 forFriendWithUUID:(id)a4 completion:(id)a5;
@end

@implementation ASClient

- (ASClient)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASClient;
  v5 = [(ASClient *)&v16 init];
  if (v5)
  {
    uint64_t v6 = HKCreateSerialDispatchQueue();
    serverQueue = v5->_serverQueue;
    v5->_serverQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = HKCreateSerialDispatchQueue();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v8;

    id v10 = objc_alloc(MEMORY[0x263F0A818]);
    v11 = ASClientTaskIdentifier();
    v12 = [MEMORY[0x263F08C38] UUID];
    uint64_t v13 = [v10 initWithHealthStore:v4 taskIdentifier:v11 exportedObject:v5 taskUUID:v12];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v13;
  }
  return v5;
}

- (id)exportedInterface
{
  return 0;
}

- (void)sendInviteRequestToDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(ASClient *)self _clientQueueSuccessCompletion:a6];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __81__ASClient_sendInviteRequestToDestination_callerID_serviceIdentifier_completion___block_invoke;
  v20[3] = &unk_2644E8670;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __81__ASClient_sendInviteRequestToDestination_callerID_serviceIdentifier_completion___block_invoke_2;
  v18[3] = &unk_2644E8698;
  id v19 = v24;
  id v14 = v24;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(ASClient *)self _remoteProxy:v20 errorHandler:v18];
}

uint64_t __81__ASClient_sendInviteRequestToDestination_callerID_serviceIdentifier_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendInviteRequestToDestination:callerID:serviceIdentifier:completion:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __81__ASClient_sendInviteRequestToDestination_callerID_serviceIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acceptInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(ASClient *)self _clientQueueSuccessCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__ASClient_acceptInviteRequestFromFriendWithUUID_completion___block_invoke;
  v12[3] = &unk_2644E86C0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__ASClient_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_2;
  v10[3] = &unk_2644E8698;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(ASClient *)self _remoteProxy:v12 errorHandler:v10];
}

uint64_t __61__ASClient_acceptInviteRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_acceptInviteRequestFromFriendWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __61__ASClient_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendWithdrawInviteRequestToFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(ASClient *)self _clientQueueSuccessCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__ASClient_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke;
  v12[3] = &unk_2644E86C0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__ASClient_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke_2;
  v10[3] = &unk_2644E8698;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(ASClient *)self _remoteProxy:v12 errorHandler:v10];
}

uint64_t __65__ASClient_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendWithdrawInviteRequestToFriendWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __65__ASClient_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ignoreInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(ASClient *)self _clientQueueSuccessCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__ASClient_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke;
  v12[3] = &unk_2644E86C0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__ASClient_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke_2;
  v10[3] = &unk_2644E8698;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(ASClient *)self _remoteProxy:v12 errorHandler:v10];
}

uint64_t __61__ASClient_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_ignoreInviteRequestFromFriendWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __61__ASClient_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendCompetitionRequestToFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(ASClient *)self _clientQueueSuccessCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__ASClient_sendCompetitionRequestToFriendWithUUID_completion___block_invoke;
  v12[3] = &unk_2644E86C0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__ASClient_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2;
  v10[3] = &unk_2644E8698;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(ASClient *)self _remoteProxy:v12 errorHandler:v10];
}

uint64_t __62__ASClient_sendCompetitionRequestToFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendCompetitionRequestToFriendWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __62__ASClient_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acceptCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(ASClient *)self _clientQueueSuccessCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__ASClient_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke;
  v12[3] = &unk_2644E86C0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__ASClient_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_2;
  v10[3] = &unk_2644E8698;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(ASClient *)self _remoteProxy:v12 errorHandler:v10];
}

uint64_t __66__ASClient_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_acceptCompetitionRequestFromFriendWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __66__ASClient_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ignoreCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(ASClient *)self _clientQueueSuccessCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__ASClient_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke;
  v12[3] = &unk_2644E86C0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__ASClient_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke_2;
  v10[3] = &unk_2644E8698;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(ASClient *)self _remoteProxy:v12 errorHandler:v10];
}

uint64_t __66__ASClient_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_ignoreCompetitionRequestFromFriendWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __66__ASClient_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)completeCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(ASClient *)self _clientQueueSuccessCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__ASClient_completeCompetitionWithFriendWithUUID_completion___block_invoke;
  v12[3] = &unk_2644E86C0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__ASClient_completeCompetitionWithFriendWithUUID_completion___block_invoke_2;
  v10[3] = &unk_2644E8698;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(ASClient *)self _remoteProxy:v12 errorHandler:v10];
}

uint64_t __61__ASClient_completeCompetitionWithFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_completeCompetitionWithFriendWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __61__ASClient_completeCompetitionWithFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = [(ASClient *)self _clientQueueSuccessCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__ASClient_setActivityDataVisible_toFriendWithUUID_completion___block_invoke;
  v14[3] = &unk_2644E86E8;
  BOOL v17 = a3;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__ASClient_setActivityDataVisible_toFriendWithUUID_completion___block_invoke_2;
  v12[3] = &unk_2644E8698;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(ASClient *)self _remoteProxy:v14 errorHandler:v12];
}

uint64_t __63__ASClient_setActivityDataVisible_toFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setActivityDataVisible:toFriendWithUUID:completion:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __63__ASClient_setActivityDataVisible_toFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setMuteEnabled:(BOOL)a3 forFriendWithUUID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = [(ASClient *)self _clientQueueSuccessCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__ASClient_setMuteEnabled_forFriendWithUUID_completion___block_invoke;
  v14[3] = &unk_2644E86E8;
  BOOL v17 = a3;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__ASClient_setMuteEnabled_forFriendWithUUID_completion___block_invoke_2;
  v12[3] = &unk_2644E8698;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(ASClient *)self _remoteProxy:v14 errorHandler:v12];
}

uint64_t __56__ASClient_setMuteEnabled_forFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setMuteEnabled:forFriendWithUUID:completion:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __56__ASClient_setMuteEnabled_forFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(ASClient *)self _clientQueueSuccessCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__ASClient_removeFriendWithUUID_completion___block_invoke;
  v12[3] = &unk_2644E86C0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__ASClient_removeFriendWithUUID_completion___block_invoke_2;
  v10[3] = &unk_2644E8698;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(ASClient *)self _remoteProxy:v12 errorHandler:v10];
}

uint64_t __44__ASClient_removeFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removeFriendWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __44__ASClient_removeFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pushActivityDataToAllFriendsWithCompletion:(id)a3
{
  id v4 = [(ASClient *)self _clientQueueSuccessCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__ASClient_pushActivityDataToAllFriendsWithCompletion___block_invoke;
  v8[3] = &unk_2644E8710;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__ASClient_pushActivityDataToAllFriendsWithCompletion___block_invoke_2;
  v6[3] = &unk_2644E8698;
  id v7 = v9;
  id v5 = v9;
  [(ASClient *)self _remoteProxy:v8 errorHandler:v6];
}

uint64_t __55__ASClient_pushActivityDataToAllFriendsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pushActivityDataWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __55__ASClient_pushActivityDataToAllFriendsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pushFakeActivityDataToAllFriendsWithCompletion:(id)a3
{
  id v4 = [(ASClient *)self _clientQueueSuccessCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__ASClient_pushFakeActivityDataToAllFriendsWithCompletion___block_invoke;
  v8[3] = &unk_2644E8710;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__ASClient_pushFakeActivityDataToAllFriendsWithCompletion___block_invoke_2;
  v6[3] = &unk_2644E8698;
  id v7 = v9;
  id v5 = v9;
  [(ASClient *)self _remoteProxy:v8 errorHandler:v6];
}

uint64_t __59__ASClient_pushFakeActivityDataToAllFriendsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pushFakeActivityDataWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __59__ASClient_pushFakeActivityDataToAllFriendsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllDataWithCompletion:(id)a3
{
  id v4 = [(ASClient *)self _clientQueueSuccessCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__ASClient_fetchAllDataWithCompletion___block_invoke;
  v8[3] = &unk_2644E8710;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__ASClient_fetchAllDataWithCompletion___block_invoke_2;
  v6[3] = &unk_2644E8698;
  id v7 = v9;
  id v5 = v9;
  [(ASClient *)self _remoteProxy:v8 errorHandler:v6];
}

uint64_t __39__ASClient_fetchAllDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllDataWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __39__ASClient_fetchAllDataWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllDataIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 completion:(id)a4
{
  id v6 = [(ASClient *)self _clientQueueSuccessCompletion:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__ASClient_fetchAllDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke;
  v10[3] = &unk_2644E8738;
  unint64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__ASClient_fetchAllDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke_2;
  v8[3] = &unk_2644E8698;
  id v9 = v11;
  id v7 = v11;
  [(ASClient *)self _remoteProxy:v10 errorHandler:v8];
}

uint64_t __69__ASClient_fetchAllDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllDataIfTimeSinceLastFetchIsGreaterThan:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __69__ASClient_fetchAllDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cloudKitAccountStatusWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke;
  v8[3] = &unk_2644E87B0;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_4;
  v6[3] = &unk_2644E8698;
  id v7 = v9;
  id v5 = v9;
  [(ASClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_2;
  v5[3] = &unk_2644E8788;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(a2, "remote_cloudKitAccountStatusWithCompletion:", v5);
}

void __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_2(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_3;
    block[3] = &unk_2644E8760;
    id v12 = v8;
    char v13 = a2;
    char v14 = a3;
    id v11 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(void *)(a1 + 32));
}

uint64_t __48__ASClient_cloudKitAccountStatusWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearFriendListWithCompletion:(id)a3
{
  id v4 = [(ASClient *)self _clientQueueSuccessCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__ASClient_clearFriendListWithCompletion___block_invoke;
  v8[3] = &unk_2644E87B0;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__ASClient_clearFriendListWithCompletion___block_invoke_4;
  v6[3] = &unk_2644E8698;
  id v7 = v9;
  id v5 = v9;
  [(ASClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __42__ASClient_clearFriendListWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__ASClient_clearFriendListWithCompletion___block_invoke_2;
  v5[3] = &unk_2644E8800;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(a2, "remote_clearFriendListWithCompletion:", v5);
}

void __42__ASClient_clearFriendListWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__ASClient_clearFriendListWithCompletion___block_invoke_3;
    block[3] = &unk_2644E87D8;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __42__ASClient_clearFriendListWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __42__ASClient_clearFriendListWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAreMultipleDevicesSharingDataForSnapshotIndex:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke;
  v12[3] = &unk_2644E86C0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_3;
  v10[3] = &unk_2644E8698;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(ASClient *)self _remoteProxy:v12 errorHandler:v10];
}

void __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_2;
  v4[3] = &unk_2644E8828;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_fetchAreMultipleDevicesSharingDataForSnapshotIndex:withCompletion:", v3, v4);
}

uint64_t __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __78__ASClient_fetchAreMultipleDevicesSharingDataForSnapshotIndex_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)expireChangeTokenWithCompletion:(id)a3
{
  id v4 = [(ASClient *)self _clientQueueSuccessCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__ASClient_expireChangeTokenWithCompletion___block_invoke;
  v8[3] = &unk_2644E8710;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__ASClient_expireChangeTokenWithCompletion___block_invoke_2;
  v6[3] = &unk_2644E8698;
  id v7 = v9;
  id v5 = v9;
  [(ASClient *)self _remoteProxy:v8 errorHandler:v6];
}

uint64_t __44__ASClient_expireChangeTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_expireChangeTokenWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __44__ASClient_expireChangeTokenWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allFriendsWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__ASClient_allFriendsWithCompletion___block_invoke;
  v8[3] = &unk_2644E8710;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__ASClient_allFriendsWithCompletion___block_invoke_3;
  v6[3] = &unk_2644E8698;
  id v7 = v9;
  id v5 = v9;
  [(ASClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __37__ASClient_allFriendsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__ASClient_allFriendsWithCompletion___block_invoke_2;
  v3[3] = &unk_2644E8850;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_fetchAllFriendsWithCompletion:", v3);
}

uint64_t __37__ASClient_allFriendsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __37__ASClient_allFriendsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)friendWithRemoteUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__ASClient_friendWithRemoteUUID_completion___block_invoke;
  v16[3] = &unk_2644E88A0;
  v16[4] = self;
  id v17 = v7;
  id v8 = (void *)MEMORY[0x223C38130](v16);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__ASClient_friendWithRemoteUUID_completion___block_invoke_3;
  v13[3] = &unk_2644E86C0;
  id v14 = v6;
  id v15 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__ASClient_friendWithRemoteUUID_completion___block_invoke_5;
  v11[3] = &unk_2644E8698;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(ASClient *)self _remoteProxy:v13 errorHandler:v11];
}

void __44__ASClient_friendWithRemoteUUID_completion___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__ASClient_friendWithRemoteUUID_completion___block_invoke_2;
  v13[3] = &unk_2644E8878;
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  char v17 = a3;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t __44__ASClient_friendWithRemoteUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
  }
  return result;
}

void __44__ASClient_friendWithRemoteUUID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__ASClient_friendWithRemoteUUID_completion___block_invoke_4;
  v4[3] = &unk_2644E88C8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_friendWithRemoteUUID:completion:", v3, v4);
}

void __44__ASClient_friendWithRemoteUUID_completion___block_invoke_4(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a4;
  id v8 = 0;
  id v11 = v7;
  if (a2 && !v7 && a3)
  {
    id v9 = a2;
    id v10 = [[ASCodableFriend alloc] initWithData:v9];

    id v8 = +[ASFriend friendWithCodableFriend:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__ASClient_friendWithRemoteUUID_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleNotificationResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(ASClient *)self _clientQueueSuccessCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__ASClient_handleNotificationResponse_completion___block_invoke;
  v12[3] = &unk_2644E86C0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__ASClient_handleNotificationResponse_completion___block_invoke_2;
  v10[3] = &unk_2644E8698;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(ASClient *)self _remoteProxy:v12 errorHandler:v10];
}

uint64_t __50__ASClient_handleNotificationResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_handleNotificationResponse:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __50__ASClient_handleNotificationResponse_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryAppBadgeCountWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke;
  v8[3] = &unk_2644E8710;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke_3;
  v6[3] = &unk_2644E8698;
  id v7 = v9;
  id v5 = v9;
  [(ASClient *)self _remoteProxy:v8 errorHandler:v6];
}

void __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke_2;
  v3[3] = &unk_2644E88F0;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_queryAppBadgeCountWithCompletion:", v3);
}

uint64_t __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__ASClient_queryAppBadgeCountWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_remoteProxy:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ASClient__remoteProxy_errorHandler___block_invoke;
  block[3] = &unk_2644E8918;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serverQueue, block);
}

void __38__ASClient__remoteProxy_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__ASClient__remoteProxy_errorHandler___block_invoke_2;
  v3[3] = &unk_2644E8698;
  id v4 = *(id *)(a1 + 48);
  [v2 fetchProxyWithHandler:v1 errorHandler:v3];
}

void __38__ASClient__remoteProxy_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR)) {
    __38__ASClient__remoteProxy_errorHandler___block_invoke_2_cold_1((uint64_t)v3, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_clientQueueSuccessCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__ASClient__clientQueueSuccessCompletion___block_invoke;
  v8[3] = &unk_2644E8800;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x223C38130](v8);

  return v6;
}

void __42__ASClient__clientQueueSuccessCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__ASClient__clientQueueSuccessCompletion___block_invoke_2;
    block[3] = &unk_2644E87D8;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __42__ASClient__clientQueueSuccessCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);

  objc_storeStrong((id *)&self->_serverQueue, 0);
}

void __38__ASClient__remoteProxy_errorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21EC60000, a2, OS_LOG_TYPE_ERROR, "Unable to get plugin proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end