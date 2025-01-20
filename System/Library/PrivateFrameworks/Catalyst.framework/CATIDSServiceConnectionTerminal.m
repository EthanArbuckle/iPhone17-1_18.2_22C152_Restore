@interface CATIDSServiceConnectionTerminal
- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 assertionProvider:(id)a4 sourceAppleID:(id)a5;
- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 assertionProvider:(id)a4 sourceAppleID:(id)a5 connectionConfiguration:(id)a6;
- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 assertionProvider:(id)a4 timerSource:(id)a5 workQueue:(id)a6 delegateQueue:(id)a7 sourceAppleID:(id)a8 connectionConfiguration:(id)a9;
- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 networkPowerPrimitives:(id)a4 sourceAppleID:(id)a5;
- (CATIDSServiceConnectionTerminalDelegate)delegate;
- (id)description;
- (id)inviteAppleIDToConnect:(id)a3 userInfo:(id)a4;
- (void)addBroadcastHandler:(id)a3;
- (void)cancelAllInvitations;
- (void)cancelInvitationWithIdentifier:(id)a3;
- (void)connectionInvitatioInbox:(id)a3 timeoutOutForInvitation:(id)a4 connectionIdentifier:(id)a5 senderAppleID:(id)a6 userInfo:(id)a7;
- (void)connectionInvitationInbox:(id)a3 foundConection:(id)a4 senderAppleID:(id)a5 senderAddress:(id)a6 assertion:(id)a7 messagingVersion:(unint64_t)a8 userInfo:(id)a9;
- (void)connectionInvitationInbox:(id)a3 rejectedInvitation:(id)a4 connectionIdentifier:(id)a5 appleID:(id)a6 address:(id)a7 error:(id)a8;
- (void)connectionInvitationInbox:(id)a3 shouldConnectToAppleID:(id)a4 connectionIdentifier:(id)a5 userInfo:(id)a6 responseHandler:(id)a7;
- (void)connectionInvitationInbox:(id)a3 wantsToAcceptInvitation:(id)a4 connectionIdentifier:(id)a5 destinationAddress:(id)a6;
- (void)connectionInvitationOutbox:(id)a3 foundConnection:(id)a4 destinationAppleID:(id)a5 destinationAddress:(id)a6 assertion:(id)a7 messagingVersion:(unint64_t)a8 userInfo:(id)a9;
- (void)connectionInvitationOutbox:(id)a3 receivedARejectionFrom:(id)a4 connectionIdentifier:(id)a5 userInfo:(id)a6 error:(id)a7;
- (void)connectionInvitationOutbox:(id)a3 wantsToAcknowledgeInvitation:(id)a4 connectionIdentifier:(id)a5 destinationAddress:(id)a6;
- (void)connectionInvitationOutbox:(id)a3 wantsToSendInvitation:(id)a4 destinationAppleID:(id)a5 userInfo:(id)a6;
- (void)processMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5;
- (void)resume;
- (void)sendContent:(id)a3 toAddress:(id)a4 forInvitation:(id)a5;
- (void)setDelegate:(id)a3;
- (void)suspend;
@end

@implementation CATIDSServiceConnectionTerminal

- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 assertionProvider:(id)a4 timerSource:(id)a5 workQueue:(id)a6 delegateQueue:(id)a7 sourceAppleID:(id)a8 connectionConfiguration:(id)a9
{
  id v37 = a3;
  id v16 = a4;
  id v36 = a5;
  id v17 = a6;
  id v35 = a7;
  id v18 = a8;
  id v19 = a9;
  if (!v18)
  {
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"CATIDSServiceConnectionTerminal.m", 73, @"Invalid parameter not satisfying: %@", @"sourceAppleID" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)CATIDSServiceConnectionTerminal;
  v20 = [(CATIDSServiceConnectionTerminal *)&v38 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->mIDSPrimitives, a3);
    objc_storeStrong((id *)&v21->mTimerSource, a5);
    objc_storeStrong((id *)&v21->mWorkQueue, a6);
    objc_storeStrong((id *)&v21->mDelegateQueue, a7);
    uint64_t v22 = [v18 copy];
    mSourceAppleID = v21->mSourceAppleID;
    v21->mSourceAppleID = (NSString *)v22;

    objc_storeStrong((id *)&v21->mConnectionConfiguration, a9);
    v24 = [CATIDSServiceConnectionInvitationInbox alloc];
    mTimerSource = v21->mTimerSource;
    [v19 invitationAcknowledgeTimeout];
    uint64_t v26 = -[CATIDSServiceConnectionInvitationInbox initWithTimerSource:assertionProvider:workQueue:acknowledgeTimeout:](v24, "initWithTimerSource:assertionProvider:workQueue:acknowledgeTimeout:", mTimerSource, v16, v17);
    mInvitationInbox = v21->mInvitationInbox;
    v21->mInvitationInbox = (CATIDSServiceConnectionInvitationInbox *)v26;

    v28 = [[CATIDSServiceConnectionInvitationOutbox alloc] initWithAssertionProvider:v16 workQueue:v17];
    mInvitationOutbox = v21->mInvitationOutbox;
    v21->mInvitationOutbox = v28;

    uint64_t v30 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    mBroadcastHandlers = v21->mBroadcastHandlers;
    v21->mBroadcastHandlers = (NSHashTable *)v30;

    [(CATIDSServiceConnectionInvitationInbox *)v21->mInvitationInbox setDelegate:v21];
    [(CATIDSServiceConnectionInvitationOutbox *)v21->mInvitationOutbox setDelegate:v21];
    v21->mIsActive = 0;
  }

  return v21;
}

- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 networkPowerPrimitives:(id)a4 sourceAppleID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[CATNetworkPowerPrimitivesBackedAssertionProvider alloc] initWithNetworkPowerPrimitives:v9];

  v12 = [(CATIDSServiceConnectionTerminal *)self initWithIDSPrimitives:v10 assertionProvider:v11 sourceAppleID:v8];
  return v12;
}

- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 assertionProvider:(id)a4 sourceAppleID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  v12 = [(CATIDSServiceConnectionTerminal *)self initWithIDSPrimitives:v10 assertionProvider:v9 sourceAppleID:v8 connectionConfiguration:v11];

  return v12;
}

- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 assertionProvider:(id)a4 sourceAppleID:(id)a5 connectionConfiguration:(id)a6
{
  id v10 = NSString;
  v11 = (void *)MEMORY[0x263F08C38];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v11 UUID];
  id v17 = [v10 stringWithFormat:@"Catalyst.IDSServiceConnection.%@", v16];

  id v18 = v17;
  dispatch_queue_t v19 = dispatch_queue_create((const char *)[v18 UTF8String], 0);
  v20 = CATGetCatalystQueue();
  v21 = objc_opt_new();
  uint64_t v22 = [(CATIDSServiceConnectionTerminal *)self initWithIDSPrimitives:v15 assertionProvider:v14 timerSource:v21 workQueue:v19 delegateQueue:v20 sourceAppleID:v13 connectionConfiguration:v12];

  return v22;
}

