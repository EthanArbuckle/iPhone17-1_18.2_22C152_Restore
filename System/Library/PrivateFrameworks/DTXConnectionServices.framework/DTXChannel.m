@interface DTXChannel
- ($2AC1CA6B41BA5ED35C064565198F84D5)_callbackSnapshot;
- (BOOL)isCanceled;
- (BOOL)sendMessageAsync:(id)a3 replyHandler:(id)a4;
- (DTXChannel)initWithConnection:(id)a3 channelIdentifier:(unsigned int)a4 label:(id)a5;
- (DTXConnection)_connection;
- (NSString)description;
- (NSString)label;
- (int)compressionTypeHint;
- (unsigned)channelCode;
- (void)_scheduleBlock:(id)a3;
- (void)_scheduleMessage:(id)a3 tracker:(id)a4 withHandler:(id)a5;
- (void)_setDispatchTarget:(id)a3 queue:(id)a4;
- (void)_setDispatchValidator:(id)a3;
- (void)cancel;
- (void)registerDisconnectHandler:(id)a3;
- (void)resume;
- (void)sendControlAsync:(id)a3 replyHandler:(id)a4;
- (void)sendControlSync:(id)a3 replyHandler:(id)a4;
- (void)sendMessage:(id)a3 replyHandler:(id)a4;
- (void)sendMessageSync:(id)a3 replyHandler:(id)a4;
- (void)setCompressionTypeHint:(int)a3;
- (void)setDispatchTarget:(id)a3;
- (void)setIsCanceled:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)suspend;
@end

@implementation DTXChannel

- (DTXChannel)initWithConnection:(id)a3 channelIdentifier:(unsigned int)a4 label:(id)a5
{
  v10 = (DTXConnection *)a3;
  id v13 = a5;
  if (!v10)
  {
    v32 = [MEMORY[0x263F08690] currentHandler:v11 withTransitionContext:v12];
    [v32 handleFailureInMethod:v33 object:a2 file:@"DTXConnection.m" lineNumber:1664 description:@"Invalid parameter not satisfying: %@", @"connection"];
  }
  v34.receiver = self;
  v34.super_class = (Class)DTXChannel;
  v14 = [(DTXChannel *)&v34 init];
  v15 = v14;
  if (v14)
  {
    v14->_channelCode = a4;
    objc_storeStrong((id *)&v14->_label, a5);
    if (v15->_channelCode) {
      objc_storeStrong((id *)&v15->_strongConnection, a3);
    }
    v15->_connection = v10;
    v18 = NSString;
    uint64_t v19 = [v10 _atomicConnectionNumber:v16 withTransitionContext:v17];
    LODWORD(v21) = v15->_channelCode;
    BOOL v22 = (int)v21 < 0;
    if ((int)v21 >= 0) {
      uint64_t v21 = v21;
    }
    else {
      uint64_t v21 = -(int)v21;
    }
    v23 = "f";
    if (!v22) {
      v23 = "";
    }
    [v18 stringWithFormat:@"%s [x%d.c%d%s]", "DTXChannel serializer queue", v19, v21, v23];
    id v24 = objc_claimAutoreleasedReturnValue();
    v27 = (const char *)[v24 UTF8String];
    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create(v27, v28);
    serialQueue = v15->_serialQueue;
    v15->_serialQueue = (OS_dispatch_queue *)v29;

    v15->_handlerGuard._os_unfair_lock_opaque = 0;
    v15->_compressionTypeHint = 1;
  }

  return v15;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  uint64_t v8 = [self->_connection _atomicConnectionNumber:v6 withOptions:v7];
  LODWORD(v10) = self->_channelCode;
  BOOL v11 = (int)v10 < 0;
  if ((int)v10 >= 0) {
    uint64_t v10 = v10;
  }
  else {
    uint64_t v10 = -(int)v10;
  }
  uint64_t v12 = "f";
  if (!v11) {
    uint64_t v12 = "";
  }
  return [NSString stringWithFormat:@"<%s %p : x%d.c%d%s> \"%@\"", Name, self, v8, v10, v12, self->_label];
}

- (void)_scheduleBlock:(id)a3
{
  if (a3) {
    dispatch_async((dispatch_queue_t)self->_serialQueue, a3);
  }
}

