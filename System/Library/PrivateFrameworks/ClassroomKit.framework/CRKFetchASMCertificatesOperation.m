@interface CRKFetchASMCertificatesOperation
- (BOOL)isAsynchronous;
- (CRKCancelable)messageReceiveSubscription;
- (CRKFetchASMCertificatesOperation)initWithIDSPrimitives:(id)a3 addressTranslator:(id)a4 controlGroupIdentifier:(id)a5 destinationAppleID:(id)a6 sourceAppleID:(id)a7 destinationDeviceIdentifier:(id)a8 sourceRole:(int64_t)a9 destinationRole:(int64_t)a10 requesterCertificate:(id)a11;
- (CRKIDSAddressTranslator)addressTranslator;
- (CRKIDSPrimitives)IDSPrimitives;
- (DMFControlGroupIdentifier)controlGroupIdentifier;
- (NSData)requesterCertificate;
- (NSString)destinationAppleID;
- (NSString)destinationDeviceIdentifier;
- (NSString)sourceAppleID;
- (int64_t)destinationRole;
- (int64_t)sourceRole;
- (void)cancel;
- (void)didSendMessage:(id)a3;
- (void)main;
- (void)operationWillFinish;
- (void)processMessage:(id)a3 senderAppleID:(id)a4 requestIdentifier:(id)a5;
- (void)setMessageReceiveSubscription:(id)a3;
@end

@implementation CRKFetchASMCertificatesOperation

- (CRKFetchASMCertificatesOperation)initWithIDSPrimitives:(id)a3 addressTranslator:(id)a4 controlGroupIdentifier:(id)a5 destinationAppleID:(id)a6 sourceAppleID:(id)a7 destinationDeviceIdentifier:(id)a8 sourceRole:(int64_t)a9 destinationRole:(int64_t)a10 requesterCertificate:(id)a11
{
  id v35 = a3;
  id v34 = a4;
  id v33 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a11;
  v36.receiver = self;
  v36.super_class = (Class)CRKFetchASMCertificatesOperation;
  v22 = [(CRKFetchASMCertificatesOperation *)&v36 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_IDSPrimitives, a3);
    objc_storeStrong((id *)&v23->_addressTranslator, a4);
    objc_storeStrong((id *)&v23->_controlGroupIdentifier, a5);
    uint64_t v24 = [v18 copy];
    destinationAppleID = v23->_destinationAppleID;
    v23->_destinationAppleID = (NSString *)v24;

    uint64_t v26 = [v19 copy];
    sourceAppleID = v23->_sourceAppleID;
    v23->_sourceAppleID = (NSString *)v26;

    uint64_t v28 = [v20 copy];
    destinationDeviceIdentifier = v23->_destinationDeviceIdentifier;
    v23->_destinationDeviceIdentifier = (NSString *)v28;

    v23->_sourceRole = a9;
    v23->_destinationRole = a10;
    uint64_t v30 = [v21 copy];
    requesterCertificate = v23->_requesterCertificate;
    v23->_requesterCertificate = (NSData *)v30;
  }
  return v23;
}

- (void)operationWillFinish
{
  id v2 = [(CRKFetchASMCertificatesOperation *)self messageReceiveSubscription];
  [v2 cancel];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRKFetchASMCertificatesOperation;
  [(CRKFetchASMCertificatesOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CRKFetchASMCertificatesOperation_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __42__CRKFetchASMCertificatesOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    id v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 endOperationWithError:v3];
  }
}

