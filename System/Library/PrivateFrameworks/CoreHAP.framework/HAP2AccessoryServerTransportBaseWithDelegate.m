@interface HAP2AccessoryServerTransportBaseWithDelegate
- (HAP2AccessoryServerTransportDelegate)delegate;
- (void)didChangeStateWithError:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HAP2AccessoryServerTransportBaseWithDelegate

- (void).cxx_destruct
{
}

- (void)didChangeStateWithError:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  v6 = [(HAP2AccessoryServerTransportBaseWithDelegate *)self delegate];
  if (v6)
  {
    unint64_t v7 = [(HAP2AccessoryServerTransportBase *)self state];
    v8 = [(HAP2AccessoryServerTransportBase *)self delegateQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__HAP2AccessoryServerTransportBaseWithDelegate_didChangeStateWithError___block_invoke;
    v9[3] = &unk_1E69F4518;
    id v10 = v6;
    v11 = self;
    unint64_t v13 = v7;
    id v12 = v4;
    dispatch_async(v8, v9);
  }
}

uint64_t __72__HAP2AccessoryServerTransportBaseWithDelegate_didChangeStateWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) transport:*(void *)(a1 + 40) didChangeState:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerTransportBase *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HAP2AccessoryServerTransportBaseWithDelegate_setDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

id __60__HAP2AccessoryServerTransportBaseWithDelegate_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (HAP2AccessoryServerTransportDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__24697;
  v11 = __Block_byref_object_dispose__24698;
  id v12 = 0;
  v3 = [(HAP2AccessoryServerTransportBase *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HAP2AccessoryServerTransportBaseWithDelegate_delegate__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerTransportDelegate *)v4;
}

uint64_t __56__HAP2AccessoryServerTransportBaseWithDelegate_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  return MEMORY[0x1F41817F8](WeakRetained, v4);
}

@end