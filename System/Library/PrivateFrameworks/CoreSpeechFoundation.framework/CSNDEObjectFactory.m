@interface CSNDEObjectFactory
+ (id)sharedInstance;
- (CSNDEObjectFactory)init;
- (OS_dispatch_queue)queue;
- (void)createNDEObject:(id)a3;
- (void)destoryNDEObject:(void *)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSNDEObjectFactory

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)destoryNDEObject:(void *)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CSNDEObjectFactory_destoryNDEObject___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async_and_wait(queue, block);
}

uint64_t __39__CSNDEObjectFactory_destoryNDEObject___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return MEMORY[0x1F4168268]();
  }
  return result;
}

- (void)createNDEObject:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__CSNDEObjectFactory_createNDEObject___block_invoke;
  v9[3] = &unk_1E6200F40;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_async_and_wait(queue, v9);
  v7 = (void **)v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __38__CSNDEObjectFactory_createNDEObject___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bytes];
  [*(id *)(a1 + 32) length];
  uint64_t result = nde_create();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CSNDEObjectFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSNDEObjectFactory;
  v2 = [(CSNDEObjectFactory *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSNDEObjectFactory", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __36__CSNDEObjectFactory_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(CSNDEObjectFactory);
  return MEMORY[0x1F41817F8]();
}

@end