- (void)resume
{
  objc_initWeak(&location, self);
  v3 = self->mWorkQueue;
  v4 = self->mDelegateQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke;
  v9[3] = &unk_2641DC510;
  v9[4] = self;
  v5 = v3;
  id v10 = v5;
  objc_copyWeak(&v12, &location);
  v11 = v4;
  v6 = v9;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_2641DBD98;
  id v15 = v6;
  v7 = v5;
  id v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 88))
  {
    v2 = _CATLogGeneral_5();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v3;
      _os_log_impl(&dword_213B7F000, v2, OS_LOG_TYPE_INFO, "%{public}@ resuming", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
    v4 = *(void **)(*(void *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke_18;
    v9[3] = &unk_2641DC4C0;
    id v10 = *(id *)(a1 + 40);
    objc_copyWeak(&v11, (id *)(a1 + 56));
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke_3;
    v5[3] = &unk_2641DC4E8;
    id v6 = *(id *)(a1 + 40);
    objc_copyWeak(&v8, (id *)(a1 + 56));
    id v7 = *(id *)(a1 + 48);
    [v4 addMessageHandler:v9 completion:v5];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v11);
  }
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_18(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke_2;
  v16[3] = &unk_2641DC498;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v11 = v16;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_2641DBD98;
  id v22 = v11;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v12, block);

  objc_destroyWeak(&v20);
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained processMessage:*(void *)(a1 + 32) senderAppleID:*(void *)(a1 + 40) senderAddress:*(void *)(a1 + 48)];
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke_4;
  v12[3] = &unk_2641DC498;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  id v13 = v5;
  id v14 = v6;
  id v15 = *(id *)(a1 + 40);
  id v8 = v12;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_2641DBD98;
  id v18 = v8;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);

  objc_destroyWeak(&v16);
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 88))
    {
      v4 = (id *)(a1 + 40);
      if (*(void *)(a1 + 40))
      {
        id v5 = _CATLogGeneral_5();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          __41__CATIDSServiceConnectionTerminal_resume__block_invoke_4_cold_1((uint64_t)v3, v4, v5);
        }
      }
      else
      {
        objc_storeStrong(WeakRetained + 10, *(id *)(a1 + 32));
        [v3[8] resume];
        id v6 = *(void **)(a1 + 48);
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke_21;
        v8[3] = &unk_2641DBE60;
        v8[4] = v3;
        id v7 = v8;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __CATPerformBlock_block_invoke_12;
        block[3] = &unk_2641DBD98;
        id v10 = v7;
        id v5 = v6;
        dispatch_async(v5, block);
      }
    }
    else
    {
      [*(id *)(a1 + 32) cancel];
    }
  }
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_21(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 serviceConnectionTerminalDidResume:*(void *)(a1 + 32)];
}

- (void)suspend
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__CATIDSServiceConnectionTerminal_suspend__block_invoke;
  v4[3] = &unk_2641DBE60;
  v4[4] = self;
  id v2 = v4;
  uint64_t v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_2641DBD98;
  id v6 = v2;
  dispatch_async(v3, block);
}

void __42__CATIDSServiceConnectionTerminal_suspend__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 88))
  {
    id v2 = _CATLogGeneral_5();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_impl(&dword_213B7F000, v2, OS_LOG_TYPE_INFO, "%{public}@ suspending", (uint8_t *)&v6, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
    [*(id *)(*(void *)(a1 + 32) + 80) cancel];
    [*(id *)(*(void *)(a1 + 32) + 64) suspend];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = 0;
  }
}

- (id)inviteAppleIDToConnect:(id)a3 userInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CATLogGeneral_5();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v24 = v7;
    _os_log_impl(&dword_213B7F000, v8, OS_LOG_TYPE_INFO, "%{public}@ inviting appleID %{public}@ with userInfo %{public}@", buf, 0x20u);
  }

  id v9 = [MEMORY[0x263F08C38] UUID];
  mWorkQueue = self->mWorkQueue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__CATIDSServiceConnectionTerminal_inviteAppleIDToConnect_userInfo___block_invoke;
  v19[3] = &unk_2641DC538;
  v19[4] = self;
  id v11 = v9;
  id v20 = v11;
  id v21 = v6;
  id v22 = v7;
  id v12 = v19;
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __CATPerformBlock_block_invoke_12;
  v24 = &unk_2641DBD98;
  id v25 = v12;
  id v13 = mWorkQueue;
  id v14 = v7;
  id v15 = v6;
  dispatch_async(v13, buf);

  id v16 = v22;
  id v17 = v11;

  return v17;
}

uint64_t __67__CATIDSServiceConnectionTerminal_inviteAppleIDToConnect_userInfo___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 64) beginInvitationWithIdentifier:a1[5] appleID:a1[6] userInfo:a1[7]];
}

