@interface ATXModeSetupPredictionTrainer
- (ATXModeSetupPredictionTrainer)init;
- (ATXModeSetupPredictionTrainer)initWithCacheBasePath:(id)a3;
- (BOOL)modeIsCurrentlyCreated:(unint64_t)a3;
- (BOOL)modeIsEligibleForSetupPrediction:(unint64_t)a3;
- (BOOL)trainSetupPredictionIfModeAffinityWasTrainedRecentlyForMode:(unint64_t)a3;
- (id)pathForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4;
- (id)pathForModeSetupPredictionCacheWithDirectory:(id)a3;
- (void)persistPredictionScores:(id)a3;
- (void)train;
- (void)trainWithXPCActivity:(id)a3;
- (void)trainWithXPCActivity:(id)a3 shouldSkipRetrainingIfTrainedRecently:(BOOL)a4 shouldSkipEligiblilityCheckForSetupPrediction:(BOOL)a5;
@end

@implementation ATXModeSetupPredictionTrainer

- (ATXModeSetupPredictionTrainer)init
{
  v3 = [MEMORY[0x1E4F4B650] modeCachesRootDirectory];
  v4 = [(ATXModeSetupPredictionTrainer *)self initWithCacheBasePath:v3];

  return v4;
}

- (ATXModeSetupPredictionTrainer)initWithCacheBasePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXModeSetupPredictionTrainer;
  v5 = [(ATXModeSetupPredictionTrainer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    cacheBasePath = v5->_cacheBasePath;
    v5->_cacheBasePath = (NSString *)v6;
  }
  return v5;
}

- (void)train
{
}

- (void)trainWithXPCActivity:(id)a3
{
}

- (void)trainWithXPCActivity:(id)a3 shouldSkipRetrainingIfTrainedRecently:(BOOL)a4 shouldSkipEligiblilityCheckForSetupPrediction:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  if (v6)
  {
    v8 = [(ATXModeSetupPredictionTrainer *)self pathForModeSetupPredictionCacheWithDirectory:@"modeSetupPredictions"];
    objc_super v9 = [MEMORY[0x1E4F4B650] modificationDateOfFileAtPath:v8];
    [v9 timeIntervalSinceNow];
    double v11 = v10;

    if (v11 < 0.0 && v11 > -21600.0)
    {
      v12 = __atxlog_handle_modes();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v41 = -v11;
        _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Skipping inference because this was done recently. Cache age: %.2f", buf, 0xCu);
      }

      goto LABEL_30;
    }
  }
  v13 = __atxlog_handle_modes();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Started running Mode Setup Prediction inference...", buf, 2u);
  }

  v33 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  allModesForModeSetupPrediction();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v14) {
    goto LABEL_24;
  }
  uint64_t v16 = v14;
  uint64_t v17 = *(void *)v36;
  *(void *)&long long v15 = 138412290;
  long long v31 = v15;
  while (2)
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v36 != v17) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v35 + 1) + 8 * v18);
      v20 = (void *)MEMORY[0x1D25F6CC0]();
      uint64_t v21 = [v19 unsignedIntegerValue];
      if (v5)
      {
        self->_modeIsEligibleForSetupPrediction = 1;
      }
      else
      {
        BOOL v22 = [(ATXModeSetupPredictionTrainer *)self modeIsEligibleForSetupPrediction:v21];
        self->_modeIsEligibleForSetupPrediction = v22;
        if (!v22) {
          goto LABEL_21;
        }
      }
      v23 = __atxlog_handle_modes();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        ATXModeToString();
        double v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = v31;
        double v41 = v24;
        _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Running Mode Prediction inference for Mode %@...", buf, 0xCu);
      }
      v25 = [[ATXModeSetupPredictionModel alloc] initWithMode:v21];
      [(ATXModeSetupPredictionModel *)v25 probabilityScore];
      v26 = objc_msgSend(NSNumber, "numberWithDouble:");
      v27 = ATXModeToString();
      [v33 setObject:v26 forKey:v27];

LABEL_21:
      if (objc_msgSend(v34, "didDefer", v31))
      {
        v29 = __atxlog_handle_modes();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          ATXModeToString();
          double v30 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = v31;
          double v41 = v30;
          _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Finished making inference for mode %@, but deferring further inference for remaining modes because XPC activity asked for deferral.", buf, 0xCu);
        }
        v8 = v33;
        [(ATXModeSetupPredictionTrainer *)self persistPredictionScores:v33];

        goto LABEL_30;
      }
      ++v18;
    }
    while (v16 != v18);
    uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_24:

  v28 = __atxlog_handle_modes();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Finished running Mode Setup Prediction inference.", buf, 2u);
  }

  v8 = v33;
  [(ATXModeSetupPredictionTrainer *)self persistPredictionScores:v33];
