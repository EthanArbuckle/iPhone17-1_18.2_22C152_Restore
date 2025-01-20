@interface HAP2AccessoryServerPairingDriverTransportControlWorkItem
+ (id)closeConnection;
+ (id)openConnection;
- (BOOL)connect;
- (HAP2AccessoryServerPairingDriverTransportControlWorkItem)initWithConnect:(BOOL)a3;
- (NSError)cancelError;
- (id)initForClosing;
- (id)initForOpening;
- (void)_finishWithError:(id)a3;
- (void)cancelWithError:(id)a3;
- (void)runForPairingDriver:(id)a3;
- (void)setCancelError:(id)a3;
@end

@implementation HAP2AccessoryServerPairingDriverTransportControlWorkItem

- (void).cxx_destruct
{
}

- (void)setCancelError:(id)a3
{
}

- (NSError)cancelError
{
  return self->_cancelError;
}

- (BOOL)connect
{
  return self->_connect;
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HAP2AccessoryServerPairingDriverTransportControlWorkItem_cancelWithError___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __76__HAP2AccessoryServerPairingDriverTransportControlWorkItem_cancelWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained cancelError];

  if (!v2)
  {
    [WeakRetained setCancelError:*(void *)(a1 + 32)];
    [WeakRetained finishWithError:*(void *)(a1 + 32)];
  }
}

- (void)_finishWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v4 assertCurrentQueue];

  v5 = [(HAP2AccessoryServerPairingDriverTransportControlWorkItem *)self cancelError];

  if (!v5) {
    [(HAP2AccessoryServerPairingDriverWorkItem *)self finishWithError:v6];
  }
}

- (void)runForPairingDriver:(id)a3
{
  id v4 = a3;
  v5 = [v4 transport];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __80__HAP2AccessoryServerPairingDriverTransportControlWorkItem_runForPairingDriver___block_invoke;
  v10 = &unk_1E69F4308;
  objc_copyWeak(&v11, &location);
  id v6 = (void *)MEMORY[0x1D944E2D0](&v7);
  if ([(HAP2AccessoryServerPairingDriverTransportControlWorkItem *)self connect]) {
    [v5 openWithCompletion:v6];
  }
  else {
    [v5 closeWithError:0 completion:v6];
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __80__HAP2AccessoryServerPairingDriverTransportControlWorkItem_runForPairingDriver___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = [WeakRetained operationQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__HAP2AccessoryServerPairingDriverTransportControlWorkItem_runForPairingDriver___block_invoke_2;
  v12[3] = &unk_1E69F4540;
  objc_copyWeak(&v14, v8);
  id v11 = v7;
  id v13 = v11;
  [v10 addBlock:v12];

  objc_destroyWeak(&v14);
}

void __80__HAP2AccessoryServerPairingDriverTransportControlWorkItem_runForPairingDriver___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishWithError:*(void *)(a1 + 32)];
}

- (id)initForClosing
{
  return [(HAP2AccessoryServerPairingDriverTransportControlWorkItem *)self initWithConnect:0];
}

- (id)initForOpening
{
  return [(HAP2AccessoryServerPairingDriverTransportControlWorkItem *)self initWithConnect:1];
}

- (HAP2AccessoryServerPairingDriverTransportControlWorkItem)initWithConnect:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAP2AccessoryServerPairingDriverTransportControlWorkItem;
  result = [(HAP2AccessoryServerPairingDriverTransportControlWorkItem *)&v5 init];
  if (result) {
    result->_connect = a3;
  }
  return result;
}

+ (id)closeConnection
{
  v2 = (void *)[objc_alloc((Class)a1) initWithConnect:0];

  return v2;
}

+ (id)openConnection
{
  v2 = (void *)[objc_alloc((Class)a1) initWithConnect:1];

  return v2;
}

@end