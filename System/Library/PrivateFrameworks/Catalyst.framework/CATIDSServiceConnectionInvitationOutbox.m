@interface CATIDSServiceConnectionInvitationOutbox
- (CATIDSServiceConnectionInvitationOutbox)initWithAssertionProvider:(id)a3 workQueue:(id)a4;
- (CATIDSServiceConnectionInvitationOutboxDelegate)delegate;
- (void)beginInvitationWithIdentifier:(id)a3 appleID:(id)a4 userInfo:(id)a5;
- (void)cancelAllInvitations;
- (void)cancelAllPowerAssertions;
- (void)cancelInvitationWithIdentifier:(id)a3;
- (void)dealloc;
- (void)receiveAcceptForInvitation:(id)a3 connectionIdentifier:(id)a4 senderAddress:(id)a5 messagingVersion:(unint64_t)a6;
- (void)receiveRejectForInvitation:(id)a3 connectionIdentifier:(id)a4 senderAddress:(id)a5 error:(id)a6;
- (void)resume;
- (void)serviceInvitationQueue;
- (void)setDelegate:(id)a3;
- (void)suspend;
@end

@implementation CATIDSServiceConnectionInvitationOutbox

- (void)dealloc
{
  [(CATIDSServiceConnectionInvitationOutbox *)self cancelAllPowerAssertions];
  v3.receiver = self;
  v3.super_class = (Class)CATIDSServiceConnectionInvitationOutbox;
  [(CATIDSServiceConnectionInvitationOutbox *)&v3 dealloc];
}

- (CATIDSServiceConnectionInvitationOutbox)initWithAssertionProvider:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CATIDSServiceConnectionInvitationOutbox;
  v9 = [(CATIDSServiceConnectionInvitationOutbox *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mAssertionProvider, a3);
    objc_storeStrong((id *)&v10->mWorkQueue, a4);
    uint64_t v11 = objc_opt_new();
    mInFlightInvitationRequestsByInvitationID = v10->mInFlightInvitationRequestsByInvitationID;
    v10->mInFlightInvitationRequestsByInvitationID = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    mInvitationRequestQueue = v10->mInvitationRequestQueue;
    v10->mInvitationRequestQueue = (NSMutableArray *)v13;
  }
  return v10;
}

- (void)beginInvitationWithIdentifier:(id)a3 appleID:(id)a4 userInfo:(id)a5
{
  mWorkQueue = self->mWorkQueue;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  CATAssertIsQueue(mWorkQueue);
  id v13 = [(CATAssertionProviding *)self->mAssertionProvider acquireAssertion];
  v12 = [[CATIDSServiceConnectionInvitationRequest alloc] initWithInvitationIdentifier:v11 appleID:v10 assertion:v13 userInfo:v9];

  [(NSMutableArray *)self->mInvitationRequestQueue addObject:v12];
  [(CATIDSServiceConnectionInvitationOutbox *)self serviceInvitationQueue];
}

- (void)resume
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  self->mIsActive = 1;

  [(CATIDSServiceConnectionInvitationOutbox *)self serviceInvitationQueue];
}

- (void)suspend
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  self->mIsActive = 0;

  [(CATIDSServiceConnectionInvitationOutbox *)self cancelAllInvitations];
}

- (void)receiveAcceptForInvitation:(id)a3 connectionIdentifier:(id)a4 senderAddress:(id)a5 messagingVersion:(unint64_t)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  id v13 = [(NSMutableDictionary *)self->mInFlightInvitationRequestsByInvitationID objectForKeyedSubscript:v10];
  if (v13)
  {
    v14 = [(CATAssertionProviding *)self->mAssertionProvider acquireAssertion];
    v15 = [(CATIDSServiceConnectionInvitationOutbox *)self delegate];
    [v15 connectionInvitationOutbox:self wantsToAcknowledgeInvitation:v10 connectionIdentifier:v11 destinationAddress:v12];

    objc_super v16 = [(CATIDSServiceConnectionInvitationOutbox *)self delegate];
    v17 = [v13 appleID];
    v18 = [v13 userInfo];
    [v16 connectionInvitationOutbox:self foundConnection:v11 destinationAppleID:v17 destinationAddress:v12 assertion:v14 messagingVersion:a6 userInfo:v18];
  }
  else
  {
    v19 = _CATLogGeneral_7();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v12;
      __int16 v24 = 2114;
      id v25 = v11;
      _os_log_impl(&dword_213B7F000, v19, OS_LOG_TYPE_INFO, "Found unexpected accept for invitation %{public}@ from %{public}@ with connection %{public}@", buf, 0x20u);
    }
  }
}

