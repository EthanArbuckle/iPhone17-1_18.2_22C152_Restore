@interface APEndpointManagerCarPlayDelegate
- (APEndpointManagerCarPlayDelegate)initWithEndpointManager:(OpaqueFigEndpointManager *)a3;
- (void)dealloc;
- (void)setCarPlayEnabled:(BOOL)a3;
- (void)setEndpoint:(OpaqueFigEndpoint *)a3 isAllowed:(BOOL)a4;
@end

@implementation APEndpointManagerCarPlayDelegate

- (APEndpointManagerCarPlayDelegate)initWithEndpointManager:(OpaqueFigEndpointManager *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)APEndpointManagerCarPlayDelegate;
  v3 = [(APEndpointManagerCarPlayDelegate *)&v5 init];
  if (v3) {
    v3->_weakManager = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
  }
  return v3;
}

- (void)dealloc
{
  weakManager = self->_weakManager;
  if (weakManager) {
    CFRelease(weakManager);
  }
  v4.receiver = self;
  v4.super_class = (Class)APEndpointManagerCarPlayDelegate;
  [(APEndpointManagerCarPlayDelegate *)&v4 dealloc];
}

- (void)setEndpoint:(OpaqueFigEndpoint *)a3 isAllowed:(BOOL)a4
{
  uint64_t v6 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = *(NSObject **)(CMBaseObjectGetDerivedStorage() + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__APEndpointManagerCarPlayDelegate_setEndpoint_isAllowed___block_invoke;
    block[3] = &__block_descriptor_49_e5_v8__0l;
    block[4] = v7;
    block[5] = a3;
    BOOL v10 = a4;
    dispatch_sync(v8, block);
  }
}

void __58__APEndpointManagerCarPlayDelegate_setEndpoint_isAllowed___block_invoke(uint64_t a1)
{
  uint64_t BrowserContextForEndpoint = carManager_getBrowserContextForEndpoint(*(void *)(a1 + 32), *(void *)(a1 + 40));
  if (BrowserContextForEndpoint)
  {
    uint64_t v3 = BrowserContextForEndpoint;
    objc_super v4 = *(const void **)(a1 + 32);
    objc_super v5 = *(const void **)(a1 + 40);
    int v6 = *(unsigned __int8 *)(a1 + 48) ^ 1;
    carManager_updateBrowserContext(v4, v3, v5, 0, 0, -1, -1, v6);
  }
}

- (void)setCarPlayEnabled:(BOOL)a3
{
  uint64_t v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    objc_super v5 = (const void *)v4;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    APSPowerAssertionRaise();
    CFRetain(v5);
    uint64_t v7 = *(NSObject **)(DerivedStorage + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__APEndpointManagerCarPlayDelegate_setCarPlayEnabled___block_invoke;
    v8[3] = &unk_1E6892418;
    v8[4] = v10;
    v8[5] = DerivedStorage;
    BOOL v9 = a3;
    v8[6] = v5;
    dispatch_async(v7, v8);
    _Block_object_dispose(v10, 8);
  }
}

void __54__APEndpointManagerCarPlayDelegate_setCarPlayEnabled___block_invoke(uint64_t a1)
{
  if (**(unsigned char **)(a1 + 40))
  {
    APSLogErrorAt();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -16712;
  }
  else if (*(unsigned char *)(a1 + 56))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = carManager_startDiscovery();
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      APSLogErrorAt();
    }
  }
  else
  {
    carManager_stopDiscovery();
  }
  APSPowerAssertionRelease();
  v2 = *(const void **)(a1 + 48);
  CFRelease(v2);
}

@end