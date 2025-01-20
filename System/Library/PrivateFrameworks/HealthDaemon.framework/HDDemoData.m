@interface HDDemoData
+ (id)demoDataDirectory;
- (id)_directoryPath;
@end

@implementation HDDemoData

void __HDDemoData_recommendedDietaryNutrientDailyValues_block_invoke()
{
  v22[39] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F2A678];
  v21[0] = *MEMORY[0x1E4F2A670];
  v21[1] = v0;
  v22[0] = &unk_1F17EDE18;
  v22[1] = &unk_1F17EDE30;
  uint64_t v1 = *MEMORY[0x1E4F2A688];
  v21[2] = *MEMORY[0x1E4F2A680];
  v21[3] = v1;
  v22[2] = &unk_1F17EDE48;
  v22[3] = &unk_1F17EDE60;
  uint64_t v2 = *MEMORY[0x1E4F2A6A0];
  v21[4] = *MEMORY[0x1E4F2A690];
  v21[5] = v2;
  v22[4] = &unk_1F17EDE78;
  v22[5] = &unk_1F17EDE90;
  uint64_t v3 = *MEMORY[0x1E4F2A6B0];
  v21[6] = *MEMORY[0x1E4F2A6A8];
  v21[7] = v3;
  v22[6] = &unk_1F17EDEA8;
  v22[7] = &unk_1F17EDEC0;
  uint64_t v4 = *MEMORY[0x1E4F2A6D8];
  v21[8] = *MEMORY[0x1E4F2A698];
  v21[9] = v4;
  v22[8] = &unk_1F17EDE18;
  v22[9] = &unk_1F17EDED8;
  uint64_t v5 = *MEMORY[0x1E4F2A6E8];
  v21[10] = *MEMORY[0x1E4F2A6E0];
  v21[11] = v5;
  v22[10] = &unk_1F17EDE30;
  v22[11] = &unk_1F17EDEF0;
  uint64_t v6 = *MEMORY[0x1E4F2A6F8];
  v21[12] = *MEMORY[0x1E4F2A6F0];
  v21[13] = v6;
  v22[12] = &unk_1F17EDF08;
  v22[13] = &unk_1F17EDE30;
  uint64_t v7 = *MEMORY[0x1E4F2A708];
  v21[14] = *MEMORY[0x1E4F2A700];
  v21[15] = v7;
  v22[14] = &unk_1F17EDEA8;
  v22[15] = &unk_1F17EDF20;
  uint64_t v8 = *MEMORY[0x1E4F2A710];
  v21[16] = *MEMORY[0x1E4F2A6B8];
  v21[17] = v8;
  v22[16] = &unk_1F17EDF38;
  v22[17] = &unk_1F17EDF50;
  uint64_t v9 = *MEMORY[0x1E4F2A720];
  v21[18] = *MEMORY[0x1E4F2A718];
  v21[19] = v9;
  v22[18] = &unk_1F17EDF68;
  v22[19] = &unk_1F17EDF80;
  uint64_t v10 = *MEMORY[0x1E4F2A728];
  v21[20] = *MEMORY[0x1E4F2A6C0];
  v21[21] = v10;
  v22[20] = &unk_1F17EDF98;
  v22[21] = &unk_1F17EDFB0;
  uint64_t v11 = *MEMORY[0x1E4F2A738];
  v21[22] = *MEMORY[0x1E4F2A730];
  v21[23] = v11;
  v22[22] = &unk_1F17EDFC8;
  v22[23] = &unk_1F17EF320;
  uint64_t v12 = *MEMORY[0x1E4F2A740];
  v21[24] = *MEMORY[0x1E4F2A6C8];
  v21[25] = v12;
  v22[24] = &unk_1F17EDFE0;
  v22[25] = &unk_1F17EDFF8;
  uint64_t v13 = *MEMORY[0x1E4F2A750];
  v21[26] = *MEMORY[0x1E4F2A748];
  v21[27] = v13;
  v22[26] = &unk_1F17EE010;
  v22[27] = &unk_1F17EE028;
  uint64_t v14 = *MEMORY[0x1E4F2A6D0];
  v21[28] = *MEMORY[0x1E4F2A758];
  v21[29] = v14;
  v22[28] = &unk_1F17EF330;
  v22[29] = &unk_1F17EE040;
  uint64_t v15 = *MEMORY[0x1E4F2A768];
  v21[30] = *MEMORY[0x1E4F2A760];
  v21[31] = v15;
  v22[30] = &unk_1F17EE058;
  v22[31] = &unk_1F17EF340;
  uint64_t v16 = *MEMORY[0x1E4F2A778];
  v21[32] = *MEMORY[0x1E4F2A770];
  v21[33] = v16;
  v22[32] = &unk_1F17EF350;
  v22[33] = &unk_1F17EE028;
  uint64_t v17 = *MEMORY[0x1E4F2A788];
  v21[34] = *MEMORY[0x1E4F2A780];
  v21[35] = v17;
  v22[34] = &unk_1F17EDED8;
  v22[35] = &unk_1F17EDF80;
  uint64_t v18 = *MEMORY[0x1E4F2A7A0];
  v21[36] = *MEMORY[0x1E4F2A790];
  v21[37] = v18;
  v22[36] = &unk_1F17EDE90;
  v22[37] = &unk_1F17EDE90;
  v21[38] = *MEMORY[0x1E4F2A798];
  v22[38] = &unk_1F17EE070;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:39];
  v20 = (void *)_MergedGlobals_210;
  _MergedGlobals_210 = v19;
}

