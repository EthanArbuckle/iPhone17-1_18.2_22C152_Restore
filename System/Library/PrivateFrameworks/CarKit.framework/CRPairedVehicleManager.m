@interface CRPairedVehicleManager
- (BOOL)removeVehicle:(id)a3;
- (CRCarKitServiceClient)serviceClient;
- (CRPairedVehicleManager)init;
- (id)_firstVehicleMatchingTest:(id)a3;
- (id)allVehicles;
- (id)pairedVehicles;
- (id)saveVehicle:(id)a3;
- (id)vehicleForBluetoothAddress:(id)a3;
- (id)vehicleForCertificateSerial:(id)a3;
- (id)vehicleNameForWiFiUUID:(id)a3;
- (void)fetchAllVehiclesWithCompletion:(id)a3;
- (void)fetchPairedVehiclesWithCompletion:(id)a3;
- (void)removeVehicle:(id)a3 completion:(id)a4;
- (void)saveVehicle:(id)a3 completion:(id)a4;
- (void)setServiceClient:(id)a3;
- (void)syncFetchAllVehiclesWithCompletion:(id)a3;
@end

@implementation CRPairedVehicleManager

- (void)fetchPairedVehiclesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CRPairedVehicleManager_fetchPairedVehiclesWithCompletion___block_invoke;
  v6[3] = &unk_1E5E3AB10;
  id v7 = v4;
  id v5 = v4;
  [(CRPairedVehicleManager *)self fetchAllVehiclesWithCompletion:v6];
}

- (void)fetchAllVehiclesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRPairedVehicleManager *)self serviceClient];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke;
  v9[3] = &unk_1E5E3ADE0;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5E3A910;
  id v8 = v10;
  id v6 = v10;
  [v5 performServiceBlock:v9 errorHandler:v7];
}

- (CRCarKitServiceClient)serviceClient
{
  return self->_serviceClient;
}

- (CRPairedVehicleManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRPairedVehicleManager;
  v2 = [(CRPairedVehicleManager *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(CRCarKitServiceClient);
    [(CRPairedVehicleManager *)v2 setServiceClient:v3];
  }
  return v2;
}

- (void)setServiceClient:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)syncFetchAllVehiclesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRPairedVehicleManager *)self serviceClient];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke;
  v9[3] = &unk_1E5E3ADE0;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5E3A910;
  id v8 = v10;
  id v6 = v10;
  [v5 performSynchronousServiceBlock:v9 errorHandler:v7];
}

void __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E3ADB8;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchAllVehiclesWithReply:v3];
}

void __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = [a2 allObjects];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

uint64_t __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E3ADB8;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchAllVehiclesWithReply:v3];
}

void __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = [a2 allObjects];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

uint64_t __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __60__CRPairedVehicleManager_fetchPairedVehiclesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_7];
    id v7 = [v10 filteredArrayUsingPredicate:v6];

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v5);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v5);
    }
  }
}

uint64_t __60__CRPairedVehicleManager_fetchPairedVehiclesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isPaired];
}

- (void)saveVehicle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRPairedVehicleManager *)self serviceClient];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__CRPairedVehicleManager_saveVehicle_completion___block_invoke;
  v13[3] = &unk_1E5E3AB38;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__CRPairedVehicleManager_saveVehicle_completion___block_invoke_2;
  v11[3] = &unk_1E5E3A910;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [v8 performServiceBlock:v13 errorHandler:v11];
}

uint64_t __49__CRPairedVehicleManager_saveVehicle_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 saveVehicle:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

uint64_t __49__CRPairedVehicleManager_saveVehicle_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)removeVehicle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRPairedVehicleManager *)self serviceClient];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__CRPairedVehicleManager_removeVehicle_completion___block_invoke;
  v13[3] = &unk_1E5E3AB38;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__CRPairedVehicleManager_removeVehicle_completion___block_invoke_2;
  v11[3] = &unk_1E5E3A910;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [v8 performServiceBlock:v13 errorHandler:v11];
}

uint64_t __51__CRPairedVehicleManager_removeVehicle_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeVehicle:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

