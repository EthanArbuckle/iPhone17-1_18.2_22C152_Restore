@interface HMAudiogramUtility
+ (id)frequencyBins;
+ (id)frequencyToHearingDecibelLevelMapFromAudiogram:(id)a3;
+ (id)requiredFrequencyBins;
@end

@implementation HMAudiogramUtility

+ (id)requiredFrequencyBins
{
  v2 = (void *)requiredFrequencyBins_requiredFrequencyBins;
  if (!requiredFrequencyBins_requiredFrequencyBins)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", &unk_270211138, &unk_270211148, &unk_270211158, &unk_270211168, &unk_270211178, &unk_270211188, 0);
    v4 = (void *)requiredFrequencyBins_requiredFrequencyBins;
    requiredFrequencyBins_requiredFrequencyBins = v3;

    v2 = (void *)requiredFrequencyBins_requiredFrequencyBins;
  }
  return v2;
}

+ (id)frequencyBins
{
  v2 = (void *)frequencyBins_frequencyBins;
  if (!frequencyBins_frequencyBins)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", &unk_270211138, &unk_270211148, &unk_270211158, &unk_270211168, &unk_270211198, &unk_270211178, &unk_2702111A8, &unk_270211188, 0);
    v4 = (void *)frequencyBins_frequencyBins;
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
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v5 = [v3 sensitivityPoints];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__HMAudiogramUtility_frequencyToHearingDecibelLevelMapFromAudiogram___block_invoke;
    v9[3] = &unk_265361450;
    id v10 = v3;
    v12 = &v13;
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

void __69__HMAudiogramUtility_frequencyToHearingDecibelLevelMapFromAudiogram___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 frequency];
  v8 = [MEMORY[0x263F0A830] hertzUnit];
  [v7 doubleValueForUnit:v8];
  double v10 = v9;

  id v11 = +[HMAudiogramUtility frequencyBins];
  v12 = [NSNumber numberWithDouble:v10];
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
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    id v37 = 0;
    v14 = [v6 tests];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __69__HMAudiogramUtility_frequencyToHearingDecibelLevelMapFromAudiogram___block_invoke_437;
    v31[3] = &unk_265361428;
    v31[4] = &v38;
    v31[5] = &v32;
    [v14 enumerateObjectsUsingBlock:v31];
    uint64_t v15 = (void *)v39[5];
    if (v15 && v33[5])
    {
      char v16 = [MEMORY[0x263F0A830] decibelHearingLevelUnit];
      [v15 doubleValueForUnit:v16];
      double v18 = v17;

      v19 = (void *)v33[5];
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
      if (gLogCategory_HMEnrollmentService <= 30
        && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
      {
        v28 = [*(id *)(a1 + 32) sourceRevision];
        v29 = [v28 source];
        v30 = [v29 name];
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }
}

uint64_t __69__HMAudiogramUtility_frequencyToHearingDecibelLevelMapFromAudiogram___block_invoke_437(uint64_t a1, void *a2)
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
      v5 = [v10 clampedSensitivity];
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
      v8 = [v11 sensitivity];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);

      id v4 = v11;
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

@end