- (void)cancelInvitationWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CATLogGeneral_5();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_213B7F000, v5, OS_LOG_TYPE_INFO, "%{public}@ canceling invitation with identifier %{public}@", buf, 0x16u);
  }

  mWorkQueue = self->mWorkQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__CATIDSServiceConnectionTerminal_cancelInvitationWithIdentifier___block_invoke;
  v10[3] = &unk_2641DC000;
  v10[4] = self;
  id v11 = v4;
  id v7 = v10;
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __CATPerformBlock_block_invoke_12;
  id v13 = &unk_2641DBD98;
  id v14 = v7;
  uint64_t v8 = mWorkQueue;
  id v9 = v4;
  dispatch_async(v8, buf);
}

uint64_t __66__CATIDSServiceConnectionTerminal_cancelInvitationWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) cancelInvitationWithIdentifier:*(void *)(a1 + 40)];
}

- (void)cancelAllInvitations
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = _CATLogGeneral_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_213B7F000, v3, OS_LOG_TYPE_INFO, "%{public}@ canceling all invitations", (uint8_t *)&buf, 0xCu);
  }

  mWorkQueue = self->mWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__CATIDSServiceConnectionTerminal_cancelAllInvitations__block_invoke;
  v7[3] = &unk_2641DBE60;
  v7[4] = self;
  id v5 = v7;
  *(void *)&long long buf = MEMORY[0x263EF8330];
  *((void *)&buf + 1) = 3221225472;
  id v9 = __CATPerformBlock_block_invoke_12;
  id v10 = &unk_2641DBD98;
  id v11 = v5;
  id v6 = mWorkQueue;
  dispatch_async(v6, &buf);
}

uint64_t __55__CATIDSServiceConnectionTerminal_cancelAllInvitations__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) cancelAllInvitations];
}

- (void)connectionInvitationInbox:(id)a3 shouldConnectToAppleID:(id)a4 connectionIdentifier:(id)a5 userInfo:(id)a6 responseHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = [[CATIDSServiceConnectionMetadata alloc] initWithConnectionIdentifier:v13 destinationAppleID:v14 userInfo:v12];

  id v16 = self->mWorkQueue;
  mDelegateQueue = self->mDelegateQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke;
  v23[3] = &unk_2641DC5B0;
  v23[4] = self;
  v24 = v15;
  id v25 = v16;
  id v26 = v11;
  id v18 = v23;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_2641DBD98;
  id v28 = v18;
  id v19 = mDelegateQueue;
  id v20 = v11;
  id v21 = v16;
  id v22 = v15;
  dispatch_async(v19, block);
}

void __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke_2;
  v5[3] = &unk_2641DC588;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 serviceConnectionTerminal:v3 shouldEstablishConnection:v4 responseHandler:v5];
}

void __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke_3;
  v11[3] = &unk_2641DC560;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v14 = a2;
  id v12 = v5;
  id v13 = v7;
  uint64_t v8 = v11;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_2641DBD98;
  id v16 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v9, block);
}

uint64_t __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)connectionInvitationInbox:(id)a3 wantsToAcceptInvitation:(id)a4 connectionIdentifier:(id)a5 destinationAddress:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [[CATInitializingIDSServiceConnectionContentAccept alloc] initWithConnectionIdentifier:v10];

  [(CATIDSServiceConnectionTerminal *)self sendContent:v12 toAddress:v9 forInvitation:v11];
}

- (void)connectionInvitatioInbox:(id)a3 timeoutOutForInvitation:(id)a4 connectionIdentifier:(id)a5 senderAppleID:(id)a6 userInfo:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = [[CATIDSServiceConnectionMetadata alloc] initWithConnectionIdentifier:v12 destinationAppleID:v11 userInfo:v10];

  mDelegateQueue = self->mDelegateQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __128__CATIDSServiceConnectionTerminal_connectionInvitatioInbox_timeoutOutForInvitation_connectionIdentifier_senderAppleID_userInfo___block_invoke;
  v18[3] = &unk_2641DC000;
  v18[4] = self;
  id v19 = v13;
  uint64_t v15 = v18;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_2641DBD98;
  id v21 = v15;
  id v16 = mDelegateQueue;
  id v17 = v13;
  dispatch_async(v16, block);
}

