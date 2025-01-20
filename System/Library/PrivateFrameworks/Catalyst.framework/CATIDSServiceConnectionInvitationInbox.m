@interface CATIDSServiceConnectionInvitationInbox
+ (id)acknowledgeTimerIdentifier;
- (CATIDSServiceConnectionInvitationInbox)initWithTimerSource:(id)a3 assertionProvider:(id)a4 workQueue:(id)a5 acknowledgeTimeout:(double)a6;
- (CATIDSServiceConnectionInvitationInboxDelegate)delegate;
- (void)acknowledgeTimerFiredWithInvitationIdentifier:(id)a3;
- (void)dealloc;
- (void)receiveAcknowledgeForInvitationIdentifier:(id)a3 connectionIdentifier:(id)a4;
- (void)receiveInvitationWithIdentifier:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5 messagingVersion:(unint64_t)a6 userInfo:(id)a7;
- (void)setDelegate:(id)a3;
@end

@implementation CATIDSServiceConnectionInvitationInbox

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSMutableDictionary *)self->mAcknowledgeTimersByInvitationID allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)CATIDSServiceConnectionInvitationInbox;
  [(CATIDSServiceConnectionInvitationInbox *)&v8 dealloc];
}

- (CATIDSServiceConnectionInvitationInbox)initWithTimerSource:(id)a3 assertionProvider:(id)a4 workQueue:(id)a5 acknowledgeTimeout:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CATIDSServiceConnectionInvitationInbox;
  uint64_t v14 = [(CATIDSServiceConnectionInvitationInbox *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->mTimerSource, a3);
    objc_storeStrong((id *)&v15->mAssertionProvider, a4);
    objc_storeStrong((id *)&v15->mWorkQueue, a5);
    v15->mAcknowledgeTimeout = a6;
    uint64_t v16 = objc_opt_new();
    mInvitationsByInvitationID = v15->mInvitationsByInvitationID;
    v15->mInvitationsByInvitationID = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    mAcknowledgeTimersByInvitationID = v15->mAcknowledgeTimersByInvitationID;
    v15->mAcknowledgeTimersByInvitationID = (NSMutableDictionary *)v18;
  }
  return v15;
}

- (void)receiveInvitationWithIdentifier:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5 messagingVersion:(unint64_t)a6 userInfo:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  uint64_t v16 = [(CATAssertionProviding *)self->mAssertionProvider acquireAssertion];
  v27 = v15;
  v17 = [[CATIDSServiceConnectionInvitation alloc] initWithSenderAppleID:v13 senderAddress:v14 assertion:v16 messagingVersion:a6 userInfo:v15];
  objc_initWeak(&location, self);
  uint64_t v18 = self->mWorkQueue;
  v19 = [(CATIDSServiceConnectionInvitationInbox *)self delegate];
  v20 = [(CATIDSServiceConnectionInvitation *)v17 connectionIdentifier];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __128__CATIDSServiceConnectionInvitationInbox_receiveInvitationWithIdentifier_senderAppleID_senderAddress_messagingVersion_userInfo___block_invoke;
  v28[3] = &unk_2641DBEB0;
  objc_super v21 = v18;
  v29 = v21;
  objc_copyWeak(&v35, &location);
  id v22 = v16;
  id v30 = v22;
  id v23 = v12;
  id v31 = v23;
  v24 = v17;
  v32 = v24;
  id v25 = v13;
  id v33 = v25;
  id v26 = v14;
  id v34 = v26;
  [v19 connectionInvitationInbox:self shouldConnectToAppleID:v25 connectionIdentifier:v20 userInfo:v27 responseHandler:v28];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __128__CATIDSServiceConnectionInvitationInbox_receiveInvitationWithIdentifier_senderAppleID_senderAddress_messagingVersion_userInfo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  CATAssertIsQueue(*(dispatch_queue_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_super v8 = (void *)WeakRetained[1];
      long long v9 = [(id)objc_opt_class() acknowledgeTimerIdentifier];
      double v10 = *((double *)v7 + 4);
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      objc_super v21 = __128__CATIDSServiceConnectionInvitationInbox_receiveInvitationWithIdentifier_senderAppleID_senderAddress_messagingVersion_userInfo___block_invoke_2;
      id v22 = &unk_2641DBE88;
      objc_copyWeak(&v24, (id *)(a1 + 80));
      id v23 = *(id *)(a1 + 48);
      id v12 = [v8 scheduleOneShotTimerWithIdentifier:v9 timeInterval:v11 queue:&v19 fireHandler:v10];

      objc_msgSend(*((id *)v7 + 5), "setObject:forKeyedSubscript:", *(void *)(a1 + 56), *(void *)(a1 + 48), v19, v20, v21, v22);
      [*((id *)v7 + 6) setObject:v12 forKeyedSubscript:*(void *)(a1 + 48)];
      id v13 = [v7 delegate];
      uint64_t v14 = *(void *)(a1 + 48);
      id v15 = [*(id *)(a1 + 56) connectionIdentifier];
      [v13 connectionInvitationInbox:v7 wantsToAcceptInvitation:v14 connectionIdentifier:v15 destinationAddress:*(void *)(a1 + 72)];

      objc_destroyWeak(&v24);
    }
    else
    {
      [*(id *)(a1 + 40) cancel];
      uint64_t v16 = [v7 delegate];
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v18 = [*(id *)(a1 + 56) connectionIdentifier];
      [v16 connectionInvitationInbox:v7 rejectedInvitation:v17 connectionIdentifier:v18 appleID:*(void *)(a1 + 64) address:*(void *)(a1 + 72) error:v5];
    }
  }
}

