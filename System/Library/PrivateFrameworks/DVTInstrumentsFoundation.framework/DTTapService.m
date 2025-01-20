@interface DTTapService
+ (void)registerCapabilities:(id)a3 forDelegateClass:(Class)a4 forConnection:(id)a5;
- (DTTapService)initWithChannel:(id)a3;
- (void)fetchDataNow;
- (void)handleBulkData:(const void *)a3 size:(unint64_t)a4 destructor:(id)a5;
- (void)handleBulkData:(id)a3;
- (void)messageReceived:(id)a3;
- (void)pause;
- (void)sendFrameMessage:(id)a3;
- (void)sendHeartbeatTime:(unint64_t)a3;
- (void)setConfig:(id)a3;
- (void)start;
- (void)stop;
- (void)unpause;
@end

@implementation DTTapService

+ (void)registerCapabilities:(id)a3 forDelegateClass:(Class)a4 forConnection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_230895D10;
  v16[3] = &unk_264B8E098;
  id v10 = v8;
  v18 = &v20;
  Class v19 = a4;
  id v17 = v10;
  sub_230895C4C(v16);
  if (!*((unsigned char *)v21 + 24))
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_230895E40;
    v11[3] = &unk_264B8E0E8;
    id v12 = v10;
    Class v14 = a4;
    id v13 = v9;
    id v15 = a1;
    sub_230895C4C(v11);
  }
  _Block_object_dispose(&v20, 8);
}

- (DTTapService)initWithChannel:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DTTapService;
  v5 = [(DTXService *)&v29 initWithChannel:v4];
  if (v5)
  {
    v6 = [[DTTapServiceMessageSender alloc] initWithChannel:v4];
    messageSender = v5->_messageSender;
    v5->_messageSender = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.dt.tap_service", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v8;

    id v10 = [v4 label];
    if (v10)
    {
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2050000000;
      uint64_t v28 = 0;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = sub_230896288;
      v22[3] = &unk_264B8E110;
      v24 = &v25;
      id v11 = v10;
      id v23 = v11;
      sub_230895C4C(v22);
      id v12 = v26;
      uint64_t v13 = v26[3];
      if (v13)
      {
        v5->_unsigned int tapServiceID = atomic_fetch_add_explicit(dword_268707EC0, 1u, memory_order_relaxed) + 1;
        uint64_t v14 = [objc_alloc((Class)v12[3]) initWithMessageSender:v5->_messageSender];
        delegate = v5->_delegate;
        v5->_delegate = (DTTapServiceDelegate *)v14;

        p_super = sDTTapLogClient();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
        {
          unsigned int tapServiceID = v5->_tapServiceID;
          NSStringFromClass((Class)v26[3]);
          id v18 = objc_claimAutoreleasedReturnValue();
          uint64_t v19 = [v18 UTF8String];
          *(_DWORD *)buf = 67109378;
          unsigned int v31 = tapServiceID;
          __int16 v32 = 2080;
          uint64_t v33 = v19;
          _os_log_impl(&dword_23087D000, p_super, OS_LOG_TYPE_INFO, "DTTapService: (%d) Created new Tap service with delegate %s", buf, 0x12u);
        }
      }
      else
      {
        NSLog(&cfstr_DttapserviceCo.isa, v11);
        p_super = &v5->super.super;
        v5 = 0;
      }

      _Block_object_dispose(&v25, 8);
      if (v13) {
        goto LABEL_9;
      }
    }
    else
    {
      NSLog(&cfstr_DttapserviceRe.isa);

      v5 = 0;
    }
    uint64_t v20 = 0;
    goto LABEL_11;
  }
LABEL_9:
  v5 = v5;
  uint64_t v20 = v5;
LABEL_11:

  return v20;
}

- (void)messageReceived:(id)a3
{
  if ([a3 errorStatus] == 2)
  {
    [(DTTapService *)self stop];
  }
}

