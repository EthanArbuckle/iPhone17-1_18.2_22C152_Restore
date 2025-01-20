@interface CRKIDSSendMessageOperation
- (BOOL)isAsynchronous;
- (CRKCancelable)messageSendSubscription;
- (CRKIDSLocalPrimitives)IDSLocalPrimitives;
- (CRKIDSMessageOptions)options;
- (CRKIDSSendMessageOperation)initWithIDSLocalPrimitives:(id)a3 message:(id)a4 destinationAddress:(id)a5 sourceAppleID:(id)a6 options:(id)a7;
- (NSDate)initialSendDate;
- (NSDictionary)message;
- (NSString)destinationAddress;
- (NSString)messageSendIdentifier;
- (NSString)sourceAppleID;
- (void)cancel;
- (void)didSendMessageWithIdentifier:(id)a3 sendSuccess:(BOOL)a4 error:(id)a5;
- (void)main;
- (void)setInitialSendDate:(id)a3;
- (void)setMessageSendIdentifier:(id)a3;
- (void)setMessageSendSubscription:(id)a3;
@end

@implementation CRKIDSSendMessageOperation

- (CRKIDSSendMessageOperation)initWithIDSLocalPrimitives:(id)a3 message:(id)a4 destinationAddress:(id)a5 sourceAppleID:(id)a6 options:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)CRKIDSSendMessageOperation;
  v18 = [(CRKIDSSendMessageOperation *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_IDSLocalPrimitives, a3);
    uint64_t v20 = [v14 copy];
    message = v19->_message;
    v19->_message = (NSDictionary *)v20;

    uint64_t v22 = [v15 copy];
    destinationAddress = v19->_destinationAddress;
    v19->_destinationAddress = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    sourceAppleID = v19->_sourceAppleID;
    v19->_sourceAppleID = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    options = v19->_options;
    v19->_options = (CRKIDSMessageOptions *)v26;
  }
  return v19;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = _CRKLogASM_3();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    __int16 v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Canceled", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)CRKIDSSendMessageOperation;
  [(CRKIDSSendMessageOperation *)&v7 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CRKIDSSendMessageOperation_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __36__CRKIDSSendMessageOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = [*(id *)(a1 + 32) messageSendSubscription];
    [v2 cancel];

    v3 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 endOperationWithError:v4];
  }
}

- (void)main
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v4 = _CRKLogASM_3();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138543618;
      id v30 = v6;
      __int16 v31 = 2048;
      v32 = self;
      _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Creating listener validate message send success", buf, 0x16u);
    }
    objc_initWeak(&location, self);
    objc_super v7 = [(CRKIDSSendMessageOperation *)self IDSLocalPrimitives];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __34__CRKIDSSendMessageOperation_main__block_invoke;
    v26[3] = &unk_2646F3700;
    objc_copyWeak(&v27, &location);
    v8 = [v7 subscribeToMessageSendsWithHandler:v26];
    [(CRKIDSSendMessageOperation *)self setMessageSendSubscription:v8];

    v9 = [(CRKIDSSendMessageOperation *)self messageSendSubscription];
    [v9 resume];

    __int16 v10 = [(CRKIDSSendMessageOperation *)self IDSLocalPrimitives];
    v11 = [(CRKIDSSendMessageOperation *)self message];
    uint64_t v12 = [(CRKIDSSendMessageOperation *)self destinationAddress];
    id v13 = [(CRKIDSSendMessageOperation *)self sourceAppleID];
    id v14 = [(CRKIDSSendMessageOperation *)self options];
    id v24 = 0;
    id v25 = 0;
    char v15 = [v10 sendMessage:v11 toAddress:v12 fromID:v13 options:v14 identifier:&v25 error:&v24];
    id v16 = v25;
    id v17 = v24;

    if (v15)
    {
      v18 = _CRKLogASM_3();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = [(CRKIDSSendMessageOperation *)self destinationAddress];
        *(_DWORD *)buf = 138544130;
        id v30 = v20;
        __int16 v31 = 2048;
        v32 = self;
        __int16 v33 = 2114;
        v34 = v21;
        __int16 v35 = 2114;
        id v36 = v16;
        _os_log_impl(&dword_224C00000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Sent message to %{public}@ and received identifier %{public}@", buf, 0x2Au);
      }
      [(CRKIDSSendMessageOperation *)self setMessageSendIdentifier:v16];
      uint64_t v22 = objc_opt_new();
      [(CRKIDSSendMessageOperation *)self setInitialSendDate:v22];
    }
    else
    {
      v23 = [(CRKIDSSendMessageOperation *)self messageSendSubscription];
      [v23 cancel];

      [(CRKIDSSendMessageOperation *)self endOperationWithError:v17];
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    [(CRKIDSSendMessageOperation *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

void __34__CRKIDSSendMessageOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained didSendMessageWithIdentifier:v8 sendSuccess:a3 error:v7];
}

- (void)didSendMessageWithIdentifier:(id)a3 sendSuccess:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__CRKIDSSendMessageOperation_didSendMessageWithIdentifier_sendSuccess_error___block_invoke;
  v12[3] = &unk_2646F3728;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __77__CRKIDSSendMessageOperation_didSendMessageWithIdentifier_sendSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = [*(id *)(a1 + 32) messageSendIdentifier];
    int v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

    if (v3)
    {
      id v4 = objc_opt_new();
      v5 = [*(id *)(a1 + 32) initialSendDate];
      [v4 timeIntervalSinceDate:v5];
      uint64_t v7 = v6;

      id v8 = _CRKLogASM_3();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        id v13 = [v11 destinationAddress];
        if (*(unsigned char *)(a1 + 56)) {
          id v14 = @"YES";
        }
        else {
          id v14 = @"NO";
        }
        BOOL v15 = v14;
        int v17 = 138544642;
        v18 = v10;
        __int16 v19 = 2048;
        id v20 = v11;
        __int16 v21 = 2114;
        uint64_t v22 = v12;
        __int16 v23 = 2114;
        id v24 = v13;
        __int16 v25 = 2114;
        uint64_t v26 = v15;
        __int16 v27 = 2048;
        uint64_t v28 = v7;
        _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Received message send status for message %{public}@ to %{public}@. Did succeed = %{public}@, duration = %.2f", (uint8_t *)&v17, 0x3Eu);
      }
      id v16 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 56)) {
        [v16 endOperationWithResultObject:0];
      }
      else {
        [v16 endOperationWithError:*(void *)(a1 + 48)];
      }
    }
  }
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  return self->_IDSLocalPrimitives;
}

- (NSDictionary)message
{
  return self->_message;
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (NSString)sourceAppleID
{
  return self->_sourceAppleID;
}

- (CRKIDSMessageOptions)options
{
  return self->_options;
}

- (CRKCancelable)messageSendSubscription
{
  return self->_messageSendSubscription;
}

- (void)setMessageSendSubscription:(id)a3
{
}

- (NSString)messageSendIdentifier
{
  return self->_messageSendIdentifier;
}

- (void)setMessageSendIdentifier:(id)a3
{
}

- (NSDate)initialSendDate
{
  return self->_initialSendDate;
}

- (void)setInitialSendDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSendDate, 0);
  objc_storeStrong((id *)&self->_messageSendIdentifier, 0);
  objc_storeStrong((id *)&self->_messageSendSubscription, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sourceAppleID, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_IDSLocalPrimitives, 0);
}

@end