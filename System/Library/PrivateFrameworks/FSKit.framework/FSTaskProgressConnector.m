@interface FSTaskProgressConnector
+ (id)newForProgress:(id)a3 description:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FSTaskDescription)taskDesc;
- (FSTaskProgressConnector)initWithProgress:(id)a3 description:(id)a4;
- (NSMutableSet)pendingReplyBlocks;
- (NSProgress)progress;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (id)getProgress:(id)a3;
- (void)dealloc;
- (void)setListener:(id)a3;
- (void)setPendingReplyBlocks:(id)a3;
- (void)setProgress:(id)a3;
- (void)setTaskDesc:(id)a3;
@end

@implementation FSTaskProgressConnector

- (FSTaskProgressConnector)initWithProgress:(id)a3 description:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)FSTaskProgressConnector;
  v9 = [(FSTaskProgressConnector *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progress, a3);
    objc_storeStrong((id *)&v10->_taskDesc, a4);
    uint64_t v11 = objc_opt_new();
    pendingReplyBlocks = v10->_pendingReplyBlocks;
    v10->_pendingReplyBlocks = (NSMutableSet *)v11;

    uint64_t v13 = [MEMORY[0x263F08D88] anonymousListener];
    listener = v10->_listener;
    v10->_listener = (NSXPCListener *)v13;

    v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v10->_listener;
      *(_DWORD *)buf = 136315394;
      v27 = "-[FSTaskProgressConnector initWithProgress:description:]";
      __int16 v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_24DDB2000, v15, OS_LOG_TYPE_DEFAULT, "%s got listener %@", buf, 0x16u);
    }

    v17 = v10->_listener;
    if (!v17)
    {
      v23 = 0;
      goto LABEL_10;
    }
    [(NSXPCListener *)v17 setDelegate:v10];
    uint64_t v18 = [(NSXPCListener *)v10->_listener endpoint];
    endpoint = v10->_endpoint;
    v10->_endpoint = (NSXPCListenerEndpoint *)v18;

    [(NSXPCListener *)v10->_listener resume];
    v20 = fskit_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v10->_listener;
      v22 = [(NSXPCListener *)v21 endpoint];
      *(_DWORD *)buf = 136315650;
      v27 = "-[FSTaskProgressConnector initWithProgress:description:]";
      __int16 v28 = 2112;
      v29 = v21;
      __int16 v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_24DDB2000, v20, OS_LOG_TYPE_DEFAULT, "%s got listener %@ endpoint %@", buf, 0x20u);
    }
  }
  v23 = v10;
LABEL_10:

  return v23;
}

+ (id)newForProgress:(id)a3 description:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithProgress:v7 description:v6];

  return v8;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FSTaskProgressConnector;
  [(FSTaskProgressConnector *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "-[FSTaskProgressConnector listener:shouldAcceptNewConnection:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_24DDB2000, v8, OS_LOG_TYPE_DEFAULT, "%s given listener %@, connection %@", (uint8_t *)&v11, 0x20u);
  }

  v9 = +[FSKitConstants FSTaskProgressXPCProtocol];
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self];
  [v7 resume];

  return 1;
}

- (id)getProgress:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  pendingReplyBlocks = self->_pendingReplyBlocks;
  v5 = (void *)[a3 copy];
  id v6 = _Block_copy(v5);
  [(NSMutableSet *)pendingReplyBlocks addObject:v6];

  id v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(NSProgress *)self->_progress completedUnitCount];
    int v9 = [(NSProgress *)self->_progress totalUnitCount];
    v12[0] = 67109376;
    v12[1] = v8;
    __int16 v13 = 1024;
    int v14 = v9;
    _os_log_impl(&dword_24DDB2000, v7, OS_LOG_TYPE_DEFAULT, "getProgress returning progress with %u of %u units done", (uint8_t *)v12, 0xEu);
  }

  progress = self->_progress;
  return progress;
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProgress:(id)a3
{
}

- (FSTaskDescription)taskDesc
{
  return (FSTaskDescription *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTaskDesc:(id)a3
{
}

- (NSMutableSet)pendingReplyBlocks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPendingReplyBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReplyBlocks, 0);
  objc_storeStrong((id *)&self->_taskDesc, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end