- (void)_scheduleMessage:(id)a3 tracker:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v12 = a5;
  if (!v8) {
    id v8 = (id)kDTXInterruptionMessage;
  }
  int v13 = [v8 v10:v11];
  if (v12 || v13 != 2)
  {
    if ([v8 isKindOfClass:[v14 class]])
    {
      uint64_t v17 = self->_connection;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = sub_22AF454D0;
      v24[3] = &unk_264884108;
      v24[4] = self;
      id v25 = v8;
      uint64_t v26 = v17;
      id v27 = v9;
      v18 = v17;
      uint64_t v19 = (void *)MEMORY[0x230F36B10](v24);

      if (!v19) {
        goto LABEL_11;
      }
    }
    else
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = sub_22AF45834;
      v20[3] = &unk_264884130;
      v20[4] = self;
      id v23 = v12;
      id v21 = v8;
      id v22 = v9;
      uint64_t v19 = (void *)MEMORY[0x230F36B10](v20);

      if (!v19)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    dispatch_async((dispatch_queue_t)self->_serialQueue, v19);
    goto LABEL_11;
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF45480;
  block[3] = &unk_264883A58;
  block[4] = self;
  dispatch_async(serialQueue, block);
LABEL_12:
}

- ($2AC1CA6B41BA5ED35C064565198F84D5)_callbackSnapshot
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x5012000000;
  id v9 = sub_22AF45A70;
  uint64_t v10 = sub_22AF45AA4;
  uint64_t v11 = 1024;
  memset(v12, 0, sizeof(v12));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22AF45B30;
  v5[3] = &unk_264884158;
  v5[4] = &v6;
  sub_22AF45AAC((os_unfair_lock_s *)self, v5);
  sub_22AF4578C(retstr, (uint64_t)(v7 + 6));
  _Block_object_dispose(&v6, 8);
  sub_22AF457E8((uint64_t)v12);
  return result;
}

- (void)setMessageHandler:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = sub_22AF42724;
  v14 = sub_22AF42750;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_22AF45CC4;
  v7[3] = &unk_264884180;
  id v5 = v4;
  v7[4] = self;
  id v8 = v5;
  id v9 = &v10;
  sub_22AF45AAC((os_unfair_lock_s *)self, v7);
  uint64_t v6 = (void *)v11[5];
  v11[5] = 0;

  _Block_object_dispose(&v10, 8);
}

- (void)_setDispatchTarget:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_22AF3FBAC;
  uint64_t v19 = sub_22AF3FBBC;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_22AF45EFC;
  v11[3] = &unk_2648841A8;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  id v9 = v7;
  id v13 = v9;
  sub_22AF45AAC((os_unfair_lock_s *)self, v11);
  uint64_t v10 = (void *)v16[5];
  v16[5] = 0;

  _Block_object_dispose(&v15, 8);
}

- (void)setDispatchTarget:(id)a3
{
}

- (void)_setDispatchValidator:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_22AF46030;
  v6[3] = &unk_2648841D0;
  id v7 = v4;
  id v5 = v4;
  sub_22AF45AAC((os_unfair_lock_s *)self, v6);
}

- (void)registerDisconnectHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    uint64_t v7 = qword_26AD82898;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_22AF4612C;
    v9[3] = &unk_2648841F8;
    id v10 = v4;
    [connection sendMessage:v8 fromChannel:v7 sendMode:2 syncWithReply:0 replyHandler:v9];
  }
}

- (void)cancel
{
  [self->_connection unregisterChannel:a2 forConnection:self];

  [self setIsCanceled:1];
}

- (void)suspend
{
}

- (void)resume
{
}

- (void)sendControlAsync:(id)a3 replyHandler:(id)a4
{
}

- (void)sendControlSync:(id)a3 replyHandler:(id)a4
{
  id v9 = a3;
  id v8 = a4;
  if (!v8) {
    sub_22AF46234((uint64_t)self, a2);
  }
  [self->_connection sendMessage:v7 fromChannel:(uint64_t)v9 sendMode:2 syncWithReply:1 replyHandler:v8];
}

- (BOOL)sendMessageAsync:(id)a3 replyHandler:(id)a4
{
  return [self->_connection sendMessage:a2 fromChannel:(uint64_t)a3 sendMode:0 syncWithReply:0 replyHandler:a4];
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
}

- (void)sendMessageSync:(id)a3 replyHandler:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  if (!v7) {
    sub_22AF46234((uint64_t)self, a2);
  }
  sub_22AF4634C(v8, self->_connection, self, 1, v7);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (unsigned)channelCode
{
  return self->_channelCode;
}

- (int)compressionTypeHint
{
  return self->_compressionTypeHint;
}

- (void)setCompressionTypeHint:(int)a3
{
  self->_compressionTypeHint = a3;
}

- (DTXConnection)_connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  sub_22AF457E8((uint64_t)&self->_channelGuarded);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_strongConnection, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end