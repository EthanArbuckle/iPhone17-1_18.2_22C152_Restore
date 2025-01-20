@interface HTDeveloperSettings
- (BOOL)isEnabled;
- (BOOL)isInternalBuild;
- (HTDeveloperSettings)init;
- (HTDeveloperSettings)initWithDefaults:(id)a3 savedSettingsDefaults:(id)a4;
- (NSArray)availableThresholdsLongNames;
- (NSArray)availableThresholdsShortNames;
- (NSArray)availableThresholdsValues;
- (int64_t)hangTracerThreshold;
- (void)setEnabled:(BOOL)a3;
- (void)setHangTracerThreshold:(int64_t)a3;
@end

@implementation HTDeveloperSettings

- (HTDeveloperSettings)init
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x263F42798]];
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  v6 = (void *)[v5 initWithSuiteName:*MEMORY[0x263F42790]];
  v7 = [(HTDeveloperSettings *)self initWithDefaults:v4 savedSettingsDefaults:v6];

  return v7;
}

- (HTDeveloperSettings)initWithDefaults:(id)a3 savedSettingsDefaults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HTDeveloperSettings;
  v9 = [(HTDeveloperSettings *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_defaults, a3);
    objc_storeStrong((id *)&v10->_savedSettingsDefaults, a4);
    uint64_t v11 = objc_opt_new();
    shortDurationFormatter = v10->_shortDurationFormatter;
    v10->_shortDurationFormatter = (NSMeasurementFormatter *)v11;

    [(NSMeasurementFormatter *)v10->_shortDurationFormatter setUnitStyle:1];
    [(NSMeasurementFormatter *)v10->_shortDurationFormatter setUnitOptions:1];
    v13 = objc_opt_new();
    [(NSMeasurementFormatter *)v10->_shortDurationFormatter setNumberFormatter:v13];

    v14 = [(NSMeasurementFormatter *)v10->_shortDurationFormatter numberFormatter];
    [v14 setNumberStyle:0];

    v15 = [(NSMeasurementFormatter *)v10->_shortDurationFormatter numberFormatter];
    [v15 setMaximumFractionDigits:0];

    uint64_t v16 = objc_opt_new();
    longDurationFormatter = v10->_longDurationFormatter;
    v10->_longDurationFormatter = (NSMeasurementFormatter *)v16;

    [(NSMeasurementFormatter *)v10->_longDurationFormatter setUnitStyle:3];
    [(NSMeasurementFormatter *)v10->_longDurationFormatter setUnitOptions:1];
    v18 = v10;
  }

  return v10;
}

- (BOOL)isEnabled
{
  defaults = self->_defaults;
  id v3 = keyWithPrefix(*MEMORY[0x263F42810], *MEMORY[0x263F42830]);
  LOBYTE(defaults) = [(NSUserDefaults *)defaults BOOLForKey:v3];

  return (char)defaults;
}

