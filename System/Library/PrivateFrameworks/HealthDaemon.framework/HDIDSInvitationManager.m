@interface HDIDSInvitationManager
- (HDIDSInvitationManager)initWithServiceIdentifier:(id)a3 messageClass:(Class)a4 schema:(id)a5;
- (HDIDSInvitationManagerDelegate)delegate;
- (IDSInvitationManager)invitationManager;
- (void)acceptInvitationWithUUID:(id)a3 codableObject:(id)a4 serverAcknowledgedBlock:(id)a5;
- (void)declineInvitationWithUUID:(id)a3 serverAcknowledgedBlock:(id)a4;
- (void)manager:(id)a3 incomingInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4;
- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4;
- (void)rescindInvitationWithUUID:(id)a3 serverAcknowledgedBlock:(id)a4;
- (void)sendInvitationToIdentifier:(id)a3 expirationDate:(id)a4 codableObject:(id)a5 serverAcknowledgedBlock:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setInvitationManager:(id)a3;
@end

@implementation HDIDSInvitationManager

- (HDIDSInvitationManager)initWithServiceIdentifier:(id)a3 messageClass:(Class)a4 schema:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDIDSInvitationManager;
  v10 = [(HDIDSInvitationManager *)&v21 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageClass, a4);
    uint64_t v12 = [v9 copy];
    schema = v11->_schema;
    v11->_schema = (NSString *)v12;

    uint64_t v14 = HKCreateSerialDispatchQueue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = HKCreateSerialDispatchQueue();
    IDSDelegateQueue = v11->_IDSDelegateQueue;
    v11->_IDSDelegateQueue = (OS_dispatch_queue *)v16;

    v18 = (void *)[objc_alloc(MEMORY[0x1E4F6AB48]) initWithServiceIdentifier:v8];
    [(HDIDSInvitationManager *)v11 setInvitationManager:v18];

    v19 = [(HDIDSInvitationManager *)v11 invitationManager];
    [v19 setDelegate:v11 queue:v11->_IDSDelegateQueue];
  }
  return v11;
}

- (void)sendInvitationToIdentifier:(id)a3 expirationDate:(id)a4 codableObject:(id)a5 serverAcknowledgedBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__HDIDSInvitationManager_sendInvitationToIdentifier_expirationDate_codableObject_serverAcknowledgedBlock___block_invoke;
  block[3] = &unk_1E62FF660;
  id v20 = v12;
  objc_super v21 = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_sync(queue, block);
}

void __106__HDIDSInvitationManager_sendInvitationToIdentifier_expirationDate_codableObject_serverAcknowledgedBlock___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"ObjectDataKey";
  v2 = [*(id *)(a1 + 32) data];
  v7[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F6AAF8]) initWithDictionary:v3 schema:*(void *)(*(void *)(a1 + 40) + 40)];
  v5 = [*(id *)(a1 + 40) invitationManager];
  [v5 sendInvitationToDestination:*(void *)(a1 + 48) expirationDate:*(void *)(a1 + 56) context:v4 serverAcknowledgedBlock:*(void *)(a1 + 64)];
}

- (void)rescindInvitationWithUUID:(id)a3 serverAcknowledgedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke;
  block[3] = &unk_1E62F4E40;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke(id *a1)
{
  v2 = [a1[4] invitationManager];
  v3 = [v2 pendingInvitations];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke_2;
  v9[3] = &unk_1E630CF38;
  id v10 = a1[5];
  v4 = objc_msgSend(v3, "hk_anyObjectPassingTest:", v9);

  if (v4)
  {
    v5 = [a1[4] invitationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke_3;
    v7[3] = &unk_1E62FFD78;
    id v8 = a1[6];
    [v5 cancelInvitation:v4 serverAcknowledgedBlock:v7];

    id v6 = v8;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 118, @"Invitation not found");
    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

- (void)acceptInvitationWithUUID:(id)a3 codableObject:(id)a4 serverAcknowledgedBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke;
  v15[3] = &unk_1E62F7150;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(queue, v15);
}

void __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke(id *a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] invitationManager];
  v3 = [v2 receivedInvitations];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke_2;
  v11[3] = &unk_1E630CF60;
  id v12 = a1[5];
  uint64_t v4 = objc_msgSend(v3, "hk_anyObjectPassingTest:", v11);

  if (v4)
  {
    id v13 = @"ObjectDataKey";
    v5 = [a1[6] data];
    v14[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F6AAF8]) initWithDictionary:v6 schema:*((void *)a1[4] + 5)];
    id v8 = [a1[4] invitationManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke_3;
    v9[3] = &unk_1E62FFD78;
    id v10 = a1[7];
    [v8 acceptInvitation:v4 withContext:v7 serverAcknowledgedBlock:v9];
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 118, @"Invitation not found");
    (*((void (**)(void))a1[7] + 2))();
  }
}

