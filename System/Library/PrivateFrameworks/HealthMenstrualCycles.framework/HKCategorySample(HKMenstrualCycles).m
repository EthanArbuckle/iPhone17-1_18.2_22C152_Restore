@interface HKCategorySample(HKMenstrualCycles)
+ (id)hkmc_categorySampleWithBleedingFlow:()HKMenstrualCycles forBleedingType:date:startOfCycle:;
+ (id)hkmc_categorySampleWithCervicalMucusQuality:()HKMenstrualCycles date:;
+ (id)hkmc_categorySampleWithCycleFactor:()HKMenstrualCycles startDate:endDate:;
+ (id)hkmc_categorySampleWithMenstrualFlow:()HKMenstrualCycles date:startOfCycle:;
+ (id)hkmc_categorySampleWithMenstrualSymptom:()HKMenstrualCycles date:;
+ (id)hkmc_categorySampleWithOvulationTestResult:()HKMenstrualCycles date:;
+ (id)hkmc_categorySampleWithPregnancyTestResult:()HKMenstrualCycles date:;
+ (id)hkmc_categorySampleWithProgesteroneTestResult:()HKMenstrualCycles date:;
+ (id)hkmc_categorySampleWithSexualActivity:()HKMenstrualCycles date:;
+ (id)hkmc_intermenstrualBleedingCategorySampleWithDate:()HKMenstrualCycles;
+ (id)hkmc_pregnancyCategorySampleWithStartDate:()HKMenstrualCycles startTimeZoneID:endDate:startDateSource:embryoAgeInDays:detailsRecordedOnDate:;
- (uint64_t)hkmc_cycleFactor;
- (uint64_t)hkmc_daySummaryBleedingAfterPregnancyFlow;
- (uint64_t)hkmc_daySummaryBleedingInPregnancyFlow;
- (uint64_t)hkmc_daySummaryCervicalMucusQuality;
- (uint64_t)hkmc_daySummaryMenstrualFlow;
- (uint64_t)hkmc_daySummaryOvulationTestResult;
- (uint64_t)hkmc_daySummaryPregnancyTestResult;
- (uint64_t)hkmc_daySummaryProgesteroneTestResult;
- (uint64_t)hkmc_daySummarySexualActivity;
- (uint64_t)hkmc_daySummarySymptom;
- (uint64_t)hkmc_deviationType;
@end

@implementation HKCategorySample(HKMenstrualCycles)

- (uint64_t)hkmc_daySummarySymptom
{
  if (objc_msgSend(a1, "hkmc_isNotPresentSymptom")) {
    return 0;
  }
  v3 = [a1 categoryType];
  uint64_t v4 = HKMCMenstrualSymptomFromDataTypeCode([v3 code]);

  return v4;
}

- (uint64_t)hkmc_daySummarySexualActivity
{
  uint64_t v4 = [a1 categoryType];
  uint64_t v5 = [v4 code];

  if (v5 != 97)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = objc_opt_class();
    v12 = [a1 categoryType];
    v13 = [v12 identifier];
    [v10 handleFailureInMethod:a2, a1, @"HKCategorySample+HKMenstrualCycles.m", 234, @"%@: Invalid data type: %@", v11, v13 object file lineNumber description];
  }
  v6 = [a1 metadata];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F09AD8]];

  if (v7)
  {
    if ([v7 BOOLValue]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 3;
    }
  }
  else
  {
    uint64_t v8 = 2;
  }

  return v8;
}

- (uint64_t)hkmc_daySummaryMenstrualFlow
{
  uint64_t v4 = [a1 categoryType];
  uint64_t v5 = [v4 code];

  if (v5 != 95)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_opt_class();
    v10 = [a1 categoryType];
    uint64_t v11 = [v10 identifier];
    [v8 handleFailureInMethod:a2, a1, @"HKCategorySample+HKMenstrualCycles.m", 199, @"%@: Invalid data type: %@", v9, v11 object file lineNumber description];
  }
  uint64_t v6 = [a1 value];
  return HKMCBleedingFlowFromCategoryValueVaginalBleeding(v6);
}

- (uint64_t)hkmc_cycleFactor
{
  uint64_t v4 = [a1 categoryType];
  uint64_t v5 = [v4 code];

  switch(v5)
  {
    case 193:
      uint64_t v7 = [a1 value];
      if ((unint64_t)(v7 - 1) < 7) {
        return v7 + 2;
      }
      break;
    case 192:
      return 1;
    case 191:
      return 2;
  }
  uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v9 = objc_opt_class();
  v10 = [a1 categoryType];
  uint64_t v11 = [v10 identifier];
  [v8 handleFailureInMethod:a2, a1, @"HKCategorySample+HKMenstrualCycles.m", 276, @"%@: Invalid data type: %@", v9, v11 object file lineNumber description];

  return 0;
}