- (BOOL)isInternalBuild
{
  v2 = [MEMORY[0x263F427A8] sharedPrefs];
  char v3 = [v2 isInternal];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v97[17] = *MEMORY[0x263EF8340];
  if (a3)
  {
    defaults = self->_defaults;
    uint64_t v6 = *MEMORY[0x263F42830];
    id v7 = keyWithPrefix(*MEMORY[0x263F42810], *MEMORY[0x263F42830]);
    [(NSUserDefaults *)defaults setBool:1 forKey:v7];

    id v8 = self->_defaults;
    v9 = keyWithPrefix(*MEMORY[0x263F42878], v6);
    [(NSUserDefaults *)v8 setBool:1 forKey:v9];

    v10 = self->_defaults;
    uint64_t v11 = keyWithPrefix(*MEMORY[0x263F428B8], v6);
    [(NSUserDefaults *)v10 setBool:1 forKey:v11];

    v12 = self->_defaults;
    v13 = keyWithPrefix(*MEMORY[0x263F42808], v6);
    [(NSUserDefaults *)v12 setInteger:500 forKey:v13];

    v14 = self->_defaults;
    uint64_t v15 = keyWithPrefix(*MEMORY[0x263F42860], v6);
    [(NSUserDefaults *)v14 setInteger:500 forKey:v15];

    uint64_t v16 = [MEMORY[0x263F427A8] sharedPrefs];
    LOBYTE(v15) = [v16 isInternal];

    if ((v15 & 1) == 0)
    {
      v17 = self->_defaults;
      v18 = keyWithPrefix(*MEMORY[0x263F42838], v6);
      [(NSUserDefaults *)v17 setInteger:0 forKey:v18];

      v19 = self->_defaults;
      objc_super v20 = keyWithPrefix(*MEMORY[0x263F42850], v6);
      [(NSUserDefaults *)v19 setInteger:0 forKey:v20];

      v21 = self->_defaults;
      v22 = keyWithPrefix(*MEMORY[0x263F42858], v6);
      [(NSUserDefaults *)v21 setInteger:0 forKey:v22];

      v23 = self->_defaults;
      v24 = keyWithPrefix(*MEMORY[0x263F42868], v6);
      [(NSUserDefaults *)v23 setFloat:v24 forKey:0.0];

      v25 = self->_defaults;
      v26 = keyWithPrefix(*MEMORY[0x263F428C0], v6);
      [(NSUserDefaults *)v25 setBool:0 forKey:v26];
    }
    v27 = self->_defaults;
    v28 = keyWithPrefix(*MEMORY[0x263F42840], v6);
    [(NSUserDefaults *)v27 setInteger:120 forKey:v28];

    v29 = self->_defaults;
    v30 = keyWithPrefix(*MEMORY[0x263F427E8], v6);
    [(NSUserDefaults *)v29 setInteger:60 forKey:v30];

    v31 = self->_defaults;
    v32 = keyWithPrefix(*MEMORY[0x263F42848], v6);
    [(NSUserDefaults *)v31 setInteger:250 forKey:v32];

    v33 = self->_defaults;
    v34 = keyWithPrefix(*MEMORY[0x263F42818], v6);
    LODWORD(v35) = 1120403456;
    [(NSUserDefaults *)v33 setFloat:v34 forKey:v35];

    v36 = self->_defaults;
    uint64_t v37 = *MEMORY[0x263F427E0];
    v38 = keyWithPrefix(*MEMORY[0x263F42880], v6);
    [(NSUserDefaults *)v36 setObject:v37 forKey:v38];

    v39 = self->_defaults;
    v40 = keyWithPrefix(*MEMORY[0x263F42870], v6);
    [(NSUserDefaults *)v39 setInteger:250 forKey:v40];

    v41 = self->_defaults;
    if (bootSessionUUID_onceToken != -1) {
      dispatch_once(&bootSessionUUID_onceToken, &__block_literal_global_5);
    }
    uint64_t v42 = *MEMORY[0x263F428B0];
    id v43 = (id)bootSessionUUID_bootUUID;
    v44 = keyWithPrefix(v42, v6);
    [(NSUserDefaults *)v41 setObject:v43 forKey:v44];

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v45 = HTPrefsKeysToRestoreForPrefix();
    uint64_t v46 = [v45 countByEnumeratingWithState:&v90 objects:v96 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v91 != v48) {
            objc_enumerationMutation(v45);
          }
          uint64_t v50 = *(void *)(*((void *)&v90 + 1) + 8 * i);
          savedSettingsDefaults = self->_savedSettingsDefaults;
          v52 = savedSettingPrefixedDefaultsKey(v50);
          v53 = [(NSUserDefaults *)savedSettingsDefaults objectForKey:v52];

          if (v53)
          {
            v54 = self->_defaults;
            v55 = keyWithPrefix(v50, v6);
            [(NSUserDefaults *)v54 setObject:v53 forKey:v55];
          }
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v90 objects:v96 count:16];
      }
      while (v47);
    }
  }
  else
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    uint64_t v56 = *MEMORY[0x263F42830];
    v57 = HTPrefsKeysToRestoreForPrefix();
    uint64_t v58 = [v57 countByEnumeratingWithState:&v86 objects:v95 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v59; ++j)
        {
          if (*(void *)v87 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = *(void *)(*((void *)&v86 + 1) + 8 * j);
          v63 = self->_defaults;
          v64 = keyWithPrefix(v62, v56);
          v65 = [(NSUserDefaults *)v63 objectForKey:v64];

          v66 = self->_savedSettingsDefaults;
          v67 = savedSettingPrefixedDefaultsKey(v62);
          [(NSUserDefaults *)v66 setObject:v65 forKey:v67];
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v86 objects:v95 count:16];
      }
      while (v59);
    }

    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v68 = *MEMORY[0x263F42878];
    v97[0] = *MEMORY[0x263F42810];
    v97[1] = v68;
    uint64_t v69 = *MEMORY[0x263F42860];
    v97[2] = *MEMORY[0x263F428B8];
    v97[3] = v69;
    uint64_t v70 = *MEMORY[0x263F42838];
    v97[4] = *MEMORY[0x263F42808];
    v97[5] = v70;
    uint64_t v71 = *MEMORY[0x263F42858];
    v97[6] = *MEMORY[0x263F42850];
    v97[7] = v71;
    uint64_t v72 = *MEMORY[0x263F428C0];
    v97[8] = *MEMORY[0x263F42868];
    v97[9] = v72;
    uint64_t v73 = *MEMORY[0x263F427E8];
    v97[10] = *MEMORY[0x263F42840];
    v97[11] = v73;
    uint64_t v74 = *MEMORY[0x263F42818];
    v97[12] = *MEMORY[0x263F42848];
    v97[13] = v74;
    uint64_t v75 = *MEMORY[0x263F42870];
    v97[14] = *MEMORY[0x263F42880];
    v97[15] = v75;
    v97[16] = *MEMORY[0x263F428B0];
    v45 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v97, 17, 0);
    uint64_t v76 = [v45 countByEnumeratingWithState:&v82 objects:v94 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v83;
      do
      {
        for (uint64_t k = 0; k != v77; ++k)
        {
          if (*(void *)v83 != v78) {
            objc_enumerationMutation(v45);
          }
          v80 = self->_defaults;
          v81 = keyWithPrefix(*(void *)(*((void *)&v82 + 1) + 8 * k), v56);
          [(NSUserDefaults *)v80 removeObjectForKey:v81];
        }
        uint64_t v77 = [v45 countByEnumeratingWithState:&v82 objects:v94 count:16];
      }
      while (v77);
    }
  }

  notify_post((const char *)*MEMORY[0x263F427A0]);
  configureTailspinForThirdPartyDevelopment(v3);
}

