@interface FAFamilyCircleRequestConnectionProvider
@end

@implementation FAFamilyCircleRequestConnectionProvider

uint64_t __58___FAFamilyCircleRequestConnectionProvider_sharedInstance__block_invoke()
{
  sharedInstance_sProvider = objc_alloc_init(_FAFamilyCircleRequestConnectionProvider);
  return MEMORY[0x1F41817F8]();
}

void __88___FAFamilyCircleRequestConnectionProvider_createResumedConnectionWithFactory_provider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained connectionWasInterrupted:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __88___FAFamilyCircleRequestConnectionProvider_createResumedConnectionWithFactory_provider___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained connectionWasInvalidated:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

@end