@interface HDCategorySampleEntity(HKMenstrualCycles)
+ (id)hdmc_ongoingFactorsOnDayIndex:()HKMenstrualCycles factorTypes:profile:calendarCache:error:;
+ (id)hdmc_ongoingFactorsOnDayIndex:()HKMenstrualCycles profile:calendarCache:error:;
@end

@implementation HDCategorySampleEntity(HKMenstrualCycles)

+ (id)hdmc_ongoingFactorsOnDayIndex:()HKMenstrualCycles profile:calendarCache:error:
{
  id v10 = a5;
  id v11 = a4;
  v12 = HKMCCycleFactorsTypes();
  v13 = objc_msgSend(a1, "hdmc_ongoingFactorsOnDayIndex:factorTypes:profile:calendarCache:error:", a3, v12, v11, v10, a6);

  return v13;
}

+ (id)hdmc_ongoingFactorsOnDayIndex:()HKMenstrualCycles factorTypes:profile:calendarCache:error:
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x263F43180];
  v15 = [MEMORY[0x263EFFA08] setWithArray:v11];
  v16 = [v14 entityEnumeratorWithTypes:v15 profile:v12 error:a7];

  if (v16)
  {
    v17 = objc_msgSend(MEMORY[0x263F434D0], "hdmc_predicateForPossibleOngoingSamplesOnDayIndex:", a3);
    [v16 setPredicate:v17];

    [v16 setLimitCount:*MEMORY[0x263F434E8]];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy_;
    v35 = __Block_byref_object_dispose_;
    id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __115__HDCategorySampleEntity_HKMenstrualCycles__hdmc_ongoingFactorsOnDayIndex_factorTypes_profile_calendarCache_error___block_invoke;
    v27[3] = &unk_264750708;
    id v18 = v13;
    v29 = &v31;
    uint64_t v30 = a3;
    id v28 = v18;
    if ([v16 enumerateWithError:a7 handler:v27])
    {
      v19 = (void *)v32[5];
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __115__HDCategorySampleEntity_HKMenstrualCycles__hdmc_ongoingFactorsOnDayIndex_factorTypes_profile_calendarCache_error___block_invoke_2;
      v25 = &unk_264750730;
      id v26 = v18;
      [v19 sortUsingComparator:&v22];
      v20 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v32[5], v22, v23, v24, v25);
    }
    else
    {
      v20 = 0;
    }

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end