@interface ATService
+ (id)allocWithZone:(_NSZone *)a3;
- (ATService)init;
- (BOOL)run;
- (BOOL)stop;
- (NSHashTable)observers;
- (NSMutableSet)messageLinks;
- (id)messageLinkForIdentifier:(id)a3;
- (void)addMessageLink:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeMessageLink:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setMessageLinks:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation ATService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_messageLinks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setMessageLinks:(id)a3
{
}

- (NSMutableSet)messageLinks
{
  return self->_messageLinks;
}

- (void)removeMessageLink:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__ATService_removeMessageLink___block_invoke;
  v7[3] = &unk_2642813C8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __31__ATService_removeMessageLink___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 40) + 16) removeObject:*(void *)(a1 + 32)];
  v2 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 16);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2164B1000, v2, OS_LOG_TYPE_DEFAULT, "Removed messageLink: %{public}@ - allLinks %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)addMessageLink:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__ATService_addMessageLink___block_invoke;
  v7[3] = &unk_2642813C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __28__ATService_addMessageLink___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32)];
  v2 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2164B1000, v2, OS_LOG_TYPE_DEFAULT, "Added messageLink: %{public}@ - allLinks %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)messageLinkForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1399;
  v16 = __Block_byref_object_dispose__1400;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ATService_messageLinkForIdentifier___block_invoke;
  block[3] = &unk_2642812B0;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __38__ATService_messageLinkForIdentifier___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1[4] + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "identifier", (void)v10);
        int v9 = [v8 isEqualToString:a1[5]];

        if (v9) {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__ATService_removeObserver___block_invoke;
  v7[3] = &unk_2642813C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __28__ATService_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__ATService_addObserver___block_invoke;
  v7[3] = &unk_2642813C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __25__ATService_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (BOOL)stop
{
  return 0;
}

- (BOOL)run
{
  return 0;
}

- (ATService)init
{
  v14.receiver = self;
  v14.super_class = (Class)ATService;
  id v2 = [(ATService *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    messageLinks = v2->_messageLinks;
    v2->_messageLinks = (NSMutableSet *)v3;

    uint64_t v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    dispatch_queue_t v7 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

    long long v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v12 = v2->_messageLinks;
    v2->_messageLinks = v11;
  }
  return v2;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[ATService allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___ATService;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

@end