+ (id)hkmc_categorySampleWithMenstrualFlow:()HKMenstrualCycles date:startOfCycle:
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = HKMCCategoryValueVaginalBleedingFromBleedingFlow(a3);
  if (v9 == HKMCCategoryValueNotSet)
  {
    v10 = 0;
  }
  else
  {
    uint64_t v11 = v9;
    v12 = objc_msgSend(a1, "hkmc_defaultMetadata");
    uint64_t v18 = *MEMORY[0x263F09AC0];
    v13 = [NSNumber numberWithBool:a5];
    v19[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v15 = objc_msgSend(v12, "hk_dictionaryByAddingEntriesFromDictionary:", v14);

    v16 = [MEMORY[0x263F0A158] menstrualFlowType];
    v10 = [a1 categorySampleWithType:v16 value:v11 startDate:v8 endDate:v8 metadata:v15];
  }
  return v10;
}

+ (id)hkmc_categorySampleWithBleedingFlow:()HKMenstrualCycles forBleedingType:date:startOfCycle:
{
  v24[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  switch(a4)
  {
    case 2:
      v12 = (void *)MEMORY[0x263F0A158];
      v13 = (void *)MEMORY[0x263F09258];
LABEL_7:
      uint64_t v11 = [v12 categoryTypeForIdentifier:*v13];
      goto LABEL_8;
    case 1:
      v12 = (void *)MEMORY[0x263F0A158];
      v13 = (void *)MEMORY[0x263F09260];
      goto LABEL_7;
    case 0:
      uint64_t v11 = [MEMORY[0x263F0A158] menstrualFlowType];
LABEL_8:
      v14 = (void *)v11;
      goto LABEL_10;
  }
  v14 = 0;
LABEL_10:
  uint64_t v15 = HKMCCategoryValueVaginalBleedingFromBleedingFlow(a3);
  if (v15 == HKMCCategoryValueNotSet)
  {
    v16 = 0;
  }
  else
  {
    uint64_t v17 = v15;
    uint64_t v18 = objc_msgSend(a1, "hkmc_defaultMetadata");
    uint64_t v23 = *MEMORY[0x263F09AC0];
    v19 = [NSNumber numberWithBool:a6];
    v24[0] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v21 = objc_msgSend(v18, "hk_dictionaryByAddingEntriesFromDictionary:", v20);

    v16 = [a1 categorySampleWithType:v14 value:v17 startDate:v10 endDate:v10 metadata:v21];
  }
  return v16;
}

+ (id)hkmc_categorySampleWithCervicalMucusQuality:()HKMenstrualCycles date:
{
  id v6 = a4;
  uint64_t v7 = HKMCCategoryValueCervicalMucusQualityFromCervicalMucusQuality(a3);
  if (v7 == HKMCCategoryValueNotSet)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = v7;
    id v10 = [MEMORY[0x263F0A158] _categoryTypeWithCode:91];
    uint64_t v11 = objc_msgSend(a1, "hkmc_defaultMetadata");
    id v8 = [a1 categorySampleWithType:v10 value:v9 startDate:v6 endDate:v6 metadata:v11];
  }
  return v8;
}

+ (id)hkmc_categorySampleWithOvulationTestResult:()HKMenstrualCycles date:
{
  id v6 = a4;
  uint64_t v7 = HKMCCategoryValueOvulationTestResultFromOvulationTestResult(a3);
  if (v7 == HKMCCategoryValueNotSet)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = v7;
    id v10 = [MEMORY[0x263F0A158] _categoryTypeWithCode:92];
    uint64_t v11 = objc_msgSend(a1, "hkmc_defaultMetadata");
    id v8 = [a1 categorySampleWithType:v10 value:v9 startDate:v6 endDate:v6 metadata:v11];
  }
  return v8;
}

+ (id)hkmc_categorySampleWithPregnancyTestResult:()HKMenstrualCycles date:
{
  id v6 = a4;
  uint64_t v7 = HKMCCategoryValuePregnancyTestResultFromPregnancyTestResult(a3);
  if (v7 == HKMCCategoryValueNotSet)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = v7;
    id v10 = [MEMORY[0x263F0A158] _categoryTypeWithCode:243];
    uint64_t v11 = objc_msgSend(a1, "hkmc_defaultMetadata");
    id v8 = [a1 categorySampleWithType:v10 value:v9 startDate:v6 endDate:v6 metadata:v11];
  }
  return v8;
}