void __128__CATIDSServiceConnectionTerminal_connectionInvitatioInbox_timeoutOutForInvitation_connectionIdentifier_senderAppleID_userInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 serviceConnectionTerminal:*(void *)(a1 + 32) timedOutOnInvitationWithMetadata:*(void *)(a1 + 40)];
}

- (void)connectionInvitationInbox:(id)a3 foundConection:(id)a4 senderAppleID:(id)a5 senderAddress:(id)a6 assertion:(id)a7 messagingVersion:(unint64_t)a8 userInfo:(id)a9
{
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  v23 = [[CATIDSServiceConnectionCapabilities alloc] initWithMessagingVersion:a8];
  id v20 = [[CATIDSServiceConnectionMetadata alloc] initWithConnectionIdentifier:v19 destinationAppleID:v18 userInfo:v15];

  id v21 = +[CATIDSServiceConnection connectionWithMetadata:v20 configuration:self->mConnectionConfiguration capabilities:v23 IDSPrimitives:self->mIDSPrimitives messageBroadcaster:self timerSource:self->mTimerSource assertion:v16 workQueue:self->mWorkQueue delegateQueue:self->mDelegateQueue destinationAddress:v17 sourceAppleID:self->mSourceAppleID];

  id v22 = [(CATIDSServiceConnectionTerminal *)self delegate];
  [v22 serviceConnectionTerminal:self establishedConnection:v21];
}

- (void)connectionInvitationInbox:(id)a3 rejectedInvitation:(id)a4 connectionIdentifier:(id)a5 appleID:(id)a6 address:(id)a7 error:(id)a8
{
  id v12 = a8;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = [[CATInitializingIDSServiceConnectionContentReject alloc] initWithConnectionIdentifier:v14 error:v12];

  [(CATIDSServiceConnectionTerminal *)self sendContent:v16 toAddress:v13 forInvitation:v15];
}

- (void)connectionInvitationOutbox:(id)a3 wantsToSendInvitation:(id)a4 destinationAppleID:(id)a5 userInfo:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v13 = [[CATInitializingIDSServiceConnectionContentInvite alloc] initWithUserInfo:v9];

  id v12 = [(CATIDSPrimitives *)self->mIDSPrimitives addressForAppleID:v10];

  [(CATIDSServiceConnectionTerminal *)self sendContent:v13 toAddress:v12 forInvitation:v11];
}

- (void)connectionInvitationOutbox:(id)a3 wantsToAcknowledgeInvitation:(id)a4 connectionIdentifier:(id)a5 destinationAddress:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [[CATInitializingIDSServiceConnectionContentAcknowledge alloc] initWithConnectionIdentifier:v10];

  [(CATIDSServiceConnectionTerminal *)self sendContent:v12 toAddress:v9 forInvitation:v11];
}

- (void)connectionInvitationOutbox:(id)a3 foundConnection:(id)a4 destinationAppleID:(id)a5 destinationAddress:(id)a6 assertion:(id)a7 messagingVersion:(unint64_t)a8 userInfo:(id)a9
{
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = [[CATIDSServiceConnectionCapabilities alloc] initWithMessagingVersion:a8];
  id v21 = [[CATIDSServiceConnectionMetadata alloc] initWithConnectionIdentifier:v19 destinationAppleID:v18 userInfo:v15];

  id v22 = +[CATIDSServiceConnection connectionWithMetadata:v21 configuration:self->mConnectionConfiguration capabilities:v20 IDSPrimitives:self->mIDSPrimitives messageBroadcaster:self timerSource:self->mTimerSource assertion:v16 workQueue:self->mWorkQueue delegateQueue:self->mDelegateQueue destinationAddress:v17 sourceAppleID:self->mSourceAppleID];

  mDelegateQueue = self->mDelegateQueue;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __152__CATIDSServiceConnectionTerminal_connectionInvitationOutbox_foundConnection_destinationAppleID_destinationAddress_assertion_messagingVersion_userInfo___block_invoke;
  v27[3] = &unk_2641DC000;
  v27[4] = self;
  id v28 = v22;
  v24 = v27;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_2641DBD98;
  id v30 = v24;
  id v25 = mDelegateQueue;
  id v26 = v22;
  dispatch_async(v25, block);
}

