@interface DTAssetResponseBroker
+ (id)sharedBroker;
- (BOOL)canContinueServingRequestWithIdentifier:(id)a3;
- (DTAssetResponseBroker)init;
- (NSMutableDictionary)activeHandlers;
- (OS_dispatch_queue)activeHandlersQueue;
- (id)activeHandlerWithIdentifier:(id)a3;
- (void)forwardMessage:(id)a3;
- (void)registerHandler:(id)a3;
- (void)setActiveHandlers:(id)a3;
- (void)setActiveHandlersQueue:(id)a3;
- (void)unregisterHandler:(id)a3;
@end

@implementation DTAssetResponseBroker

- (DTAssetResponseBroker)init
{
  v6.receiver = self;
  v6.super_class = (Class)DTAssetResponseBroker;
  v2 = [(DTAssetResponseBroker *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(DTAssetResponseBroker *)v2 setActiveHandlers:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dt.DTAssetResponseBroker", MEMORY[0x263EF83A8]);
    [(DTAssetResponseBroker *)v2 setActiveHandlersQueue:v4];
  }
  return v2;
}

+ (id)sharedBroker
{
  if (qword_2687080A0 != -1) {
    dispatch_once(&qword_2687080A0, &unk_26E515828);
  }
  v2 = (void *)qword_268708098;
  return v2;
}

- (id)activeHandlerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_2308F7E90;
  v16 = sub_2308F7EA0;
  id v17 = 0;
  v5 = [(DTAssetResponseBroker *)self activeHandlersQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308F7EA8;
  block[3] = &unk_264B8DE80;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)forwardMessage:(id)a3
{
  id v11 = a3;
  id v4 = [MEMORY[0x263EFFA08] setWithObjects:objc_opt_class(), 0];
  v5 = [v11 error];

  if (v5)
  {
    id v6 = [v11 error];
    id v7 = [v6 userInfo];
    v8 = [v7 objectForKeyedSubscript:@"RequestIdentifier"];
  }
  else
  {
    v8 = [v11 objectWithAllowedClasses:v4];

    if (!v8) {
      goto LABEL_8;
    }
    id v6 = [v11 objectWithAllowedClasses:v4];
    v8 = [v6 identifier];
  }

  if (v8)
  {
    v9 = [(DTAssetResponseBroker *)self activeHandlerWithIdentifier:v8];
    if (v9)
    {
      id v10 = v9;
      [v9 receivedMessage:v11];
      goto LABEL_9;
    }
  }
LABEL_8:
  id v10 = [v11 description];
  syslog(3, "ODR: Got message not meant for any active handler: %s", (const char *)[v10 UTF8String]);
LABEL_9:
}

- (BOOL)canContinueServingRequestWithIdentifier:(id)a3
{
  v3 = [(DTAssetResponseBroker *)self activeHandlerWithIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)registerHandler:(id)a3
{
  id v4 = a3;
  v5 = [(DTAssetResponseBroker *)self activeHandlersQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308F816C;
  v7[3] = &unk_264B8DA70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

- (void)unregisterHandler:(id)a3
{
  id v4 = a3;
  v5 = [(DTAssetResponseBroker *)self activeHandlersQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308F82E8;
  v7[3] = &unk_264B8DA70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

- (NSMutableDictionary)activeHandlers
{
  return self->_activeHandlers;
}

- (void)setActiveHandlers:(id)a3
{
}

- (OS_dispatch_queue)activeHandlersQueue
{
  return self->_activeHandlersQueue;
}

- (void)setActiveHandlersQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeHandlersQueue, 0);
  objc_storeStrong((id *)&self->_activeHandlers, 0);
}

@end