uint64_t __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

- (void)declineInvitationWithUUID:(id)a3 serverAcknowledgedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke;
  block[3] = &unk_1E62F4E40;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke(id *a1)
{
  v2 = [a1[4] invitationManager];
  v3 = [v2 receivedInvitations];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke_2;
  v9[3] = &unk_1E630CF60;
  id v10 = a1[5];
  uint64_t v4 = objc_msgSend(v3, "hk_anyObjectPassingTest:", v9);

  if (v4)
  {
    v5 = [a1[4] invitationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke_3;
    v7[3] = &unk_1E62FFD78;
    id v8 = a1[6];
    [v5 declineInvitation:v4 serverAcknowledgedBlock:v7];

    id v6 = v8;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 118, @"Invitation not found");
    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
  id v5 = a4;
  id v16 = [v5 context];
  id v6 = [v16 dictionary];
  id v7 = [v6 objectForKeyedSubscript:@"ObjectDataKey"];

  id v8 = (void *)[objc_alloc(self->_messageClass) initWithData:v7];
  id v9 = [v5 fromID];
  id v10 = [v9 _stripPotentialTokenURIWithToken:0];
  id v11 = [v10 _stripFZIDPrefix];

  id v12 = [HDIDSInvitation alloc];
  id v13 = [v5 uniqueID];

  id v14 = [(HDIDSInvitation *)v12 initWithUUID:v13 fromID:v11 codableObject:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained invitationManager:self didReceiveInvitation:v14];
}

- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4
{
  id v5 = a4;
  id v16 = [v5 context];
  id v6 = [v16 dictionary];
  id v7 = [v6 objectForKeyedSubscript:@"ObjectDataKey"];

  id v8 = (void *)[objc_alloc(self->_messageClass) initWithData:v7];
  id v9 = [v5 fromID];
  id v10 = [v9 _stripPotentialTokenURIWithToken:0];
  id v11 = [v10 _stripFZIDPrefix];

  id v12 = [HDIDSInvitation alloc];
  id v13 = [v5 uniqueID];

  id v14 = [(HDIDSInvitation *)v12 initWithUUID:v13 fromID:v11 codableObject:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained invitationManager:self didRescindInvitation:v14];
}

- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4
{
  id v5 = a4;
  id v13 = [v5 context];
  id v6 = [v13 dictionary];
  id v7 = [v6 objectForKeyedSubscript:@"ObjectDataKey"];

  id v8 = (void *)[objc_alloc(self->_messageClass) initWithData:v7];
  id v9 = [HDIDSInvitation alloc];
  id v10 = [v5 uniqueID];

  id v11 = [(HDIDSInvitation *)v9 initWithUUID:v10 fromID:0 codableObject:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained invitationManager:self didAcceptInvitation:v11];
}

- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4
{
  id v5 = a4;
  id v13 = [v5 context];
  id v6 = [v13 dictionary];
  id v7 = [v6 objectForKeyedSubscript:@"ObjectDataKey"];

  id v8 = (void *)[objc_alloc(self->_messageClass) initWithData:v7];
  id v9 = [HDIDSInvitation alloc];
  id v10 = [v5 uniqueID];

  id v11 = [(HDIDSInvitation *)v9 initWithUUID:v10 fromID:0 codableObject:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained invitationManager:self didDeclineInvitation:v11];
}

- (HDIDSInvitationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDIDSInvitationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSInvitationManager)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_IDSDelegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageClass, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end