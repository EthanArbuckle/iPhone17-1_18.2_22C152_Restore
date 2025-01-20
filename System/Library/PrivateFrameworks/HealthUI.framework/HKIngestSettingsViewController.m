@interface HKIngestSettingsViewController
@end

@implementation HKIngestSettingsViewController

void __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  if (v5) {
    char v7 = a2;
  }
  else {
    char v7 = 1;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1057) = v7;
  *(unsigned char *)(*(void *)(a1 + 32) + 1056) = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke_278;
  block[3] = &unk_1E6D50ED8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke_278(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

void __46___HKIngestSettingsViewController_reloadData___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

void __64___HKIngestSettingsViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      *((unsigned char *)WeakRetained + 1056) = *(unsigned char *)(a1 + 40);
    }
    else
    {
      _HKInitializeLogging();
      v6 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        __64___HKIngestSettingsViewController_switchCellValueChanged_value___block_invoke_cold_1(v6, v5, a1);
      }
    }
  }
}

uint64_t __72___HKIngestSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "fetchEnabledStatusForPeripheral getEnabledStatusForPeripheral failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __64___HKIngestSettingsViewController_switchCellValueChanged_value___block_invoke_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  v6 = [a2 deviceIdentifier];
  uint64_t v7 = [a2 title];
  v8 = (void *)v7;
  int v9 = *(unsigned __int8 *)(a3 + 40);
  int v11 = 138543874;
  v12 = v6;
  if (v9) {
    v10 = @"ON";
  }
  else {
    v10 = @"OFF";
  }
  __int16 v13 = 2114;
  uint64_t v14 = v7;
  __int16 v15 = 2114;
  v16 = v10;
  _os_log_error_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_ERROR, "Could not set the enabled status of device %{public}@, '%{public}@', to %{public}@", (uint8_t *)&v11, 0x20u);
}

@end