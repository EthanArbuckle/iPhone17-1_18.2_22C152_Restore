@interface HDSampleEntity(HKMenstrualCycles)
+ (id)hdmc_daySummaryAnchorWithHealthDatabase:()HKMenstrualCycles error:;
+ (uint64_t)hdmc_analysisSampleInfo:()HKMenstrualCycles forProfile:error:;
@end

@implementation HDSampleEntity(HKMenstrualCycles)

+ (id)hdmc_daySummaryAnchorWithHealthDatabase:()HKMenstrualCycles error:
{
  v5 = (void *)MEMORY[0x263F43318];
  id v6 = a3;
  v7 = HKMCDaySummarySampleTypes();
  v8 = HDSampleEntityPredicateForDataTypes();
  v9 = [v5 maxRowIDForPredicate:v8 healthDatabase:v6 error:a4];

  return v9;
}

+ (uint64_t)hdmc_analysisSampleInfo:()HKMenstrualCycles forProfile:error:
{
  id v5 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  id v6 = [v5 database];
  v7 = [MEMORY[0x263F431E0] contextForReadingProtectedData];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke;
  v12[3] = &unk_264750D28;
  v12[4] = &v14;
  id v13 = 0;
  uint64_t v8 = [v6 performTransactionWithContext:v7 error:&v13 block:v12 inaccessibilityHandler:0];
  id v9 = v13;

  char v10 = v8 ^ 1;
  if (!a3) {
    char v10 = 1;
  }
  if ((v10 & 1) == 0) {
    *a3 = (id) v15[5];
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

@end