void __HDDemoData_canonicalDietaryUnits_block_invoke()
{
  v42[39] = *MEMORY[0x1E4F143B8];
  v41[0] = *MEMORY[0x1E4F2A670];
  v40 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[0] = v40;
  v41[1] = *MEMORY[0x1E4F2A678];
  v39 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[1] = v39;
  v41[2] = *MEMORY[0x1E4F2A680];
  v38 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[2] = v38;
  v41[3] = *MEMORY[0x1E4F2A688];
  v37 = [MEMORY[0x1E4F2B618] gramUnit];
  v42[3] = v37;
  v41[4] = *MEMORY[0x1E4F2A690];
  v36 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[4] = v36;
  v41[5] = *MEMORY[0x1E4F2A6A0];
  v35 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[5] = v35;
  v41[6] = *MEMORY[0x1E4F2A6A8];
  v34 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[6] = v34;
  v41[7] = *MEMORY[0x1E4F2A6B0];
  v33 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
  v42[7] = v33;
  v41[8] = *MEMORY[0x1E4F2A698];
  v32 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[8] = v32;
  v41[9] = *MEMORY[0x1E4F2A6D8];
  v31 = [MEMORY[0x1E4F2B618] gramUnit];
  v42[9] = v31;
  v41[10] = *MEMORY[0x1E4F2A6E0];
  v30 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[10] = v30;
  v41[11] = *MEMORY[0x1E4F2A6E8];
  v29 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[11] = v29;
  v41[12] = *MEMORY[0x1E4F2A6F0];
  v28 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[12] = v28;
  v41[13] = *MEMORY[0x1E4F2A6F8];
  v27 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[13] = v27;
  v41[14] = *MEMORY[0x1E4F2A700];
  v26 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[14] = v26;
  v41[15] = *MEMORY[0x1E4F2A708];
  v25 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[15] = v25;
  v41[16] = *MEMORY[0x1E4F2A6B8];
  v24 = [MEMORY[0x1E4F2B618] gramUnit];
  v42[16] = v24;
  v41[17] = *MEMORY[0x1E4F2A710];
  v23 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[17] = v23;
  v41[18] = *MEMORY[0x1E4F2A718];
  v22 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[18] = v22;
  v41[19] = *MEMORY[0x1E4F2A720];
  v21 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[19] = v21;
  v41[20] = *MEMORY[0x1E4F2A6C0];
  v20 = [MEMORY[0x1E4F2B618] gramUnit];
  v42[20] = v20;
  v41[21] = *MEMORY[0x1E4F2A728];
  uint64_t v19 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[21] = v19;
  v41[22] = *MEMORY[0x1E4F2A730];
  uint64_t v18 = [MEMORY[0x1E4F2B618] gramUnit];
  v42[22] = v18;
  v41[23] = *MEMORY[0x1E4F2A738];
  uint64_t v17 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[23] = v17;
  v41[24] = *MEMORY[0x1E4F2A6C8];
  uint64_t v16 = [MEMORY[0x1E4F2B618] gramUnit];
  v42[24] = v16;
  v41[25] = *MEMORY[0x1E4F2A740];
  uint64_t v15 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[25] = v15;
  v41[26] = *MEMORY[0x1E4F2A748];
  uint64_t v14 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[26] = v14;
  v41[27] = *MEMORY[0x1E4F2A750];
  uint64_t v13 = [MEMORY[0x1E4F2B618] gramUnit];
  v42[27] = v13;
  v41[28] = *MEMORY[0x1E4F2A758];
  uint64_t v12 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[28] = v12;
  v41[29] = *MEMORY[0x1E4F2A6D0];
  uint64_t v0 = [MEMORY[0x1E4F2B618] gramUnit];
  v42[29] = v0;
  v41[30] = *MEMORY[0x1E4F2A760];
  uint64_t v1 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[30] = v1;
  v41[31] = *MEMORY[0x1E4F2A768];
  uint64_t v2 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[31] = v2;
  v41[32] = *MEMORY[0x1E4F2A770];
  uint64_t v3 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[32] = v3;
  v41[33] = *MEMORY[0x1E4F2A778];
  uint64_t v4 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[33] = v4;
  v41[34] = *MEMORY[0x1E4F2A780];
  uint64_t v5 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[34] = v5;
  v41[35] = *MEMORY[0x1E4F2A788];
  uint64_t v6 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:4];
  v42[35] = v6;
  v41[36] = *MEMORY[0x1E4F2A790];
  uint64_t v7 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[36] = v7;
  v41[37] = *MEMORY[0x1E4F2A7A0];
  uint64_t v8 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:3];
  v42[37] = v8;
  v41[38] = *MEMORY[0x1E4F2A798];
  uint64_t v9 = [MEMORY[0x1E4F2B618] literUnitWithMetricPrefix:4];
  v42[38] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:39];
  uint64_t v11 = (void *)qword_1EBA18C90;
  qword_1EBA18C90 = v10;
}

