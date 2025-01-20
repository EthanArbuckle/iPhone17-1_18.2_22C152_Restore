@interface HUServiceDetailsCameraSettingsReaderWriter
- (HUServiceDetailsCameraSettingsReaderWriter)initWithConfigurator:(id)a3;
- (HUServiceDetailsCameraSettingsReaderWriterConfigurator)configurator;
- (id)_fastUpdateResultsForCharacteristic:(id)a3 withTitle:(id)a4;
- (id)readWithOptions:(id)a3;
- (id)updateUserSettingsWithValue:(BOOL)a3;
- (void)setConfigurator:(id)a3;
@end

@implementation HUServiceDetailsCameraSettingsReaderWriter

- (HUServiceDetailsCameraSettingsReaderWriter)initWithConfigurator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUServiceDetailsCameraSettingsReaderWriter;
  v5 = [(HUServiceDetailsCameraSettingsReaderWriter *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_configurator, v4);
  }

  return v6;
}

- (id)readWithOptions:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];

  if (!v5)
  {
    v19 = (void *)MEMORY[0x1E4F7A0D8];
    v20 = (void *)MEMORY[0x1E4F69228];
    uint64_t v40 = *MEMORY[0x1E4F68B10];
    v41[0] = MEMORY[0x1E4F1CC38];
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    v9 = [v20 outcomeWithResults:v7];
    v18 = [v19 futureWithResult:v9];
    goto LABEL_12;
  }
  v6 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];
  v7 = [v6 cameraSettings];

  objc_super v8 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];
  v9 = [v8 characteristicForSettings:v7];

  if (!v9)
  {
    v21 = HFLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];
      *(_DWORD *)buf = 138412290;
      v39 = v22;
      _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "Failed to get characteristic for configurator:%@", buf, 0xCu);
    }
    v23 = (void *)MEMORY[0x1E4F7A0D8];
    v24 = (void *)MEMORY[0x1E4F69228];
    uint64_t v36 = *MEMORY[0x1E4F68B10];
    uint64_t v37 = MEMORY[0x1E4F1CC38];
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v25 = [v24 outcomeWithResults:v11];
    v18 = [v23 futureWithResult:v25];
    goto LABEL_10;
  }
  v10 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];
  id v11 = [v10 itemTitle];

  v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  int v13 = [v12 BOOLValue];

  if (!v13)
  {
    v26 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    v27 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];
    v25 = [v27 characteristicValueManager];

    v28 = [v25 readValuesForCharacteristics:v26];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __62__HUServiceDetailsCameraSettingsReaderWriter_readWithOptions___block_invoke;
    v31[3] = &unk_1E6387290;
    id v11 = v11;
    id v32 = v11;
    id v33 = v9;
    v34 = self;
    id v35 = v26;
    id v29 = v26;
    v18 = [v28 flatMap:v31];

LABEL_10:
    goto LABEL_11;
  }
  v14 = (void *)MEMORY[0x1E4F7A0D8];
  v15 = (void *)MEMORY[0x1E4F69228];
  v16 = [(HUServiceDetailsCameraSettingsReaderWriter *)self _fastUpdateResultsForCharacteristic:v9 withTitle:v11];
  v17 = [v15 outcomeWithResults:v16];
  v18 = [v14 futureWithResult:v17];

LABEL_11:
LABEL_12:

  return v18;
}