- (void)main
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    objc_super v4 = _CRKLogASM_4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138543618;
      v25 = v6;
      __int16 v26 = 2048;
      v27 = self;
      _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Fetching ASM certificate", buf, 0x16u);
    }
    v7 = [(CRKFetchASMCertificatesOperation *)self controlGroupIdentifier];
    v8 = [(CRKFetchASMCertificatesOperation *)self destinationDeviceIdentifier];
    int64_t v9 = [(CRKFetchASMCertificatesOperation *)self sourceRole];
    int64_t v10 = [(CRKFetchASMCertificatesOperation *)self destinationRole];
    v11 = [(CRKFetchASMCertificatesOperation *)self requesterCertificate];
    v12 = +[CRKRequestCertificatesIDSMessage messageWithControlGroupIdentifier:v7 destinationDeviceIdentifier:v8 sourceRole:v9 destinationRole:v10 requesterCertificate:v11];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __40__CRKFetchASMCertificatesOperation_main__block_invoke;
    v22[3] = &unk_2646F3778;
    v22[4] = self;
    id v13 = v12;
    id v23 = v13;
    v14 = (void *)MEMORY[0x22A620AF0](v22);
    v15 = _CRKLogASM_4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543618;
      v25 = v17;
      __int16 v26 = 2048;
      v27 = self;
      _os_log_impl(&dword_224C00000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Preparing to receive response before sending request", buf, 0x16u);
    }
    id v18 = [(CRKFetchASMCertificatesOperation *)self IDSPrimitives];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __40__CRKFetchASMCertificatesOperation_main__block_invoke_5;
    v20[3] = &unk_2646F37C8;
    v20[4] = self;
    id v21 = v13;
    id v19 = v13;
    [v18 subscribeToMessagesWithHandler:v14 completion:v20];
  }
  else
  {
    [(CRKFetchASMCertificatesOperation *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

void __40__CRKFetchASMCertificatesOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_super v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 requestIdentifier];
  [v4 processMessage:v7 senderAppleID:v6 requestIdentifier:v8];
}

void __40__CRKFetchASMCertificatesOperation_main__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__CRKFetchASMCertificatesOperation_main__block_invoke_2;
  v10[3] = &unk_2646F37A0;
  id v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __40__CRKFetchASMCertificatesOperation_main__block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isExecuting])
  {
    if (*(void *)(a1 + 40))
    {
      id v2 = *(void **)(a1 + 32);
      objc_msgSend(v2, "endOperationWithError:");
    }
    else
    {
      id v3 = _CRKLogASM_4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v4 = (objc_class *)objc_opt_class();
        id v5 = NSStringFromClass(v4);
        id v6 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v23 = v5;
        __int16 v24 = 2048;
        v25 = v6;
        _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Ready to receive certificate response", buf, 0x16u);
      }
      [*(id *)(a1 + 32) setMessageReceiveSubscription:*(void *)(a1 + 48)];
      id v7 = [CRKIDSMessageCannon alloc];
      id v8 = [*(id *)(a1 + 32) IDSPrimitives];
      id v9 = [(CRKIDSMessageCannon *)v7 initWithIDSPrimitives:v8];

      int64_t v10 = _CRKLogASM_4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        id v13 = *(void **)(a1 + 32);
        v14 = [v13 destinationAppleID];
        *(_DWORD *)buf = 138543874;
        id v23 = v12;
        __int16 v24 = 2048;
        v25 = v13;
        __int16 v26 = 2114;
        v27 = v14;
        _os_log_impl(&dword_224C00000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Sending cert request to (%{public}@)", buf, 0x20u);
      }
      v15 = [*(id *)(a1 + 32) addressTranslator];
      v16 = [*(id *)(a1 + 32) destinationAppleID];
      v17 = [v15 destinationAddressForAppleID:v16];

      id v18 = objc_opt_new();
      [v18 setFireAndForget:1];
      uint64_t v19 = *(void *)(a1 + 56);
      id v20 = [*(id *)(a1 + 32) sourceAppleID];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __40__CRKFetchASMCertificatesOperation_main__block_invoke_8;
      v21[3] = &unk_2646F3438;
      v21[4] = *(void *)(a1 + 32);
      [(CRKIDSMessageCannon *)v9 sendIDSMessage:v19 destinationAddress:v17 sourceAppleID:v20 options:v18 completion:v21];
    }
  }
}

uint64_t __40__CRKFetchASMCertificatesOperation_main__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didSendMessage:a2];
}

- (void)didSendMessage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CRKFetchASMCertificatesOperation_didSendMessage___block_invoke;
  v6[3] = &unk_2646F37F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __51__CRKFetchASMCertificatesOperation_didSendMessage___block_invoke(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 32);
  uint64_t result = [*(id *)(a1 + 32) isExecuting];
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v4 = (id *)(a1 + 40);
    if (v5)
    {
      id v6 = _CRKLogASM_4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __51__CRKFetchASMCertificatesOperation_didSendMessage___block_invoke_cold_1(v2, v4, v6);
      }

      return [(id)*v2 endOperationWithError:*v4];
    }
  }
  return result;
}

