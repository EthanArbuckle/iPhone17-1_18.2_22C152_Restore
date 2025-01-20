@interface HAP2AccessoryServerPairingDriverAuthPromptWorkItem
+ (id)promptForType:(unint64_t)a3;
- (HAP2AccessoryServerPairingDriverAuthPromptWorkItem)initWithPermissionType:(unint64_t)a3;
- (NSError)cancelError;
- (id)description;
- (unint64_t)permissionType;
- (void)cancelWithError:(id)a3;
- (void)runForPairingDriver:(id)a3;
- (void)setCancelError:(id)a3;
@end

@implementation HAP2AccessoryServerPairingDriverAuthPromptWorkItem

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

- (unint64_t)permissionType
{
  return self->_permissionType;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)HAP2AccessoryServerPairingDriverAuthPromptWorkItem;
  v3 = [(HAP2AccessoryServerPairingDriverWorkItem *)&v10 description];
  v4 = NSString;
  unint64_t v5 = [(HAP2AccessoryServerPairingDriverAuthPromptWorkItem *)self permissionType];
  if (v5 - 1 > 3) {
    v6 = @"Unknown Type";
  }
  else {
    v6 = off_1E69F42E0[v5 - 1];
  }
  v7 = v6;
  v8 = [v4 stringWithFormat:@"%@ (%@)", v3, v7];

  return v8;
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unint64_t v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_cancelWithError___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_cancelWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCancelError:*(void *)(a1 + 32)];
  [WeakRetained finishWithError:*(void *)(a1 + 32)];
}

- (void)runForPairingDriver:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 delegate];
  if (v5)
  {
    objc_initWeak(&location, self);
    unint64_t v6 = [(HAP2AccessoryServerPairingDriverAuthPromptWorkItem *)self permissionType];
    v7 = [v4 accessoryServer];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_runForPairingDriver___block_invoke;
    v9[3] = &unk_1E69F4420;
    objc_copyWeak(&v10, &location);
    [v5 pairingDriver:v4 doesRequirePermission:v6 accessory:v7 completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    [(HAP2AccessoryServerPairingDriverWorkItem *)self finishWithError:v8];
  }
}

void __74__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_runForPairingDriver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained operationQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_runForPairingDriver___block_invoke_2;
    v8[3] = &unk_1E69F4540;
    objc_copyWeak(&v10, v4);
    id v9 = v3;
    [v7 addBlock:v8];

    objc_destroyWeak(&v10);
  }
}

void __74__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_runForPairingDriver___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained cancelError];

  if (!v2) {
    [WeakRetained finishWithError:*(void *)(a1 + 32)];
  }
}

- (HAP2AccessoryServerPairingDriverAuthPromptWorkItem)initWithPermissionType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HAP2AccessoryServerPairingDriverAuthPromptWorkItem;
  id v4 = [(HAP2AccessoryServerPairingDriverAuthPromptWorkItem *)&v8 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_permissionType = a3;
    unint64_t v6 = v4;
  }

  return v5;
}

+ (id)promptForType:(unint64_t)a3
{
  id v3 = (void *)[objc_alloc((Class)a1) initWithPermissionType:a3];

  return v3;
}

@end