- (void)setConfig:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308963B0;
  v7[3] = &unk_264B8DA70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (void)start
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_230896750;
  id v9 = sub_230896760;
  id v10 = 0;
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_230896768;
  v4[3] = &unk_264B8DDD8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(serialQueue, v4);
  v3 = (void *)v6[5];
  if (v3) {
    [v3 waitUntilFinished];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)stop
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_230896750;
  id v23 = sub_230896760;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_230896750;
  serialQueue = self->_serialQueue;
  id v17 = sub_230896760;
  id v18 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_230896C00;
  block[3] = &unk_264B8E160;
  block[4] = self;
  block[5] = &v19;
  block[6] = &v13;
  dispatch_sync(serialQueue, block);
  id v4 = (void *)v20[5];
  if (v4 || v14[5])
  {
    [v4 waitUntilFinished];
    [(id)v14[5] waitUntilFinished];
    uint64_t v5 = sDTTapLogClient();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unsigned int tapServiceID = self->_tapServiceID;
      *(_DWORD *)buf = 67109120;
      unsigned int v26 = tapServiceID;
      _os_log_impl(&dword_23087D000, v5, OS_LOG_TYPE_DEBUG, "DTTapService: (%d) Tap has been stopped and fully fetched from.", buf, 8u);
    }

    [(DTTapServiceDelegate *)self->_delegate didStop];
    uint64_t v7 = objc_opt_new();
    [v7 setKind:5];
    messageSender = self->_messageSender;
    id v9 = [MEMORY[0x263F38CA0] messageWithObject:v7];
    [(DTTapServiceMessageSender *)messageSender sendMessage:v9];

    [(DTTapServiceMessageSender *)self->_messageSender sendBarrierMessage];
    id v10 = sDTTapLogClient();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = self->_tapServiceID;
      *(_DWORD *)buf = 67109120;
      unsigned int v26 = v11;
      _os_log_impl(&dword_23087D000, v10, OS_LOG_TYPE_INFO, "DTTapService: (%d) All stop related messages have been sent. Stop complete", buf, 8u);
    }
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

- (void)pause
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_230896750;
  id v9 = sub_230896760;
  id v10 = 0;
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_230896E34;
  v4[3] = &unk_264B8DDD8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(serialQueue, v4);
  v3 = (void *)v6[5];
  if (v3) {
    [v3 waitUntilFinished];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)unpause
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_230896750;
  id v9 = sub_230896760;
  id v10 = 0;
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_230897010;
  v4[3] = &unk_264B8DDD8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(serialQueue, v4);
  v3 = (void *)v6[5];
  if (v3) {
    [v3 waitUntilFinished];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)fetchDataNow
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_230896750;
  id v9 = sub_230896760;
  id v10 = 0;
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2308971EC;
  v4[3] = &unk_264B8DDD8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(serialQueue, v4);
  v3 = (void *)v6[5];
  if (v3) {
    [v3 waitUntilFinished];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)handleBulkData:(const void *)a3 size:(unint64_t)a4 destructor:(id)a5
{
  id v6 = [MEMORY[0x263F38CA0] messageReferencingBuffer:a3 length:a4 destructor:a5];
  [(DTTapServiceMessageSender *)self->_messageSender sendMessage:v6];
}

- (void)handleBulkData:(id)a3
{
  id v4 = [MEMORY[0x263F38CA0] messageWithData:a3];
  [(DTTapServiceMessageSender *)self->_messageSender sendMessage:v4];
}

- (void)sendFrameMessage:(id)a3
{
  messageSender = self->_messageSender;
  id v4 = [MEMORY[0x263F38CA0] messageWithObject:a3];
  [(DTTapServiceMessageSender *)messageSender sendMessage:v4];
}

- (void)sendHeartbeatTime:(unint64_t)a3
{
  id v7 = (id)objc_opt_new();
  [v7 setHeartbeatTime:a3];
  messageSender = self->_messageSender;
  id v6 = [MEMORY[0x263F38CA0] messageWithObject:v7];
  [(DTTapServiceMessageSender *)messageSender sendMessage:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSender, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_tap, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end