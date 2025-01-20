@interface ASIDSMessageCenter
+ (id)addContext:(id)a3 toInvitation:(id)a4;
- (ASIDSMessageCenter)initWithServiceIdentifier:(id)a3;
- (ASIDSMessageCenterDelegate)delegate;
- (ASIDSMessageCenterSecureCloudDelegate)secureCloudDelegate;
- (NSString)serviceIdentifier;
- (id)_idsIdentifierForDestination:(id)a3;
- (id)_idsIdentifiersForDestinations:(id)a3;
- (id)_messageHandlerForType:(int)a3;
- (void)_dispatchAction:(SEL)a3 invocationBlock:(id)a4;
- (void)_dispatchMessage:(id)a3 handler:(id)a4 messageHandledCompletion:(id)a5;
- (void)_handleErrorForMessage:(id)a3;
- (void)_handleErrorSendingFinalizeHandshake:(id)a3;
- (void)_handleErrorSendingInviteRequest:(id)a3;
- (void)_handleErrorSendingInviteResponse:(id)a3;
- (void)_handleErrorSendingSecureCloudMessage:(id)a3;
- (void)_handleErrorSendingWithdrawInviteRequest:(id)a3;
- (void)_handleFinalizeHandshake:(id)a3 fromSenderAddress:(id)a4 receiverAddress:(id)a5 messageHandledCompletion:(id)a6;
- (void)_handleInviteRequest:(id)a3 fromSenderAddress:(id)a4 receiverAddress:(id)a5 messageHandledCompletion:(id)a6;
- (void)_handleInviteResponse:(id)a3 fromSenderAddress:(id)a4 receiverAddress:(id)a5 messageHandledCompletion:(id)a6;
- (void)_handleMessage:(id)a3 identifier:(id)a4;
- (void)_handleMessageSendSuccess:(BOOL)a3 error:(id)a4 identifier:(id)a5;
- (void)_handleSecureCloudMessage:(id)a3 fromSenderAddress:(id)a4 receiverAddress:(id)a5 messageHandledCompletion:(id)a6;
- (void)_handleWithdrawInviteRequest:(id)a3 fromSenderAddress:(id)a4 receiverAddress:(id)a5 messageHandledCompletion:(id)a6;
- (void)_processMessageQueue:(id)a3 preprocessingBlock:(id)a4;
- (void)_sendMessage:(id)a3 type:(int)a4 destinations:(id)a5 fromAddress:(id)a6 completion:(id)a7;
- (void)_sendPayload:(id)a3 type:(int)a4 destinations:(id)a5 fromAddress:(id)a6 completion:(id)a7;
- (void)beginReceivingMessages;
- (void)dealloc;
- (void)endReceivingMessages;
- (void)processPersistedMessageQueue;
- (void)processRetryMessageQueue;
- (void)sendFinalizeHandshake:(id)a3 toDestinations:(id)a4 completion:(id)a5;
- (void)sendInviteRequest:(id)a3 toDestinations:(id)a4 completion:(id)a5;
- (void)sendInviteResponse:(id)a3 toDestinations:(id)a4 fromAddress:(id)a5 completion:(id)a6;
- (void)sendSecureCloudMessagePayload:(id)a3 type:(int)a4 toDestinations:(id)a5 completion:(id)a6;
- (void)sendWithdrawInviteRequest:(id)a3 toDestinations:(id)a4 completion:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setSecureCloudDelegate:(id)a3;
@end

@implementation ASIDSMessageCenter

- (ASIDSMessageCenter)initWithServiceIdentifier:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ASIDSMessageCenter;
  v6 = [(ASIDSMessageCenter *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceIdentifier, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    outgoingDispatchQueue = v7->_outgoingDispatchQueue;
    v7->_outgoingDispatchQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = HKCreateSerialDispatchQueue();
    incomingDispatchQueue = v7->_incomingDispatchQueue;
    v7->_incomingDispatchQueue = (OS_dispatch_queue *)v10;

    v12 = [ASMessageQueue alloc];
    v13 = [NSString stringWithFormat:@"%@-outgoing", v5];
    uint64_t v14 = [(ASMessageQueue *)v12 initWithQueueName:v13];
    outgoingMessageQueue = v7->_outgoingMessageQueue;
    v7->_outgoingMessageQueue = (ASMessageQueue *)v14;

    v16 = [ASMessageQueue alloc];
    v17 = [NSString stringWithFormat:@"%@-retry", v5];
    uint64_t v18 = [(ASMessageQueue *)v16 initWithQueueName:v17];
    retryMessageQueue = v7->_retryMessageQueue;
    v7->_retryMessageQueue = (ASMessageQueue *)v18;

    v20 = [ASMessageQueue alloc];
    v21 = [NSString stringWithFormat:@"%@-persisted", v5];
    uint64_t v22 = [(ASMessageQueue *)v20 initWithQueueName:v21];
    persistedMessageQueue = v7->_persistedMessageQueue;
    v7->_persistedMessageQueue = (ASMessageQueue *)v22;
  }
  return v7;
}

