@interface HKElectrocardiogram(WDExtensions)
- (id)wd_commaSeparatedData;
- (id)wd_commaSeparatedHeaderWithActiveAlgorithmVersion:()WDExtensions;
@end

@implementation HKElectrocardiogram(WDExtensions)

- (id)wd_commaSeparatedHeaderWithActiveAlgorithmVersion:()WDExtensions
{
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  v6 = WDBundle();
  v7 = [v6 localizedStringForKey:@"ECG_CSV_CLASSIFICATION_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  v8 = HKConditionallyRedactedHeartRhythmString();
  [v5 appendString:v8];

  [v5 appendString:@","];
  uint64_t v9 = [a1 _localizedClassificationWithActiveAlgorithmVersion:a3];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_26D2EA890;
  }
  [v5 appendString:v11];

  [v5 appendString:@"\n"];
  v12 = WDBundle();
  v13 = [v12 localizedStringForKey:@"ECG_CSV_SYMPTOMS_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  v14 = HKConditionallyRedactedHeartRhythmString();
  [v5 appendString:v14];

  [v5 appendString:@","];
  v15 = [a1 _localizedSymptoms];
  v16 = [v15 componentsJoinedByString:@","];
  [v5 appendString:v16];

  [v5 appendString:@"\n"];
  v17 = WDBundle();
  v18 = [v17 localizedStringForKey:@"ECG_CSV_SOFTWARE_VERSION_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  v19 = HKConditionallyRedactedHeartRhythmString();
  [v5 appendString:v19];

  [v5 appendString:@","];
  v20 = [a1 sourceRevision];
  uint64_t v21 = [v20 version];
  v22 = (void *)v21;
  if (v21) {
    v23 = (__CFString *)v21;
  }
  else {
    v23 = &stru_26D2EA890;
  }
  [v5 appendString:v23];

  [v5 appendString:@"\n"];
  v24 = [a1 device];
  v25 = [v24 hardwareVersion];

  if (v25)
  {
    v26 = WDBundle();
    v27 = [v26 localizedStringForKey:@"ECG_CSV_DEVICE_VERSION_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    v28 = HKConditionallyRedactedHeartRhythmString();
    [v5 appendString:v28];

    [v5 appendString:@","];
    v29 = NSString;
    v30 = [a1 device];
    v31 = [v30 hardwareVersion];
    v32 = [v29 stringWithFormat:@"\"%@\"", v31];
    [v5 appendString:v32];

    [v5 appendString:@"\n"];
  }
  id v33 = objc_alloc_init(MEMORY[0x263F08988]);
  [v33 setUnitStyle:3];
  v34 = [a1 samplingFrequency];
  v35 = [v34 _foundationMeasurement];

  v36 = WDBundle();
  v37 = [v36 localizedStringForKey:@"ECG_CSV_FREQUENCY_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  v38 = HKConditionallyRedactedHeartRhythmString();
  [v5 appendString:v38];

  [v5 appendString:@","];
  if (v35)
  {
    v39 = [v33 stringFromMeasurement:v35];
    [v5 appendString:v39];
  }
  [v5 appendString:@"\n"];

  return v5;
}

- (id)wd_commaSeparatedData
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v3 setNumberStyle:1];
  v24 = v3;
  [v3 setUsesGroupingSeparator:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v23 = a1;
  id obj = [a1 leadNames];
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v2 appendString:@"\n"];
        uint64_t v8 = [v7 integerValue];
        uint64_t v9 = WDBundle();
        v10 = [v9 localizedStringForKey:@"ECG_CSV_LEAD_NAME_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
        v11 = HKConditionallyRedactedHeartRhythmString();
        [v2 appendString:v11];

        [v2 appendString:@","];
        if (v8 == 1)
        {
          v12 = WDBundle();
          v13 = [v12 localizedStringForKey:@"ECG_LEAD_NAME_I" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
          uint64_t v9 = HKConditionallyRedactedHeartRhythmString();
        }
        [v2 appendString:v9];

        [v2 appendString:@"\n"];
        v14 = WDBundle();
        v15 = [v14 localizedStringForKey:@"ECG_CSV_UNIT_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
        v16 = HKConditionallyRedactedHeartRhythmString();
        [v2 appendString:v16];

        [v2 appendString:@","];
        v17 = WDBundle();
        v18 = [v17 localizedStringForKey:@"ECG_CSV_UNIT_STRING" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
        v19 = HKConditionallyRedactedHeartRhythmString();
        [v2 appendString:v19];

        [v2 appendString:@"\n"];
        [v2 appendString:@"\n"];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __58__HKElectrocardiogram_WDExtensions__wd_commaSeparatedData__block_invoke;
        v25[3] = &unk_26458DAB0;
        id v26 = v2;
        id v27 = v24;
        [v23 _enumerateDataForLead:v8 block:v25];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }

  return v2;
}

@end