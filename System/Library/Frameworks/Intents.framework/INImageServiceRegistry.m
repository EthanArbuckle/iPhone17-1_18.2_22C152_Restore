@interface INImageServiceRegistry
+ (id)sharedInstance;
- (INImageServiceRegistry)init;
- (NSArray)imageLoaders;
- (NSArray)imageServices;
- (NSArray)imageStorageServices;
- (id)imageLoaderForServiceIdentifier:(id)a3;
- (id)imageServiceForServiceIdentifier:(id)a3;
- (id)imageStorageServiceForServiceIdentifier:(id)a3;
- (void)_reprioritizeImageServices;
- (void)registerImageService:(id)a3;
- (void)unregisterImageService:(id)a3;
@end

@implementation INImageServiceRegistry

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__INImageServiceRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sSharedInstance;

  return v2;
}

- (void)registerImageService:(id)a3
{
  id v4 = a3;
  v5 = [v4 serviceIdentifier];

  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__INImageServiceRegistry_registerImageService___block_invoke;
    v7[3] = &unk_1E551F790;
    v7[4] = self;
    id v8 = v4;
    v6 = (void (**)(void))MEMORY[0x192F984C0](v7);
    if (dispatch_get_specific(&INImageServiceRegistryQueueSpecificKey) == self) {
      v6[2](v6);
    }
    else {
      dispatch_sync((dispatch_queue_t)self->_registryQueue, v6);
    }
  }
}

uint64_t __52__INImageServiceRegistry__reprioritizeImageServices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "servicePriority"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "servicePriority"));
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    v9 = [v5 serviceIdentifier];
    v10 = [v4 serviceIdentifier];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

uint64_t __47__INImageServiceRegistry_registerImageService___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = [v2 serviceIdentifier];
  [v3 setObject:v2 forKey:v4];

  id v5 = *(void **)(a1 + 32);

  return [v5 _reprioritizeImageServices];
}

- (void)_reprioritizeImageServices
{
  id v6 = [(NSMutableDictionary *)self->_imageServicesByServiceIdentifier allValues];
  v3 = [v6 sortedArrayUsingComparator:&__block_literal_global_68997];
  id v4 = (NSMutableArray *)[v3 mutableCopy];
  prioritySortedImageServices = self->_prioritySortedImageServices;
  self->_prioritySortedImageServices = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryQueue, 0);
  objc_storeStrong((id *)&self->_prioritySortedImageServices, 0);

  objc_storeStrong((id *)&self->_imageServicesByServiceIdentifier, 0);
}

- (id)imageServiceForServiceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__68995;
  v17 = __Block_byref_object_dispose__68996;
  id v18 = 0;
  registryQueue = self->_registryQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__INImageServiceRegistry_imageServiceForServiceIdentifier___block_invoke;
  block[3] = &unk_1E551B620;
  v11 = self;
  v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(registryQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __59__INImageServiceRegistry_imageServiceForServiceIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    v3 = [*(id *)(a1[5] + 8) objectForKey:v2];
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v3);
  if (v2)
  {
  }
}

- (NSArray)imageServices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__68995;
  id v10 = __Block_byref_object_dispose__68996;
  id v11 = 0;
  registryQueue = self->_registryQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__INImageServiceRegistry_imageServices__block_invoke;
  v5[3] = &unk_1E551B170;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(registryQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __39__INImageServiceRegistry_imageServices__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  id v4 = (id)v2;
  if (v2) {
    id v3 = (void *)v2;
  }
  else {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

- (void)unregisterImageService:(id)a3
{
  id v4 = a3;
  id v5 = [v4 serviceIdentifier];

  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__INImageServiceRegistry_unregisterImageService___block_invoke;
    v7[3] = &unk_1E551F790;
    v7[4] = self;
    id v8 = v4;
    uint64_t v6 = (void (**)(void))MEMORY[0x192F984C0](v7);
    if (dispatch_get_specific(&INImageServiceRegistryQueueSpecificKey) == self) {
      v6[2](v6);
    }
    else {
      dispatch_sync((dispatch_queue_t)self->_registryQueue, v6);
    }
  }
}

uint64_t __49__INImageServiceRegistry_unregisterImageService___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [*(id *)(a1 + 40) serviceIdentifier];
  [v2 removeObjectForKey:v3];

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v5 removeObject:v4];
}

- (INImageServiceRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)INImageServiceRegistry;
  id v2 = [(INImageServiceRegistry *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.intents.INImageServiceRegistry.RegistryQueue", 0);
    uint64_t v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 3), &INImageServiceRegistryQueueSpecificKey, v2, 0);
  }
  return (INImageServiceRegistry *)v2;
}

uint64_t __40__INImageServiceRegistry_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

- (id)imageStorageServiceForServiceIdentifier:(id)a3
{
  id v3 = [(INImageServiceRegistry *)self imageServiceForServiceIdentifier:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 conformsToProtocol:&unk_1EDBB3D98]) {
      id v3 = v4;
    }
    else {
      id v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (NSArray)imageStorageServices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__68995;
  id v10 = __Block_byref_object_dispose__68996;
  id v11 = 0;
  registryQueue = self->_registryQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__INImageServiceRegistry_INImageStorageServiceRegistry__imageStorageServices__block_invoke;
  v5[3] = &unk_1E551B170;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(registryQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __77__INImageServiceRegistry_INImageStorageServiceRegistry__imageStorageServices__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "if_compactMap:", &__block_literal_global_91);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

id __77__INImageServiceRegistry_INImageStorageServiceRegistry__imageStorageServices__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 conformsToProtocol:&unk_1EDBB3D98]) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (id)imageLoaderForServiceIdentifier:(id)a3
{
  uint64_t v3 = [(INImageServiceRegistry *)self imageServiceForServiceIdentifier:a3];
  id v4 = v3;
  if (v3)
  {
    if ([v3 conformsToProtocol:&unk_1EDBE6380]) {
      uint64_t v3 = v4;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (NSArray)imageLoaders
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__68995;
  id v10 = __Block_byref_object_dispose__68996;
  id v11 = 0;
  registryQueue = self->_registryQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__INImageServiceRegistry_INImageLoaderRegistry__imageLoaders__block_invoke;
  v5[3] = &unk_1E551B170;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(registryQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __61__INImageServiceRegistry_INImageLoaderRegistry__imageLoaders__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "if_compactMap:", &__block_literal_global_26);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

id __61__INImageServiceRegistry_INImageLoaderRegistry__imageLoaders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 conformsToProtocol:&unk_1EDBE6380]) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

@end