+ (id)hkmc_categorySampleWithProgesteroneTestResult:()HKMenstrualCycles date:
{
  id v6 = a4;
  uint64_t v7 = HKMCCategoryValueProgesteroneTestResultFromProgesteroneTestResult(a3);
  if (v7 == HKMCCategoryValueNotSet)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = v7;
    id v10 = [MEMORY[0x263F0A158] _categoryTypeWithCode:244];
    uint64_t v11 = objc_msgSend(a1, "hkmc_defaultMetadata");
    id v8 = [a1 categorySampleWithType:v10 value:v9 startDate:v6 endDate:v6 metadata:v11];
  }
  return v8;
}

+ (id)hkmc_categorySampleWithSexualActivity:()HKMenstrualCycles date:
{
  v19[1] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a1, "hkmc_defaultMetadata");
  if (a3 == 3)
  {
    uint64_t v16 = *MEMORY[0x263F09AD8];
    uint64_t v17 = MEMORY[0x263EFFA80];
    id v8 = NSDictionary;
    uint64_t v9 = &v17;
    id v10 = &v16;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    uint64_t v18 = *MEMORY[0x263F09AD8];
    v19[0] = MEMORY[0x263EFFA88];
    id v8 = NSDictionary;
    uint64_t v9 = v19;
    id v10 = &v18;
LABEL_7:
    v12 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
    uint64_t v13 = objc_msgSend(v7, "hk_dictionaryByAddingEntriesFromDictionary:", v12);

    uint64_t v7 = (void *)v13;
  }
  v14 = [MEMORY[0x263F0A158] _categoryTypeWithCode:97];
  uint64_t v11 = [a1 categorySampleWithType:v14 value:0 startDate:v6 endDate:v6 metadata:v7];

LABEL_9:
  return v11;
}

+ (id)hkmc_categorySampleWithMenstrualSymptom:()HKMenstrualCycles date:
{
  id v6 = a4;
  uint64_t v7 = HKMCDataTypeCodeFromMenstrualSymptom(a3);
  if (v7 == HKMCDataTypeCodeNotSet)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F0A158] _categoryTypeWithCode:v7];
    id v10 = objc_msgSend(a1, "hkmc_defaultMetadata");
    id v8 = [a1 categorySampleWithType:v9 value:0 startDate:v6 endDate:v6 metadata:v10];
  }
  return v8;
}

+ (id)hkmc_intermenstrualBleedingCategorySampleWithDate:()HKMenstrualCycles
{
  uint64_t v4 = (void *)MEMORY[0x263F0A158];
  id v5 = a3;
  id v6 = [v4 _categoryTypeWithCode:96];
  uint64_t v7 = objc_msgSend(a1, "hkmc_defaultMetadata");
  id v8 = [a1 categorySampleWithType:v6 value:0 startDate:v5 endDate:v5 metadata:v7];

  return v8;
}

+ (id)hkmc_categorySampleWithCycleFactor:()HKMenstrualCycles startDate:endDate:
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = HKMCDataTypeCodeFromCycleFactors(a3);
  if (v10 == 193) {
    uint64_t v11 = HKMCCategoryValueContraceptiveFromCycleFactor(a3);
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = [MEMORY[0x263F0A158] dataTypeWithCode:v10];
  uint64_t v13 = objc_msgSend(a1, "hkmc_defaultMetadata");
  v14 = [a1 categorySampleWithType:v12 value:v11 startDate:v9 endDate:v8 metadata:v13];

  return v14;
}

+ (id)hkmc_pregnancyCategorySampleWithStartDate:()HKMenstrualCycles startTimeZoneID:endDate:startDateSource:embryoAgeInDays:detailsRecordedOnDate:
{
  id v14 = a7;
  id v15 = a8;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_msgSend(a1, "hkmc_defaultMetadata");
  v20 = (void *)[v19 mutableCopy];

  v21 = [NSNumber numberWithInteger:a6];
  [v20 setObject:v21 forKey:*MEMORY[0x263F0AB60]];

  [v20 setValue:v17 forKey:*MEMORY[0x263F09B00]];
  if (v14) {
    [v20 setObject:v14 forKey:*MEMORY[0x263F0AB58]];
  }
  if (v15) {
    [v20 setObject:v15 forKey:*MEMORY[0x263F0AB50]];
  }
  v22 = [MEMORY[0x263F0A158] dataTypeWithCode:191];
  uint64_t v23 = [a1 categorySampleWithType:v22 value:0 startDate:v18 endDate:v16 metadata:v20];

  return v23;
}

