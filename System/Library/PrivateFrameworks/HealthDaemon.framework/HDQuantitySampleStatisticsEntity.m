@interface HDQuantitySampleStatisticsEntity
+ (BOOL)setDiscreteQuantitySampleStatistics:(id)a3 persistentID:(id)a4 database:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (int64_t)protectionClass;
@end

@implementation HDQuantitySampleStatisticsEntity

+ (id)databaseTable
{
  return @"quantity_sample_statistics";
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_104;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"owner_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (BOOL)setDiscreteQuantitySampleStatistics:(id)a3 persistentID:(id)a4 database:(id)a5 error:(id *)a6
{
  v22[6] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v22[0] = @"owner_id";
  v22[1] = @"min";
  v22[2] = @"max";
  v22[3] = @"most_recent";
  v22[4] = @"most_recent_date";
  v22[5] = @"most_recent_duration";
  v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a5;
  v14 = [v12 arrayWithObjects:v22 count:6];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__HDQuantitySampleStatisticsEntity_setDiscreteQuantitySampleStatistics_persistentID_database_error___block_invoke;
  v19[3] = &unk_1E62F3A88;
  id v20 = v11;
  id v21 = v10;
  id v15 = v10;
  id v16 = v11;
  v17 = [a1 insertOrReplaceEntity:1 database:v13 properties:v14 error:a6 bindingHandler:v19];

  return v17 != 0;
}

void __100__HDQuantitySampleStatisticsEntity_setDiscreteQuantitySampleStatistics_persistentID_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"owner_id", [*(id *)(a1 + 32) longLongValue]);
  v4 = [*(id *)(a1 + 40) quantityType];
  id v15 = [v4 canonicalUnit];

  if ([*(id *)(a1 + 40) _hasMinimumQuantity])
  {
    v5 = [*(id *)(a1 + 40) minimumQuantity];
    [v5 doubleValueForUnit:v15];
    MEMORY[0x1C1879E50](a2, @"min");
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"min");
  }
  if ([*(id *)(a1 + 40) _hasMaximumQuantity])
  {
    v6 = [*(id *)(a1 + 40) maximumQuantity];
    [v6 doubleValueForUnit:v15];
    MEMORY[0x1C1879E50](a2, @"max");
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"max");
  }
  if ([*(id *)(a1 + 40) _hasMostRecentQuantity])
  {
    v7 = [*(id *)(a1 + 40) mostRecentQuantity];
    [v7 doubleValueForUnit:v15];
    MEMORY[0x1C1879E50](a2, @"most_recent");
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"most_recent");
  }
  if ([*(id *)(a1 + 40) _hasMostRecentQuantityDateInterval])
  {
    v8 = [*(id *)(a1 + 40) mostRecentQuantityDateInterval];
    v9 = [v8 startDate];
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;

    MEMORY[0x1C1879E50](a2, @"most_recent_date", v11);
    v12 = [*(id *)(a1 + 40) mostRecentQuantityDateInterval];
    [v12 duration];
    double v14 = v13;

    if (v14 == 0.0) {
      MEMORY[0x1C1879E80](a2, @"most_recent_duration", 0);
    }
    else {
      MEMORY[0x1C1879E50](a2, @"most_recent_duration", v14);
    }
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"most_recent_date");
    MEMORY[0x1C1879E90](a2, @"most_recent_duration");
  }
}

@end