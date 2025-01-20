@interface HAP2AccessoryServerPairingDriverMFiCertWorkItem
+ (id)checkCertificate;
- (NSError)cancelError;
- (void)cancelWithError:(id)a3;
- (void)runForPairingDriver:(id)a3;
- (void)setCancelError:(id)a3;
@end

@implementation HAP2AccessoryServerPairingDriverMFiCertWorkItem

+ (id)checkCertificate
{
  v2 = objc_opt_new();

  return v2;
}

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

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HAP2AccessoryServerPairingDriverMFiCertWorkItem_cancelWithError___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__HAP2AccessoryServerPairingDriverMFiCertWorkItem_cancelWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setCancelError:*(void *)(a1 + 32)];
    [v3 finishWithError:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)runForPairingDriver:(id)a3
{
  id v4 = a3;
  v5 = [v4 pairingSession];
  id v6 = [v5 getCertificate];

  v7 = [v4 delegate];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = [MEMORY[0x1E4F653F0] currentActivity];
    objc_initWeak(&location, self);
    v10 = [v4 accessoryServer];
    v11 = [v10 model];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__HAP2AccessoryServerPairingDriverMFiCertWorkItem_runForPairingDriver___block_invoke;
    v14[3] = &unk_1E69F0950;
    objc_copyWeak(&v18, &location);
    id v12 = v9;
    id v15 = v12;
    id v16 = v4;
    id v13 = v8;
    id v17 = v13;
    [v7 pairingDriver:v16 validatePairingCert:v6 model:v11 completion:v14];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    [(HAP2AccessoryServerPairingDriverWorkItem *)self finishWithError:v13];
  }
}

void __71__HAP2AccessoryServerPairingDriverMFiCertWorkItem_runForPairingDriver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    v7 = [v5 accessoryServer];
    [v7 model];

    id v8 = NSNumber;
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:*(void *)(a1 + 48)];
    id v10 = (id)objc_msgSend(v8, "numberWithDouble:");

    [v3 domain];
    [v3 code];

    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __71__HAP2AccessoryServerPairingDriverMFiCertWorkItem_runForPairingDriver___block_invoke_2;
    id v16 = &unk_1E69F46E0;
    id v17 = WeakRetained;
    id v18 = v3;
    v11 = (void *)MEMORY[0x1D944E2D0](&v13);
    id v12 = objc_msgSend(WeakRetained, "operationQueue", v13, v14, v15, v16, v17);
    [v12 addBlock:v11];
  }
}

void __71__HAP2AccessoryServerPairingDriverMFiCertWorkItem_runForPairingDriver___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cancelError];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 finishWithError:v4];
  }
}

@end