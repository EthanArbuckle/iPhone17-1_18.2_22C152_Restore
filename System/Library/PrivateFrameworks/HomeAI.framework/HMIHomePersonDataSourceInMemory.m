@interface HMIHomePersonDataSourceInMemory
+ (id)shortDescription;
- (HMIHomePersonDataSourceInMemory)init;
- (NSMutableDictionary)personToFaceCrops;
- (NSMutableSet)unassociatedFaceCrops;
- (NSSet)removedPersonFaceCrops;
- (OS_dispatch_queue)workQueue;
- (id)existingFaceCropUUIDs;
- (id)existingPersonFaceCropUUIDs;
- (id)existingPersonUUIDs;
- (os_unfair_lock_s)lock;
- (void)addFaceCrops:(id)a3 completion:(id)a4;
- (void)addFaceprints:(id)a3 completion:(id)a4;
- (void)addPersonFaceCrops:(id)a3 completion:(id)a4;
- (void)addPersons:(id)a3 completion:(id)a4;
- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5 completion:(id)a6;
- (void)fetchAllFaceprintsWithCompletion:(id)a3;
- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3;
- (void)fetchAllPersonsWithCompletion:(id)a3;
- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3;
- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchSettingsWithCompletion:(id)a3;
- (void)performCloudPullWithCompletion:(id)a3;
- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4;
- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4;
@end

@implementation HMIHomePersonDataSourceInMemory

- (HMIHomePersonDataSourceInMemory)init
{
  v16.receiver = self;
  v16.super_class = (Class)HMIHomePersonDataSourceInMemory;
  v2 = [(HMIHomePersonDataSourceInMemory *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    personToFaceCrops = v3->_personToFaceCrops;
    v3->_personToFaceCrops = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    unassociatedFaceCrops = v3->_unassociatedFaceCrops;
    v3->_unassociatedFaceCrops = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x263EFFA08] set];
    removedPersonFaceCrops = v3->_removedPersonFaceCrops;
    v3->_removedPersonFaceCrops = (NSSet *)v8;

    HMIDispatchQueueNameString(v3, 0);
    id v10 = objc_claimAutoreleasedReturnValue();
    v11 = (const char *)[v10 UTF8String];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v13;
  }
  return v3;
}

- (id)existingPersonUUIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [(HMIHomePersonDataSourceInMemory *)self personToFaceCrops];
  uint64_t v6 = [v5 allKeys];
  v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_18);
  uint64_t v8 = [v4 setWithArray:v7];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

uint64_t __54__HMIHomePersonDataSourceInMemory_existingPersonUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (id)existingPersonFaceCropUUIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [MEMORY[0x263EFF9C0] set];
  v5 = [(HMIHomePersonDataSourceInMemory *)self personToFaceCrops];
  uint64_t v6 = [v5 allValues];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__HMIHomePersonDataSourceInMemory_existingPersonFaceCropUUIDs__block_invoke;
  v10[3] = &unk_26477CF80;
  id v7 = v4;
  id v11 = v7;
  objc_msgSend(v6, "na_each:", v10);

  uint64_t v8 = (void *)[v7 copy];
  os_unfair_lock_unlock(p_lock);
  return v8;
}

void __62__HMIHomePersonDataSourceInMemory_existingPersonFaceCropUUIDs__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "na_map:", &__block_literal_global_5);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 unionSet:v3];
}

uint64_t __62__HMIHomePersonDataSourceInMemory_existingPersonFaceCropUUIDs__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (id)existingFaceCropUUIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(HMIHomePersonDataSourceInMemory *)self unassociatedFaceCrops];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_9_0);

  os_unfair_lock_unlock(p_lock);
  return v5;
}

uint64_t __56__HMIHomePersonDataSourceInMemory_existingFaceCropUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (void)fetchAllFaceprintsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMIHomePersonDataSourceInMemory_fetchAllFaceprintsWithCompletion___block_invoke;
  block[3] = &unk_26477CFC8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __68__HMIHomePersonDataSourceInMemory_fetchAllFaceprintsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263EFFA08] set];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__HMIHomePersonDataSourceInMemory_fetchAllPersonFaceCropsWithCompletion___block_invoke;
  v7[3] = &unk_26477BD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__HMIHomePersonDataSourceInMemory_fetchAllPersonFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v4 = [*(id *)(a1 + 32) personToFaceCrops];
  v5 = [v4 allValues];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__HMIHomePersonDataSourceInMemory_fetchAllPersonFaceCropsWithCompletion___block_invoke_2;
  v9[3] = &unk_26477CF80;
  id v6 = v2;
  id v10 = v6;
  objc_msgSend(v5, "na_each:", v9);

  os_unfair_lock_unlock(v3);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = (void *)[v6 copy];
  (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
}