void __152__CATIDSServiceConnectionTerminal_connectionInvitationOutbox_foundConnection_destinationAppleID_destinationAddress_assertion_messagingVersion_userInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 serviceConnectionTerminal:*(void *)(a1 + 32) establishedConnection:*(void *)(a1 + 40)];
}

- (void)connectionInvitationOutbox:(id)a3 receivedARejectionFrom:(id)a4 connectionIdentifier:(id)a5 userInfo:(id)a6 error:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [[CATIDSServiceConnectionMetadata alloc] initWithConnectionIdentifier:v13 destinationAppleID:v14 userInfo:v12];

  mDelegateQueue = self->mDelegateQueue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __121__CATIDSServiceConnectionTerminal_connectionInvitationOutbox_receivedARejectionFrom_connectionIdentifier_userInfo_error___block_invoke;
  v21[3] = &unk_2641DBE10;
  v21[4] = self;
  id v22 = v15;
  id v23 = v11;
  id v17 = v21;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_2641DBD98;
  id v25 = v17;
  id v18 = mDelegateQueue;
  id v19 = v11;
  id v20 = v15;
  dispatch_async(v18, block);
}

void __121__CATIDSServiceConnectionTerminal_connectionInvitationOutbox_receivedARejectionFrom_connectionIdentifier_userInfo_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 serviceConnectionTerminal:*(void *)(a1 + 32) receivedRejectionWithMetadata:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)addBroadcastHandler:(id)a3
{
}

- (void)processMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (self->mIsActive)
  {
    id v11 = (void *)[(NSHashTable *)self->mBroadcastHandlers copy];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = [v11 objectEnumerator];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) processMessage:v8 senderAppleID:v9 senderAddress:v10];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v14);
    }

    id v17 = self->mWorkQueue;
    mDelegateQueue = self->mDelegateQueue;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __78__CATIDSServiceConnectionTerminal_processMessage_senderAppleID_senderAddress___block_invoke;
    v22[3] = &unk_2641DC5D8;
    v22[4] = self;
    id v23 = v9;
    v24 = v17;
    id v25 = v8;
    id v26 = v10;
    id v19 = v22;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_12;
    block[3] = &unk_2641DBD98;
    id v32 = v19;
    id v20 = mDelegateQueue;
    id v21 = v17;
    dispatch_async(v20, block);
  }
}

void __78__CATIDSServiceConnectionTerminal_processMessage_senderAppleID_senderAddress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  int v3 = [v2 serviceConnectionTerminal:*(void *)(a1 + 32) shouldTrustAppleID:*(void *)(a1 + 40)];

  if (v3)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__CATIDSServiceConnectionTerminal_processMessage_senderAppleID_senderAddress___block_invoke_2;
    v9[3] = &unk_2641DC538;
    uint64_t v4 = *(void **)(a1 + 48);
    id v5 = *(id *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = v5;
    uint64_t v11 = v6;
    id v12 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 40);
    id v7 = v9;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_12;
    block[3] = &unk_2641DBD98;
    id v15 = v7;
    id v8 = v4;
    dispatch_async(v8, block);
  }
}

