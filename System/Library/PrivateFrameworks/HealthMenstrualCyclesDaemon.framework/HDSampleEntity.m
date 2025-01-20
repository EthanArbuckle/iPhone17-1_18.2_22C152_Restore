@interface HDSampleEntity
@end

@implementation HDSampleEntity

uint64_t __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [v5 databaseForEntityClass:objc_opt_class()];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke_4;
  v9[3] = &unk_264750D00;
  v9[4] = *(void *)(a1 + 32);
  uint64_t v7 = [v6 executeCachedStatementForKey:&IDSBAASignerErrorDomain_block_invoke_lookupKey error:a3 SQLGenerator:&__block_literal_global_3 bindingHandler:0 enumerationHandler:v9];

  return v7;
}

id __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke_2()
{
  v0 = HKMCCycleTrackingSampleTypes();
  v1 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09E38]];
  v2 = [v0 arrayByAddingObject:v1];

  v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_286);
  v4 = NSString;
  id v5 = [v3 componentsJoinedByString:@", "];
  v6 = [v4 stringWithFormat:@"WHERE (samples.data_type IN (%@))", v5];

  uint64_t v7 = [NSString stringWithFormat:@"SELECT MAX(samples.data_id), objects.uuid, samples.data_type, objects.type FROM samples INNER JOIN objects USING(data_id) %@", v6];

  return v7;
}

uint64_t __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 code];
  return [v2 numberWithInteger:v3];
}

uint64_t __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x22A634720](a2, 1);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F451D0]);
    uint64_t v5 = HDSQLiteColumnAsInt64();
    uint64_t v6 = [v4 initWithAnchor:v5 UUID:v3 deleted:HDSQLiteColumnAsInt64() == 2];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  return 0;
}

@end