uint64_t __73__HMIHomePersonDataSourceInMemory_fetchAllPersonFaceCropsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) unionSet:a2];
}

- (void)fetchAllPersonsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HMIHomePersonDataSourceInMemory_fetchAllPersonsWithCompletion___block_invoke;
  v7[3] = &unk_26477BD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__HMIHomePersonDataSourceInMemory_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF8C0] array];
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v4 = [*(id *)(a1 + 32) personToFaceCrops];
  id v7 = [v4 allKeys];

  os_unfair_lock_unlock(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [MEMORY[0x263EFFA08] setWithArray:v7];
  (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
}

- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HMIHomePersonDataSourceInMemory_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v12 = v6;
  dispatch_queue_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __80__HMIHomePersonDataSourceInMemory_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) existingPersonUUIDs];
  LOBYTE(v3) = [v3 isSubsetOfSet:v4];

  if (v3)
  {
    uint64_t v5 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    id v6 = [*(id *)(a1 + 40) personToFaceCrops];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    dispatch_queue_t v13 = __80__HMIHomePersonDataSourceInMemory_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_2;
    id v14 = &unk_26477CFF0;
    id v15 = *(id *)(a1 + 32);
    id v7 = v2;
    id v16 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:&v11];

    os_unfair_lock_unlock(v5);
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v9 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Invalid person UUIDs"];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v9);
  }
}

void __80__HMIHomePersonDataSourceInMemory_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [a2 UUID];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5) {
    [*(id *)(a1 + 40) unionSet:v7];
  }
}

- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__HMIHomePersonDataSourceInMemory_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477CFC8;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __83__HMIHomePersonDataSourceInMemory_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263EFFA08] set];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMIHomePersonDataSourceInMemory_fetchPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v12 = v6;
  dispatch_queue_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__HMIHomePersonDataSourceInMemory_fetchPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) existingPersonUUIDs];
  LOBYTE(v2) = [v2 isSubsetOfSet:v3];

  if (v2)
  {
    id v4 = [MEMORY[0x263EFFA08] set];
    id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    id v6 = (void *)MEMORY[0x263EFFA08];
    id v7 = [*(id *)(a1 + 40) personToFaceCrops];
    uint64_t v8 = [v7 allKeys];
    id v9 = [v6 setWithArray:v8];

    os_unfair_lock_unlock(v5);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__HMIHomePersonDataSourceInMemory_fetchPersonsWithUUIDs_completion___block_invoke_2;
    v13[3] = &unk_26477D018;
    id v14 = *(id *)(a1 + 32);
    id v10 = objc_msgSend(v9, "na_filter:", v13);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Invalid person UUIDs"];
    (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v12);
  }
}

uint64_t __68__HMIHomePersonDataSourceInMemory_fetchPersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)performCloudPullWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HMIHomePersonDataSourceInMemory_performCloudPullWithCompletion___block_invoke;
  block[3] = &unk_26477CFC8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __66__HMIHomePersonDataSourceInMemory_performCloudPullWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addFaceCrops:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HMIHomePersonDataSourceInMemory_addFaceCrops_completion___block_invoke;
  block[3] = &unk_26477CFC8;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __59__HMIHomePersonDataSourceInMemory_addFaceCrops_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Not implemented"];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)addPersonFaceCrops:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMIHomePersonDataSourceInMemory_addPersonFaceCrops_completion___block_invoke;
  block[3] = &unk_26477CFC8;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __65__HMIHomePersonDataSourceInMemory_addPersonFaceCrops_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Not implemented"];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)addPersons:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HMIHomePersonDataSourceInMemory_addPersons_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v12 = v6;
  dispatch_queue_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __57__HMIHomePersonDataSourceInMemory_addPersons_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_20);
  id v3 = [*(id *)(a1 + 40) existingPersonUUIDs];
  int v4 = [v2 intersectsSet:v3];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000, @"Invalid persons, person already exists" description];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__HMIHomePersonDataSourceInMemory_addPersons_completion___block_invoke_3;
    v9[3] = &unk_26477D040;
    id v8 = *(void **)(a1 + 32);
    void v9[4] = *(void *)(a1 + 40);
    objc_msgSend(v8, "na_each:", v9);
    os_unfair_lock_unlock(v7);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __57__HMIHomePersonDataSourceInMemory_addPersons_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

void __57__HMIHomePersonDataSourceInMemory_addPersons_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a2;
  id v6 = [v3 set];
  uint64_t v5 = [*(id *)(a1 + 32) personToFaceCrops];
  [v5 setObject:v6 forKeyedSubscript:v4];
}

- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__HMIHomePersonDataSourceInMemory_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke;
  v7[3] = &unk_26477BD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __79__HMIHomePersonDataSourceInMemory_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFFA08] set];
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v4 = [*(id *)(a1 + 32) unassociatedFaceCrops];
  id v5 = (id)[v4 copy];

  os_unfair_lock_unlock(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSettingsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMIHomePersonDataSourceInMemory_fetchSettingsWithCompletion___block_invoke;
  block[3] = &unk_26477CFC8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __63__HMIHomePersonDataSourceInMemory_fetchSettingsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Not implemented"];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v12 = v6;
  dispatch_queue_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) existingPersonFaceCropUUIDs];
  LOBYTE(v2) = [v2 isSubsetOfSet:v3];

  if (v2)
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    id v6 = [*(id *)(a1 + 40) personToFaceCrops];
    id v7 = [v6 allKeys];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_2;
    v16[3] = &unk_26477D090;
    id v8 = v4;
    id v17 = v8;
    *(_OWORD *)id v14 = *(_OWORD *)(a1 + 32);
    id v9 = v14[0];
    int8x16_t v18 = vextq_s8(*(int8x16_t *)v14, *(int8x16_t *)v14, 8uLL);
    objc_msgSend(v7, "na_each:", v16);

    uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 32) setByAddingObjectsFromSet:v8];
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = v10;

    os_unfair_lock_unlock(v5);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    id v15 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Invalid faceCropUUIDs"];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v15);
  }
}

void __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 personToFaceCrops];
  id v7 = [v6 objectForKeyedSubscript:v5];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_3;
  v18[3] = &unk_26477D068;
  id v19 = *(id *)(a1 + 48);
  id v8 = objc_msgSend(v7, "na_filter:", v18);
  [v3 unionSet:v8];

  id v9 = [*(id *)(a1 + 40) personToFaceCrops];
  uint64_t v10 = [v9 objectForKeyedSubscript:v5];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_4;
  id v16 = &unk_26477D068;
  id v17 = *(id *)(a1 + 48);
  uint64_t v11 = objc_msgSend(v10, "na_filter:", &v13);
  id v12 = objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops", v13, v14, v15, v16);
  [v12 setObject:v11 forKeyedSubscript:v5];
}

uint64_t __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMIHomePersonDataSourceInMemory_removePersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __69__HMIHomePersonDataSourceInMemory_removePersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) existingPersonUUIDs];
  LOBYTE(v2) = [v2 isSubsetOfSet:v3];

  if (v2)
  {
    uint64_t v4 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    id v5 = [*(id *)(a1 + 40) personToFaceCrops];
    id v6 = [v5 allKeys];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__HMIHomePersonDataSourceInMemory_removePersonsWithUUIDs_completion___block_invoke_2;
    v11[3] = &unk_26477D0B8;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v12 = v7;
    uint64_t v13 = v8;
    objc_msgSend(v6, "na_each:", v11);

    os_unfair_lock_unlock(v4);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000, @"Invalid persons, person UUID doesn't exists" description];
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }
}

void __69__HMIHomePersonDataSourceInMemory_removePersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v14 = v3;
  id v5 = [v3 UUID];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = (void *)v6[4];
    uint64_t v8 = [v6 personToFaceCrops];
    uint64_t v9 = [v8 objectForKeyedSubscript:v14];
    uint64_t v10 = [v7 setByAddingObjectsFromSet:v9];
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = v10;

    uint64_t v13 = [*(id *)(a1 + 40) personToFaceCrops];
    [v13 removeObjectForKey:v14];
  }
}