void __78__CATIDSServiceConnectionTerminal_processMessage_senderAppleID_senderAddress___block_invoke_2(void *a1)
{
  id v2 = +[CATIDSMessagePayload instanceWithDictionary:a1[4]];
  if (v2)
  {
    id v61 = v2;
    int v3 = [v2 metadata];
    uint64_t v4 = [v3 messageType];

    id v2 = v61;
    if (v4 == 101)
    {
      id v5 = [v61 message];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v25 = [MEMORY[0x263F08690] currentHandler];
        id v26 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2"];
        long long v27 = (objc_class *)objc_opt_class();
        long long v28 = NSStringFromClass(v27);
        long long v29 = (objc_class *)objc_opt_class();
        long long v30 = NSStringFromClass(v29);
        [v25 handleFailureInFunction:v26, @"CATIDSServiceConnectionTerminal.m", 461, @"expected %@, got %@", v28, v30 file lineNumber description];
      }
      uint64_t v6 = [v5 content];
      uint64_t v7 = [v6 contentType];

      switch(v7)
      {
        case 1:
          id v8 = *(void **)(a1[5] + 56);
          id v9 = [v5 invitationIdentifier];
          id v12 = a1 + 6;
          uint64_t v10 = a1[6];
          uint64_t v11 = v12[1];
          id v13 = [v61 metadata];
          uint64_t v14 = [v13 messagingVersion];
          id v15 = [v5 content];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v59 = [MEMORY[0x263F08690] currentHandler];
            v57 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2"];
            v31 = (objc_class *)objc_opt_class();
            v56 = NSStringFromClass(v31);
            id v32 = (objc_class *)objc_opt_class();
            v33 = NSStringFromClass(v32);
            [v59 handleFailureInFunction:v57, @"CATIDSServiceConnectionTerminal.m", 477, @"expected %@, got %@", v56, v33 file lineNumber description];
          }
          id v16 = [v15 userInfo];
          [v8 receiveInvitationWithIdentifier:v9 senderAppleID:v11 senderAddress:v10 messagingVersion:v14 userInfo:v16];

          goto LABEL_20;
        case 2:
          id v17 = *(void **)(a1[5] + 64);
          id v9 = [v5 invitationIdentifier];
          id v13 = [v5 content];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v34 = [MEMORY[0x263F08690] currentHandler];
            id v35 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2"];
            id v36 = (objc_class *)objc_opt_class();
            id v37 = NSStringFromClass(v36);
            objc_super v38 = (objc_class *)objc_opt_class();
            v39 = NSStringFromClass(v38);
            [v34 handleFailureInFunction:v35, @"CATIDSServiceConnectionTerminal.m", 466, @"expected %@, got %@", v37, v39 file lineNumber description];
          }
          id v15 = [v13 connectionIdentifier];
          uint64_t v18 = a1[6];
          id v19 = [v61 metadata];
          objc_msgSend(v17, "receiveAcceptForInvitation:connectionIdentifier:senderAddress:messagingVersion:", v9, v15, v18, objc_msgSend(v19, "messagingVersion"));

          goto LABEL_20;
        case 3:
          id v20 = *(void **)(a1[5] + 64);
          id v9 = [v5 invitationIdentifier];
          id v13 = [v5 content];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v40 = [MEMORY[0x263F08690] currentHandler];
            v41 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2"];
            v42 = (objc_class *)objc_opt_class();
            v43 = NSStringFromClass(v42);
            v44 = (objc_class *)objc_opt_class();
            v45 = NSStringFromClass(v44);
            [v40 handleFailureInFunction:v41, @"CATIDSServiceConnectionTerminal.m", 489, @"expected %@, got %@", v43, v45 file lineNumber description];
          }
          id v15 = [v13 connectionIdentifier];
          uint64_t v21 = a1[6];
          id v22 = [v5 content];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v46 = [MEMORY[0x263F08690] currentHandler];
            v60 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2"];
            v47 = (objc_class *)objc_opt_class();
            v58 = NSStringFromClass(v47);
            v48 = (objc_class *)objc_opt_class();
            v49 = NSStringFromClass(v48);
            [v46 handleFailureInFunction:v60, @"CATIDSServiceConnectionTerminal.m", 492, @"expected %@, got %@", v58, v49 file lineNumber description];
          }
          id v23 = [v22 error];
          [v20 receiveRejectForInvitation:v9 connectionIdentifier:v15 senderAddress:v21 error:v23];

          goto LABEL_20;
        case 4:
          v24 = *(void **)(a1[5] + 56);
          id v9 = [v5 invitationIdentifier];
          id v13 = [v5 content];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v50 = [MEMORY[0x263F08690] currentHandler];
            v51 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2"];
            v52 = (objc_class *)objc_opt_class();
            v53 = NSStringFromClass(v52);
            v54 = (objc_class *)objc_opt_class();
            v55 = NSStringFromClass(v54);
            [v50 handleFailureInFunction:v51, @"CATIDSServiceConnectionTerminal.m", 483, @"expected %@, got %@", v53, v55 file lineNumber description];
          }
          id v15 = [v13 connectionIdentifier];
          [v24 receiveAcknowledgeForInvitationIdentifier:v9 connectionIdentifier:v15];
