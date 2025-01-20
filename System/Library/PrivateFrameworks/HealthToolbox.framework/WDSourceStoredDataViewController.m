@interface WDSourceStoredDataViewController
- (BOOL)shouldShowDeleteAllDataButton;
- (BOOL)sourceHasData;
- (BOOL)sourceIsInstalled;
- (HKSource)source;
- (id)storedDataDisplayName;
- (id)storedDataPredicate;
- (void)deleteAllSourceData;
- (void)deleteAllStoredData;
- (void)deleteSource;
- (void)setSource:(id)a3;
- (void)sourceIsInstalled;
@end

@implementation WDSourceStoredDataViewController

- (BOOL)sourceIsInstalled
{
  id v4 = objc_alloc(MEMORY[0x263F01878]);
  v5 = [(WDSourceStoredDataViewController *)self source];
  v6 = [v5 bundleIdentifier];
  id v13 = 0;
  v7 = (void *)[v4 initWithBundleIdentifier:v6 allowPlaceholder:1 error:&v13];
  id v8 = v13;

  if (v7)
  {
    v9 = [v7 applicationState];
    char v10 = [v9 isInstalled];
  }
  else
  {
    if (v8)
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x263F098F8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
        [(WDSourceStoredDataViewController *)v11 sourceIsInstalled];
      }
    }
    char v10 = 0;
  }

  return v10;
}

- (BOOL)sourceHasData
{
  v2 = [(WDStoredDataByCategoryViewController *)self capturedSampleTypes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)storedDataPredicate
{
  v2 = (void *)MEMORY[0x263F0A668];
  BOOL v3 = [(WDSourceStoredDataViewController *)self source];
  id v4 = [v2 predicateForObjectsFromSource:v3];

  return v4;
}

- (id)storedDataDisplayName
{
  v2 = [(WDSourceStoredDataViewController *)self source];
  BOOL v3 = [v2 name];

  return v3;
}

- (BOOL)shouldShowDeleteAllDataButton
{
  BOOL v3 = [(WDStoredDataByCategoryViewController *)self profile];
  id v4 = [v3 healthStore];
  v5 = [v4 profileIdentifier];
  uint64_t v6 = [v5 type];

  if (v6 == 3) {
    return 0;
  }
  if ([(WDSourceStoredDataViewController *)self sourceHasData]) {
    return 1;
  }
  return ![(WDSourceStoredDataViewController *)self sourceIsInstalled];
}

- (void)deleteAllStoredData
{
  if ([(WDSourceStoredDataViewController *)self sourceIsInstalled]
    || ([(WDSourceStoredDataViewController *)self source],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 _isLocalDevice],
        v3,
        (v4 & 1) != 0))
  {
    if ([(WDSourceStoredDataViewController *)self sourceHasData])
    {
      [(WDSourceStoredDataViewController *)self deleteAllSourceData];
    }
  }
  else
  {
    [(WDSourceStoredDataViewController *)self deleteSource];
  }
}

- (void)deleteSource
{
  id v3 = objc_alloc(MEMORY[0x263F0A7B8]);
  char v4 = [(WDStoredDataByCategoryViewController *)self profile];
  v5 = [v4 healthStore];
  uint64_t v6 = (void *)[v3 initWithHealthStore:v5];

  v7 = [(WDSourceStoredDataViewController *)self source];
  id v8 = [v7 bundleIdentifier];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__WDSourceStoredDataViewController_deleteSource__block_invoke;
  v9[3] = &unk_26458DC48;
  v9[4] = self;
  [v6 deleteSourceWithBundleIdentifier:v8 completion:v9];
}

void __48__WDSourceStoredDataViewController_deleteSource__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)*MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      __48__WDSourceStoredDataViewController_deleteSource__block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)deleteAllSourceData
{
  char v4 = [(WDStoredDataByCategoryViewController *)self profile];
  id v5 = [v4 healthStore];
  uint64_t v6 = [(WDStoredDataByCategoryViewController *)self capturedSampleTypes];
  v7 = [(WDSourceStoredDataViewController *)self source];
  id v8 = [v7 bundleIdentifier];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__WDSourceStoredDataViewController_deleteAllSourceData__block_invoke;
  v9[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
  v9[4] = a2;
  [v5 deleteAllSamplesWithTypes:v6 sourceBundleIdentifier:v8 options:2 completion:v9];
}

void __55__WDSourceStoredDataViewController_deleteAllSourceData__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)*MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      __55__WDSourceStoredDataViewController_deleteAllSourceData__block_invoke_cold_1(a1, v6);
    }
  }
}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)sourceIsInstalled
{
  id v3 = a1;
  char v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0(&dword_2210D2000, v5, v6, "%@ sourceIsInstalled: %@", v7, v8, v9, v10, v11);
}

void __48__WDSourceStoredDataViewController_deleteSource__block_invoke_cold_1(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  char v4 = [v2 source];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0(&dword_2210D2000, v5, v6, "Source %@ not deleted: %@", v7, v8, v9, v10, v11);
}

void __55__WDSourceStoredDataViewController_deleteAllSourceData__block_invoke_cold_1(uint64_t a1, void *a2)
{
  v2 = *(const char **)(a1 + 32);
  id v3 = a2;
  char v4 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0(&dword_2210D2000, v5, v6, "%@ deleteAllSamplesWithTypes: %@", v7, v8, v9, v10, v11);
}

@end