void __128__CATIDSServiceConnectionInvitationInbox_receiveInvitationWithIdentifier_senderAppleID_senderAddress_messagingVersion_userInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained acknowledgeTimerFiredWithInvitationIdentifier:*(void *)(a1 + 32)];
}

- (void)receiveAcknowledgeForInvitationIdentifier:(id)a3 connectionIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  objc_super v8 = [(NSMutableDictionary *)self->mInvitationsByInvitationID objectForKeyedSubscript:v6];
  long long v9 = v8;
  if (!v8)
  {
    uint64_t v19 = _CATLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CATIDSServiceConnectionInvitationInbox receiveAcknowledgeForInvitationIdentifier:connectionIdentifier:]((uint64_t)v6, (uint64_t)v7, v19);
    }
    goto LABEL_8;
  }
  double v10 = [v8 connectionIdentifier];
  char v11 = [v10 isEqual:v7];

  if ((v11 & 1) == 0)
  {
    uint64_t v19 = _CATLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v9 connectionIdentifier];
      *(_DWORD *)buf = 138543874;
      id v22 = v6;
      __int16 v23 = 2114;
      id v24 = v7;
      __int16 v25 = 2114;
      id v26 = v20;
      _os_log_error_impl(&dword_213B7F000, v19, OS_LOG_TYPE_ERROR, "Found mismatch connection identifier for invitation %{public}@. Received %{public}@ but expected %{public}@", buf, 0x20u);
    }
LABEL_8:

    goto LABEL_9;
  }
  id v12 = [(NSMutableDictionary *)self->mAcknowledgeTimersByInvitationID objectForKeyedSubscript:v6];
  [v12 invalidate];

  [(NSMutableDictionary *)self->mAcknowledgeTimersByInvitationID setObject:0 forKeyedSubscript:v6];
  [(NSMutableDictionary *)self->mInvitationsByInvitationID setObject:0 forKeyedSubscript:v6];
  id v13 = [(CATIDSServiceConnectionInvitationInbox *)self delegate];
  uint64_t v14 = [v9 senderAppleID];
  id v15 = [v9 senderAddress];
  uint64_t v16 = [v9 assertion];
  uint64_t v17 = [v9 messagingVersion];
  uint64_t v18 = [v9 userInfo];
  [v13 connectionInvitationInbox:self foundConection:v7 senderAppleID:v14 senderAddress:v15 assertion:v16 messagingVersion:v17 userInfo:v18];

LABEL_9:
}

- (void)acknowledgeTimerFiredWithInvitationIdentifier:(id)a3
{
  mWorkQueue = self->mWorkQueue;
  id v5 = a3;
  CATAssertIsQueue(mWorkQueue);
  id v11 = [(NSMutableDictionary *)self->mInvitationsByInvitationID objectForKeyedSubscript:v5];
  id v6 = [v11 assertion];
  [v6 cancel];

  [(NSMutableDictionary *)self->mAcknowledgeTimersByInvitationID setObject:0 forKeyedSubscript:v5];
  [(NSMutableDictionary *)self->mInvitationsByInvitationID setObject:0 forKeyedSubscript:v5];
  id v7 = [(CATIDSServiceConnectionInvitationInbox *)self delegate];
  objc_super v8 = [v11 connectionIdentifier];
  long long v9 = [v11 senderAppleID];
  double v10 = [v11 userInfo];
  [v7 connectionInvitatioInbox:self timeoutOutForInvitation:v5 connectionIdentifier:v8 senderAppleID:v9 userInfo:v10];
}

+ (id)acknowledgeTimerIdentifier
{
  v2 = NSString;
  v3 = NSStringFromClass((Class)a1);
  uint64_t v4 = [v2 stringWithFormat:@"%@-AcknowledgeTimer", v3];

  return v4;
}

- (CATIDSServiceConnectionInvitationInboxDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATIDSServiceConnectionInvitationInboxDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mAcknowledgeTimersByInvitationID, 0);
  objc_storeStrong((id *)&self->mInvitationsByInvitationID, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
  objc_storeStrong((id *)&self->mAssertionProvider, 0);

  objc_storeStrong((id *)&self->mTimerSource, 0);
}

- (void)receiveAcknowledgeForInvitationIdentifier:(os_log_t)log connectionIdentifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_213B7F000, log, OS_LOG_TYPE_ERROR, "Found acknowledge for unexpected invitation %{public}@ with connection identifier %{public}@.", (uint8_t *)&v3, 0x16u);
}

@end