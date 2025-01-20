@interface HMDHAP2Storage
- (HAP2StorageDelegate)delegate;
- (HMDHAP2Storage)initWithAccessoryBrowser:(id)a3;
- (void)_removeKeysForIdentifiers:(id)a3 completion:(id)a4;
- (void)deregisterPairedAccessoryWithIdentifier:(id)a3;
- (void)fetchCacheForIdentifier:(id)a3 completion:(id)a4;
- (void)fetchControllerKeyForDeviceId:(id)a3 completion:(id)a4;
- (void)fetchKeysForIdentifiers:(id)a3 completion:(id)a4;
- (void)hasKeysForIdentifiers:(id)a3 completion:(id)a4;
- (void)registerPairedAccessoryWithIdentifier:(id)a3;
- (void)removeCacheForIdentifier:(id)a3 completion:(id)a4;
- (void)removeControllerKeyWithCompletion:(id)a3;
- (void)removeKeysForIdentifiers:(id)a3 completion:(id)a4;
- (void)resetPairedAccessoryIdentifiers;
- (void)saveCacheForIdentifier:(id)a3 data:(id)a4 completion:(id)a5;
- (void)saveControllerIdentity:(id)a3 completion:(id)a4;
- (void)saveKeysForIdentifiers:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HMDHAP2Storage

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessoryBrowser);
  objc_storeStrong((id *)&self->_registeredIdentifiers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HAP2StorageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HAP2StorageDelegate *)WeakRetained;
}

- (void)saveKeysForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke_2;
  v15[3] = &unk_264A14830;
  v3 = *(void **)(a1 + 32);
  v15[4] = *(void *)(a1 + 40);
  id v4 = v2;
  id v16 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v15];
  uint64_t v5 = *(void *)(a1 + 48);
  if ([v4 count])
  {
    id v6 = (void *)[v4 copy];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
  id v7 = [*(id *)(a1 + 40) delegate];
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke_3;
    v11[3] = &unk_264A14858;
    id v12 = v4;
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 40);
    id v13 = v9;
    uint64_t v14 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

void __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id v6 = (void *)v6[3];
  }
  id v7 = v6;
  id v8 = a3;
  id v9 = [v5 deviceIDString];
  id v14 = 0;
  char v10 = [v7 savePublicKey:v8 forAccessoryName:v9 error:&v14];

  id v11 = v14;
  if (v10)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      id v13 = *(void **)(v12 + 32);
    }
    else {
      id v13 = 0;
    }
    [v13 addObject:v5];
  }
  else
  {
    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v5];
  }
}

void __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (!v3) {
    [*(id *)(a1 + 40) storage:*(void *)(a1 + 48) didSaveKeyWithIdentifier:v4];
  }
}

- (void)removeCacheForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDHAP2Storage_removeCacheForIdentifier_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __54__HMDHAP2Storage_removeCacheForIdentifier_completion___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  if (v2 && (id WeakRetained = objc_loadWeakRetained((id *)(v2 + 40))) != 0)
  {
    id v4 = WeakRetained;
    [WeakRetained removeAccessoryCacheForIdentifier:a1[5]];
    id v5 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    hap2LogInitialize();
    id v6 = *MEMORY[0x263F35B48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F35B48], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[5];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_error_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "Storage: Unable to remove cache for %@", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = a1[6];
    id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    id v5 = *(void (**)(void))(v7 + 16);
  }
  v5();
}

- (void)saveCacheForIdentifier:(id)a3 data:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__HMDHAP2Storage_saveCacheForIdentifier_data_completion___block_invoke;
  v16[3] = &unk_264A2EE30;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v11;
  id v15 = v8;
  dispatch_async(workQueue, v16);
}

void __57__HMDHAP2Storage_saveCacheForIdentifier_data_completion___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  if (v2 && (id WeakRetained = objc_loadWeakRetained((id *)(v2 + 40))) != 0)
  {
    id v4 = WeakRetained;
    [WeakRetained saveAccessoryCache:a1[6] forIdentifier:a1[5]];
    id v5 = *(void (**)(void))(a1[7] + 16);
  }
  else
  {
    hap2LogInitialize();
    id v6 = *MEMORY[0x263F35B48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F35B48], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[5];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_error_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "Storage: Unable to save cache for %@", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = a1[7];
    id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    id v5 = *(void (**)(void))(v7 + 16);
  }
  v5();
}