LABEL_30:
}

- (BOOL)trainSetupPredictionIfModeAffinityWasTrainedRecentlyForMode:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = ATXModeToString();
  BOOL v5 = [(ATXModeSetupPredictionTrainer *)self pathForModeEntityTypeIdentifier:@"apps" modeIdentifier:v4];

  BOOL v6 = [MEMORY[0x1E4F4B650] modificationDateOfFileAtPath:v5];
  [v6 timeIntervalSinceNow];
  double v8 = v7;

  BOOL v9 = v8 > -604800.0 && v8 < 0.0;
  if (!v9)
  {
    double v10 = __atxlog_handle_modes();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = ATXModeToString();
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Skipping Mode Setup Prediction inference because the Mode Affinity model for this mode: %@ has not been trained within the last 7 days", (uint8_t *)&v13, 0xCu);
    }
  }

  return v9;
}

- (BOOL)modeIsCurrentlyCreated:(unint64_t)a3
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v4 = [MEMORY[0x1E4F4AF78] sharedInstance];
  BOOL v5 = [v4 getAllModeConfigurationsWithoutCache];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ATXModeSetupPredictionTrainer_modeIsCurrentlyCreated___block_invoke;
  v8[3] = &unk_1E68B3D90;
  id v6 = v4;
  id v9 = v6;
  double v10 = &v12;
  unint64_t v11 = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  LOBYTE(a3) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return a3;
}

void __56__ATXModeSetupPredictionTrainer_modeIsCurrentlyCreated___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void *)a1[4];
  double v8 = [v6 mode];
  uint64_t v9 = objc_msgSend(v7, "atxModeForDNDSemanticType:", objc_msgSend(v8, "semanticType"));

  if (a1[6] == v9)
  {
    double v10 = [v6 created];

    if (v10)
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      unint64_t v11 = __atxlog_handle_modes();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = ATXModeToString();
        int v13 = 138412290;
        uint64_t v14 = v12;
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Skipping Mode Setup Prediction inference because this Mode: %@ is currently created.", (uint8_t *)&v13, 0xCu);
      }
      *a4 = 1;
    }
  }
}

- (BOOL)modeIsEligibleForSetupPrediction:(unint64_t)a3
{
  if (-[ATXModeSetupPredictionTrainer modeIsCurrentlyCreated:](self, "modeIsCurrentlyCreated:")) {
    return 0;
  }
  return [(ATXModeSetupPredictionTrainer *)self trainSetupPredictionIfModeAffinityWasTrainedRecentlyForMode:a3];
}

- (id)pathForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4
{
  cacheBasePath = self->_cacheBasePath;
  id v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithFormat:@"%@_%@", v8, v7];

  double v10 = [(NSString *)cacheBasePath stringByAppendingPathComponent:v9];

  return v10;
}

- (id)pathForModeSetupPredictionCacheWithDirectory:(id)a3
{
  return [(NSString *)self->_cacheBasePath stringByAppendingPathComponent:a3];
}

- (void)persistPredictionScores:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1D25F6CC0]();
  id v18 = 0;
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v18];
  id v7 = v18;
  id v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    uint64_t v14 = [(ATXModeSetupPredictionTrainer *)self pathForModeSetupPredictionCacheWithDirectory:@"modeSetupPredictions"];
    id v17 = 0;
    char v10 = [v6 writeToFile:v14 options:1073741825 error:&v17];
    id v11 = v17;
    uint64_t v12 = __atxlog_handle_modes();
    int v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: SUCCESS - Finished writing mode setup probability scores.", v16, 2u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      -[ATXModeSetupPredictionTrainer persistPredictionScores:]((uint64_t)v11, v13);
    }
  }
  else
  {
    uint64_t v14 = __atxlog_handle_modes();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[ATXModeSetupPredictionTrainer persistPredictionScores:]((uint64_t)v8, v14);
    }
  }
}

- (void).cxx_destruct
{
}

- (void)persistPredictionScores:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "ATXModeSetupPredictionTrainer: FAILURE - Unable to archive mode setup probability scores with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)persistPredictionScores:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "ATXModeSetupPredictionTrainer: FAILURE - Unable to write mode setup probability scores with error: %@", (uint8_t *)&v2, 0xCu);
}

@end