- (void)dealloc
{
  [(IDSService *)self->_idsService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)ASIDSMessageCenter;
  [(ASIDSMessageCenter *)&v3 dealloc];
}

- (void)beginReceivingMessages
{
  objc_super v3 = (IDSService *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:self->_serviceIdentifier];
  idsService = self->_idsService;
  self->_idsService = v3;

  id v5 = self->_idsService;
  incomingDispatchQueue = self->_incomingDispatchQueue;
  [(IDSService *)v5 addDelegate:self queue:incomingDispatchQueue];
}

- (void)endReceivingMessages
{
  [(IDSService *)self->_idsService removeDelegate:self];
  idsService = self->_idsService;
  self->_idsService = 0;
}

- (void)processRetryMessageQueue
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  objc_super v3 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    serviceIdentifier = self->_serviceIdentifier;
    int v5 = 138543362;
    v6 = serviceIdentifier;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter [%{public}@] processing retry messages", (uint8_t *)&v5, 0xCu);
  }
  [(ASIDSMessageCenter *)self _processMessageQueue:self->_retryMessageQueue preprocessingBlock:&__block_literal_global_13];
}

void __46__ASIDSMessageCenter_processRetryMessageQueue__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_msgSend(v3, "setRetryCount:", objc_msgSend(v3, "retryCount") + 1);
}

- (void)processPersistedMessageQueue
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v3 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    serviceIdentifier = self->_serviceIdentifier;
    int v5 = 138543362;
    v6 = serviceIdentifier;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter [%{public}@] processing persisted messages", (uint8_t *)&v5, 0xCu);
  }
  [(ASIDSMessageCenter *)self _processMessageQueue:self->_persistedMessageQueue preprocessingBlock:0];
}

- (void)sendInviteRequest:(id)a3 toDestinations:(id)a4 completion:(id)a5
{
}

- (void)sendInviteResponse:(id)a3 toDestinations:(id)a4 fromAddress:(id)a5 completion:(id)a6
{
}

- (void)sendFinalizeHandshake:(id)a3 toDestinations:(id)a4 completion:(id)a5
{
}

- (void)sendWithdrawInviteRequest:(id)a3 toDestinations:(id)a4 completion:(id)a5
{
}

- (void)sendSecureCloudMessagePayload:(id)a3 type:(int)a4 toDestinations:(id)a5 completion:(id)a6
{
}

- (id)_messageHandlerForType:(int)a3
{
  if (!v4 & v3)
  {
    if ((a3 - 100) >= 4)
    {
      uint64_t v7 = 0;
      goto LABEL_12;
    }
    uint64_t v7 = objc_alloc_init(ASMessageHandler);
    int v5 = &selRef__handleErrorSendingSecureCloudMessage_;
    v6 = &selRef__handleSecureCloudMessage_fromSenderAddress_receiverAddress_messageHandledCompletion_;
  }
  else
  {
    switch(a3)
    {
      case 1:
        uint64_t v7 = objc_alloc_init(ASMessageHandler);
        [(ASMessageHandler *)v7 setProtobufClass:objc_opt_class()];
        int v5 = &selRef__handleErrorSendingInviteRequest_;
        v6 = &selRef__handleInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion_;
        break;
      case 2:
        uint64_t v7 = objc_alloc_init(ASMessageHandler);
        [(ASMessageHandler *)v7 setProtobufClass:objc_opt_class()];
        int v5 = &selRef__handleErrorSendingInviteResponse_;
        v6 = &selRef__handleInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion_;
        break;
      case 3:
        uint64_t v7 = objc_alloc_init(ASMessageHandler);
        [(ASMessageHandler *)v7 setProtobufClass:objc_opt_class()];
        int v5 = &selRef__handleErrorSendingFinalizeHandshake_;
        v6 = &selRef__handleFinalizeHandshake_fromSenderAddress_receiverAddress_messageHandledCompletion_;
        break;
      case 4:
        uint64_t v7 = objc_alloc_init(ASMessageHandler);
        [(ASMessageHandler *)v7 setProtobufClass:objc_opt_class()];
        int v5 = &selRef__handleErrorSendingWithdrawInviteRequest_;
        v6 = &selRef__handleWithdrawInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion_;
        break;
      default:
        JUMPOUT(0);
    }
  }
  [(ASMessageHandler *)v7 setHandleReceiveMessageAction:*v6];
  [(ASMessageHandler *)v7 setHandleErrorSendingMessageAction:*v5];
LABEL_12:
  return v7;
}

