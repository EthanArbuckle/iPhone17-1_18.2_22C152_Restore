@interface MXExtensionDispatchCenter
@end

@implementation MXExtensionDispatchCenter

uint64_t __55___MXExtensionDispatchCenter_dispatchExtensions_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __55___MXExtensionDispatchCenter_dispatchExtensions_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __57___MXExtensionDispatchCenter_addExtensionsUpdateHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = (id)MEMORY[0x18C139AE0](*(void *)(a1 + 40));
  [v1 addObject:v2];
}

void __59___MXExtensionDispatchCenter_removeExtensionUpdateHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = (id)MEMORY[0x18C139AE0](*(void *)(a1 + 40));
  [v1 removeObject:v2];
}

@end