- (void)receiveRejectForInvitation:(id)a3 connectionIdentifier:(id)a4 senderAddress:(id)a5 error:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  v14 = [(NSMutableDictionary *)self->mInFlightInvitationRequestsByInvitationID objectForKeyedSubscript:v10];
  if (v14)
  {
    v15 = [(CATIDSServiceConnectionInvitationOutbox *)self delegate];
    objc_super v16 = [v14 appleID];
    v17 = [v14 userInfo];
    [v15 connectionInvitationOutbox:self receivedARejectionFrom:v16 connectionIdentifier:v11 userInfo:v17 error:v13];
  }
  else
  {
    v18 = _CATLogGeneral_7();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138543618;
      id v20 = v10;
      __int16 v21 = 2114;
      id v22 = v12;
      _os_log_impl(&dword_213B7F000, v18, OS_LOG_TYPE_INFO, "Found unexpected rejection for invitation %{public}@ from %{public}@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)cancelInvitationWithIdentifier:(id)a3
{
  id v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  v5 = [(NSMutableDictionary *)self->mInFlightInvitationRequestsByInvitationID objectForKeyedSubscript:v4];
  v6 = [v5 assertion];
  [v6 cancel];

  [(NSMutableDictionary *)self->mInFlightInvitationRequestsByInvitationID setObject:0 forKeyedSubscript:v4];
  mInvitationRequestQueue = self->mInvitationRequestQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__CATIDSServiceConnectionInvitationOutbox_cancelInvitationWithIdentifier___block_invoke;
  v9[3] = &unk_2641DC668;
  id v10 = v4;
  id v8 = v4;
  [(NSMutableArray *)mInvitationRequestQueue cat_removeFirstObjectMatching:v9];
}

uint64_t __74__CATIDSServiceConnectionInvitationOutbox_cancelInvitationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 invitationIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)cancelAllInvitations
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  [(CATIDSServiceConnectionInvitationOutbox *)self cancelAllPowerAssertions];
  [(NSMutableArray *)self->mInvitationRequestQueue removeAllObjects];
  mInFlightInvitationRequestsByInvitationID = self->mInFlightInvitationRequestsByInvitationID;

  [(NSMutableDictionary *)mInFlightInvitationRequestsByInvitationID removeAllObjects];
}

- (void)serviceInvitationQueue
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (self->mIsActive && [(NSMutableArray *)self->mInvitationRequestQueue count])
  {
    id v9 = [(NSMutableArray *)self->mInvitationRequestQueue firstObject];
    [(NSMutableArray *)self->mInvitationRequestQueue removeObjectAtIndex:0];
    mInFlightInvitationRequestsByInvitationID = self->mInFlightInvitationRequestsByInvitationID;
    uint64_t v4 = [v9 invitationIdentifier];
    [(NSMutableDictionary *)mInFlightInvitationRequestsByInvitationID setObject:v9 forKeyedSubscript:v4];

    v5 = [(CATIDSServiceConnectionInvitationOutbox *)self delegate];
    v6 = [v9 invitationIdentifier];
    id v7 = [v9 appleID];
    id v8 = [v9 userInfo];
    [v5 connectionInvitationOutbox:self wantsToSendInvitation:v6 destinationAppleID:v7 userInfo:v8];

    [(CATIDSServiceConnectionInvitationOutbox *)self serviceInvitationQueue];
  }
}

- (void)cancelAllPowerAssertions
{
  mInvitationRequestQueue = self->mInvitationRequestQueue;
  id v4 = [(NSMutableDictionary *)self->mInFlightInvitationRequestsByInvitationID allValues];
  objc_super v3 = [(NSMutableArray *)mInvitationRequestQueue arrayByAddingObjectsFromArray:v4];
  objc_msgSend(v3, "cat_forEach:", &__block_literal_global_20);
}

void __67__CATIDSServiceConnectionInvitationOutbox_cancelAllPowerAssertions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 assertion];
  [v2 cancel];
}

- (CATIDSServiceConnectionInvitationOutboxDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATIDSServiceConnectionInvitationOutboxDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mInvitationRequestQueue, 0);
  objc_storeStrong((id *)&self->mInFlightInvitationRequestsByInvitationID, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);

  objc_storeStrong((id *)&self->mAssertionProvider, 0);
}

@end