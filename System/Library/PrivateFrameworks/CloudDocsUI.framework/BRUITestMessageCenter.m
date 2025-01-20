@interface BRUITestMessageCenter
+ (id)defaultCenter;
- (BRUITestMessageCenter)init;
- (id)_init;
- (void)_sendMessageNamed:(id)a3 userInfo:(id)a4 isReply:(BOOL)a5 messageUUID:(id)a6 reply:(id)a7;
- (void)didReceiveMessage:(id)a3;
- (void)sendMessageNamed:(id)a3 userInfo:(id)a4 reply:(id)a5;
- (void)setHandler:(id)a3 forMessageNamed:(id)a4;
- (void)startReceiver;
- (void)startSender;
- (void)stop;
@end

@implementation BRUITestMessageCenter

- (BRUITestMessageCenter)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  uint64_t v5 = objc_opt_class();
  v6 = [NSString stringWithUTF8String:"-[BRUITestMessageCenter init]"];
  v7 = NSStringFromSelector(sel_defaultCenter);
  [v3 raise:v4, @"-[%@ %@] is unavailable, use %@ instead.", v5, v6, v7 format];

  return 0;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)BRUITestMessageCenter;
  v2 = [(BRUITestMessageCenter *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    pendingReplies = v2->_pendingReplies;
    v2->_pendingReplies = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    messageHandlers = v2->_messageHandlers;
    v2->_messageHandlers = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("BRUITestMessageCenter-message-queue", 0);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)defaultCenter
{
  if (defaultCenter_onceToken != -1) {
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)defaultCenter_defaultCenter;

  return v2;
}

uint64_t __38__BRUITestMessageCenter_defaultCenter__block_invoke()
{
  id v0 = [[BRUITestMessageCenter alloc] _init];
  uint64_t v1 = defaultCenter_defaultCenter;
  defaultCenter_defaultCenter = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (void)startSender
{
  self->_isSender = 1;
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 addObserver:self selector:sel_didReceiveMessage_ name:@"_BRUITestMessageReceiver" object:0];
}

- (void)startReceiver
{
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 addObserver:self selector:sel_didReceiveMessage_ name:@"_BRUITestMessageSender" object:0];
}

- (void)stop
{
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)sendMessageNamed:(id)a3 userInfo:(id)a4 reply:(id)a5
{
}

- (void)_sendMessageNamed:(id)a3 userInfo:(id)a4 isReply:(BOOL)a5 messageUUID:(id)a6 reply:(id)a7
{
  BOOL v9 = a5;
  v29[4] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!v14)
  {
    id v14 = [MEMORY[0x263F08C38] UUID];
  }
  v28[0] = @"_kBRUITestMessageUUID";
  v16 = [v14 UUIDString];
  v29[0] = v16;
  v29[1] = v12;
  v25 = v12;
  v28[1] = @"_kBRUITestMessageName";
  v28[2] = @"_kBRUITestMessageIsReply";
  v17 = [NSNumber numberWithBool:v9];
  v29[2] = v17;
  v28[3] = @"_kBRUITestPid";
  v18 = [NSNumber numberWithInt:getpid()];
  v29[3] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
  v20 = (void *)[v19 mutableCopy];

  if (v13) {
    [v20 setObject:v13 forKeyedSubscript:@"_kBRUITestMessagePayload"];
  }
  if (!v9)
  {
    if (v15)
    {
      uint64_t v21 = MEMORY[0x230F72310](v15);
    }
    else
    {
      uint64_t v21 = [MEMORY[0x263EFF9D0] null];
    }
    v22 = (void *)v21;
    [(NSMutableDictionary *)self->_pendingReplies setObject:v21 forKeyedSubscript:v14];
  }
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__BRUITestMessageCenter__sendMessageNamed_userInfo_isReply_messageUUID_reply___block_invoke;
  block[3] = &unk_26492CCC8;
  block[4] = self;
  id v27 = v20;
  id v24 = v20;
  dispatch_async(messageQueue, block);
}

void __78__BRUITestMessageCenter__sendMessageNamed_userInfo_isReply_messageUUID_reply___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F087C8] defaultCenter];
  id v4 = v2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 33)) {
    id v3 = @"_BRUITestMessageSender";
  }
  else {
    id v3 = @"_BRUITestMessageReceiver";
  }
  [v2 postNotificationName:v3 object:0 userInfo:*(void *)(a1 + 40)];
}

- (void)didReceiveMessage:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"_kBRUITestPid"];
  uint64_t v6 = [v5 integerValue];
  pid_t v7 = getpid();

  if (v6 != v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"_kBRUITestMessagePayload"];
    BOOL v9 = [v4 objectForKeyedSubscript:@"_kBRUITestMessageUUID"];
    objc_super v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
    v11 = [v4 objectForKeyedSubscript:@"_kBRUITestMessageIsReply"];
    int v12 = [v11 BOOLValue];

    if (v12)
    {
      id v13 = [(NSMutableDictionary *)self->_pendingReplies objectForKeyedSubscript:v10];
      [(NSMutableDictionary *)self->_pendingReplies setObject:0 forKeyedSubscript:v10];
      id v14 = [MEMORY[0x263EFF9D0] null];
      char v15 = [v13 isEqual:v14];

      if (v15)
      {
LABEL_7:

        goto LABEL_8;
      }
      v16 = (void (**)(id, void *))MEMORY[0x230F72310](v13);
      v16[2](v16, v8);
    }
    else
    {
      v17 = [v4 objectForKeyedSubscript:@"_kBRUITestMessageName"];
      v18 = [(NSMutableDictionary *)self->_messageHandlers objectForKeyedSubscript:v17];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __43__BRUITestMessageCenter_didReceiveMessage___block_invoke;
      block[3] = &unk_26492D680;
      id v20 = v18;
      id v21 = v17;
      id v22 = v8;
      v23 = self;
      id v24 = v10;
      v16 = v17;
      id v13 = v18;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    goto LABEL_7;
  }
LABEL_8:
}

void __43__BRUITestMessageCenter_didReceiveMessage___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__BRUITestMessageCenter_didReceiveMessage___block_invoke_2;
  v5[3] = &unk_26492D658;
  uint64_t v4 = *(void *)(a1 + 48);
  v5[4] = *(void *)(a1 + 56);
  id v6 = v2;
  id v7 = *(id *)(a1 + 64);
  [v3 didReceiveMessageNamed:v6 userInfo:v4 reply:v5];
}

uint64_t __43__BRUITestMessageCenter_didReceiveMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sendMessageNamed:*(void *)(a1 + 40) userInfo:a2 isReply:1 messageUUID:*(void *)(a1 + 48) reply:0];
}

- (void)setHandler:(id)a3 forMessageNamed:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_messageHandlers, 0);

  objc_storeStrong((id *)&self->_pendingReplies, 0);
}

@end