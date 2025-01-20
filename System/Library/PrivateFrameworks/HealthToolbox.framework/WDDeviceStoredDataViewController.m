@interface WDDeviceStoredDataViewController
- (BOOL)shouldShowDeleteAllDataButton;
- (HKDevice)device;
- (NSString)displayName;
- (id)storedDataDisplayName;
- (id)storedDataPredicate;
- (void)deleteAllStoredData;
- (void)setDevice:(id)a3;
- (void)setDisplayName:(id)a3;
@end

@implementation WDDeviceStoredDataViewController

- (id)storedDataPredicate
{
  v2 = (void *)MEMORY[0x263F0A668];
  v3 = (void *)MEMORY[0x263EFFA08];
  v4 = [(WDDeviceStoredDataViewController *)self device];
  v5 = [v3 setWithObject:v4];
  v6 = [v2 predicateForObjectsFromDevices:v5];

  return v6;
}

- (id)storedDataDisplayName
{
  v3 = [(WDDeviceStoredDataViewController *)self displayName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(WDDeviceStoredDataViewController *)self device];
    id v5 = [v6 name];
  }

  return v5;
}

- (BOOL)shouldShowDeleteAllDataButton
{
  v3 = [(WDStoredDataByCategoryViewController *)self profile];
  v4 = [v3 healthStore];
  id v5 = [v4 profileIdentifier];
  uint64_t v6 = [v5 type];

  if (v6 == 3) {
    return 0;
  }
  v8 = [(WDStoredDataByCategoryViewController *)self capturedSampleTypes];
  if ([v8 count]) {
    char v7 = 1;
  }
  else {
    char v7 = [MEMORY[0x263F0A980] isAppleInternalInstall];
  }

  return v7;
}

- (void)deleteAllStoredData
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v13 = [(WDDeviceStoredDataViewController *)self storedDataPredicate];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 1;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  v4 = [(WDStoredDataByCategoryViewController *)self capturedSampleTypes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        dispatch_group_enter(v3);
        v9 = [(WDStoredDataByCategoryViewController *)self profile];
        v10 = [v9 healthStore];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke;
        v15[3] = &unk_26458E020;
        v15[4] = v8;
        v17 = v23;
        SEL v18 = a2;
        v16 = v3;
        [v10 deleteObjectsOfType:v8 predicate:v13 withCompletion:v15];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v5);
  }

  dispatch_group_leave(v3);
  v11 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_280;
  block[3] = &unk_26458DDB0;
  block[4] = self;
  block[5] = v23;
  block[6] = a2;
  dispatch_group_notify(v3, v11, block);

  _Block_object_dispose(v23, 8);
}

void __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_cold_1(a1, v7, (uint64_t)v6);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_280(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v2 = objc_alloc(MEMORY[0x263F0A300]);
    v3 = [*(id *)(a1 + 32) profile];
    v4 = [v3 healthStore];
    uint64_t v5 = (void *)[v2 initWithHealthStore:v4];

    id v6 = [*(id *)(a1 + 32) device];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_2;
    v7[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
    v7[4] = *(void *)(a1 + 48);
    [v5 deleteDevice:v6 completion:v7];
  }
}

void __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_2_cold_1(a1, v6, (uint64_t)v5);
    }
  }
}

- (HKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

void __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = *(const char **)(a1 + 56);
  id v6 = a2;
  uint64_t v7 = NSStringFromSelector(v5);
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = 138412802;
  v10 = v7;
  __int16 v11 = 2112;
  uint64_t v12 = v8;
  __int16 v13 = 2112;
  uint64_t v14 = a3;
  _os_log_error_impl(&dword_2210D2000, v6, OS_LOG_TYPE_ERROR, "%@ deleteObjectsOfType: %@ %@", (uint8_t *)&v9, 0x20u);
}

void __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = *(const char **)(a1 + 32);
  id v5 = a2;
  id v6 = NSStringFromSelector(v4);
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_2210D2000, v5, OS_LOG_TYPE_ERROR, "%@ Error deleting device: %@", (uint8_t *)&v7, 0x16u);
}

@end