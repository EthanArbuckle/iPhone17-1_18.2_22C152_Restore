@interface CATSharingDeviceDiscovery
- (BOOL)invalidated;
- (CATSharingDeviceDiscovery)initWithDiscoveryPrimitives:(id)a3 delegate:(id)a4 delegateOperationQueue:(id)a5;
- (NSArray)nearbyDevices;
- (id)pairingTerminalForDevice:(id)a3;
- (void)_activate;
- (void)_invalidateWithError:(id)a3;
- (void)activate;
- (void)addPrimitiveHandlers;
- (void)deviceFound:(id)a3;
- (void)deviceLost:(id)a3;
- (void)invalidate;
- (void)removePrimitiveHandlers;
- (void)setInvalidated:(BOOL)a3;
- (void)setNearbyDevices:(id)a3;
@end

@implementation CATSharingDeviceDiscovery

- (CATSharingDeviceDiscovery)initWithDiscoveryPrimitives:(id)a3 delegate:(id)a4 delegateOperationQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CATSharingDeviceDiscovery;
  v12 = [(CATSharingDeviceDiscovery *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mDiscoveryPrimitives, a3);
    objc_storeWeak((id *)&v13->mDelegate, v10);
    objc_storeStrong((id *)&v13->mDelegationQueue, a5);
    nearbyDevices = v13->_nearbyDevices;
    v13->_nearbyDevices = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v13;
}

- (void)activate
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__CATSharingDeviceDiscovery_activate__block_invoke;
  v4[3] = &unk_2641DBCB0;
  objc_copyWeak(&v5, &location);
  v2 = v4;
  v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_10;
  block[3] = &unk_2641DBD98;
  id v8 = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__CATSharingDeviceDiscovery_activate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _activate];
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__CATSharingDeviceDiscovery_invalidate__block_invoke;
  v4[3] = &unk_2641DBCB0;
  objc_copyWeak(&v5, &location);
  v2 = v4;
  v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_10;
  block[3] = &unk_2641DBD98;
  id v8 = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__CATSharingDeviceDiscovery_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = CATErrorWithCodeAndUserInfo(701, 0);
  [WeakRetained _invalidateWithError:v1];
}

- (id)pairingTerminalForDevice:(id)a3
{
  id v5 = a3;
  v6 = [(CATSharingDeviceDiscovery *)self nearbyDevices];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"CATSharingDeviceDiscovery.m" lineNumber:82 description:@"Device is not present in nearbyDevices"];
  }
  id v8 = [(CATSharingDiscoveryPrimitives *)self->mDiscoveryPrimitives sessionForDevice:v5];
  id v9 = [[CATDeviceSessionBackedDevicePairingTerminal alloc] initWithDeviceSession:v8];

  return v9;
}

- (void)_activate
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if ([(CATSharingDeviceDiscovery *)self invalidated])
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CATSharingDeviceDiscovery.m" lineNumber:96 description:@"Terminal must not be invalidated"];
  }
  id v5 = _CATLogGeneral_4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v14 = v7;
    __int16 v15 = 2114;
    objc_super v16 = v8;
    _os_log_impl(&dword_213B7F000, v5, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  mDiscoveryPrimitives = self->mDiscoveryPrimitives;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__CATSharingDeviceDiscovery__activate__block_invoke;
  v11[3] = &unk_2641DC028;
  objc_copyWeak(&v12, (id *)buf);
  [(CATSharingDiscoveryPrimitives *)mDiscoveryPrimitives activateWithCompletion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __38__CATSharingDeviceDiscovery__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!v3) {
      [WeakRetained addPrimitiveHandlers];
    }
    v6 = (void *)v5[3];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__CATSharingDeviceDiscovery__activate__block_invoke_2;
    v7[3] = &unk_2641DC000;
    v7[4] = v5;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

void __38__CATSharingDeviceDiscovery__activate__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained deviceDiscovery:*(void *)(a1 + 32) didActivateWithError:*(void *)(a1 + 40)];
}

