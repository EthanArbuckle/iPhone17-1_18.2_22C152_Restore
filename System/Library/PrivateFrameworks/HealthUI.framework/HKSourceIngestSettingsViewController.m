@interface HKSourceIngestSettingsViewController
- (HKSourceIngestSettingsViewController)initWithHealthStore:(id)a3 displayTypeController:(id)a4 source:(id)a5 useInsetStyling:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HKSourceIngestSettingsViewController

- (HKSourceIngestSettingsViewController)initWithHealthStore:(id)a3 displayTypeController:(id)a4 source:(id)a5 useInsetStyling:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a5;
  v12 = [(_HKIngestSettingsViewController *)self _initWithHealthStore:a3 displayTypeController:a4 useInsetStyling:v6];
  v13 = (HKSourceIngestSettingsViewController *)v12;
  if (v12)
  {
    v14 = v12 + 135;
    objc_storeStrong(v12 + 135, a5);
    v15 = [*v14 name];
    [(HKSourceIngestSettingsViewController *)v13 setTitle:v15];

    id v16 = objc_alloc(MEMORY[0x1E4F29128]);
    v17 = [*v14 bundleIdentifier];
    v18 = (void *)[v16 initWithUUIDString:v17];
    [(_HKIngestSettingsViewController *)v13 setDeviceIdentifier:v18];
  }
  return v13;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HKSourceIngestSettingsViewController;
  [(_HKIngestSettingsViewController *)&v8 viewDidLoad];
  v3 = [MEMORY[0x1E4F2B3C0] predicateForObjectsFromSource:self->_source];
  id v4 = objc_alloc(MEMORY[0x1E4F2B968]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HKSourceIngestSettingsViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E6D53980;
  v7[4] = self;
  v5 = (void *)[v4 initWithPredicate:v3 resultsHandler:v7];
  BOOL v6 = [(_HKIngestSettingsViewController *)self healthStore];
  [v6 executeQuery:v5];
}

void __51__HKSourceIngestSettingsViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a3)
  {
    [*(id *)(a1 + 32) reloadData:a3];
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __51__HKSourceIngestSettingsViewController_viewDidLoad__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
}

- (void).cxx_destruct
{
}

void __51__HKSourceIngestSettingsViewController_viewDidLoad__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Source sample types not returned: %@", (uint8_t *)&v2, 0xCu);
}

@end