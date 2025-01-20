@interface HMHealthKitUtilities
+ (id)frequencyBins;
+ (id)frequencyToHearingDecibelLevelMapFromAudiogram:(id)a3;
+ (id)requiredFrequencyBins;
+ (id)sharedInstance;
- (BOOL)_isAudiogramValid:(id)a3;
- (HMHealthKitUtilities)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)featureStatusChangedHandler;
- (unsigned)_getHMRegionStatusFromFeatureStatus:(id)a3 featureIdentifier:(id)a4;
- (unsigned)getRegionSupportStatusForFeatureID:(id)a3;
- (void)_activate;
- (void)_audiogramsQueryHandler:(id)a3 results:(id)a4 error:(id)a5;
- (void)_invalidate;
- (void)_startAudiogramQuery;
- (void)activate;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setFeatureStatusChangedHandler:(id)a3;
- (void)startAudiogramQuery;
- (void)updateHMSettingsStruct:(id *)a3 fromAudiogram:(id)a4;
@end

@implementation HMHealthKitUtilities

- (void)startAudiogramQuery
{
  if (!self->_audiogramQueryInProgress)
  {
    [(HMHealthKitUtilities *)self _startAudiogramQuery];
    self->_audiogramQueryInProgress = 1;
  }
}

- (void)_startAudiogramQuery
{
  v3 = [MEMORY[0x263F0A598] audiogramSampleType];
  id v4 = objc_alloc_init(MEMORY[0x263F0A410]);
  id v5 = objc_alloc(MEMORY[0x263F0A6E0]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HMHealthKitUtilities__startAudiogramQuery__block_invoke;
  v7[3] = &unk_2653628C8;
  v7[4] = self;
  v6 = (void *)[v5 initWithSampleType:v3 predicate:0 limit:0 sortDescriptors:0 resultsHandler:v7];
  if (gLogCategory_HMHealthKitUtilities <= 30
    && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [v4 executeQuery:v6];
}

+ (id)sharedInstance
{
  if (sharedInstance_sOnce != -1) {
    dispatch_once(&sharedInstance_sOnce, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sSelf;
  return v2;
}

- (void)_audiogramsQueryHandler:(id)a3 results:(id)a4 error:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (gLogCategory_HMHealthKitUtilities <= 90
      && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
    {
      id v29 = v10;
      LogPrintF();
    }
    v28 = +[HMServiceDaemon sharedHMServiceDaemon];
    [v28 reportValidAudiograms:MEMORY[0x263EFFA68] invalidAudiograms:MEMORY[0x263EFFA68] error:v10];
  }
  else
  {
    id v30 = v8;
    id v11 = v9;
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          if ([(HMHealthKitUtilities *)self _isAudiogramValid:v19]) {
            v20 = v12;
          }
          else {
            v20 = v13;
          }
          [v20 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v16);
    }

    v21 = (NSArray *)[v12 copy];
    validAudiograms = self->_validAudiograms;
    self->_validAudiograms = v21;

    v23 = (NSArray *)[v13 copy];
    invalidAudiograms = self->_invalidAudiograms;
    self->_invalidAudiograms = v23;

    v25 = +[HMServiceDaemon sharedHMServiceDaemon];
    v26 = (void *)[(NSArray *)self->_validAudiograms copy];
    v27 = (void *)[(NSArray *)self->_invalidAudiograms copy];
    [v25 reportValidAudiograms:v26 invalidAudiograms:v27 error:0];

    id v8 = v30;
  }
}

uint64_t __44__HMHealthKitUtilities__startAudiogramQuery__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _audiogramsQueryHandler:*(void *)(a1 + 40) results:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __44__HMHealthKitUtilities__startAudiogramQuery__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(NSObject **)(v10 + 48);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__HMHealthKitUtilities__startAudiogramQuery__block_invoke_2;
  v15[3] = &unk_2653628A0;
  v15[4] = v10;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v11, v15);
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
}