- (void)fetchCacheForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDHAP2Storage_fetchCacheForIdentifier_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __53__HMDHAP2Storage_fetchCacheForIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (id WeakRetained = objc_loadWeakRetained((id *)(v2 + 40))) != 0)
  {
    id v4 = WeakRetained;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__HMDHAP2Storage_fetchCacheForIdentifier_completion___block_invoke_16;
    v9[3] = &unk_264A14808;
    uint64_t v5 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v4 fetchAccessoryCacheForIdentifier:v5 completion:v9];
  }
  else
  {
    hap2LogInitialize();
    id v6 = *MEMORY[0x263F35B48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F35B48], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "Storage: Unable to retrieve cache for %@", buf, 0xCu);
    }
    uint64_t v7 = *(void *)(a1 + 48);
    id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v4);
  }
}

void __53__HMDHAP2Storage_fetchCacheForIdentifier_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = 0;
  }
  else
  {
    v3 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveControllerIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF498];
  id v10 = NSString;
  uint64_t v11 = NSStringFromSelector(a2);
  uint64_t v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)_removeKeysForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  uint64_t v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__HMDHAP2Storage__removeKeysForIdentifiers_completion___block_invoke;
  v13[3] = &unk_264A14790;
  v13[4] = self;
  id v10 = v9;
  id v14 = v10;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
  if (![v10 count])
  {

    id v10 = 0;
  }
  uint64_t v11 = (void *)[v10 copy];
  v8[2](v8, v11);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__HMDHAP2Storage__removeKeysForIdentifiers_completion___block_invoke_2;
  v12[3] = &unk_264A147E0;
  v12[4] = self;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);
}

void __55__HMDHAP2Storage__removeKeysForIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[3];
  }
  uint64_t v5 = v4;
  id v6 = [v3 deviceIDString];
  id v11 = 0;
  char v7 = [v5 removeAccessoryKeyForName:v6 error:&v11];
  id v8 = v11;

  if (v7)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      id v10 = *(void **)(v9 + 32);
    }
    else {
      id v10 = 0;
    }
    [v10 removeObject:v3];
  }
  else
  {
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v3];
  }
}

void __55__HMDHAP2Storage__removeKeysForIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 storage:*(void *)(a1 + 32) didRemoveKeyWithIdentifier:v4];
}

- (void)removeKeysForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDHAP2Storage_removeKeysForIdentifiers_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

uint64_t __54__HMDHAP2Storage_removeKeysForIdentifiers_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeKeysForIdentifiers:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)removeControllerKeyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)fetchKeysForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDHAP2Storage_fetchKeysForIdentifiers_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __53__HMDHAP2Storage_fetchKeysForIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__HMDHAP2Storage_fetchKeysForIdentifiers_completion___block_invoke_2;
  v10[3] = &unk_264A147B8;
  id v4 = *(void **)(a1 + 32);
  v10[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v11 = v5;
  id v12 = v2;
  id v6 = v2;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);
  if (![v5 count])
  {

    id v5 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = (void *)[v6 copy];
  id v9 = (void *)[v5 copy];
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v9);
}

void __53__HMDHAP2Storage_fetchKeysForIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v13 = 0;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[3];
  }
  id v5 = v4;
  id v6 = [v3 deviceIDString];
  id v12 = 0;
  uint64_t v7 = [v5 readPublicKeyForAccessoryName:v6 registeredWithHomeKit:&v13 error:&v12];
  id v8 = v12;

  if (v7)
  {
    if (!v13)
    {
      id v11 = [MEMORY[0x263F087E8] hapErrorWithCode:1];
      [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v3];

      goto LABEL_9;
    }
    id v9 = *(void **)(a1 + 48);
    id v10 = v7;
  }
  else
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = v8;
  }
  [v9 setObject:v10 forKeyedSubscript:v3];