- (void)_invalidateWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  char v7 = _CATLogGeneral_4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_213B7F000, v7, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", buf, 0x16u);
  }
  [(CATSharingDeviceDiscovery *)self setInvalidated:1];
  [(CATSharingDeviceDiscovery *)self removePrimitiveHandlers];
  [(CATSharingDiscoveryPrimitives *)self->mDiscoveryPrimitives deactivate];
  uint64_t v18 = *MEMORY[0x263F08608];
  id v19 = v5;
  id v11 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v12 = CATErrorWithCodeAndUserInfo(700, v11);

  objc_initWeak((id *)buf, self);
  mDelegationQueue = self->mDelegationQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__CATSharingDeviceDiscovery__invalidateWithError___block_invoke;
  v15[3] = &unk_2641DC0C0;
  objc_copyWeak(&v17, (id *)buf);
  id v14 = v12;
  id v16 = v14;
  [(CATOperationQueue *)mDelegationQueue addOperationWithBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __50__CATSharingDeviceDiscovery__invalidateWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 2);
    [v3 deviceDiscovery:v4 hasInvalidated:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)addPrimitiveHandlers
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke;
  v7[3] = &unk_2641DC028;
  objc_copyWeak(&v8, &location);
  [(CATSharingDiscoveryPrimitives *)self->mDiscoveryPrimitives setInvalidationHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_3;
  v5[3] = &unk_2641DC430;
  objc_copyWeak(&v6, &location);
  [(CATSharingDiscoveryPrimitives *)self->mDiscoveryPrimitives setDeviceFoundHandler:v5];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_5;
  v3[3] = &unk_2641DC430;
  objc_copyWeak(&v4, &location);
  [(CATSharingDiscoveryPrimitives *)self->mDiscoveryPrimitives setDeviceLostHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_2;
  v7[3] = &unk_2641DC0C0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v4 = v3;
  id v8 = v4;
  id v5 = v7;
  id v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_10;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateWithError:*(void *)(a1 + 32)];
}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_4;
  v7[3] = &unk_2641DC0C0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v4 = v3;
  id v8 = v4;
  id v5 = v7;
  id v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_10;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deviceFound:*(void *)(a1 + 32)];
}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_6;
  v7[3] = &unk_2641DC0C0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v4 = v3;
  id v8 = v4;
  id v5 = v7;
  id v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_10;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deviceLost:*(void *)(a1 + 32)];
}

- (void)deviceFound:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  id v6 = [(CATSharingDeviceDiscovery *)self nearbyDevices];
  id v8 = (id)[v6 mutableCopy];

  [v8 addObject:v4];
  char v7 = (void *)[v8 copy];
  [(CATSharingDeviceDiscovery *)self setNearbyDevices:v7];
}

- (void)deviceLost:(id)a3
{
  id v4 = a3;
  id v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  id v6 = [(CATSharingDeviceDiscovery *)self nearbyDevices];
  char v7 = (void *)[v6 mutableCopy];

  [v7 removeObject:v4];
  id v8 = (void *)[v7 copy];
  [(CATSharingDeviceDiscovery *)self setNearbyDevices:v8];

  objc_initWeak(&location, self);
  mDelegationQueue = self->mDelegationQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__CATSharingDeviceDiscovery_deviceLost___block_invoke;
  v11[3] = &unk_2641DC0C0;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [(CATOperationQueue *)mDelegationQueue addOperationWithBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __40__CATSharingDeviceDiscovery_deviceLost___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 2);
    [v3 deviceDiscovery:v4 didLoseDevice:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)removePrimitiveHandlers
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(CATSharingDiscoveryPrimitives *)self->mDiscoveryPrimitives setInvalidationHandler:0];
  [(CATSharingDiscoveryPrimitives *)self->mDiscoveryPrimitives setDeviceFoundHandler:0];
  mDiscoveryPrimitives = self->mDiscoveryPrimitives;

  [(CATSharingDiscoveryPrimitives *)mDiscoveryPrimitives setDeviceLostHandler:0];
}

- (NSArray)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->mDelegationQueue, 0);
  objc_destroyWeak((id *)&self->mDelegate);

  objc_storeStrong((id *)&self->mDiscoveryPrimitives, 0);
}

@end