- (void)_handleInviteRequest:(id)a3 fromSenderAddress:(id)a4 receiverAddress:(id)a5 messageHandledCompletion:(id)a6
{
  p_delegate = &self->_delegate;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained messageCenter:self didReceiveInviteRequest:v14 fromSenderAddress:v13 receiverAddress:v12 messageHandledCompletion:v11];
}

- (void)_handleInviteResponse:(id)a3 fromSenderAddress:(id)a4 receiverAddress:(id)a5 messageHandledCompletion:(id)a6
{
  p_delegate = &self->_delegate;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained messageCenter:self didReceiveInviteResponse:v14 fromSenderAddress:v13 receiverAddress:v12 messageHandledCompletion:v11];
}

- (void)_handleFinalizeHandshake:(id)a3 fromSenderAddress:(id)a4 receiverAddress:(id)a5 messageHandledCompletion:(id)a6
{
  p_delegate = &self->_delegate;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained messageCenter:self didReceiveFinalizeHandshake:v14 fromSenderAddress:v13 receiverAddress:v12 messageHandledCompletion:v11];
}

- (void)_handleWithdrawInviteRequest:(id)a3 fromSenderAddress:(id)a4 receiverAddress:(id)a5 messageHandledCompletion:(id)a6
{
  p_delegate = &self->_delegate;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained messageCenter:self didReceiveWithdrawInviteRequest:v14 fromSenderAddress:v13 receiverAddress:v12 messageHandledCompletion:v11];
}

- (void)_handleSecureCloudMessage:(id)a3 fromSenderAddress:(id)a4 receiverAddress:(id)a5 messageHandledCompletion:(id)a6
{
  p_secureCloudDelegate = &self->_secureCloudDelegate;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_secureCloudDelegate);
  id v13 = [v12 payload];
  uint64_t v14 = [v12 type];

  [WeakRetained messageCenter:self didReceivePayload:v13 type:v14 fromSenderAddress:v11 messageHandledCompletion:v10];
}

- (void)_handleMessage:(id)a3 identifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_incomingDispatchQueue);
  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __48__ASIDSMessageCenter__handleMessage_identifier___block_invoke;
  uint64_t v18 = &unk_265217360;
  objc_copyWeak(&v21, &location);
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  id v10 = (void (**)(void, void))MEMORY[0x24C557E50](&v15);
  id v11 = -[ASIDSMessageCenter _messageHandlerForType:](self, "_messageHandlerForType:", objc_msgSend(v8, "type", v15, v16, v17, v18));
  if (v11)
  {
    [(ASIDSMessageCenter *)self _dispatchMessage:v8 handler:v11 messageHandledCompletion:v10];
  }
  else
  {
    id v12 = NSStringFromASMessageType([v8 type]);
    ASLoggingInitialize();
    id v13 = (id)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v8 senderAddress];
      *(_DWORD *)buf = 138543874;
      v24 = v12;
      __int16 v25 = 2114;
      id v26 = v9;
      __int16 v27 = 2112;
      v28 = v14;
      _os_log_error_impl(&dword_2474C9000, v13, OS_LOG_TYPE_ERROR, "IDSMessageCenter ignoring protobuf with unknown type %{public}@, guid: %{public}@, from: %@", buf, 0x20u);
    }
    v10[2](v10, 0);
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __48__ASIDSMessageCenter__handleMessage_identifier___block_invoke(id *a1, uint64_t a2)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[3];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__ASIDSMessageCenter__handleMessage_identifier___block_invoke_2;
    v7[3] = &unk_265216D98;
    uint64_t v10 = a2;
    v7[4] = WeakRetained;
    id v8 = a1[4];
    id v9 = a1[5];
    dispatch_async(v6, v7);
  }
}