+ (id)frequencyBins
{
  v2 = (void *)frequencyBins_frequencyBins;
  if (!frequencyBins_frequencyBins)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", &unk_2702132A8, &unk_2702132B8, &unk_2702132C8, &unk_2702132D8, &unk_2702132E8, &unk_2702132F8, &unk_270213308, &unk_270213318, 0);
    id v4 = (void *)frequencyBins_frequencyBins;
    frequencyBins_frequencyBins = v3;

    v2 = (void *)frequencyBins_frequencyBins;
  }
  return v2;
}

+ (id)frequencyToHearingDecibelLevelMapFromAudiogram:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v5 = [v3 sensitivityPoints];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71__HMHealthKitUtilities_frequencyToHearingDecibelLevelMapFromAudiogram___block_invoke;
    v9[3] = &unk_265362808;
    id v10 = v3;
    id v12 = &v13;
    id v6 = v4;
    id v11 = v6;
    [v5 enumerateObjectsUsingBlock:v9];

    if (*((unsigned char *)v14 + 24)) {
      id v7 = 0;
    }
    else {
      id v7 = v6;
    }

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __71__HMHealthKitUtilities_frequencyToHearingDecibelLevelMapFromAudiogram___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 frequency];
  id v8 = [MEMORY[0x263F0A830] hertzUnit];
  [v7 doubleValueForUnit:v8];
  double v10 = v9;

  id v11 = +[HMHealthKitUtilities frequencyBins];
  id v12 = [NSNumber numberWithDouble:v10];
  int v13 = [v11 containsObject:v12];

  if (v13)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy_;
    v42 = __Block_byref_object_dispose_;
    id v43 = 0;
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    uint64_t v36 = __Block_byref_object_dispose_;
    id v37 = 0;
    id v14 = [v6 tests];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __71__HMHealthKitUtilities_frequencyToHearingDecibelLevelMapFromAudiogram___block_invoke_295;
    v31[3] = &unk_2653627E0;
    v31[4] = &v38;
    v31[5] = &v32;
    [v14 enumerateObjectsUsingBlock:v31];
    uint64_t v15 = (void *)v39[5];
    if (v15 && v33[5])
    {
      char v16 = [MEMORY[0x263F0A830] decibelHearingLevelUnit];
      [v15 doubleValueForUnit:v16];
      double v18 = v17;

      uint64_t v19 = (void *)v33[5];
      v20 = [MEMORY[0x263F0A830] decibelHearingLevelUnit];
      [v19 doubleValueForUnit:v20];
      double v22 = v21;

      id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v24 = [NSNumber numberWithDouble:v18];
      [v23 setObject:v24 forKey:@"left"];

      v25 = [NSNumber numberWithDouble:v22];
      [v23 setObject:v25 forKey:@"right"];

      v26 = *(void **)(a1 + 40);
      v27 = [NSNumber numberWithDouble:v10];
      [v26 setObject:v23 forKey:v27];
    }
    else
    {
      if (gLogCategory_HMHealthKitUtilities <= 30
        && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
      {
        v28 = [*(id *)(a1 + 32) sourceRevision];
        id v29 = [v28 source];
        id v30 = [v29 name];
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }
}

uint64_t __71__HMHealthKitUtilities_frequencyToHearingDecibelLevelMapFromAudiogram___block_invoke_295(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    double v10 = v3;
    id v3 = (id)[v3 side];
    id v4 = v10;
    if (!v3)
    {
      id v5 = [v10 clampedSensitivity];
      if (v5) {
        [v10 clampedSensitivity];
      }
      else {
      id v6 = [v10 sensitivity];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);

      id v4 = v10;
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v11 = v4;
    id v3 = (id)[v4 side];
    id v4 = v11;
    if (v3 == (id)1)
    {
      id v7 = [v11 clampedSensitivity];
      if (v7) {
        [v11 clampedSensitivity];
      }
      else {
      id v8 = [v11 sensitivity];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);

      id v4 = v11;
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

+ (id)requiredFrequencyBins
{
  v2 = (void *)requiredFrequencyBins_requiredFrequencyBins;
  if (!requiredFrequencyBins_requiredFrequencyBins)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", &unk_2702132A8, &unk_2702132B8, &unk_2702132C8, &unk_2702132D8, &unk_2702132F8, &unk_270213318, 0);
    id v4 = (void *)requiredFrequencyBins_requiredFrequencyBins;
    requiredFrequencyBins_requiredFrequencyBins = v3;

    v2 = (void *)requiredFrequencyBins_requiredFrequencyBins;
  }
  return v2;
}

uint64_t __38__HMHealthKitUtilities_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HMHealthKitUtilities);
  uint64_t v1 = sharedInstance_sSelf;
  sharedInstance_sSelf = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HMHealthKitUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMHealthKitUtilities;
  v2 = [(HMHealthKitUtilities *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    id v4 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HMHealthKitUtilities_activate__block_invoke;
  block[3] = &unk_265362650;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__HMHealthKitUtilities_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    if (gLogCategory_HMHealthKitUtilities <= 30
      && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HMHealthKitUtilities_invalidate__block_invoke;
  block[3] = &unk_265362650;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__HMHealthKitUtilities_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (gLogCategory_HMHealthKitUtilities <= 30
    && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  featureManagerMap = self->_featureManagerMap;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__HMHealthKitUtilities__invalidate__block_invoke;
  v7[3] = &unk_265362850;
  v7[4] = self;
  [(NSMutableDictionary *)featureManagerMap enumerateKeysAndObjectsUsingBlock:v7];
  [(NSMutableDictionary *)self->_featureManagerMap removeAllObjects];
  id v4 = self->_featureManagerMap;
  self->_featureManagerMap = 0;

  validAudiograms = self->_validAudiograms;
  self->_validAudiograms = 0;

  invalidAudiograms = self->_invalidAudiograms;
  self->_invalidAudiograms = 0;

  self->_activateCalled = 0;
}

uint64_t __35__HMHealthKitUtilities__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 unregisterObserver:*(void *)(a1 + 32)];
}

- (BOOL)_isAudiogramValid:(id)a3
{
  id v3 = a3;
  id v4 = +[HMHealthKitUtilities frequencyToHearingDecibelLevelMapFromAudiogram:v3];
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v5 = +[HMHealthKitUtilities requiredFrequencyBins];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__HMHealthKitUtilities__isAudiogramValid___block_invoke;
    v8[3] = &unk_265362878;
    id v9 = v4;
    double v10 = &v11;
    [v5 enumerateObjectsUsingBlock:v8];

    BOOL v6 = *((unsigned char *)v12 + 24) == 0;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    if (gLogCategory_HMHealthKitUtilities <= 10
      && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    BOOL v6 = 0;
  }

  return v6;
}

void __42__HMHealthKitUtilities__isAudiogramValid___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  BOOL v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  if (!v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)updateHMSettingsStruct:(id *)a3 fromAudiogram:(id)a4
{
  uint64_t v5 = +[HMHealthKitUtilities frequencyToHearingDecibelLevelMapFromAudiogram:a4];
  v72 = (void *)v5;
  if (v5)
  {
    BOOL v6 = +[HMHealthKitUtilities frequencyBins];
    id v7 = [v6 objectAtIndexedSubscript:0];
    id v8 = [v72 objectForKey:v7];
    id v9 = [v8 objectForKey:@"left"];
    [v9 floatValue];
    a3->var3.var0 = v10;

    uint64_t v11 = [v6 objectAtIndexedSubscript:0];
    id v12 = [v72 objectForKey:v11];
    uint64_t v13 = [v12 objectForKey:@"right"];
    [v13 floatValue];
    a3->var4.var0 = v14;

    uint64_t v15 = [v6 objectAtIndexedSubscript:1];
    char v16 = [v72 objectForKey:v15];
    double v17 = [v16 objectForKey:@"left"];
    [v17 floatValue];
    a3->var3.var1 = v18;

    uint64_t v19 = [v6 objectAtIndexedSubscript:1];
    v20 = [v72 objectForKey:v19];
    double v21 = [v20 objectForKey:@"right"];
    [v21 floatValue];
    a3->var4.var1 = v22;

    id v23 = [v6 objectAtIndexedSubscript:2];
    v24 = [v72 objectForKey:v23];
    v25 = [v24 objectForKey:@"left"];
    [v25 floatValue];
    a3->var3.var2 = v26;

    v27 = [v6 objectAtIndexedSubscript:2];
    v28 = [v72 objectForKey:v27];
    id v29 = [v28 objectForKey:@"right"];
    [v29 floatValue];
    a3->var4.var2 = v30;

    long long v31 = [v6 objectAtIndexedSubscript:3];
    uint64_t v32 = [v72 objectForKey:v31];
    long long v33 = [v32 objectForKey:@"left"];
    [v33 floatValue];
    a3->var3.var3 = v34;

    v35 = [v6 objectAtIndexedSubscript:3];
    uint64_t v36 = [v72 objectForKey:v35];
    id v37 = [v36 objectForKey:@"right"];
    [v37 floatValue];
    a3->var4.var3 = v38;

    v39 = [v6 objectAtIndexedSubscript:5];
    uint64_t v40 = [v72 objectForKey:v39];
    v41 = [v40 objectForKey:@"left"];
    [v41 floatValue];
    a3->var3.var5 = v42;

    id v43 = [v6 objectAtIndexedSubscript:5];
    v44 = [v72 objectForKey:v43];
    v45 = [v44 objectForKey:@"right"];
    [v45 floatValue];
    a3->var4.var5 = v46;

    v47 = [v6 objectAtIndexedSubscript:7];
    v48 = [v72 objectForKey:v47];
    v49 = [v48 objectForKey:@"left"];
    [v49 floatValue];
    a3->var3.var7 = v50;

    v51 = [v6 objectAtIndexedSubscript:7];
    v52 = [v72 objectForKey:v51];
    v53 = [v52 objectForKey:@"right"];
    [v53 floatValue];
    a3->var4.var7 = v54;

    v55 = [v6 objectAtIndexedSubscript:4];
    v56 = [v72 objectForKey:v55];

    if (v56)
    {
      v57 = [v56 objectForKey:@"left"];
      [v57 floatValue];
      a3->var3.float var4 = v58;

      v59 = [v56 objectForKey:@"right"];
      [v59 floatValue];
      a3->var4.float var4 = v60;
    }
    else
    {
      float var4 = (float)(a3->var3.var3 + a3->var3.var5) * 0.5;
      a3->var3.float var4 = var4;
      float v62 = (float)(a3->var4.var3 + a3->var4.var5) * 0.5;
      a3->var4.float var4 = v62;
      if (gLogCategory_HMHealthKitUtilities <= 30)
      {
        if (gLogCategory_HMHealthKitUtilities == -1)
        {
          if (!_LogCategory_Initialize()) {
            goto LABEL_8;
          }
          float var4 = a3->var3.var4;
          float v62 = a3->var4.var4;
        }
        double v70 = var4;
        double v71 = v62;
        LogPrintF();
      }
    }
LABEL_8:
    v63 = objc_msgSend(v6, "objectAtIndexedSubscript:", 6, *(void *)&v70, *(void *)&v71);
    v64 = [v72 objectForKey:v63];

    if (v64)
    {
      v65 = [v64 objectForKey:@"left"];
      [v65 floatValue];
      a3->var3.var6 = v66;

      v67 = [v64 objectForKey:@"right"];
      [v67 floatValue];
      a3->var4.var6 = v68;
    }
    else
    {
      a3->var3.var6 = (float)(a3->var3.var5 + a3->var3.var7) * 0.5;
      a3->var4.var6 = (float)(a3->var4.var5 + a3->var4.var7) * 0.5;
      if (gLogCategory_HMHealthKitUtilities <= 30
        && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }

    goto LABEL_15;
  }
  v69 = 0;
  if (gLogCategory_HMHealthKitUtilities <= 30)
  {
    if (gLogCategory_HMHealthKitUtilities != -1 || (uint64_t v5 = _LogCategory_Initialize(), v69 = 0, v5))
    {
      uint64_t v5 = LogPrintF();
LABEL_15:
      v69 = v72;
    }
  }
  MEMORY[0x270F9A758](v5, v69);
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMHealthKitUtilities_featureStatusProviding_didUpdateFeatureStatus___block_invoke;
  block[3] = &unk_265362650;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __70__HMHealthKitUtilities_featureStatusProviding_didUpdateFeatureStatus___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unsigned)getRegionSupportStatusForFeatureID:(id)a3
{
  id v4 = a3;
  featureManagerMap = self->_featureManagerMap;
  if (!featureManagerMap)
  {
    BOOL v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v7 = self->_featureManagerMap;
    self->_featureManagerMap = v6;

    featureManagerMap = self->_featureManagerMap;
  }
  id v8 = [(NSMutableDictionary *)featureManagerMap objectForKeyedSubscript:v4];

  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_featureManagerMap objectForKeyedSubscript:v4];
    [v9 unregisterObserver:self];

    [(NSMutableDictionary *)self->_featureManagerMap setObject:0 forKeyedSubscript:v4];
  }
  id v10 = objc_alloc_init(MEMORY[0x263F0A410]);
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureIdentifier:v4 healthStore:v10 countryCodeSource:1];
  [(NSMutableDictionary *)self->_featureManagerMap setObject:v11 forKeyedSubscript:v4];
  [v11 registerObserver:self];
  id v16 = 0;
  id v12 = [v11 featureStatusWithError:&v16];
  id v13 = v16;
  if (v12)
  {
    unsigned __int8 v14 = [(HMHealthKitUtilities *)self _getHMRegionStatusFromFeatureStatus:v12 featureIdentifier:v4];
  }
  else
  {
    if (gLogCategory_HMHealthKitUtilities <= 90
      && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (unsigned)_getHMRegionStatusFromFeatureStatus:(id)a3 featureIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F095D0];
  id v8 = a3;
  id v9 = [v8 objectForKeyedSubscript:v7];
  int v10 = [v9 areAllRequirementsSatisfied];

  uint64_t v11 = [v8 objectForKeyedSubscript:v7];
  id v12 = [v11 highestPriorityUnsatisfiedRequirement];

  uint64_t v13 = *MEMORY[0x263F09578];
  unsigned __int8 v14 = [v8 objectForKeyedSubscript:*MEMORY[0x263F09578]];
  int v15 = [v14 areAllRequirementsSatisfied];

  id v16 = [v8 objectForKeyedSubscript:v13];

  double v17 = [v16 highestPriorityUnsatisfiedRequirement];

  if (v15) {
    char v18 = 2;
  }
  else {
    char v18 = 3;
  }
  if (v10) {
    unsigned __int8 v19 = v18;
  }
  else {
    unsigned __int8 v19 = 1;
  }
  featureIDRegionStatusMap = self->_featureIDRegionStatusMap;
  if (!featureIDRegionStatusMap)
  {
    double v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    float v22 = self->_featureIDRegionStatusMap;
    self->_featureIDRegionStatusMap = v21;

    featureIDRegionStatusMap = self->_featureIDRegionStatusMap;
  }
  id v23 = [(NSMutableDictionary *)featureIDRegionStatusMap objectForKeyedSubscript:v6];
  int v24 = [v23 intValue];

  if (v24 != v19)
  {
    v25 = [NSNumber numberWithUnsignedChar:v19];
    [(NSMutableDictionary *)self->_featureIDRegionStatusMap setObject:v25 forKeyedSubscript:v6];

    if (gLogCategory_HMHealthKitUtilities <= 30
      && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  return v19;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)featureStatusChangedHandler
{
  return self->_featureStatusChangedHandler;
}

- (void)setFeatureStatusChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_featureStatusChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_featureIDRegionStatusMap, 0);
  objc_storeStrong((id *)&self->_validAudiograms, 0);
  objc_storeStrong((id *)&self->_invalidAudiograms, 0);
  objc_storeStrong((id *)&self->_featureManagerMap, 0);
}

@end