- (void)addFaceprints:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HMIHomePersonDataSourceInMemory_addFaceprints_completion___block_invoke;
  block[3] = &unk_26477CFC8;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __60__HMIHomePersonDataSourceInMemory_addFaceprints_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__HMIHomePersonDataSourceInMemory_removeFaceprintsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477CFC8;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __72__HMIHomePersonDataSourceInMemory_removeFaceprintsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(HMIHomePersonDataSourceInMemory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke;
  block[3] = &unk_26477D180;
  id v18 = v10;
  id v19 = self;
  id v20 = v11;
  id v21 = v12;
  int64_t v22 = a5;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) existingFaceCropUUIDs];
  if ([v2 isSubsetOfSet:v3])
  {
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) existingPersonFaceCropUUIDs];
    LOBYTE(v4) = [v4 isSubsetOfSet:v5];

    if ((v4 & 1) == 0)
    {
      uint64_t v31 = *(void *)(a1 + 56);
      v32 = (void *)MEMORY[0x263F087E8];
      v33 = @"Invalid faceCropUUIDs";
      goto LABEL_8;
    }
  }
  id v6 = [*(id *)(a1 + 40) existingPersonUUIDs];
  char v7 = [v6 containsObject:*(void *)(a1 + 48)];

  if (v7)
  {
    uint64_t v8 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    id v9 = (void *)MEMORY[0x263EFF9C0];
    id v10 = [*(id *)(a1 + 40) unassociatedFaceCrops];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_2;
    v47[3] = &unk_26477D0E0;
    id v48 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 64);
    id v49 = v11;
    uint64_t v50 = v12;
    uint64_t v13 = objc_msgSend(v10, "na_map:", v47);
    id v14 = [v9 setWithSet:v13];

    id v15 = [*(id *)(a1 + 40) unassociatedFaceCrops];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_3;
    v45[3] = &unk_26477D108;
    id v46 = *(id *)(a1 + 32);
    id v16 = objc_msgSend(v15, "na_filter:", v45);
    uint64_t v17 = [v16 mutableCopy];
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = *(void **)(v18 + 24);
    *(void *)(v18 + 24) = v17;

    id v20 = [*(id *)(a1 + 40) personToFaceCrops];
    id v21 = [v20 allKeys];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_4;
    v40[3] = &unk_26477D158;
    id v22 = v14;
    id v41 = v22;
    *(_OWORD *)v34 = *(_OWORD *)(a1 + 32);
    id v23 = v34[0];
    int8x16_t v42 = vextq_s8(*(int8x16_t *)v34, *(int8x16_t *)v34, 8uLL);
    id v24 = *(id *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 64);
    id v43 = v24;
    uint64_t v44 = v25;
    objc_msgSend(v21, "na_each:", v40);

    v26 = [*(id *)(a1 + 40) personToFaceCrops];
    v27 = [v26 allKeys];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_7;
    v36[3] = &unk_26477D090;
    id v28 = *(id *)(a1 + 48);
    uint64_t v29 = *(void *)(a1 + 40);
    id v37 = v28;
    uint64_t v38 = v29;
    id v30 = v22;
    id v39 = v30;
    objc_msgSend(v27, "na_each:", v36);

    os_unfair_lock_unlock(v8);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    return;
  }
  uint64_t v31 = *(void *)(a1 + 56);
  v32 = (void *)MEMORY[0x263F087E8];
  v33 = @"Invalid personUUID";
LABEL_8:
  v35 = [v32 hmiPrivateErrorWithCode:1000 description:v33];
  (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v35);
}

HMIPersonFaceCrop *__101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  id v5 = [v3 UUID];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = [HMIPersonFaceCrop alloc];
    char v7 = [v3 UUID];
    uint64_t v8 = [v3 dataRepresentation];
    id v9 = [v3 dateCreated];
    [v3 faceBoundingBox];
    id v10 = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](v6, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", v7, v8, v9, a1[5], a1[6]);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

void __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 personToFaceCrops];
  char v7 = [v6 objectForKeyedSubscript:v5];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_5;
  v20[3] = &unk_26477D130;
  id v21 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v22 = v8;
  uint64_t v23 = v9;
  id v10 = objc_msgSend(v7, "na_map:", v20);
  [v4 unionSet:v10];

  id v11 = [*(id *)(a1 + 40) personToFaceCrops];
  uint64_t v12 = [v11 objectForKeyedSubscript:v5];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_6;
  uint64_t v18 = &unk_26477D068;
  id v19 = *(id *)(a1 + 48);
  uint64_t v13 = objc_msgSend(v12, "na_filter:", &v15);
  id v14 = objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops", v15, v16, v17, v18);
  [v14 setObject:v13 forKeyedSubscript:v5];
}

HMIPersonFaceCrop *__101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  id v5 = [v3 UUID];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = [HMIPersonFaceCrop alloc];
    char v7 = [v3 UUID];
    id v8 = [v3 dataRepresentation];
    uint64_t v9 = [v3 dateCreated];
    [v3 faceBoundingBox];
    id v10 = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](v6, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", v7, v8, v9, a1[5], a1[6]);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

void __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 UUID];
  int v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) personToFaceCrops];
    id v6 = [v5 objectForKeyedSubscript:v9];
    char v7 = [v6 setByAddingObjectsFromSet:*(void *)(a1 + 48)];
    id v8 = [*(id *)(a1 + 40) personToFaceCrops];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
}

+ (id)shortDescription
{
  return @"NOT IMPLEMENTED";
}

- (NSMutableDictionary)personToFaceCrops
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableSet)unassociatedFaceCrops
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)removedPersonFaceCrops
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_removedPersonFaceCrops, 0);
  objc_storeStrong((id *)&self->_unassociatedFaceCrops, 0);
  objc_storeStrong((id *)&self->_personToFaceCrops, 0);
}

@end