- (uint64_t)hkmc_daySummaryBleedingInPregnancyFlow
{
  uint64_t v4 = [a1 categoryType];
  uint64_t v5 = [v4 code];

  if (v5 != 313)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [a1 categoryType];
    uint64_t v11 = [v10 identifier];
    [v8 handleFailureInMethod:a2, a1, @"HKCategorySample+HKMenstrualCycles.m", 204, @"%@: Invalid data type: %@", v9, v11 object file lineNumber description];
  }
  uint64_t v6 = [a1 value];
  return HKMCBleedingFlowFromCategoryValueVaginalBleeding(v6);
}

- (uint64_t)hkmc_daySummaryBleedingAfterPregnancyFlow
{
  uint64_t v4 = [a1 categoryType];
  uint64_t v5 = [v4 code];

  if (v5 != 314)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [a1 categoryType];
    uint64_t v11 = [v10 identifier];
    [v8 handleFailureInMethod:a2, a1, @"HKCategorySample+HKMenstrualCycles.m", 209, @"%@: Invalid data type: %@", v9, v11 object file lineNumber description];
  }
  uint64_t v6 = [a1 value];
  return HKMCBleedingFlowFromCategoryValueVaginalBleeding(v6);
}

- (uint64_t)hkmc_daySummaryCervicalMucusQuality
{
  uint64_t v4 = [a1 categoryType];
  uint64_t v5 = [v4 code];

  if (v5 != 91)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [a1 categoryType];
    uint64_t v11 = [v10 identifier];
    [v8 handleFailureInMethod:a2, a1, @"HKCategorySample+HKMenstrualCycles.m", 214, @"%@: Invalid data type: %@", v9, v11 object file lineNumber description];
  }
  uint64_t v6 = [a1 value];
  return HKMCCervicalMucusQualityFromCategoryValueCervicalMucusQuality(v6);
}

- (uint64_t)hkmc_daySummaryOvulationTestResult
{
  uint64_t v4 = [a1 categoryType];
  uint64_t v5 = [v4 code];

  if (v5 != 92)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [a1 categoryType];
    uint64_t v11 = [v10 identifier];
    [v8 handleFailureInMethod:a2, a1, @"HKCategorySample+HKMenstrualCycles.m", 219, @"%@: Invalid data type: %@", v9, v11 object file lineNumber description];
  }
  uint64_t v6 = [a1 value];
  return HKMCOvulationTestResultFromCategoryValueOvulationTestResult(v6);
}

- (uint64_t)hkmc_daySummaryPregnancyTestResult
{
  uint64_t v4 = [a1 categoryType];
  uint64_t v5 = [v4 code];

  if (v5 != 243)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [a1 categoryType];
    uint64_t v11 = [v10 identifier];
    [v8 handleFailureInMethod:a2, a1, @"HKCategorySample+HKMenstrualCycles.m", 224, @"%@: Invalid data type: %@", v9, v11 object file lineNumber description];
  }
  uint64_t v6 = [a1 value];
  return HKMCPregnancyTestResultFromCategoryValuePregnancyTestResult(v6);
}

- (uint64_t)hkmc_daySummaryProgesteroneTestResult
{
  uint64_t v4 = [a1 categoryType];
  uint64_t v5 = [v4 code];

  if (v5 != 244)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [a1 categoryType];
    uint64_t v11 = [v10 identifier];
    [v8 handleFailureInMethod:a2, a1, @"HKCategorySample+HKMenstrualCycles.m", 229, @"%@: Invalid data type: %@", v9, v11 object file lineNumber description];
  }
  uint64_t v6 = [a1 value];
  return HKMCProgesteroneTestResultFromCategoryValueProgesteroneTestResult(v6);
}

- (uint64_t)hkmc_deviationType
{
  uint64_t v4 = [a1 categoryType];
  uint64_t v5 = [v4 code];

  if ((unint64_t)(v5 - 262) < 4) {
    return qword_224A17B78[v5 - 262];
  }
  uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [a1 categoryType];
  uint64_t v10 = [v9 identifier];
  [v7 handleFailureInMethod:a2, a1, @"HKCategorySample+HKMenstrualCycles.m", 292, @"%@: Invalid data type: %@", v8, v10 object file lineNumber description];

  return 0;
}

@end