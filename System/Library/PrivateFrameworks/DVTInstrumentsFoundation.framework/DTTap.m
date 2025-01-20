@interface DTTap
- (BOOL)_canFetchWhileArchiving;
- (BOOL)isRunning;
- (DTTap)init;
- (DTTap)initWithConfig:(id)a3;
- (DTTap)initWithConfig:(id)a3 memoHandler:(id)a4;
- (DTTapConfig)config;
- (DTTapMemoHandler)memoHandler;
- (NSString)uuid;
- (OS_dispatch_queue)serialQueue;
- (id)_fetchDataForReason:(unint64_t)a3;
- (id)fetchDataNow;
- (id)pause;
- (id)start;
- (id)stop;
- (id)unpause;
- (unsigned)tapID;
- (void)_pause;
- (void)_start;
- (void)_stop;
- (void)_unpause;
- (void)resumeDataProcessing;
- (void)setIsRunning:(BOOL)a3;
- (void)suspendDataProcessing;
@end

@implementation DTTap

- (DTTap)init
{
  uint64_t v2 = objc_opt_class();
  NSLog(&cfstr_TheClassCannot.isa, v2);
  __assert_rtn("-[DTTap init]", "DTTap.m", 26, "0");
}

- (DTTap)initWithConfig:(id)a3
{
  return (DTTap *)MEMORY[0x270F9A6D0](self, sel_initWithConfig_memoHandler_);
}

- (DTTap)initWithConfig:(id)a3 memoHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DTTap;
  v9 = [(DTTap *)&v15 init];
  v10 = v9;
  if (v9)
  {
    if (!v7) {
      sub_23093E3C0();
    }
    v9->_tapID = atomic_fetch_add_explicit(&dword_268707FBC, 1u, memory_order_relaxed) + 1;
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.dt.tap", v11);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_config, a3);
    objc_storeStrong((id *)&v10->_memoHandler, a4);
  }

  return v10;
}

- (NSString)uuid
{
  return [(DTTapConfig *)self->_config uuid];
}

- (id)start
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = sDTTapLogClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int tapID = self->_tapID;
    *(_DWORD *)buf = 67109120;
    unsigned int v13 = tapID;
    _os_log_impl(&dword_23087D000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called start API", buf, 8u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2308DEDB8;
  v11[3] = &unk_264B8D590;
  v11[4] = self;
  v5 = [MEMORY[0x263F086D0] blockOperationWithBlock:v11];
  serialQueue = self->_serialQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2308DEF00;
  v9[3] = &unk_264B8D590;
  id v7 = v5;
  id v10 = v7;
  dispatch_async(serialQueue, v9);

  return v7;
}

- (id)stop
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = sDTTapLogClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int tapID = self->_tapID;
    *(_DWORD *)buf = 67109120;
    unsigned int v13 = tapID;
    _os_log_impl(&dword_23087D000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called stop API", buf, 8u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2308DF088;
  v11[3] = &unk_264B8D590;
  v11[4] = self;
  v5 = [MEMORY[0x263F086D0] blockOperationWithBlock:v11];
  serialQueue = self->_serialQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2308DF1C4;
  v9[3] = &unk_264B8D590;
  id v7 = v5;
  id v10 = v7;
  dispatch_async(serialQueue, v9);

  return v7;
}

- (id)pause
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = sDTTapLogClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int tapID = self->_tapID;
    *(_DWORD *)buf = 67109120;
    unsigned int v13 = tapID;
    _os_log_impl(&dword_23087D000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called pause API", buf, 8u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2308DF34C;
  v11[3] = &unk_264B8D590;
  v11[4] = self;
  v5 = [MEMORY[0x263F086D0] blockOperationWithBlock:v11];
  serialQueue = self->_serialQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2308DF45C;
  v9[3] = &unk_264B8D590;
  id v7 = v5;
  id v10 = v7;
  dispatch_async(serialQueue, v9);

  return v7;
}

- (id)unpause
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = sDTTapLogClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int tapID = self->_tapID;
    *(_DWORD *)buf = 67109120;
    unsigned int v13 = tapID;
    _os_log_impl(&dword_23087D000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called unpause API", buf, 8u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2308DF5E4;
  v11[3] = &unk_264B8D590;
  v11[4] = self;
  v5 = [MEMORY[0x263F086D0] blockOperationWithBlock:v11];
  serialQueue = self->_serialQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2308DF6F4;
  v9[3] = &unk_264B8D590;
  id v7 = v5;
  id v10 = v7;
  dispatch_async(serialQueue, v9);

  return v7;
}

- (id)fetchDataNow
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = sDTTapLogClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int tapID = self->_tapID;
    *(_DWORD *)buf = 67109120;
    unsigned int v14 = tapID;
    _os_log_impl(&dword_23087D000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called fetchDataNow API", buf, 8u);
  }

  v5 = objc_opt_new();
  serialQueue = self->_serialQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2308DF830;
  v11[3] = &unk_264B8DA70;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  dispatch_async(serialQueue, v11);
  id v8 = v12;
  id v9 = v7;

  return v9;
}

- (void)suspendDataProcessing
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = sDTTapLogClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int tapID = self->_tapID;
    v5[0] = 67109120;
    v5[1] = tapID;
    _os_log_impl(&dword_23087D000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called suspendDataProcessing API", (uint8_t *)v5, 8u);
  }

  [(DTTapMemoHandler *)self->_memoHandler suspend];
}

- (void)resumeDataProcessing
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = sDTTapLogClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int tapID = self->_tapID;
    v5[0] = 67109120;
    v5[1] = tapID;
    _os_log_impl(&dword_23087D000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called resumeDataProcessing API", (uint8_t *)v5, 8u);
  }

  [(DTTapMemoHandler *)self->_memoHandler resume];
}

- (void)_start
{
}

- (void)_stop
{
}

- (void)_pause
{
}

- (void)_unpause
{
}

- (BOOL)_canFetchWhileArchiving
{
  return 0;
}

- (id)_fetchDataForReason:(unint64_t)a3
{
}

- (unsigned)tapID
{
  return self->_tapID;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (DTTapMemoHandler)memoHandler
{
  return self->_memoHandler;
}

- (DTTapConfig)config
{
  return self->_config;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_memoHandler, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end