void __48__ASIDSMessageCenter__handleMessage_identifier___block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[7];
  if (v2 != 2)
  {
    if (v2 != 1)
    {
      if (!v2)
      {
        ASLoggingInitialize();
        char v3 = *MEMORY[0x263F23AE0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter message handled successfully", (uint8_t *)&v12, 2u);
        }
      }
      return;
    }
    ASLoggingInitialize();
    uint64_t v10 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter persisting message for later use", (uint8_t *)&v12, 2u);
    }
    uint64_t v8 = a1[5];
    id v9 = *(void **)(a1[4] + 48);
LABEL_13:
    [v9 setMessage:v8 identifier:a1[6]];
    return;
  }
  ASLoggingInitialize();
  char v4 = (os_log_t *)MEMORY[0x263F23AE0];
  int v5 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)a1[5];
    id v7 = v5;
    int v12 = 134217984;
    uint64_t v13 = [v6 retryCount];
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter message needs retry, current count is %ld", (uint8_t *)&v12, 0xCu);
  }
  if ([(id)a1[5] retryCount] <= 9)
  {
    uint64_t v8 = a1[5];
    id v9 = *(void **)(a1[4] + 40);
    goto LABEL_13;
  }
  ASLoggingInitialize();
  id v11 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
    __48__ASIDSMessageCenter__handleMessage_identifier___block_invoke_2_cold_1(v11);
  }
}

- (void)_dispatchMessage:(id)a3 handler:(id)a4 messageHandledCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 protobufClass])
  {
    id v11 = objc_alloc((Class)[v9 protobufClass]);
    int v12 = [v8 payload];
    uint64_t v13 = (void *)[v11 initWithData:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [v9 handleReceiveMessageAction];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__ASIDSMessageCenter__dispatchMessage_handler_messageHandledCompletion___block_invoke;
  v18[3] = &unk_265217388;
  id v19 = v13;
  id v20 = v8;
  id v22 = v10;
  uint64_t v23 = v14;
  id v21 = self;
  id v15 = v10;
  id v16 = v8;
  id v17 = v13;
  [(ASIDSMessageCenter *)self _dispatchAction:v14 invocationBlock:v18];
}

void __72__ASIDSMessageCenter__dispatchMessage_handler_messageHandledCompletion___block_invoke(uint64_t a1, void (*a2)(uint64_t, uint64_t, id, id, void *, void *))
{
  char v4 = *(void **)(a1 + 32);
  if (!v4) {
    char v4 = *(void **)(a1 + 40);
  }
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v4;
  id v11 = [v7 senderAddress];
  id v9 = [*(id *)(a1 + 40) receiverAddress];
  id v10 = (void *)MEMORY[0x24C557E50](*(void *)(a1 + 56));
  a2(v6, v5, v8, v11, v9, v10);
}

- (void)_handleErrorSendingInviteRequest:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 messageCenter:self errorSendingInviteRequest:v7];
  }
}

- (void)_handleErrorSendingInviteResponse:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 messageCenter:self errorSendingInviteResponse:v7];
  }
}

- (void)_handleErrorSendingFinalizeHandshake:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 messageCenter:self errorSendingFinalizeHandshake:v7];
  }
}

- (void)_handleErrorSendingWithdrawInviteRequest:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 messageCenter:self errorSendingWithdrawInviteRequest:v7];
  }
}

- (void)_handleErrorSendingSecureCloudMessage:(id)a3
{
  id v3 = a3;
  ASLoggingInitialize();
  char v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
    -[ASIDSMessageCenter _handleErrorSendingSecureCloudMessage:](v4, v3);
  }
}

