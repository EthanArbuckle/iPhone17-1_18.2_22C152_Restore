@interface IAPUIDManager
+ (id)sharedIAPUIDManager;
- (BOOL)isIAPUIDPresent:(unint64_t)a3;
- (BOOL)removeIAPUID:(unint64_t)a3;
- (IAPUIDManager)init;
- (id)objectForIAPUID:(unint64_t)a3;
- (unint64_t)iapUID:(id)a3;
- (void)dealloc;
@end

@implementation IAPUIDManager

- (IAPUIDManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)IAPUIDManager;
  v2 = [(IAPUIDManager *)&v4 init];
  if (v2 && init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global_1);
  }
  return v2;
}

uint64_t __21__IAPUIDManager_init__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.iap.iapuidmanager.queue", 0);
  v1 = (void *)__iapUIDQueue;
  __iapUIDQueue = (uint64_t)v0;

  __iapUIDDictionary = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  v3 = (void *)__iapUIDQueue;
  __iapUIDQueue = 0;

  objc_super v4 = (void *)__iapUIDDictionary;
  __iapUIDDictionary = 0;

  v5.receiver = self;
  v5.super_class = (Class)IAPUIDManager;
  [(IAPUIDManager *)&v5 dealloc];
}

+ (id)sharedIAPUIDManager
{
  if (sharedIAPUIDManager_onceToken != -1) {
    dispatch_once(&sharedIAPUIDManager_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedIAPUIDManager_sharedManagerInstance;
  return v2;
}

uint64_t __36__IAPUIDManager_sharedIAPUIDManager__block_invoke()
{
  sharedIAPUIDManager_sharedManagerInstance = objc_alloc_init(IAPUIDManager);
  return MEMORY[0x270F9A758]();
}

- (unint64_t)iapUID:(id)a3
{
  id v3 = a3;
  objc_super v4 = __iapUIDQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__IAPUIDManager_iapUID___block_invoke;
  block[3] = &unk_2646682E8;
  id v9 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
  unint64_t v6 = __iapUIDCounter;

  return v6;
}

void __24__IAPUIDManager_iapUID___block_invoke(uint64_t a1)
{
  if ((unint64_t)(__iapUIDCounter + 1) > 1) {
    uint64_t v2 = __iapUIDCounter + 1;
  }
  else {
    uint64_t v2 = 1;
  }
  __iapUIDCounter = v2;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(id)__iapUIDDictionary setObject:*(void *)(a1 + 32) forKey:v3];
}

- (BOOL)removeIAPUID:(unint64_t)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__IAPUIDManager_removeIAPUID___block_invoke;
  v5[3] = &unk_2646689C8;
  v5[4] = &v6;
  v5[5] = a3;
  dispatch_sync((dispatch_queue_t)__iapUIDQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __30__IAPUIDManager_removeIAPUID___block_invoke(uint64_t a1)
{
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend((id)__iapUIDDictionary, "objectForKey:");

  if (v2)
  {
    [(id)__iapUIDDictionary removeObjectForKey:v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (BOOL)isIAPUIDPresent:(unint64_t)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__IAPUIDManager_isIAPUIDPresent___block_invoke;
  v5[3] = &unk_2646689C8;
  v5[4] = &v6;
  v5[5] = a3;
  dispatch_sync((dispatch_queue_t)__iapUIDQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__IAPUIDManager_isIAPUIDPresent___block_invoke(uint64_t a1)
{
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend((id)__iapUIDDictionary, "objectForKey:");

  if (v2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (id)objectForIAPUID:(unint64_t)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__IAPUIDManager_objectForIAPUID___block_invoke;
  v5[3] = &unk_2646689C8;
  v5[4] = &v6;
  v5[5] = a3;
  dispatch_sync((dispatch_queue_t)__iapUIDQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__IAPUIDManager_objectForIAPUID___block_invoke(uint64_t a1)
{
  id v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v2 = [(id)__iapUIDDictionary objectForKey:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end