@interface HUServiceDetailsExportDiagnosticsItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsExportDiagnosticsItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  uint64_t v38 = *MEMORY[0x1E4F68AB8];
  v4 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsExportAnalyticsKey", @"HUServiceDetailsExportAnalyticsKey", 1);
  v39[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = HFPreferencesBooleanValueForKey();
  v8 = NSNumber;
  v9 = [(HUServiceDetailsAbstractItem *)self sourceAccessory];
  unsigned int v10 = objc_msgSend(v9, "hf_isHomePod") ^ 1;
  if (v7 == 2) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 1;
  }
  v12 = [v8 numberWithInt:v11];
  uint64_t v13 = *MEMORY[0x1E4F68B10];
  [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v14 = [(HUServiceDetailsAbstractItem *)self sourceAccessory];
  v15 = [v14 mediaProfile];

  v16 = objc_msgSend(v15, "hf_settingsAdapterManager");
  v17 = [v16 adapterForIdentifier:*MEMORY[0x1E4F67FA8]];
  if ([v17 conformsToProtocol:&unk_1F1AD9270]) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  id v20 = v19;
  if ([v20 conformsToProtocol:&unk_1F1AD9270]) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  id v22 = v21;

  v23 = [v22 inProgressButtonPressFutureForKeyPath:*MEMORY[0x1E4F68520]];

  [v6 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F68898]];
  if (v23) {
    uint64_t v24 = [v23 isFinished] ^ 1;
  }
  else {
    uint64_t v24 = 0;
  }
  v25 = [NSNumber numberWithBool:v24];
  [v6 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  v26 = HFLogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v27 = v7 == 2;
    v28 = [v6 objectForKeyedSubscript:v13];
    v33[0] = 67109634;
    v33[1] = v27;
    __int16 v34 = 2112;
    v35 = v28;
    __int16 v36 = 1024;
    int v37 = v24;
    _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "User has the HomePod Sysdiagnose profile installed: %{BOOL}d, Show export diagnostics button: %@, isOperationInProgress: %{BOOL}d", (uint8_t *)v33, 0x18u);
  }
  v29 = (void *)MEMORY[0x1E4F7A0D8];
  v30 = [MEMORY[0x1E4F69228] outcomeWithResults:v6];
  v31 = [v29 futureWithResult:v30];

  return v31;
}

@end