id __62__HUServiceDetailsCameraSettingsReaderWriter_readWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F692F0];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v6 = [NSString stringWithFormat:@"AccessoryDetails.%@", *(void *)(a1 + 40)];
  v7 = [v6 componentsSeparatedByString:@"::"];
  objc_super v8 = [v7 lastObject];
  v9 = [v8 componentsSeparatedByString:@":"];
  v10 = [v9 firstObject];
  id v11 = [v10 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F18F92B8];
  v12 = [@"AccessoryDetails." stringByAppendingString:v11];
  [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68928]];

  int v13 = [*(id *)(a1 + 48) configurator];
  v14 = [v13 itemTitleLocalizationKey];
  [v5 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68AC0]];

  v15 = [v4 responseForCharacteristic:*(void *)(a1 + 40)];

  v16 = (uint64_t *)MEMORY[0x1E4F68BC0];
  if (v15)
  {
    v17 = [v15 error];

    if (v17)
    {
      v18 = HFLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v19;
        _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Failed attempt to read value for characteristic:%@", buf, 0xCu);
      }
    }
    v20 = [v15 valueWithExpectedClass:objc_opt_class()];
    v21 = v20;
    if (v20)
    {
      v22 = NSNumber;
      [v20 BOOLValue];
      v23 = [v22 numberWithInteger:HFPrimaryStateFromBOOL()];
      [v5 setObject:v23 forKeyedSubscript:*v16];
    }
  }
  uint64_t v24 = *v16;
  v25 = [v5 objectForKeyedSubscript:*v16];

  if (!v25)
  {
    objc_opt_class();
    v26 = [*(id *)(a1 + 40) value];
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    id v28 = v27;

    id v29 = NSNumber;
    [v28 BOOLValue];
    v30 = [v29 numberWithInteger:HFPrimaryStateFromBOOL()];
    [v5 setObject:v30 forKeyedSubscript:v24];
  }
  [v5 setObject:*(void *)(a1 + 56) forKeyedSubscript:*MEMORY[0x1E4F68908]];
  v31 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v31;
}

- (id)_fastUpdateResultsForCharacteristic:(id)a3 withTitle:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v5 dictionary];
  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v9 = [NSString stringWithFormat:@"AccessoryDetails.%@", v7];
  v10 = [v9 componentsSeparatedByString:@"::"];
  id v11 = [v10 lastObject];
  v12 = [v11 componentsSeparatedByString:@":"];
  int v13 = [v12 firstObject];
  v14 = [v13 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F18F92B8];
  v15 = [@"AccessoryDetails." stringByAppendingString:v14];
  [v8 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68928]];

  objc_opt_class();
  v16 = [v7 value];
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  uint64_t v19 = NSNumber;
  [v18 BOOLValue];
  v20 = [v19 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v8 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v7, 0);

  [v8 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  return v8;
}

- (id)updateUserSettingsWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v7 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];
    objc_super v8 = [v7 cameraSettings];

    v9 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];
    v10 = [v9 characteristicForSettings:v8];

    id v11 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];
    v12 = [v11 transactionReason];

    int v13 = [NSNumber numberWithBool:v3];
    v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v25 = [v13 BOOLValue];
      __int16 v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "Attempt to update value allowed %{BOOL}d for characteristic:%@", buf, 0x12u);
    }

    v15 = [(HUServiceDetailsCameraSettingsReaderWriter *)self configurator];
    v16 = [v15 characteristicValueManager];

    [v16 beginTransactionWithReason:v12];
    id v17 = objc_alloc_init(MEMORY[0x1E4F69048]);
    [v17 setValue:v13 forCharacteristic:v10];
    id v18 = [v16 writeValuesForCharacteristics:v17];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__HUServiceDetailsCameraSettingsReaderWriter_updateUserSettingsWithValue___block_invoke;
    v22[3] = &unk_1E63856C0;
    id v19 = v6;
    id v23 = v19;
    id v20 = (id)[v18 addCompletionBlock:v22];

    [v16 commitTransactionWithReason:v12];
  }
  else
  {
    id v19 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v19;
}

uint64_t __74__HUServiceDetailsCameraSettingsReaderWriter_updateUserSettingsWithValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (HUServiceDetailsCameraSettingsReaderWriterConfigurator)configurator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configurator);

  return (HUServiceDetailsCameraSettingsReaderWriterConfigurator *)WeakRetained;
}

- (void)setConfigurator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end