+ (id)demoDataDirectory
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  self;
  if (([MEMORY[0x1E4F2B898] usingDemoDataDatabase] & 1) == 0
    && ![MEMORY[0x1E4F2B860] isRunningStoreDemoMode])
  {
    v33 = 0;
    goto LABEL_53;
  }
  unint64_t v2 = 0x1E4F1C000uLL;
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = +[HDDemoDataGeneratorConfiguration configurationFromDefaults:v3];

  uint64_t v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v6 = [v5 isAppleWatch];

  if (v6)
  {
    if ([MEMORY[0x1E4F2B860] runningInStoreDemoModeF201]) {
      uint64_t v7 = 60;
    }
    else {
      uint64_t v7 = 1;
    }
    if ([v4 generationPeriodInDays] <= v7) {
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 persistToDefaults:v10];

    goto LABEL_15;
  }
  if ([MEMORY[0x1E4F2B860] isRunningStoreDemoMode])
  {
    uint64_t v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
    uint64_t v9 = [v8 isAppleWatch] ? 1 : 180;

    if ([v4 generationPeriodInDays] > v9) {
      goto LABEL_14;
    }
  }
LABEL_15:
  uint64_t v11 = [HDDemoData alloc];
  uint64_t v12 = [v4 profileType];
  if (v11)
  {
    uint64_t v13 = v12;
    v58.receiver = v11;
    v58.super_class = (Class)HDDemoData;
    uint64_t v11 = objc_msgSendSuper2(&v58, sel_init);
    if (v11)
    {
      uint64_t v14 = NSHomeDirectory();
      uint64_t v15 = [v14 stringByAppendingPathComponent:@"Library/Health"];

      uint64_t v16 = DirectoryPathForHDDemoDataProfileType(v13);
      uint64_t v17 = [NSString stringWithFormat:@"DemoData/%@", v16];
      uint64_t v18 = [v15 stringByAppendingPathComponent:v17];
      demoDataPath = v11->_demoDataPath;
      v11->_demoDataPath = (NSString *)v18;

      v20 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
      fileManager = v11->_fileManager;
      v11->_fileManager = v20;
    }
  }
  self;
  if (([MEMORY[0x1E4F2B898] isGenerateDemoDataSet] & 1) == 0
    && ([MEMORY[0x1E4F2B860] isRunningStoreDemoMode] & 1) == 0)
  {
    _HKInitializeLogging();
    v34 = (void *)*MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_INFO))
    {
      v35 = v34;
      v36 = -[HDDemoData _directoryPath]((id *)&v11->super.isa);
      LODWORD(v58.receiver) = 138412290;
      *(id *)((char *)&v58.receiver + 4) = v36;
      _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_INFO, "Returning demo data directory path: %@", (uint8_t *)&v58, 0xCu);
    }
    v33 = -[HDDemoData _directoryPath]((id *)&v11->super.isa);
    goto LABEL_52;
  }
  v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v23 = [v22 BOOLForKey:@"HealthDemoDataResetDatabaseKey"];

  v24 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v25 = [v24 objectForKey:@"HealthDemoDataLastRunDateKey"];

  v26 = [MEMORY[0x1E4F1C9C8] date];
  if (v25 && [MEMORY[0x1E4F2B860] isRunningStoreDemoMode])
  {
    v27 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v28 = [v27 dateByAddingUnit:16 value:-7 toDate:v26 options:0];

    v29 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v30 = [v29 dateByAddingUnit:16 value:7 toDate:v26 options:0];

    int v31 = objc_msgSend(v25, "hk_isBeforeDate:", v28);
    int v32 = objc_msgSend(v25, "hk_isAfterDate:", v30);
    if ((v32 & 1) != 0 || v31)
    {
      if (v32)
      {
        _HKInitializeLogging();
        v37 = *MEMORY[0x1E4F29F30];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v58.receiver) = 0;
          _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEFAULT, "Will reset demo data database as clock has moved too far back", (uint8_t *)&v58, 2u);
        }
      }
      if (v31)
      {
        _HKInitializeLogging();
        v38 = *MEMORY[0x1E4F29F30];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v58.receiver) = 0;
          _os_log_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_DEFAULT, "Will reset demo data database as clock has been moved too far forward", (uint8_t *)&v58, 2u);
        }
      }

      unint64_t v2 = 0x1E4F1C000uLL;
      if (!v11) {
        goto LABEL_49;
      }
      goto LABEL_40;
    }

    unint64_t v2 = 0x1E4F1C000;
    if ((v23 & 1) == 0) {
      goto LABEL_49;
    }