LABEL_9:
}

- (void)fetchControllerKeyForDeviceId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HMDHAP2Storage_fetchControllerKeyForDeviceId_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __59__HMDHAP2Storage_fetchControllerKeyForDeviceId_completion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  id v3 = (void *)a1[5];
  id v4 = v2;
  id v5 = [v3 deviceIDString];
  id v8 = 0;
  id v6 = [v4 readControllerPairingKeyForAccessory:v5 error:&v8];
  id v7 = v8;

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)hasKeysForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__HMDHAP2Storage_hasKeysForIdentifiers_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __51__HMDHAP2Storage_hasKeysForIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __51__HMDHAP2Storage_hasKeysForIdentifiers_completion___block_invoke_2;
  id v11 = &unk_264A14790;
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v12 = v2;
  uint64_t v13 = v3;
  id v5 = v2;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v8);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
}

void __51__HMDHAP2Storage_hasKeysForIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = NSNumber;
  id v5 = *(void **)(a1 + 40);
  if (v5) {
    id v5 = (void *)v5[4];
  }
  uint64_t v6 = v5;
  id v7 = a2;
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "containsObject:", v7));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__HMDHAP2Storage_setDelegate___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

id __30__HMDHAP2Storage_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)deregisterPairedAccessoryWithIdentifier:(id)a3
{
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HMDHAP2Storage_deregisterPairedAccessoryWithIdentifier___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __58__HMDHAP2Storage_deregisterPairedAccessoryWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F359A0]) initWithDeviceIDString:*(void *)(a1 + 32)];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      id v4 = *(void **)(v3 + 32);
    }
    else {
      id v4 = 0;
    }
    [v4 removeObject:v2];
    id v5 = *(void **)(a1 + 40);
    id v6 = [MEMORY[0x263EFFA08] setWithObject:v2];
    [v5 _removeKeysForIdentifiers:v6 completion:&__block_literal_global_487];
  }
  else
  {
    hap2LogInitialize();
    id v7 = *MEMORY[0x263F35B50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F35B50], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_debug_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "Ignoring invalid deregistered device ID: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

uint64_t __58__HMDHAP2Storage_deregisterPairedAccessoryWithIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_8];
}

void __58__HMDHAP2Storage_deregisterPairedAccessoryWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  hap2LogInitialize();
  id v6 = *MEMORY[0x263F35B50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F35B50], OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_debug_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "remove key id=%@ error=%@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)registerPairedAccessoryWithIdentifier:(id)a3
{
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMDHAP2Storage_registerPairedAccessoryWithIdentifier___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __56__HMDHAP2Storage_registerPairedAccessoryWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F359A0]) initWithDeviceIDString:*(void *)(a1 + 32)];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      id v4 = *(void **)(v3 + 32);
    }
    else {
      id v4 = 0;
    }
    [v4 addObject:v2];
    id v5 = [*(id *)(a1 + 40) delegate];
    [v5 storage:*(void *)(a1 + 40) didSaveKeyWithIdentifier:v2];
  }
  else
  {
    hap2LogInitialize();
    id v6 = *MEMORY[0x263F35B50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F35B50], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_debug_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "Ignoring invalid registered device ID: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)resetPairedAccessoryIdentifiers
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HMDHAP2Storage_resetPairedAccessoryIdentifiers__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __49__HMDHAP2Storage_resetPairedAccessoryIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 32);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 removeAllObjects];
}

- (HMDHAP2Storage)initWithAccessoryBrowser:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDHAP2Storage;
  id v5 = [(HMDHAP2Storage *)&v16 init];
  if (v5)
  {
    id v6 = (const char *)HMFDispatchQueueName();
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263F35AD0] systemStore];
    storage = v5->_storage;
    v5->_storage = (HAPSystemKeychainStore *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    registeredIdentifiers = v5->_registeredIdentifiers;
    v5->_registeredIdentifiers = (NSMutableSet *)v12;

    objc_storeWeak((id *)&v5->_accessoryBrowser, v4);
    id v14 = v5;
  }

  return v5;
}

@end