LABEL_20:

          break;
        default:
          break;
      }

      id v2 = v61;
    }
  }
}

- (void)sendContent:(id)a3 toAddress:(id)a4 forInvitation:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [[CATInitializingServiceConnectionIDSMessage alloc] initWithInvitationIdentifier:v9 content:v10];

  id v12 = [[CATIDSMessagePayload alloc] initWithMessage:v11];
  id v13 = [(CATIDSMessagePayload *)v12 dictionaryValue];
  uint64_t v14 = objc_opt_new();
  [v14 setDeliveryTimeout:&unk_26C4B5E38];
  mIDSPrimitives = self->mIDSPrimitives;
  mSourceAppleID = self->mSourceAppleID;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __71__CATIDSServiceConnectionTerminal_sendContent_toAddress_forInvitation___block_invoke;
  v19[3] = &unk_2641DC600;
  v19[4] = self;
  id v20 = v8;
  id v21 = v13;
  id v17 = v13;
  id v18 = v8;
  [(CATIDSPrimitives *)mIDSPrimitives sendMessage:v17 toAddress:v18 fromID:mSourceAppleID options:v14 completion:v19];
}

void __71__CATIDSServiceConnectionTerminal_sendContent_toAddress_forInvitation___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _CATLogGeneral_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__CATIDSServiceConnectionTerminal_sendContent_toAddress_forInvitation___block_invoke_cold_1(a1, v3, v4);
    }
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p { sourceAppleID = %@ }>", objc_opt_class(), self, self->mSourceAppleID];
}

- (CATIDSServiceConnectionTerminalDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATIDSServiceConnectionTerminalDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mMessageSubscription, 0);
  objc_storeStrong((id *)&self->mBroadcastHandlers, 0);
  objc_storeStrong((id *)&self->mInvitationOutbox, 0);
  objc_storeStrong((id *)&self->mInvitationInbox, 0);
  objc_storeStrong((id *)&self->mConnectionConfiguration, 0);
  objc_storeStrong((id *)&self->mSourceAppleID, 0);
  objc_storeStrong((id *)&self->mDelegateQueue, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
  objc_storeStrong((id *)&self->mTimerSource, 0);

  objc_storeStrong((id *)&self->mIDSPrimitives, 0);
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_4_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [*a2 verboseDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_213B7F000, a3, OS_LOG_TYPE_ERROR, "%{public}@ failed to begin listeneing for IDS messages. Error: %{public}@.", (uint8_t *)&v6, 0x16u);
}

void __71__CATIDSServiceConnectionTerminal_sendContent_toAddress_forInvitation___block_invoke_cold_1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = [a2 verboseDescription];
  int v8 = 138544130;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  __int16 v12 = 2114;
  uint64_t v13 = v6;
  __int16 v14 = 2114;
  id v15 = v7;
  _os_log_error_impl(&dword_213B7F000, a3, OS_LOG_TYPE_ERROR, "%{public}@ failed to send IDS message %{public}@ to address %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x2Au);
}

@end