LABEL_27:
    if (!v11) {
      goto LABEL_49;
    }
LABEL_40:
    v39 = [*(id *)(v2 + 2840) standardUserDefaults];
    [v39 setBool:0 forKey:@"HealthDemoDataResetDatabaseKey"];

    v40 = [*(id *)(v2 + 2840) standardUserDefaults];
    [v40 removeObjectForKey:@"HealthDemoDataFirstRunDateKey"];

    v41 = [*(id *)(v2 + 2840) standardUserDefaults];
    [v41 removeObjectForKey:@"HealthDemoDataLastRunDateKey"];

    v42 = [*(id *)(v2 + 2840) standardUserDefaults];
    [v42 removeObjectForKey:@"HealthDemoDataFirstSampleDateKey"];

    v43 = [*(id *)(v2 + 2840) standardUserDefaults];
    [v43 removeObjectForKey:@"HealthDemoDataLastSampleDateKey"];

    char v57 = 0;
    if ([(NSFileManager *)v11->_fileManager fileExistsAtPath:v11->_demoDataPath isDirectory:&v57])
    {
      if (!v57)
      {
        _HKInitializeLogging();
        v54 = *MEMORY[0x1E4F29F30];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
        {
          v55 = v11->_demoDataPath;
          LODWORD(v58.receiver) = 138412290;
          *(id *)((char *)&v58.receiver + 4) = v55;
          _os_log_error_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_ERROR, "Demo Data path exists but is not a directory. Aborting. path = %@", (uint8_t *)&v58, 0xCu);
        }
        goto LABEL_49;
      }
      v45 = v11->_demoDataPath;
      v44 = v11->_fileManager;
      id v56 = 0;
      BOOL v46 = [(NSFileManager *)v44 removeItemAtPath:v45 error:&v56];
      id v47 = v56;
      if (!v46)
      {
        _HKInitializeLogging();
        v48 = *MEMORY[0x1E4F29F30];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
        {
          LODWORD(v58.receiver) = 138543362;
          *(id *)((char *)&v58.receiver + 4) = v47;
          _os_log_error_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_ERROR, "Could not remove demo data directory. error: %{public}@", (uint8_t *)&v58, 0xCu);
        }
LABEL_48:

        goto LABEL_49;
      }
    }
    else
    {
      id v47 = 0;
    }
    _HKInitializeLogging();
    v49 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v58.receiver) = 0;
      _os_log_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_DEFAULT, "Demo data database has been reset", (uint8_t *)&v58, 2u);
    }
    goto LABEL_48;
  }
  if (v23) {
    goto LABEL_27;
  }
LABEL_49:
  _HKInitializeLogging();
  v50 = (void *)*MEMORY[0x1E4F29F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_INFO))
  {
    v51 = v50;
    v52 = -[HDDemoData _directoryPath]((id *)&v11->super.isa);
    LODWORD(v58.receiver) = 138412290;
    *(id *)((char *)&v58.receiver + 4) = v52;
    _os_log_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_INFO, "Returning demo data directory path: %@", (uint8_t *)&v58, 0xCu);
  }
  v33 = -[HDDemoData _directoryPath]((id *)&v11->super.isa);

LABEL_52:
LABEL_53:

  return v33;
}

- (id)_directoryPath
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);

  objc_storeStrong((id *)&self->_demoDataPath, 0);
}

@end