- (void)_handleErrorForMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_outgoingDispatchQueue);
  char v5 = -[ASIDSMessageCenter _messageHandlerForType:](self, "_messageHandlerForType:", [v4 type]);
  id v6 = v5;
  if (v5)
  {
    id v7 = objc_alloc((Class)[v5 protobufClass]);
    id v8 = [v4 payload];
    id v9 = (void *)[v7 initWithData:v8];

    uint64_t v10 = [v6 handleErrorSendingMessageAction];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__ASIDSMessageCenter__handleErrorForMessage___block_invoke;
    v12[3] = &unk_2652173B0;
    id v13 = v9;
    id v14 = v4;
    id v15 = self;
    uint64_t v16 = v10;
    id v11 = v9;
    [(ASIDSMessageCenter *)self _dispatchAction:v10 invocationBlock:v12];
  }
}

uint64_t __45__ASIDSMessageCenter__handleErrorForMessage___block_invoke(void *a1, uint64_t (*a2)(void, void, uint64_t))
{
  uint64_t v2 = a1[4];
  if (!v2) {
    uint64_t v2 = a1[5];
  }
  return a2(a1[6], a1[7], v2);
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = [v12 context];
  id v14 = [v13 outgoingResponseIdentifier];

  id v15 = objc_alloc_init(ASMessage);
  uint64_t v16 = (void *)IDSCopyRawAddressForDestination();

  [(ASMessage *)v15 setSenderAddress:v16];
  id v17 = [v10 toID];

  uint64_t v18 = (void *)IDSCopyRawAddressForDestination();
  [(ASMessage *)v15 setReceiverAddress:v18];

  -[ASMessage setType:](v15, "setType:", [v12 type]);
  id v19 = [v12 data];
  [(ASMessage *)v15 setPayload:v19];

  uint64_t v20 = [v12 type];
  id v21 = NSStringFromASMessageType(v20);
  ASLoggingInitialize();
  id v22 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = v22;
    v24 = [(ASMessage *)v15 senderAddress];
    int v25 = 138543874;
    id v26 = v21;
    __int16 v27 = 2114;
    v28 = v14;
    __int16 v29 = 2112;
    v30 = v24;
    _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter received protobuf of type %{public}@, guid: %{public}@, from: %@", (uint8_t *)&v25, 0x20u);
  }
  [(ASIDSMessageCenter *)self _handleMessage:v15 identifier:v14];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a7;
  ASLoggingInitialize();
  id v12 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543874;
    id v14 = v10;
    __int16 v15 = 1024;
    BOOL v16 = v8;
    __int16 v17 = 2114;
    id v18 = v11;
    _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter sent protobuf with guid %{public}@ to server with success: %d error: %{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  [(ASIDSMessageCenter *)self _handleMessageSendSuccess:v8 error:v11 identifier:v10];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v7 = a5;
  ASLoggingInitialize();
  BOOL v8 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter successfully delivered protobuf with guid %{public}@ to remote device", (uint8_t *)&v9, 0xCu);
  }
  [(ASIDSMessageCenter *)self _handleMessageSendSuccess:1 error:0 identifier:v7];
}

- (void)_handleMessageSendSuccess:(BOOL)a3 error:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  outgoingDispatchQueue = self->_outgoingDispatchQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__ASIDSMessageCenter__handleMessageSendSuccess_error_identifier___block_invoke;
  v13[3] = &unk_2652173D8;
  v13[4] = self;
  id v14 = v9;
  BOOL v16 = a3;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(outgoingDispatchQueue, v13);
}

