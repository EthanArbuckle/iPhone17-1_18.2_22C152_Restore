@interface DTTapRemote
- (DTTapMessageHandler)messageHandler;
- (DTTapRemote)initWithConfig:(id)a3 memoHandler:(id)a4 messageHandler:(id)a5 connection:(id)a6;
- (id)_fetchDataForReason:(unint64_t)a3;
- (void)_pause;
- (void)_start;
- (void)_stop;
- (void)_unpause;
- (void)messageReceived:(id)a3;
@end

@implementation DTTapRemote

- (DTTapRemote)initWithConfig:(id)a3 memoHandler:(id)a4 messageHandler:(id)a5 connection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)DTTapRemote;
  v14 = [(DTTap *)&v34 initWithConfig:v10 memoHandler:v11];
  v15 = v14;
  if (v14)
  {
    if (!v12) {
      sub_23093DC4C();
    }
    objc_storeStrong((id *)&v14->_messageHandler, a5);
    objc_storeStrong((id *)&v15->_connection, a6);
    v15->_connectionEnabled = 1;
    objc_initWeak(&location, v15);
    v16 = [v10 serviceName];
    uint64_t v17 = [v13 makeChannelWithIdentifier:v16];
    channel = v15->_channel;
    v15->_channel = (DTXChannel *)v17;

    v19 = v15->_channel;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_2308DBD60;
    v31[3] = &unk_264B8F7B8;
    objc_copyWeak(&v32, &location);
    [(DTXChannel *)v19 setMessageHandler:v31];
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    char v30 = 1;
    v20 = [(DTTap *)v15 config];
    v21 = [v20 plist];

    v22 = [MEMORY[0x263F38CA0] messageWithSelector:sel_setConfig_ objectArguments:v21];
    v23 = v15->_channel;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_2308DBE58;
    v28[3] = &unk_264B8E340;
    v28[4] = v29;
    [(DTXChannel *)v23 sendMessageSync:v22 replyHandler:v28];

    v24 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v25 = dispatch_queue_create("DTTapRemote unprocessed message queue", v24);
    unprocessedMessageQueue = v15->_unprocessedMessageQueue;
    v15->_unprocessedMessageQueue = (OS_dispatch_queue *)v25;

    _Block_object_dispose(v29, 8);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)messageReceived:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    unprocessedMessageQueue = self->_unprocessedMessageQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_2308DBF98;
    v7[3] = &unk_264B8DA70;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(unprocessedMessageQueue, v7);
  }
}

- (void)_start
{
  if (self->_channel)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    char v7 = 1;
    v3 = [MEMORY[0x263F38CA0] messageWithSelector:sel_start objectArguments:0];
    channel = self->_channel;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2308DC15C;
    v5[3] = &unk_264B8E340;
    v5[4] = v6;
    [(DTXChannel *)channel sendMessageSync:v3 replyHandler:v5];

    _Block_object_dispose(v6, 8);
  }
}

- (void)_stop
{
  if (self->_connectionEnabled)
  {
    if (!self->_channel) {
      return;
    }
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    char v7 = 1;
    v3 = [MEMORY[0x263F38CA0] messageWithSelector:sel_stop objectArguments:0];
    channel = self->_channel;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2308DC35C;
    v5[3] = &unk_264B8E340;
    v5[4] = v6;
    [(DTXChannel *)channel sendMessageSync:v3 replyHandler:v5];

    _Block_object_dispose(v6, 8);
  }
  [(DTTap *)self setIsRunning:0];
}

- (void)_pause
{
  if (self->_channel)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    char v7 = 1;
    v3 = [MEMORY[0x263F38CA0] messageWithSelector:sel_pause objectArguments:0];
    channel = self->_channel;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2308DC540;
    v5[3] = &unk_264B8E340;
    v5[4] = v6;
    [(DTXChannel *)channel sendMessageSync:v3 replyHandler:v5];

    _Block_object_dispose(v6, 8);
  }
}

- (void)_unpause
{
  if (self->_channel)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    char v7 = 1;
    v3 = [MEMORY[0x263F38CA0] messageWithSelector:sel_unpause objectArguments:0];
    channel = self->_channel;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2308DC724;
    v5[3] = &unk_264B8E340;
    v5[4] = v6;
    [(DTXChannel *)channel sendMessageSync:v3 replyHandler:v5];

    _Block_object_dispose(v6, 8);
  }
}

- (id)_fetchDataForReason:(unint64_t)a3
{
  v5 = [(DTTap *)self config];
  uint64_t v6 = [v5 serviceVersion];

  if (a3 == 1 && v6 >= 2)
  {
    channel = self->_channel;
    id v8 = [MEMORY[0x263F38CA0] messageWithSelector:sel_fetchDataNow objectArguments:0];
    [(DTXChannel *)channel sendControlSync:v8 replyHandler:&unk_26E515748];
  }
  dispatch_sync((dispatch_queue_t)self->_unprocessedMessageQueue, &unk_26E515A48);
  v9 = [(DTTap *)self memoHandler];
  id v10 = [v9 handleMemo:0];

  return v10;
}

- (DTTapMessageHandler)messageHandler
{
  return self->_messageHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_unprocessedMessageQueue, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end