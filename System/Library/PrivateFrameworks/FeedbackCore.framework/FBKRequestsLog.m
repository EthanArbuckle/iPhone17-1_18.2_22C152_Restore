@interface FBKRequestsLog
+ (id)sharedInstance;
- (BOOL)active;
- (BOOL)isActive;
- (FBKRequestsLog)init;
- (NSMutableArray)requests;
- (NSURL)requestDirectoryURL;
- (OS_dispatch_queue)requestSaveQueue;
- (id)mutableArrayValueForKey:(id)a3;
- (void)_addRequest:(id)a3;
- (void)addRequest:(id)a3;
- (void)insertObject:(id)a3 inRequestsAtIndex:(unint64_t)a4;
- (void)removeObjectFromRequestsAtIndex:(unint64_t)a3;
- (void)replaceObjectInRequestsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setIsActive:(BOOL)a3;
- (void)setRequestDirectoryURL:(id)a3;
- (void)setRequestSaveQueue:(id)a3;
- (void)setRequests:(id)a3;
@end

@implementation FBKRequestsLog

- (FBKRequestsLog)init
{
  v14.receiver = self;
  v14.super_class = (Class)FBKRequestsLog;
  v2 = [(FBKRequestsLog *)&v14 init];
  uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  requests = v2->_requests;
  v2->_requests = (NSMutableArray *)v3;

  if (FBKIsInternalInstall(v5, v6))
  {
    v7 = [MEMORY[0x263F08AB0] processInfo];
    v8 = [v7 environment];
    v9 = [v8 objectForKeyedSubscript:@"FBK_RECORD_FIXTURES"];
    char v10 = [v9 isEqualToString:@"1"];
  }
  else
  {
    char v10 = 0;
  }
  v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v12 = [v11 BOOLForKey:@"showDebugRequests"];

  v2->_isActive = v10 | v12;
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

void __32__FBKRequestsLog_sharedInstance__block_invoke()
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v0;

  if (FBKIsInternalInstall(v2, v3))
  {
    v4 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v5 = [v4 environment];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"FBK_RECORD_FIXTURES"];
    int v7 = [v6 isEqualToString:@"1"];

    if (v7)
    {
      uint64_t v8 = +[FBKFileManager applicationSupportDirectory];
      v9 = *(void **)(sharedInstance_sharedInstance_0 + 24);
      *(void *)(sharedInstance_sharedInstance_0 + 24) = v8;

      char v10 = +[FBKLog appHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(sharedInstance_sharedInstance_0 + 24);
        int v18 = 138412290;
        uint64_t v19 = v11;
        _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "will record fixtures at [%@]", (uint8_t *)&v18, 0xCu);
      }

      char v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -1);
      dispatch_queue_t v13 = dispatch_queue_create("FeedbackAssistant.RequestSaveQueue.Internal", v12);
      objc_super v14 = *(void **)(sharedInstance_sharedInstance_0 + 32);
      *(void *)(sharedInstance_sharedInstance_0 + 32) = v13;
    }
    if ([(id)sharedInstance_sharedInstance_0 isActive])
    {
      v15 = [MEMORY[0x263F3A160] sharedInstance];
      [v15 setHostIdentifier:@"FBK"];

      v16 = [MEMORY[0x263F3A160] sharedInstance];
      [v16 setOnPeerJoin:&__block_literal_global_18];

      v17 = [MEMORY[0x263F3A160] sharedInstance];
      [v17 start];
    }
  }
}

void __32__FBKRequestsLog_sharedInstance__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = +[FBKRequestsLog sharedInstance];
  v4 = [v3 requests];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        char v10 = [MEMORY[0x263F3A160] sharedInstance];
        [v10 sendRecord:v9 toPeer:v2];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)active
{
  return self->_isActive;
}

- (id)mutableArrayValueForKey:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FBKRequestsLog;
  uint64_t v3 = [(FBKRequestsLog *)&v5 mutableArrayValueForKey:a3];

  return v3;
}

- (void)addRequest:(id)a3
{
  id v4 = [a3 wrappedObject];
  [(FBKRequestsLog *)self _addRequest:v4];
}

- (void)_addRequest:(id)a3
{
  id v4 = a3;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __30__FBKRequestsLog__addRequest___block_invoke;
  v17 = &unk_264874270;
  int v18 = self;
  id v5 = v4;
  id v19 = v5;
  dispatch_async(MEMORY[0x263EF83A0], &v14);
  uint64_t v6 = [(FBKRequestsLog *)self requestDirectoryURL];
  if (v6)
  {
    uint64_t v8 = (void *)v6;
    int v9 = FBKIsInternalInstall(v6, v7);

    if (v9)
    {
      char v10 = [(FBKRequestsLog *)self requestDirectoryURL];
      long long v11 = [(FBKRequestsLog *)self requestSaveQueue];
      id v12 = v5;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __saveRequest_block_invoke;
      block[3] = &unk_264874270;
      id v21 = v12;
      id v22 = v10;
      id v13 = v10;
      dispatch_async(v11, block);
    }
  }
}

void __30__FBKRequestsLog__addRequest___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 requests];
  objc_msgSend(v1, "insertObject:inRequestsAtIndex:", v2, objc_msgSend(v3, "count"));
}

- (void)insertObject:(id)a3 inRequestsAtIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(FBKRequestsLog *)self requests];
  [v7 insertObject:v6 atIndex:a4];

  id v8 = [MEMORY[0x263F3A160] sharedInstance];
  [v8 broadcastRecord:v6];
}

- (void)removeObjectFromRequestsAtIndex:(unint64_t)a3
{
  id v4 = [(FBKRequestsLog *)self requests];
  [v4 removeObjectAtIndex:a3];
}

- (void)replaceObjectInRequestsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  id v7 = [(FBKRequestsLog *)self requests];
  [v7 replaceObjectAtIndex:a3 withObject:v6];
}

- (NSMutableArray)requests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequests:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (NSURL)requestDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequestDirectoryURL:(id)a3
{
}

- (OS_dispatch_queue)requestSaveQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRequestSaveQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSaveQueue, 0);
  objc_storeStrong((id *)&self->_requestDirectoryURL, 0);

  objc_storeStrong((id *)&self->_requests, 0);
}

@end