void __65__ASIDSMessageCenter__handleMessageSendSuccess_error_identifier___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) messageWithIdentifier:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    id v4 = NSStringFromASMessageType([v2 type]);
    if (*(unsigned char *)(a1 + 56) && !*(void *)(a1 + 48))
    {
      ASLoggingInitialize();
      id v7 = *MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        BOOL v16 = v4;
        __int16 v17 = 2114;
        uint64_t v18 = v8;
        _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter success sending protobuf with type %{public}@, guid %{public}@", buf, 0x16u);
      }
    }
    else
    {
      ASLoggingInitialize();
      char v5 = *MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        BOOL v16 = v4;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        __int16 v19 = 2114;
        uint64_t v20 = v10;
        _os_log_error_impl(&dword_2474C9000, v5, OS_LOG_TYPE_ERROR, "IDSMessageCenter error sending protobuf with type %{public}@, guid %{public}@, error: %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 32) _handleErrorForMessage:v3];
    }
    [*(id *)(*(void *)(a1 + 32) + 32) removeMessageWithIdentifier:*(void *)(a1 + 40)];
    id v6 = [v3 ephemeralCompletionBlock];

    if (v6)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__ASIDSMessageCenter__handleMessageSendSuccess_error_identifier___block_invoke_84;
      block[3] = &unk_265216D20;
      id v12 = v3;
      char v14 = *(unsigned char *)(a1 + 56);
      id v13 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __65__ASIDSMessageCenter__handleMessageSendSuccess_error_identifier___block_invoke_84(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ephemeralCompletionBlock];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)_sendMessage:(id)a3 type:(int)a4 destinations:(id)a5 fromAddress:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = [a3 data];
  [(ASIDSMessageCenter *)self _sendPayload:v15 type:v9 destinations:v14 fromAddress:v13 completion:v12];
}

- (void)_sendPayload:(id)a3 type:(int)a4 destinations:(id)a5 fromAddress:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  outgoingDispatchQueue = self->_outgoingDispatchQueue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __76__ASIDSMessageCenter__sendPayload_type_destinations_fromAddress_completion___block_invoke;
  v21[3] = &unk_265217400;
  int v27 = a4;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  int v25 = self;
  id v26 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  dispatch_async(outgoingDispatchQueue, v21);
}

void __76__ASIDSMessageCenter__sendPayload_type_destinations_fromAddress_completion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = NSStringFromASMessageType(*(unsigned int *)(a1 + 72));
  ASLoggingInitialize();
  id v3 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    __int16 v29 = v2;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter requesting send for protobuf of type %{public}@ to destinations: %@", buf, 0x16u);
  }
  char v5 = (void *)[objc_alloc(MEMORY[0x263F4A228]) initWithProtobufData:*(void *)(a1 + 40) type:*(unsigned __int16 *)(a1 + 72) isResponse:0];
  v26[0] = *MEMORY[0x263F49F80];
  id v6 = [NSNumber numberWithDouble:*MEMORY[0x263F4A150]];
  v26[1] = *MEMORY[0x263F49F90];
  v27[0] = v6;
  v27[1] = MEMORY[0x263EFFA88];
  id v7 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if (*(void *)(a1 + 48))
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 56), "_idsIdentifierForDestination:");
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F49F10]];
  }
  uint64_t v10 = [*(id *)(a1 + 56) _idsIdentifiersForDestinations:*(void *)(a1 + 32)];
  id v11 = *(void **)(*(void *)(a1 + 56) + 8);
  id v24 = 0;
  id v25 = 0;
  int v12 = [v11 sendProtobuf:v5 toDestinations:v10 priority:300 options:v8 identifier:&v25 error:&v24];
  id v13 = v25;
  id v14 = v24;
  id v15 = objc_alloc_init(ASMessage);
  [(ASMessage *)v15 setType:*(unsigned int *)(a1 + 72)];
  [(ASMessage *)v15 setPayload:*(void *)(a1 + 40)];
  BOOL v16 = (void *)[*(id *)(a1 + 64) copy];
  [(ASMessage *)v15 setEphemeralCompletionBlock:v16];

  if (!v12 || v14)
  {
    ASLoggingInitialize();
    id v18 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __76__ASIDSMessageCenter__sendPayload_type_destinations_fromAddress_completion___block_invoke_cold_1((uint64_t)v2, (uint64_t)v14, v18);
    }
    [*(id *)(a1 + 56) _handleErrorForMessage:v15];
    id v19 = [(ASMessage *)v15 ephemeralCompletionBlock];

    if (v19)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__ASIDSMessageCenter__sendPayload_type_destinations_fromAddress_completion___block_invoke_88;
      block[3] = &unk_265216D20;
      uint64_t v21 = v15;
      char v23 = v12;
      id v22 = v14;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 56) + 32) setMessage:v15 identifier:v13];
    ASLoggingInitialize();
    id v17 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v2;
      __int16 v30 = 2114;
      id v31 = v13;
      _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter successfully requested send for protobuf of type %{public}@, guid: %{public}@", buf, 0x16u);
    }
  }
}

