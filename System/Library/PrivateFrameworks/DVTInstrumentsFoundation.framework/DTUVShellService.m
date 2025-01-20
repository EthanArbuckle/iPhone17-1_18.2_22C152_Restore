@interface DTUVShellService
- (DTUVShellService)initWithChannel:(id)a3;
- (id)_makeDTXMessageFrom:(id)a3;
- (id)_makeDTXReplyHandlerFrom:(id)a3;
- (id)_makeServiceMessageFrom:(id)a3 error:(id *)a4;
- (id)_makeServiceReplyHandlerFrom:(id)a3;
- (id)createExternalService:(id)a3 error:(id *)a4;
- (void)_activateService;
- (void)_bindServiceCancelationToChannelCancelation;
- (void)_replyToQueuedMessages:(id)a3;
- (void)messageReceived:(id)a3;
- (void)sendMessage:(id)a3;
@end

@implementation DTUVShellService

- (DTUVShellService)initWithChannel:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DTUVShellService;
  v5 = [(DTXService *)&v15 initWithChannel:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    queuedServiceMessages = v5->_queuedServiceMessages;
    v5->_queuedServiceMessages = (NSMutableArray *)v6;

    id v8 = [NSString stringWithFormat:@"%@-MessageQueue", objc_opt_class()];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    messageQueue = v5->_messageQueue;
    v5->_messageQueue = (OS_dispatch_queue *)v9;

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_23091B574;
    v12[3] = &unk_264B90968;
    v13 = v5;
    id v14 = v4;
    DTUVLaunchPreviewShell(v12);
  }
  return v5;
}

- (void)_bindServiceCancelationToChannelCancelation
{
  service = self->_service;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_23091B7D4;
  v6[3] = &unk_264B8D590;
  v6[4] = self;
  [(DTUVService *)service observeCancelation:v6];
  id v4 = [(DTXService *)self channel];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_23091B818;
  v5[3] = &unk_264B8D590;
  v5[4] = self;
  [v4 registerDisconnectHandler:v5];
}

- (void)_activateService
{
  service = self->_service;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_23091B8A8;
  v3[3] = &unk_264B90990;
  v3[4] = self;
  [(DTUVService *)service activateWithCompletion:v3];
}

- (void)_replyToQueuedMessages:(id)a3
{
  id v4 = a3;
  messageQueue = self->_messageQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23091BB2C;
  v7[3] = &unk_264B8DA70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(messageQueue, v7);
}

- (void)messageReceived:(id)a3
{
  id v4 = a3;
  if ((id)*MEMORY[0x263F38CC8] != v4)
  {
    id v12 = 0;
    v5 = [(DTUVShellService *)self _makeServiceMessageFrom:v4 error:&v12];
    id v6 = v12;
    if (v5)
    {
      messageQueue = self->_messageQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_23091BDB8;
      block[3] = &unk_264B8DA70;
      block[4] = self;
      id v11 = v5;
      dispatch_sync(messageQueue, block);
    }
    else
    {
      id v8 = [(DTXService *)self channel];
      dispatch_queue_t v9 = (void *)[v4 newReplyWithError:v6];
      [v8 sendControlAsync:v9 replyHandler:0];
    }
  }
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  id v7 = [(DTUVShellService *)self _makeDTXMessageFrom:v4];
  v5 = [(DTUVShellService *)self _makeDTXReplyHandlerFrom:v4];

  id v6 = [(DTXService *)self channel];
  [v6 sendControlAsync:v7 replyHandler:v5];
}

- (id)_makeServiceMessageFrom:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 stringForMessageKey:@"type"];
  id v8 = [(DTUVShellService *)self _makeServiceReplyHandlerFrom:v6];
  dispatch_queue_t v9 = [v6 object];

  v10 = DTUVMakeServiceMessage(v7, v9, v8, a4);

  return v10;
}

- (id)_makeServiceReplyHandlerFrom:(id)a3
{
  id v4 = a3;
  if ([v4 integerForMessageKey:@"UVOneWayMessageKey"] == 1)
  {
    v5 = 0;
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_23091C00C;
    v7[3] = &unk_264B909B8;
    id v8 = v4;
    dispatch_queue_t v9 = self;
    v5 = _Block_copy(v7);
  }
  return v5;
}

- (id)_makeDTXMessageFrom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payload];

  v5 = (void *)MEMORY[0x263F38CA0];
  if (v4)
  {
    id v6 = [v3 payload];
    id v7 = [v5 messageWithObject:v6];
  }
  else
  {
    id v7 = [MEMORY[0x263F38CA0] message];
  }
  id v8 = [v3 messageType];

  if (v8)
  {
    dispatch_queue_t v9 = [v3 messageType];
    [v7 setString:v9 forMessageKey:@"type"];
  }
  v10 = [v3 replyHandler];

  if (!v10) {
    [v7 setInteger:1 forMessageKey:@"UVOneWayMessageKey"];
  }

  return v7;
}

- (id)_makeDTXReplyHandlerFrom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 replyHandler];

  if (v4)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_23091C280;
    aBlock[3] = &unk_264B8F770;
    id v7 = v3;
    id v4 = _Block_copy(aBlock);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serviceMessageHandler, 0);
  objc_storeStrong((id *)&self->_queuedServiceMessages, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
}

- (id)createExternalService:(id)a3 error:(id *)a4
{
  return 0;
}

@end