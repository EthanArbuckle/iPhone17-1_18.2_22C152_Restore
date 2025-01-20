@interface CARSessionScreenBorrowToken
- (CARSession)session;
- (CARSessionScreenBorrowToken)initWithSession:(id)a3 client:(id)a4 reason:(id)a5;
- (NSString)client;
- (NSString)reason;
- (void)dealloc;
- (void)unborrowToken;
@end

@implementation CARSessionScreenBorrowToken

- (CARSessionScreenBorrowToken)initWithSession:(id)a3 client:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CARSessionScreenBorrowToken;
  v11 = [(CARSessionScreenBorrowToken *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_session, v8);
    objc_storeStrong((id *)&v12->_client, a4);
    objc_storeStrong((id *)&v12->_reason, a5);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__CARSessionScreenBorrowToken_initWithSession_client_reason___block_invoke;
    v14[3] = &unk_1E5E3BF78;
    id v15 = v9;
    id v16 = v10;
    [v8 _performExtendedEndpointAction:v14];
  }
  return v12;
}

uint64_t __61__CARSessionScreenBorrowToken_initWithSession_client_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v8 = *(void *)(VTable + 24);
  uint64_t result = VTable + 24;
  uint64_t v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  if (v10)
  {
    return v10(a2, v3, v4);
  }
  return result;
}

- (void)unborrowToken
{
  uint64_t v3 = [(CARSessionScreenBorrowToken *)self client];
  uint64_t v4 = [(CARSessionScreenBorrowToken *)self reason];
  v5 = [(CARSessionScreenBorrowToken *)self session];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__CARSessionScreenBorrowToken_unborrowToken__block_invoke;
  v8[3] = &unk_1E5E3BF78;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 _performExtendedEndpointAction:v8];
}

uint64_t __44__CARSessionScreenBorrowToken_unborrowToken__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v8 = *(void *)(VTable + 24);
  uint64_t result = VTable + 24;
  uint64_t v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 24);
  if (v10)
  {
    return v10(a2, v3, v4);
  }
  return result;
}

- (void)dealloc
{
  [(CARSessionScreenBorrowToken *)self unborrowToken];
  v3.receiver = self;
  v3.super_class = (Class)CARSessionScreenBorrowToken;
  [(CARSessionScreenBorrowToken *)&v3 dealloc];
}

- (CARSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (CARSession *)WeakRetained;
}

- (NSString)client
{
  return self->_client;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_session);
}

@end