- (void)processMessage:(id)a3 senderAppleID:(id)a4 requestIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__CRKFetchASMCertificatesOperation_processMessage_senderAppleID_requestIdentifier___block_invoke;
  v14[3] = &unk_2646F37A0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __83__CRKFetchASMCertificatesOperation_processMessage_senderAppleID_requestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isExecuting])
  {
    id v2 = _CRKLogASM_4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = (objc_class *)objc_opt_class();
      id v4 = NSStringFromClass(v3);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v26 = 138543874;
      v27 = v4;
      __int16 v28 = 2048;
      uint64_t v29 = v5;
      __int16 v30 = 2114;
      uint64_t v31 = v6;
      _os_log_impl(&dword_224C00000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Processing message response from (%{public}@)", (uint8_t *)&v26, 0x20u);
    }
    id v7 = [*(id *)(a1 + 32) destinationAppleID];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 40)];

    if (v8)
    {
      id v9 = +[CRKIDSMessagePayload instanceWithDictionary:*(void *)(a1 + 48)];
      id v10 = v9;
      if (v9)
      {
        id v11 = [v9 messageMetadata];
        uint64_t v12 = [v11 messageType];

        if (v12 == 2)
        {
          id v13 = [v10 messageContent];
          v14 = +[CRKRequestCertificatesResponseIDSMessage instanceWithDictionary:v13];

          if (v14)
          {
            id v15 = [v14 requestIdentifier];
            int v16 = [v15 isEqual:*(void *)(a1 + 56)];

            if (v16)
            {
              id v17 = [v14 error];

              if (v17)
              {
                id v18 = *(void **)(a1 + 32);
                uint64_t v19 = [v14 error];
                [v18 endOperationWithError:v19];
              }
              else
              {
                id v20 = _CRKLogASM_4();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  id v21 = (objc_class *)objc_opt_class();
                  v22 = NSStringFromClass(v21);
                  uint64_t v23 = *(void *)(a1 + 32);
                  uint64_t v24 = *(void *)(a1 + 40);
                  int v26 = 138543874;
                  v27 = v22;
                  __int16 v28 = 2048;
                  uint64_t v29 = v23;
                  __int16 v30 = 2114;
                  uint64_t v31 = v24;
                  _os_log_impl(&dword_224C00000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Valid cert response from (%{public}@)", (uint8_t *)&v26, 0x20u);
                }
                v25 = *(void **)(a1 + 32);
                uint64_t v19 = [v14 certificateDataCollection];
                [v25 endOperationWithResultObject:v19];
              }
            }
          }
        }
      }
    }
  }
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CRKIDSAddressTranslator)addressTranslator
{
  return self->_addressTranslator;
}

- (DMFControlGroupIdentifier)controlGroupIdentifier
{
  return self->_controlGroupIdentifier;
}

- (NSString)destinationAppleID
{
  return self->_destinationAppleID;
}

- (NSString)sourceAppleID
{
  return self->_sourceAppleID;
}

- (NSString)destinationDeviceIdentifier
{
  return self->_destinationDeviceIdentifier;
}

- (int64_t)sourceRole
{
  return self->_sourceRole;
}

- (int64_t)destinationRole
{
  return self->_destinationRole;
}

- (NSData)requesterCertificate
{
  return self->_requesterCertificate;
}

- (CRKCancelable)messageReceiveSubscription
{
  return self->_messageReceiveSubscription;
}

- (void)setMessageReceiveSubscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageReceiveSubscription, 0);
  objc_storeStrong((id *)&self->_requesterCertificate, 0);
  objc_storeStrong((id *)&self->_destinationDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppleID, 0);
  objc_storeStrong((id *)&self->_destinationAppleID, 0);
  objc_storeStrong((id *)&self->_controlGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_addressTranslator, 0);

  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

void __51__CRKFetchASMCertificatesOperation_didSendMessage___block_invoke_cold_1(uint64_t *a1, id *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = *a1;
  id v9 = [*a2 verboseDescription];
  int v10 = 138543874;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = v8;
  __int16 v14 = 2114;
  id v15 = v9;
  _os_log_error_impl(&dword_224C00000, a3, OS_LOG_TYPE_ERROR, "%{public}@ - %p: Failed to send cert request. Error = %{public}@", (uint8_t *)&v10, 0x20u);
}

@end