uint64_t __51__CRPairedVehicleManager_removeVehicle_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (id)_firstVehicleMatchingTest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  id v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CRPairedVehicleManager__firstVehicleMatchingTest___block_invoke;
  v8[3] = &unk_1E5E3AE28;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(CRPairedVehicleManager *)self syncFetchAllVehiclesWithCompletion:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__CRPairedVehicleManager__firstVehicleMatchingTest___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 indexOfObjectPassingTest:*(void *)(a1 + 32)];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v7 objectAtIndexedSubscript:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)vehicleForBluetoothAddress:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CRPairedVehicleManager_vehicleForBluetoothAddress___block_invoke;
  v8[3] = &unk_1E5E3AE50;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(CRPairedVehicleManager *)self _firstVehicleMatchingTest:v8];

  return v6;
}

uint64_t __53__CRPairedVehicleManager_vehicleForBluetoothAddress___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 bluetoothAddress];
  if (v7)
  {
    uint64_t v8 = [v6 bluetoothAddress];
    int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

    if (v9)
    {
      uint64_t v7 = 1;
      *a4 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)vehicleNameForWiFiUUID:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__CRPairedVehicleManager_vehicleNameForWiFiUUID___block_invoke;
  v9[3] = &unk_1E5E3AE50;
  id v10 = v4;
  id v5 = v4;
  id v6 = [(CRPairedVehicleManager *)self _firstVehicleMatchingTest:v9];
  uint64_t v7 = [v6 vehicleName];

  return v7;
}

uint64_t __49__CRPairedVehicleManager_vehicleNameForWiFiUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 carplayWiFiUUID];
  if (v7)
  {
    uint64_t v8 = [v6 carplayWiFiUUID];
    int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

    if (v9)
    {
      uint64_t v7 = 1;
      *a4 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)vehicleForCertificateSerial:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CRPairedVehicleManager_vehicleForCertificateSerial___block_invoke;
  v8[3] = &unk_1E5E3AE50;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(CRPairedVehicleManager *)self _firstVehicleMatchingTest:v8];

  return v6;
}

uint64_t __54__CRPairedVehicleManager_vehicleForCertificateSerial___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 certificateSerialNumber];
  if (v7)
  {
    uint64_t v8 = [v6 certificateSerialNumber];
    int v9 = [v8 isEqualToData:*(void *)(a1 + 32)];

    if (v9)
    {
      uint64_t v7 = 1;
      *a4 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)saveVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__CRPairedVehicleManager_saveVehicle___block_invoke;
  v10[3] = &unk_1E5E3AE78;
  id v12 = &v13;
  id v6 = v5;
  uint64_t v11 = v6;
  [(CRPairedVehicleManager *)self saveVehicle:v4 completion:v10];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __38__CRPairedVehicleManager_saveVehicle___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)removeVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__CRPairedVehicleManager_removeVehicle___block_invoke;
  v9[3] = &unk_1E5E3AEA0;
  uint64_t v11 = &v12;
  id v6 = v5;
  id v10 = v6;
  [(CRPairedVehicleManager *)self removeVehicle:v4 completion:v9];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  LOBYTE(self) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

intptr_t __40__CRPairedVehicleManager_removeVehicle___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)allVehicles
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  char v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__CRPairedVehicleManager_allVehicles__block_invoke;
  v8[3] = &unk_1E5E3AEC8;
  id v10 = &v11;
  id v4 = v3;
  int v9 = v4;
  [(CRPairedVehicleManager *)self fetchAllVehiclesWithCompletion:v8];
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v4, v5);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __37__CRPairedVehicleManager_allVehicles__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)pairedVehicles
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  char v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__CRPairedVehicleManager_pairedVehicles__block_invoke;
  v8[3] = &unk_1E5E3AEC8;
  id v10 = &v11;
  id v4 = v3;
  int v9 = v4;
  [(CRPairedVehicleManager *)self fetchPairedVehiclesWithCompletion:v8];
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v4, v5);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __40__CRPairedVehicleManager_pairedVehicles__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end