void __76__ASIDSMessageCenter__sendPayload_type_destinations_fromAddress_completion___block_invoke_88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ephemeralCompletionBlock];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)_dispatchAction:(SEL)a3 invocationBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ASIDSMessageCenter *)self methodForSelector:a3];
  if (v7)
  {
    uint64_t v8 = v7;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__ASIDSMessageCenter__dispatchAction_invocationBlock___block_invoke;
    v9[3] = &unk_265217428;
    id v10 = v6;
    uint64_t v11 = v8;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

uint64_t __54__ASIDSMessageCenter__dispatchAction_invocationBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_processMessageQueue:(id)a3 preprocessingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  incomingDispatchQueue = self->_incomingDispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ASIDSMessageCenter__processMessageQueue_preprocessingBlock___block_invoke;
  block[3] = &unk_265217478;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(incomingDispatchQueue, block);
}

void __62__ASIDSMessageCenter__processMessageQueue_preprocessingBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__ASIDSMessageCenter__processMessageQueue_preprocessingBlock___block_invoke_2;
  v5[3] = &unk_265217450;
  id v8 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateQueuedMessagesUsingBlock:v5];
}

void __62__ASIDSMessageCenter__processMessageQueue_preprocessingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  ASLoggingInitialize();
  uint64_t v7 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = NSStringFromASMessageType([v6 type]);
    id v10 = [v6 senderAddress];
    int v12 = 138543874;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "IDSMessageCenter redelivering protobuf of type %{public}@, guid: %{public}@, from: %@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
  [*(id *)(a1 + 32) removeMessageWithIdentifier:v5];
  [*(id *)(a1 + 40) _handleMessage:v6 identifier:v5];
}

- (id)_idsIdentifierForDestination:(id)a3
{
  id v3 = a3;
  if (([v3 containsString:@"tel:"] & 1) != 0
    || [v3 containsString:@"mailto:"])
  {
    id v4 = v3;
LABEL_4:
    id v5 = v4;
    goto LABEL_5;
  }
  if ([v3 containsString:@"@"])
  {
    id v4 = (id)MEMORY[0x24C5578B0](v3);
    goto LABEL_4;
  }
  uint64_t v7 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  uint64_t v8 = [v3 rangeOfCharacterFromSet:v7];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = (id)IDSCopyIDForPhoneNumber();
    goto LABEL_4;
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

- (id)_idsIdentifiersForDestinations:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[ASIDSMessageCenter _idsIdentifierForDestination:](self, "_idsIdentifierForDestination:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  int v12 = [MEMORY[0x263EFFA08] setWithSet:v5];

  return v12;
}

+ (id)addContext:(id)a3 toInvitation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    [v6 setContext:v5];
  }
  else
  {
    ASLoggingInitialize();
    uint64_t v7 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      +[ASIDSMessageCenter addContext:toInvitation:]((uint64_t)v6, v7);
    }
  }

  return v6;
}

- (ASIDSMessageCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASIDSMessageCenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (ASIDSMessageCenterSecureCloudDelegate)secureCloudDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
  return (ASIDSMessageCenterSecureCloudDelegate *)WeakRetained;
}

- (void)setSecureCloudDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_secureCloudDelegate);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_persistedMessageQueue, 0);
  objc_storeStrong((id *)&self->_retryMessageQueue, 0);
  objc_storeStrong((id *)&self->_outgoingMessageQueue, 0);
  objc_storeStrong((id *)&self->_incomingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_outgoingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

void __48__ASIDSMessageCenter__handleMessage_identifier___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "IDSMessageCenter message has been retried too many times, discarding", v1, 2u);
}

- (void)_handleErrorSendingSecureCloudMessage:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = NSStringFromASMessageType([a2 type]);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_2474C9000, v3, OS_LOG_TYPE_ERROR, "Error sending secure cloud message of type: %@", (uint8_t *)&v5, 0xCu);
}

void __76__ASIDSMessageCenter__sendPayload_type_destinations_fromAddress_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "IDSMessageCenter error requesting send for protobuf of type %{public}@, error: %{public}@", (uint8_t *)&v3, 0x16u);
}

+ (void)addContext:(uint64_t)a1 toInvitation:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2474C9000, a2, OS_LOG_TYPE_ERROR, "IDSMessageCenter failed to set context on invitation %@", (uint8_t *)&v2, 0xCu);
}

@end