- (int64_t)hangTracerThreshold
{
  defaults = self->_defaults;
  BOOL v3 = keyWithPrefix(*MEMORY[0x263F42860], *MEMORY[0x263F42830]);
  int64_t v4 = [(NSUserDefaults *)defaults integerForKey:v3];

  return v4;
}

- (void)setHangTracerThreshold:(int64_t)a3
{
  defaults = self->_defaults;
  uint64_t v6 = *MEMORY[0x263F42830];
  id v7 = keyWithPrefix(*MEMORY[0x263F42860], *MEMORY[0x263F42830]);
  [(NSUserDefaults *)defaults setInteger:a3 forKey:v7];

  id v8 = self->_defaults;
  v9 = keyWithPrefix(*MEMORY[0x263F42808], v6);
  [(NSUserDefaults *)v8 setInteger:a3 forKey:v9];

  v10 = (const char *)*MEMORY[0x263F427A0];

  notify_post(v10);
}

- (NSArray)availableThresholdsValues
{
  BOOL v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[HTDeveloperSettings hangTracerThreshold](self, "hangTracerThreshold"));
  int64_t v4 = [MEMORY[0x263EFF980] arrayWithArray:&unk_2701CBE28];
  if ([(HTDeveloperSettings *)self hangTracerThreshold]
    && ([v4 containsObject:v3] & 1) == 0)
  {
    [v4 addObject:v3];
    [v4 sortUsingSelector:sel_compare_];
  }
  id v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

- (NSArray)availableThresholdsShortNames
{
  BOOL v3 = [(HTDeveloperSettings *)self availableThresholdsValues];
  int64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __52__HTDeveloperSettings_availableThresholdsShortNames__block_invoke;
  uint64_t v11 = &unk_2653541B0;
  v12 = self;
  id v13 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:&v8];
  uint64_t v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __52__HTDeveloperSettings_availableThresholdsShortNames__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 24);
  int64_t v4 = (objc_class *)MEMORY[0x263F08980];
  id v5 = a2;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 integerValue];

  uint64_t v8 = [MEMORY[0x263F08C98] milliseconds];
  uint64_t v9 = (void *)[v6 initWithDoubleValue:v8 unit:(double)v7];
  id v10 = [v3 stringFromMeasurement:v9];

  [*(id *)(a1 + 40) addObject:v10];
}

- (NSArray)availableThresholdsLongNames
{
  BOOL v3 = [(HTDeveloperSettings *)self availableThresholdsValues];
  int64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __51__HTDeveloperSettings_availableThresholdsLongNames__block_invoke;
  uint64_t v11 = &unk_2653541B0;
  v12 = self;
  id v13 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:&v8];
  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __51__HTDeveloperSettings_availableThresholdsLongNames__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  if (v3 > 999)
  {
    id v7 = [MEMORY[0x263F08C98] seconds];
    v3 /= 0x3E8uLL;
  }
  else
  {
    id v7 = [MEMORY[0x263F08C98] milliseconds];
  }
  int64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08980]) initWithDoubleValue:v7 unit:(double)v3];
  id v6 = [v4 stringFromMeasurement:v5];

  [*(id *)(a1 + 40) addObject:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longDurationFormatter, 0);
  objc_storeStrong((id *)&self->_shortDurationFormatter, 0);
  objc_storeStrong((id *)&self->_savedSettingsDefaults, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end