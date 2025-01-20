@interface HDQuantitySampleSeriesEntity
+ (BOOL)_deleteHFDSeriesIfFoundForPersistentID:(void *)a3 database:(uint64_t)a4 error:;
+ (BOOL)deleteSeriesDataWithKey:(int64_t)a3 database:(id)a4 error:(id *)a5;
+ (BOOL)deleteSeriesWithID:(id)a3 deleteSeriesData:(BOOL)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)enumerateDataWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)enumerateDataWithIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)enumerateDataWithTransaction:(id)a3 HFDKey:(int64_t)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)enumerateRawDataWithTransaction:(id)a3 HFDKey:(int64_t)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)insertValues:(id)a3 series:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)isConcreteEntity;
+ (BOOL)performPostFirstJournalMergeCleanupWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)primitiveInsertValues:(id)a3 seriesVersion:(int64_t)a4 HFDKey:(int64_t)a5 database:(id)a6 error:(id *)a7;
+ (BOOL)primitiveRemoveDatums:(id)a3 HFDKey:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)replaceExistingObject:(id)a3 existingObjectID:(id)a4 replacementObject:(id)a5 replacementObjectID:(id)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9;
+ (BOOL)replaceObjectID:(id)a3 replacementObjectID:(id)a4 deleteOriginalSeriesData:(BOOL)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (BOOL)supportsObjectMerging;
+ (BOOL)unitTesting_insertValues:(id)a3 quantitySample:(id)a4 seriesVersion:(int64_t)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5;
+ (Class)entityClassForEnumeration;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_insertDataObject:(void *)a3 inDatabase:(void *)a4 persistentID:(uint64_t)a5 error:;
+ (id)additionalPredicateForEnumeration;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)freezeSeriesWithIdentifier:(id)a3 metadata:(id)a4 endDate:(id)a5 profile:(id)a6 error:(id *)a7;
+ (id)hasSeriesDataForHFDKey:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (id)indices;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)joinClausesForProperty:(id)a3;
+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8;
+ (id)objectInsertionFilterForProfile:(id)a3;
+ (id)orderingTermForSortDescriptor:(id)a3;
+ (id)privateSubEntities;
+ (id)quantitySampleSeriesEntitiesForAutoFreezeSQL;
+ (id)quantitySampleSeriesEntitiesForAutoFreezeWithTransaction:(id)a3 error:(id *)a4;
+ (id)removeValues:(id)a3 fromQuantitySeriesSample:(id)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)_hasSeriesDataWithDatabase:(id)a3 hfdKey:(unint64_t)a4 error:(id *)a5;
+ (uint64_t)_insertionEra;
+ (uint64_t)_statisticsProperties;
+ (void)unitTesting_updateInsertionEra;
- (BOOL)_getFirstTimeEndTimeCountWithTransaction:(uint64_t)a3 HFDKey:(uint64_t)a4 error:(void *)a5 handler:;
- (BOOL)_insertValues:(void *)a3 database:(uint64_t)a4 error:;
- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4;
- (BOOL)enumerateDataWithTransaction:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)insertValues:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)startTimeEndTimeCountForSeriesWithTransaction:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)unitTesting_setInsertionEra:(int64_t)a3 profile:(id)a4 error:(id *)a5;
- (id)HFDKeyWithDatabase:(id)a3 error:(id *)a4;
- (id)_dataOriginProvenanceWithTransaction:(void *)a3 profile:(uint64_t)a4 error:;
- (id)_updatedSampleForQuantitySeriesSample:(uint64_t)a3 HFDKey:(void *)a4 endDate:(void *)a5 transaction:(uint64_t)a6 error:;
- (id)countForSeriesWithTransaction:(id)a3 error:(id *)a4;
- (id)freezeWithEndDate:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6;
- (id)hasSeriesDataWithTransaction:(id)a3 error:(id *)a4;
- (uint64_t)_isFrozenInDatabase:(uint64_t)a3 error:;
- (uint64_t)_setHFDKey:(void *)a3 database:(uint64_t)a4 error:;
- (void)willDeleteFromDatabase:(id)a3;
@end

@implementation HDQuantitySampleSeriesEntity

+ (id)databaseTable
{
  return @"quantity_sample_series";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  {
    v5 = a3;
    a3 = v5;
    if (v4)
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_1, 0, &dword_1BCB7D000);
      a3 = v5;
    }
  }
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)+[HDQuantitySampleSeriesEntity columnDefinitionsWithCount:]::columnDefinitions;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"data_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)indices
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = +[HDQuantitySampleSeriesEntity disambiguatedSQLForProperty:@"insertion_era"];
  int v4 = [v2 stringWithFormat:@"%@ IS NOT NULL", v3];

  id v5 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v6 = objc_opt_class();
  v11 = @"insertion_era";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v8 = (void *)[v5 initWithEntity:v6 name:@"unfrozen" columns:v7 unique:0 predicateString:v4];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v9;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (Class)entityClassForEnumeration
{
  return (Class)objc_opt_class();
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  self;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"count", @"insertion_era", @"hfd_key", 0);
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F65D38];
    v8 = objc_msgSend((id)objc_msgSend(a1, "entityClassForEnumeration"), "disambiguatedDatabaseTable");
    v9 = [v7 leftJoinClauseFromTable:v8 toTargetEntity:a1 as:0 localReference:@"data_id" targetKey:@"data_id"];

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
LABEL_5:
    v15 = (void *)v10;

    goto LABEL_7;
  }
  v11 = +[HDQuantitySampleSeriesEntity _statisticsProperties]();
  int v12 = [v11 containsObject:v4];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F65D38];
    v14 = [a1 disambiguatedDatabaseTable];
    v9 = [v13 leftJoinClauseFromTable:v14 toTargetEntity:objc_opt_class() as:0 localReference:@"data_id" targetKey:@"owner_id"];

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    goto LABEL_5;
  }
  v15 = objc_msgSend((id)objc_msgSend(a1, "entityClassForEnumeration"), "joinClausesForProperty:", v4);
LABEL_7:

  return v15;
}

+ (uint64_t)_statisticsProperties
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"min", @"max", @"most_recent", @"most_recent_date", @"most_recent_duration", 0);
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 key];
  uint64_t v6 = [v4 ascending];
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A9B0]])
  {
    v7 = NSString;
    v8 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"most_recent_date"];
    v9 = +[HDDataEntity disambiguatedSQLForProperty:@"start_date"];
    uint64_t v10 = [v7 stringWithFormat:@"IFNULL(%@, %@)", v8, v9];

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F65D50]) initWithExpression:v10 ascending:v6];
LABEL_5:
    v16 = (void *)v11;

    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A9A8]])
  {
    int v12 = NSString;
    v13 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"most_recent_date"];
    v14 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"most_recent_duration"];
    v15 = +[HDDataEntity disambiguatedSQLForProperty:@"end_date"];
    uint64_t v10 = [v12 stringWithFormat:@"IFNULL(%@ + %@, %@)", v13, v14, v15];

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F65D50]) initWithExpression:v10 ascending:v6];
    goto LABEL_5;
  }
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleSeriesEntity;
  v16 = objc_msgSendSuper2(&v18, sel_orderingTermForSortDescriptor_, v4);
LABEL_7:

  return v16;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x1E4F65C70]] & 1) != 0
    || [v4 isEqualToString:@"data_id"])
  {
    id v5 = (void *)[a1 entityClassForEnumeration];
LABEL_4:
    uint64_t v6 = [v5 disambiguatedSQLForProperty:v4];
    goto LABEL_5;
  }
  v9 = +[HDQuantitySampleSeriesEntity _statisticsProperties]();
  int v10 = [v9 containsObject:v4];

  if (v10)
  {
    id v5 = objc_opt_class();
    goto LABEL_4;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleSeriesEntity;
  uint64_t v6 = objc_msgSendSuper2(&v11, sel_disambiguatedSQLForProperty_, v4);
LABEL_5:
  v7 = (void *)v6;

  return v7;
}

+ (id)privateSubEntities
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (uint64_t)_insertionEra
{
  if (_MergedGlobals_213 != -1) {
    dispatch_once(&_MergedGlobals_213, &__block_literal_global_149);
  }
  return qword_1EBA18D68;
}

void __45__HDQuantitySampleSeriesEntity__insertionEra__block_invoke()
{
  qword_1EBA18D68 = (uint64_t)CFAbsoluteTimeGetCurrent();
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  return 1;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v7 = +[HDQuantitySampleSeriesEntity _insertDataObject:inDatabase:persistentID:error:]((uint64_t)a1, a3, a5, a6, (uint64_t)a7);

  return v7;
}

+ (id)_insertDataObject:(void *)a3 inDatabase:(void *)a4 persistentID:(uint64_t)a5 error:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v43 = a4;
  uint64_t v10 = self;
  if ([v8 count] == 1 && objc_msgSend(v8, "_frozen"))
  {
    id v11 = v43;
    goto LABEL_21;
  }
  int v12 = [v8 codableQuantitySample];
  if ([v12 hasFinal])
  {
    v13 = [v8 codableQuantitySample];
    char v14 = [v13 final];

    if ((v14 & 1) == 0)
    {
      id v15 = v8;
      v16 = @"insert";
      self;
      _HKInitializeLogging();
      v17 = (id)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v42 = [v15 quantityType];
        uint64_t v40 = [v42 code];
        uint64_t v39 = [v15 count];
        v41 = [v15 codableQuantitySample];
        int v37 = [v41 frozen];
        v38 = [v15 codableQuantitySample];
        int v18 = [v38 final];
        v19 = [v15 codableQuantitySample];
        v20 = [v19 quantitySeriesDatas];
        *(_DWORD *)buf = 138544898;
        v50 = @"insert";
        __int16 v51 = 2048;
        uint64_t v52 = v40;
        __int16 v53 = 2048;
        uint64_t v54 = v39;
        __int16 v55 = 1024;
        int v56 = v37;
        __int16 v57 = 1024;
        int v58 = v18;
        __int16 v59 = 2048;
        uint64_t v60 = [v20 count];
        __int16 v61 = 2114;
        id v62 = v15;
        _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "Non-final quantity sample %{public}@: type=%ld, count=%ld, frozen=%{BOOL}d, final=%{BOOL}d, datumsCount=%ld, sample=(%{public}@)", buf, 0x40u);
      }
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = [v15 count];
      v23 = [v15 codableQuantitySample];
      v24 = [v23 quantitySeriesDatas];
      +[HDAutoBugCaptureReporter reportNotFinalSeriesSampleWithClass:count:datumCount:reason:](HDAutoBugCaptureReporter, "reportNotFinalSeriesSampleWithClass:count:datumCount:reason:", v21, v22, [v24 count], @"insert");

      char v25 = 0;
      goto LABEL_11;
    }
  }
  else
  {
  }
  char v25 = 1;
LABEL_11:
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __80__HDQuantitySampleSeriesEntity__insertDataObject_inDatabase_persistentID_error___block_invoke;
  v44[3] = &unk_1E6304328;
  id v26 = v43;
  id v45 = v26;
  id v27 = v8;
  id v46 = v27;
  uint64_t v47 = v10;
  char v48 = v25;
  if (([v9 executeSQL:@"INSERT INTO quantity_sample_series (data_id, count, insertion_era, hfd_key, series_location) VALUES (?, ?, ?, (COALESCE((SELECT MAX(hfd_key) + 1 FROM quantity_sample_series), 1)), 2)", a5, v44, 0 error bindingHandler enumerationHandler] & 1) != 0&& ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)|| +[HDQuantitySampleStatisticsEntity setDiscreteQuantitySampleStatistics:persistentID:database:error:](HDQuantitySampleStatisticsEntity, "setDiscreteQuantitySampleStatistics:persistentID:database:error:", v27, v26, v9, a5))&& +[HDQuantitySampleSeriesEntity _deleteHFDSeriesIfFoundForPersistentID:database:error:](v10, v26, v9, a5))
  {
    v28 = [v27 codableQuantitySample];
    v29 = [v28 quantitySeriesDatas];
    BOOL v30 = v29 == 0;

    if (!v30)
    {
      v31 = [v27 codableQuantitySample];
      v32 = [v31 quantitySeriesDatas];
      v33 = objc_msgSend(v32, "hk_map:", &__block_literal_global_346_0);

      v34 = -[HDSQLiteEntity initWithPersistentID:]([HDQuantitySampleSeriesEntity alloc], "initWithPersistentID:", [v26 longLongValue]);
      BOOL v35 = -[HDQuantitySampleSeriesEntity _insertValues:database:error:](v34, v33, v9, a5);

      if (!v35) {
        id v26 = 0;
      }
    }
    id v11 = v26;
  }
  else
  {
    id v11 = 0;
  }

LABEL_21:

  return v11;
}

uint64_t __80__HDQuantitySampleSeriesEntity__insertDataObject_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) count]);
  if ([*(id *)(a1 + 40) _frozen])
  {
    if (*(unsigned char *)(a1 + 56))
    {
      return sqlite3_bind_null(a2, 3);
    }
    self;
    sqlite3_int64 v5 = -+[HDQuantitySampleSeriesEntity _insertionEra]();
  }
  else
  {
    sqlite3_int64 v5 = +[HDQuantitySampleSeriesEntity _insertionEra]();
  }

  return sqlite3_bind_int64(a2, 3, v5);
}

+ (BOOL)_deleteHFDSeriesIfFoundForPersistentID:(void *)a3 database:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  id v8 = +[HDSQLiteEntity entityWithPersistentID:v6];
  id v9 = [v8 HFDKeyWithDatabase:v7 error:a4];

  if (v9) {
    BOOL v10 = +[HDQuantitySeriesDataEntity deleteSeriesDataWithIdentifier:database:error:](HDQuantitySeriesDataEntity, "deleteSeriesDataWithIdentifier:database:error:", [v9 longLongValue], v7, a4);
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

id __80__HDQuantitySampleSeriesEntity__insertDataObject_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasStartDate]) {
    [v2 startDate];
  }
  else {
    [v2 endDate];
  }
  double v4 = v3;
  float v5 = -1.0;
  if ([v2 hasStartDate])
  {
    [v2 endDate];
    double v7 = v6;
    [v2 startDate];
    float v5 = v7 - v8;
  }
  id v9 = (void *)MEMORY[0x1E4F2ADB0];
  [v2 value];
  *(float *)&double v10 = v5;
  int v12 = [v9 datumWithTimestamp:v4 value:v11 duration:v10];

  return v12;
}

- (BOOL)_insertValues:(void *)a3 database:(uint64_t)a4 error:
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = [a1 HFDKeyWithDatabase:v8 error:a4];
    if (v9)
    {
      uint64_t v39 = 0;
      uint64_t v40 = &v39;
      uint64_t v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__126;
      id v43 = __Block_byref_object_dispose__126;
      id v44 = 0;
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2020000000;
      uint64_t v38 = -1;
      v46[0] = @"start_date";
      v46[1] = @"data_type";
      double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __61__HDQuantitySampleSeriesEntity__insertValues_database_error___block_invoke;
      v34[3] = &unk_1E6304370;
      v34[4] = &v39;
      v34[5] = &v35;
      int v11 = [a1 getValuesForProperties:v10 database:v8 error:a4 handler:v34];

      if (v11 && v40[5] && (_HKValidDataTypeCode() & 1) != 0)
      {
        int v12 = [MEMORY[0x1E4F2B448] dataTypeWithCode:v36[3]];
        [(id)v40[5] timeIntervalSinceReferenceDate];
        double v14 = v13;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v15 = v7;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v45 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v31;
LABEL_8:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v30 + 1) + 8 * v18);
            [v19 timeInterval];
            if (v20 < v14) {
              break;
            }
            [v19 duration];
            if (v21 < 0.0)
            {
              [v19 duration];
              if (v22 != -1.0)
              {
                objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Cannot insert datum (%@) because it has an invalid negative duration", v19);
                goto LABEL_27;
              }
            }
            if ([v12 isMinimumDurationRestricted])
            {
              [v19 duration];
              float v24 = v23;
              [v12 minimumAllowedDuration];
              if (v25 > v24)
              {
                v28 = (void *)MEMORY[0x1E4F28C58];
                [v12 minimumAllowedDuration];
                objc_msgSend(v28, "hk_assignError:code:format:", a4, 100, @"Cannot insert datum (%@) because duration is too short. Minimum required duration for sample type %@ is %f", v19, v12, v29);
                goto LABEL_27;
              }
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v45 count:16];
              if (v16) {
                goto LABEL_8;
              }
              goto LABEL_18;
            }
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Cannot insert datum (%@) because it occurs before the series start time (%f)", v19, *(void *)&v14);
LABEL_27:

          BOOL v26 = 0;
          goto LABEL_28;
        }
LABEL_18:

        BOOL v26 = +[HDQuantitySampleSeriesEntity primitiveInsertValues:seriesVersion:HFDKey:database:error:](HDQuantitySampleSeriesEntity, "primitiveInsertValues:seriesVersion:HFDKey:database:error:", v15, 1, [v9 longLongValue], v8, a4);
LABEL_28:
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Unable to lookup %@ and %@ for %@ with persistentID %lld", @"start_date", @"data_type", objc_opt_class(), objc_msgSend(a1, "persistentID"));
        BOOL v26 = 0;
      }
      _Block_object_dispose(&v35, 8);
      _Block_object_dispose(&v39, 8);
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

+ (BOOL)insertValues:(id)a3 series:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [[HDInsertValuesToQuantitySampleSeriesOperation alloc] initWithSeries:v10 values:v9];
  LOBYTE(a6) = [(HDJournalableOperation *)v12 performOrJournalWithProfile:v11 error:a6];

  return (char)a6;
}

+ (id)objectInsertionFilterForProfile:(id)a3
{
  id v4 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleSeriesEntity;
  float v5 = objc_msgSendSuper2(&v11, sel_objectInsertionFilterForProfile_, v4);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HDQuantitySampleSeriesEntity_objectInsertionFilterForProfile___block_invoke;
  aBlock[3] = &unk_1E62FFC58;
  id v10 = v5;
  id v6 = v5;
  id v7 = _Block_copy(aBlock);

  return v7;
}

uint64_t __64__HDQuantitySampleSeriesEntity_objectInsertionFilterForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 _frozen]) {
      uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)insertValues:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_super v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDQuantitySampleSeriesEntity.mm", 349, @"Invalid parameter not satisfying: %@", @"values != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"HDQuantitySampleSeriesEntity.mm", 350, @"Invalid parameter not satisfying: %@", @"transaction != nil" object file lineNumber description];

LABEL_3:
  int v12 = [v11 protectedDatabase];
  id v20 = 0;
  uint64_t v13 = -[HDQuantitySampleSeriesEntity _isFrozenInDatabase:error:]((uint64_t)self, v12, (uint64_t)&v20);
  id v14 = v20;

  if (v13 == 2)
  {
    id v15 = [v11 protectedDatabase];
    BOOL v16 = -[HDQuantitySampleSeriesEntity _insertValues:database:error:](self, v9, v15, (uint64_t)a5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a5, 3, @"Unable to add data to a frozen series.", v14);
    BOOL v16 = 0;
  }

  return v16;
}

- (uint64_t)_isFrozenInDatabase:(uint64_t)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v11[4] = &v13;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __58__HDQuantitySampleSeriesEntity__isFrozenInDatabase_error___block_invoke;
    v12[3] = &unk_1E62F52C8;
    v12[4] = a1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__HDQuantitySampleSeriesEntity__isFrozenInDatabase_error___block_invoke_2;
    v11[3] = &unk_1E62F5278;
    int v7 = [v5 executeSQL:@"SELECT insertion_era FROM quantity_sample_series WHERE data_id = ?" error:a3 bindingHandler:v12 enumerationHandler:v11];
    uint64_t v8 = 1;
    if (!*((unsigned char *)v14 + 24)) {
      uint64_t v8 = 2;
    }
    if (v7) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __58__HDQuantitySampleSeriesEntity__isFrozenInDatabase_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __58__HDQuantitySampleSeriesEntity__isFrozenInDatabase_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1C1879FC0](a2, 0)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return 0;
}

- (id)HFDKeyWithDatabase:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v16[0] = @"hfd_key";
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__HDQuantitySampleSeriesEntity_HFDKeyWithDatabase_error___block_invoke;
  v11[3] = &unk_1E62FFCA8;
  v11[4] = &v12;
  BOOL v8 = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v6 error:a4 handler:v11];

  if (v8)
  {
    if (v13[3])
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:");
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Unable to get %@ for %@ with persistentID %lld", @"hfd_key", objc_opt_class(), -[HDSQLiteEntity persistentID](self, "persistentID"));
  }
  uint64_t v9 = 0;
LABEL_6:
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __57__HDQuantitySampleSeriesEntity_HFDKeyWithDatabase_error___block_invoke(uint64_t a1)
{
  uint64_t result = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (uint64_t)_setHFDKey:(void *)a3 database:(uint64_t)a4 error:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v12[0] = @"hfd_key";
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HDQuantitySampleSeriesEntity__setHFDKey_database_error___block_invoke;
  v11[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v11[4] = a2;
  uint64_t v9 = [a1 updateProperties:v8 database:v7 error:a4 bindingHandler:v11];

  return v9;
}

void __58__HDQuantitySampleSeriesEntity__setHFDKey_database_error___block_invoke()
{
}

uint64_t __61__HDQuantitySampleSeriesEntity__insertValues_database_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = MEMORY[0x1C1879F30](a3, 0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t result = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)primitiveInsertValues:(id)a3 seriesVersion:(int64_t)a4 HFDKey:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  v28 = a7;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v12);
        }
        char v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_msgSend(v16, "value", v28);
        double v18 = v17;
        float v19 = -1.0;
        if (a4 == 1 && [v16 hasDuration])
        {
          [v16 duration];
          float v19 = v20;
        }
        [v16 timeInterval];
        id v29 = 0;
        BOOL v22 = +[HDQuantitySeriesDataEntity insertOrReplaceEntity:1 database:v11 value:a5 duration:&v29 timestamp:v18 identifier:v19 error:v21];
        id v23 = v29;
        if (!v22)
        {
          id v25 = v23;
          BOOL v26 = v25;
          if (v25)
          {
            if (v28) {
              id *v28 = v25;
            }
            else {
              _HKLogDroppedError();
            }
          }

          BOOL v24 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v24 = 1;
LABEL_18:

  return v24;
}

+ (id)freezeSeriesWithIdentifier:(id)a3 metadata:(id)a4 endDate:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [[HDFreezeQuantitySampleSeriesOperation alloc] initWithIdentifier:v11 metadata:v12 endDate:v13];
  if ([(HDJournalableOperation *)v15 performOrJournalWithProfile:v14 error:a7])
  {
    char v16 = [HDSeriesFreezeResult alloc];
    uint64_t v17 = [(HDFreezeQuantitySampleSeriesOperation *)v15 freezeResult];
    double v18 = [(HDFreezeQuantitySampleSeriesOperation *)v15 frozenIdentifier];
    float v19 = [(HDSeriesFreezeResult *)v16 initWithStatus:v17 frozenIdentifier:v18];
  }
  else
  {
    float v19 = 0;
  }

  return v19;
}

+ (BOOL)performPostFirstJournalMergeCleanupWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v23 = a4;
  BOOL v24 = v7;
  id v30 = 0;
  BOOL v8 = [a1 quantitySampleSeriesEntitiesForAutoFreezeWithTransaction:v7 error:&v30];
  id v9 = v30;
  if (v8)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v27;
      do
      {
        uint64_t v12 = 0;
        id v13 = v9;
        do
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
          uint64_t v15 = [v24 protectedDatabase];
          char v16 = [v14 UUIDForProperty:@"uuid" database:v15];

          id v25 = v13;
          uint64_t v17 = +[HDQuantitySampleSeriesEntity freezeSeriesWithIdentifier:v16 metadata:0 endDate:0 profile:v23 error:&v25];
          id v9 = v25;

          if (!v17)
          {
            _HKInitializeLogging();
            double v18 = (id)*MEMORY[0x1E4F29F18];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              uint64_t v19 = [v14 persistentID];
              *(_DWORD *)buf = 134218242;
              uint64_t v32 = v19;
              __int16 v33 = 2114;
              id v34 = v9;
              _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "Failed to freeze quantity sample series %lld during post-journal-merge cleanup: %{public}@", buf, 0x16u);
            }
          }
          ++v12;
          id v13 = v9;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v10);
    }
  }
  else
  {
    _HKInitializeLogging();
    float v20 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = (uint64_t)v9;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Failed to enumerate quantity sample series requiring auto-freeze during post-journal-merge cleanup: %{public}@", buf, 0xCu);
    }
  }

  return 1;
}

+ (id)quantitySampleSeriesEntitiesForAutoFreezeWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v8 = [a1 quantitySampleSeriesEntitiesForAutoFreezeSQL];
  uint64_t v9 = +[HDQuantitySampleSeriesEntity _insertionEra]();
  uint64_t v10 = [v6 protectedDatabase];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __95__HDQuantitySampleSeriesEntity_quantitySampleSeriesEntitiesForAutoFreezeWithTransaction_error___block_invoke;
  v16[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[4] = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__HDQuantitySampleSeriesEntity_quantitySampleSeriesEntitiesForAutoFreezeWithTransaction_error___block_invoke_2;
  v14[3] = &unk_1E6304398;
  id v11 = v7;
  id v15 = v11;
  LOBYTE(a4) = [v10 executeSQL:v8 error:a4 bindingHandler:v16 enumerationHandler:v14];

  if (a4) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

uint64_t __95__HDQuantitySampleSeriesEntity_quantitySampleSeriesEntitiesForAutoFreezeWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 32));

  return sqlite3_bind_int64(a2, 3, 1209600);
}

uint64_t __95__HDQuantitySampleSeriesEntity_quantitySampleSeriesEntitiesForAutoFreezeWithTransaction_error___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [(HDSQLiteEntity *)[HDQuantitySampleSeriesEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  [v1 addObject:v2];

  return 1;
}

+ (id)quantitySampleSeriesEntitiesForAutoFreezeSQL
{
  id v2 = NSString;
  sqlite3_int64 v3 = [a1 disambiguatedDatabaseTable];
  uint64_t v4 = [v2 stringWithFormat:@"SELECT %@ FROM %@ WHERE ((%@ IS NOT NULL) AND (%@ != ?) AND ((%@ > 0) OR (ABS(? + %@) > ?)))", @"data_id", v3, @"insertion_era", @"insertion_era", @"insertion_era", @"insertion_era"];

  return v4;
}

- (id)freezeWithEndDate:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 protectedDatabase];
  id v14 = [(HDQuantitySampleSeriesEntity *)self HFDKeyWithDatabase:v13 error:a6];
  if (!v14)
  {
    id v23 = 0;
    goto LABEL_32;
  }
  uint64_t v54 = v13;
  __int16 v55 = v14;
  id v56 = v11;
  __int16 v57 = v10;
  id v52 = v12;
  objc_msgSend(NSNumber, "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v12;
  id v62 = 0;
  uint64_t v63 = (uint64_t)&v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__126;
  v66 = __Block_byref_object_dispose__126;
  id v67 = 0;
  uint64_t v17 = [self entityEnumeratorWithProfile:v16];
  double v18 = HDDataEntityPredicateForRowID((uint64_t)v15, 1);
  [v17 setPredicate:v18];

  [v17 setIgnoreEntityClassAdditionalPredicateForEnumeration:1];
  id v60 = 0;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __82__HDQuantitySampleSeriesEntity__quantitySampleWithID_canBeUnfrozen_profile_error___block_invoke;
  v61[3] = &unk_1E6304220;
  v61[4] = &v62;
  [v17 enumerateWithError:&v60 handler:v61];
  id v19 = v60;
  id v20 = v19;
  double v21 = *(void **)(v63 + 40);
  int v58 = v21;
  if (v21)
  {
    id v22 = v21;
    goto LABEL_12;
  }
  if (v19)
  {
    id v20 = v19;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Could not find series with ID %@", v15);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
LABEL_8:
    if (a6)
    {
      id v20 = v20;
      *a6 = v20;
    }
    else
    {
      _HKLogDroppedError();
    }
  }

LABEL_12:
  _Block_object_dispose(&v62, 8);

  BOOL v24 = [v58 UUID];
  __int16 v53 = (void *)[v24 copy];

  uint64_t v25 = [v55 longLongValue];
  uint64_t v26 = [v55 longLongValue];
  id v59 = v58;
  id v27 = v57;
  id v28 = v11;
  id v29 = v16;
  uint64_t v51 = v25;
  if (self)
  {
    id v30 = -[HDQuantitySampleSeriesEntity _dataOriginProvenanceWithTransaction:profile:error:](self, v28, v29, (uint64_t)a6);
    if (v30)
    {
      long long v31 = -[HDQuantitySampleSeriesEntity _updatedSampleForQuantitySeriesSample:HFDKey:endDate:transaction:error:]((uint64_t)self, v59, v26, v27, v28, (uint64_t)a6);
      uint64_t v32 = v31;
      if (!v31) {
        goto LABEL_17;
      }
      [v31 _setFreezing];
      __int16 v33 = [v29 dataManager];
      id v62 = v32;
      id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
      [v59 _creationTimestamp];
      char v35 = objc_msgSend(v33, "insertDataObjects:withProvenance:creationDate:error:", v34, v30, a6);

      if (v35)
      {
        uint64_t v36 = [v32 UUID];
      }
      else
      {
LABEL_17:
        uint64_t v36 = 0;
      }
    }
    else
    {
      uint64_t v36 = 0;
    }
  }
  else
  {
    uint64_t v36 = 0;
  }

  if (v36)
  {
    uint64_t v37 = HDDataEntityPredicateForDataUUID();
    uint64_t v38 = +[HDDataEntity anyInDatabase:v54 predicate:v37 error:a6];

    if (v38)
    {
      uint64_t v39 = objc_opt_class();
      uint64_t v40 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
      uint64_t v41 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v38, "persistentID"));
      char v42 = [v39 replaceObjectID:v40 replacementObjectID:v41 deleteOriginalSeriesData:0 profile:v29 transaction:v28 error:a6];

      if (v42)
      {
        id v43 = v38;
        id v44 = v53;
        id v45 = v54;
        self;
        v61[0] = @"uuid";
        id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
        id v62 = (void *)MEMORY[0x1E4F143A8];
        uint64_t v63 = 3221225472;
        uint64_t v64 = (uint64_t)__136__HDQuantitySampleSeriesEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke;
        v65 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6304248;
        uint64_t v47 = (void (*)(uint64_t))v44;
        v66 = v47;
        char v48 = [v43 updateProperties:v46 database:v45 error:a6 bindingHandler:&v62];

        if (v48)
        {
          int v49 = -[HDQuantitySampleSeriesEntity _setHFDKey:database:error:](v43, v51, v45, (uint64_t)a6);

          if (v49)
          {
            id v23 = v43;
LABEL_30:

            goto LABEL_31;
          }
        }
        else
        {
        }
      }
    }
    id v23 = 0;
    goto LABEL_30;
  }
  id v23 = 0;
LABEL_31:

  id v11 = v56;
  id v10 = v57;
  id v12 = v52;
  id v13 = v54;
  id v14 = v55;
LABEL_32:

  return v23;
}

+ (BOOL)deleteSeriesWithID:(id)a3 deleteSeriesData:(BOOL)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = __Block_byref_object_copy__126;
  uint64_t v25 = __Block_byref_object_dispose__126;
  id v26 = 0;
  id v14 = [[HDDataEntityDeletionContext alloc] initWithProfile:v12 transaction:v13];
  [(HDDataEntityDeletionContext *)v14 setInsertDeletedObjects:0];
  [(HDDataEntityDeletionContext *)v14 setCallWillDeleteWithProfileTransaction:v10];
  id v15 = HDDataEntityPredicateForRowID((uint64_t)v11, 1);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__HDQuantitySampleSeriesEntity_deleteSeriesWithID_deleteSeriesData_profile_transaction_error___block_invoke;
  v20[3] = &unk_1E62FFC30;
  v20[4] = &v27;
  v20[5] = &v21;
  +[HDSampleEntity deleteSamplesWithPredicate:v15 limit:0 deletionContext:v14 completionHandler:v20];

  id v16 = (id)v22[5];
  uint64_t v17 = v16;
  if (v16)
  {
    if (a7) {
      *a7 = v16;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v18 = *((unsigned char *)v28 + 24);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __94__HDQuantitySampleSeriesEntity_deleteSeriesWithID_deleteSeriesData_profile_transaction_error___block_invoke(uint64_t a1, char a2, int a3, int a4, int a5, int a6, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

+ (BOOL)replaceObjectID:(id)a3 replacementObjectID:(id)a4 deleteOriginalSeriesData:(BOOL)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  if (+[HDAssociationEntity copyAssociationsFromChildID:v14 toObjectID:a4 profile:v15 error:a8])
  {
    char v17 = [a1 deleteSeriesWithID:v14 deleteSeriesData:v11 profile:v15 transaction:v16 error:a8];
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)_dataOriginProvenanceWithTransaction:(void *)a3 profile:(uint64_t)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v7 protectedDatabase];
  BOOL v10 = [a1 valueForProperty:@"provenance" database:v9];

  if (v10)
  {
    BOOL v11 = [v8 dataProvenanceManager];
    id v12 = [v11 originProvenanceForPersistentID:v10 transaction:v7 error:a4];

    if (v12) {
      id v13 = v12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Unable to get %@ for %@ with persistentID %lld", @"provenance", objc_opt_class(), objc_msgSend(a1, "persistentID"));
    id v12 = 0;
  }

  return v12;
}

- (id)_updatedSampleForQuantitySeriesSample:(uint64_t)a3 HFDKey:(void *)a4 endDate:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  uint64_t v86 = 0;
  v87 = (double *)&v86;
  uint64_t v88 = 0x2020000000;
  uint64_t v89 = 0;
  uint64_t v82 = 0;
  v83 = (double *)&v82;
  uint64_t v84 = 0x2020000000;
  uint64_t v85 = 0;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  uint64_t v81 = 0;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __103__HDQuantitySampleSeriesEntity__updatedSampleForQuantitySeriesSample_HFDKey_endDate_transaction_error___block_invoke;
  v77[3] = &unk_1E63041D0;
  v77[4] = &v86;
  v77[5] = &v82;
  v77[6] = &v78;
  if (!-[HDQuantitySampleSeriesEntity _getFirstTimeEndTimeCountWithTransaction:HFDKey:error:handler:](a1, v13, a3, a6, v77))goto LABEL_8; {
  double v14 = v87[3];
  }
  [v11 _startTimestamp];
  if (v14 < v15)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *((void *)v87 + 3);
    [v11 _startTimestamp];
    id v19 = @"Cannot freeze series %@ because the first quantity time (%f) is before the sample start time (%f)";
    uint64_t v20 = 100;
LABEL_7:
    objc_msgSend(v16, "hk_assignError:code:format:", a6, v20, v19, v11, v17, v18);
LABEL_8:
    uint64_t v23 = 0;
    goto LABEL_9;
  }
  if (!v12)
  {
    uint64_t v25 = v83;
    uint64_t v26 = *((void *)v83 + 3);
    goto LABEL_23;
  }
  [v12 timeIntervalSinceReferenceDate];
  [v12 timeIntervalSinceReferenceDate];
  if (v21 < v83[3])
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    [v12 timeIntervalSinceReferenceDate];
    uint64_t v17 = v22;
    uint64_t v18 = *((void *)v83 + 3);
    id v19 = @"Cannot freeze series %@ because the specifed sample endTime (%f) is before the last quantity end time (%f)";
    uint64_t v20 = 3;
    goto LABEL_7;
  }
  uint64_t v27 = [v11 quantityType];
  if (([v27 isMaximumDurationRestricted] & 1) == 0)
  {

    goto LABEL_17;
  }
  [v12 timeIntervalSinceReferenceDate];
  double v29 = v28;
  [v11 _startTimestamp];
  double v31 = v30;
  uint64_t v32 = [v11 quantityType];
  [v32 maximumAllowedDuration];
  double v34 = v33;

  if (v29 - v31 <= v34)
  {
LABEL_17:
    uint64_t v38 = [v11 quantityType];
    if ([v38 isMinimumDurationRestricted])
    {
      [v12 timeIntervalSinceReferenceDate];
      double v40 = v39;
      [v11 _startTimestamp];
      double v42 = v41;
      id v43 = [v11 quantityType];
      [v43 minimumAllowedDuration];
      double v45 = v44;

      if (v40 - v42 < v45)
      {
        id v46 = (void *)MEMORY[0x1E4F28C58];
        id v36 = [v11 startDate];
        uint64_t v37 = [v11 quantityType];
        objc_msgSend(v46, "hk_assignError:code:format:", a6, 3, @"Cannot freeze series %@ because the duration between the series start date (%@) and specified endDate (%@) falls below the minimum allowed duration for sample type (%@)", v11, v36, v12, v37);
        goto LABEL_20;
      }
    }
    else
    {
    }
    [v12 timeIntervalSinceReferenceDate];
    uint64_t v25 = v83;
LABEL_23:
    *((void *)v25 + 3) = v26;
    uint64_t v47 = (void *)[v11 copy];
    uint64_t v37 = [MEMORY[0x1E4F29128] UUID];
    [v47 _setUUID:v37];
    [v47 _setEndTimestamp:v83[3]];
    [v47 _setCount:v79[3]];
    if (v79[3] < 1)
    {
LABEL_52:
      id v36 = v47;
      uint64_t v23 = v36;
      goto LABEL_53;
    }
    id v36 = v47;
    id v74 = v13;
    v75 = v37;
    self;
    char v48 = [v36 quantityType];
    unint64_t v49 = [v48 aggregationStyle];

    if (v49 >= 4) {
      uint64_t v50 = 0;
    }
    else {
      uint64_t v50 = qword_1BD32D248[v49];
    }
    uint64_t v51 = [v36 quantityType];
    id v52 = +[HDStatisticsCollectionCalculator calculatorForQuantityType:v51 intervalCollection:0 options:v50 mergeStrategy:1];

    id v53 = v52;
    id v54 = v74;
    self;
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __93__HDQuantitySampleSeriesEntity__statisticsWithHFDKey_statisticsCalculator_transaction_error___block_invoke;
    v90[3] = &unk_1E63043E8;
    uint64_t v93 = a3;
    id v76 = v54;
    id v91 = v76;
    id v55 = v53;
    id v92 = v55;
    if ([v55 performInitialStatisticsTransaction:v90 error:a6])
    {
      id v56 = [v55 currentStatistics];
      __int16 v57 = v56;
      if (v56) {
        id v58 = v56;
      }
      else {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 100, @"No statistics for quantity sample series with HFDKey (%lld)", a3);
      }
    }
    else
    {
      __int16 v57 = 0;
    }

    if (!v57)
    {

      uint64_t v23 = 0;
      uint64_t v37 = v75;
      goto LABEL_53;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v59 = v57;
      id v60 = v36;
      self;
      __int16 v61 = [v59 averageQuantity];

      if (v61)
      {
        id v62 = [v59 averageQuantity];
        [v60 _setAverageQuantity:v62];
      }
      uint64_t v63 = [v59 minimumQuantity];

      if (v63)
      {
        uint64_t v64 = [v59 minimumQuantity];
        [v60 _setMinimumQuantity:v64];
      }
      v65 = [v59 maximumQuantity];

      if (v65)
      {
        v66 = [v59 maximumQuantity];
        [v60 _setMaximumQuantity:v66];
      }
      id v67 = [v59 mostRecentQuantity];

      if (v67)
      {
        uint64_t v68 = [v59 mostRecentQuantity];
        [v60 _setMostRecentQuantity:v68];
      }
      v69 = [v59 mostRecentQuantityDateInterval];

      if (!v69) {
        goto LABEL_50;
      }
      v70 = [v59 mostRecentQuantityDateInterval];
      [v60 _setMostRecentQuantityDateInterval:v70];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_51:

        uint64_t v37 = v75;
        goto LABEL_52;
      }
      id v71 = v57;
      id v72 = v36;
      self;
      v73 = [v71 sumQuantity];

      if (!v73)
      {
LABEL_50:

        goto LABEL_51;
      }
      v70 = [v71 sumQuantity];
      [v72 _setSumQuantity:v70];
    }

    goto LABEL_50;
  }
  char v35 = (void *)MEMORY[0x1E4F28C58];
  id v36 = [v11 startDate];
  uint64_t v37 = [v11 quantityType];
  objc_msgSend(v35, "hk_assignError:code:format:", a6, 3, @"Cannot freeze series %@ because the series start date (%@) and specified endDate (%@) exceed the maximum allowed duration for sample type (%@)", v11, v36, v12, v37);
LABEL_20:
  uint64_t v23 = 0;
LABEL_53:

LABEL_9:
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v86, 8);

  return v23;
}

+ (BOOL)replaceExistingObject:(id)a3 existingObjectID:(id)a4 replacementObject:(id)a5 replacementObjectID:(id)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"HDQuantitySampleSeriesEntity.mm", 743, @"Invalid parameter not satisfying: %@", @"[existingObject isKindOfClass:[HKQuantitySample class]]" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"HDQuantitySampleSeriesEntity.mm", 744, @"Invalid parameter not satisfying: %@", @"[replacementObject isKindOfClass:[HKQuantitySample class]]" object file lineNumber description];
  }
  id v22 = v16;
  id v23 = v18;
  if (([v22 _frozen] & 1) != 0 || !objc_msgSend(v23, "_frozen"))
  {
    v29.receiver = a1;
    v29.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleSeriesEntity;
    unsigned __int8 v24 = objc_msgSendSuper2(&v29, sel_replaceExistingObject_existingObjectID_replacementObject_replacementObjectID_profile_transaction_error_, v22, v17, v23, v19, v20, v21, a9);
  }
  else
  {
    unsigned __int8 v24 = [a1 replaceObjectID:v17 replacementObjectID:v19 deleteOriginalSeriesData:0 profile:v20 transaction:v21 error:a9];
  }
  BOOL v25 = v24;

  return v25;
}

void *__103__HDQuantitySampleSeriesEntity__updatedSampleForQuantitySeriesSample_HFDKey_endDate_transaction_error___block_invoke(void *result, uint64_t a2, double a3, double a4)
{
  *(double *)(*(void *)(result[4] + 8) + 24) = a3;
  *(double *)(*(void *)(result[5] + 8) + 24) = a4;
  *(void *)(*(void *)(result[6] + 8) + 24) = a2;
  return result;
}

- (BOOL)_getFirstTimeEndTimeCountWithTransaction:(uint64_t)a3 HFDKey:(uint64_t)a4 error:(void *)a5 handler:
{
  id v9 = a2;
  id v10 = a5;
  id v11 = v10;
  if (a1)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __94__HDQuantitySampleSeriesEntity__getFirstTimeEndTimeCountWithTransaction_HFDKey_error_handler___block_invoke;
    v14[3] = &unk_1E6304488;
    id v15 = v10;
    BOOL v12 = +[HDQuantitySeriesDataEntity getRangeAndCountForSeriesIdentifier:a3 transaction:v9 error:a4 handler:v14];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

BOOL __93__HDQuantitySampleSeriesEntity__statisticsWithHFDKey_statisticsCalculator_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__126;
  id v17 = __Block_byref_object_dispose__126;
  id v18 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__HDQuantitySampleSeriesEntity__statisticsWithHFDKey_statisticsCalculator_transaction_error___block_invoke_2;
  v10[3] = &unk_1E63043C0;
  uint64_t v4 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  BOOL v12 = &v13;
  BOOL v5 = +[HDQuantitySeriesDataEntity enumerateSeries:v4 transaction:v3 error:a2 handler:v10];
  if (!v5)
  {
    id v6 = (void *)v14[5];
    if (v6)
    {
      id v7 = v6;
      id v8 = v7;
      if (a2) {
        *a2 = v7;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }

  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __93__HDQuantitySampleSeriesEntity__statisticsWithHFDKey_statisticsCalculator_transaction_error___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  double v5 = -0.0;
  if (a4 != -1.0) {
    double v5 = a4;
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v6 addSampleValue:0 startTime:&obj endTime:a3 sourceID:a2 error:v5 + a2];
  objc_storeStrong((id *)(v7 + 40), obj);
  return v8;
}

void __136__HDQuantitySampleSeriesEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke()
{
}

+ (BOOL)enumerateDataWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  BOOL v12 = [a4 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __82__HDQuantitySampleSeriesEntity_enumerateDataWithIdentifier_profile_error_handler___block_invoke;
  v16[3] = &unk_1E6304298;
  id v19 = a1;
  id v13 = v10;
  id v17 = v13;
  id v14 = v11;
  id v18 = v14;
  LOBYTE(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v12 error:a5 block:v16];

  return (char)a5;
}

uint64_t __82__HDQuantitySampleSeriesEntity_enumerateDataWithIdentifier_profile_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) enumerateDataWithIdentifier:*(void *)(a1 + 32) transaction:a2 error:a3 handler:*(void *)(a1 + 40)];
}

+ (BOOL)enumerateDataWithIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = [v10 protectedDatabase];
  id v13 = HDDataEntityPredicateForDataUUID();
  id v18 = 0;
  id v14 = +[HDDataEntity anyInDatabase:v12 predicate:v13 error:&v18];
  id v15 = v18;

  if (!v14)
  {
    if (v15)
    {
      id v15 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Could not find frozen series with ID %@", v9);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
LABEL_9:

        char v16 = 0;
        goto LABEL_10;
      }
    }
    if (a5)
    {
      id v15 = v15;
      *a5 = v15;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_9;
  }
  char v16 = [v14 enumerateDataWithTransaction:v10 error:a5 handler:v11];
LABEL_10:

  return v16;
}

+ (id)additionalPredicateForEnumeration
{
  return (id)[MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"insertion_era"];
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(HDEntityEncoder *)[_HDQuantitySampleSeriesEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v11 transaction:v12 purpose:a5 encodingOptions:v13 authorizationFilter:v14];

  return v15;
}

uint64_t __82__HDQuantitySampleSeriesEntity__quantitySampleWithID_canBeUnfrozen_profile_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

+ (id)hasSeriesDataForHFDKey:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__HDQuantitySampleSeriesEntity_hasSeriesDataForHFDKey_transaction_error___block_invoke;
  v10[3] = &unk_1E6304410;
  void v10[4] = &v11;
  if (+[HDQuantitySeriesDataEntity enumerateSeries:a3 transaction:v7 error:a5 handler:v10])
  {
    uint64_t v8 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 24)];
  }
  else
  {
    uint64_t v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __73__HDQuantitySampleSeriesEntity_hasSeriesDataForHFDKey_transaction_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

- (id)hasSeriesDataWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 protectedDatabase];
  uint64_t v8 = [(HDQuantitySampleSeriesEntity *)self HFDKeyWithDatabase:v7 error:a4];

  if (v8)
  {
    id v9 = objc_msgSend((id)objc_opt_class(), "hasSeriesDataForHFDKey:transaction:error:", objc_msgSend(v8, "longLongValue"), v6, a4);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)countForSeriesWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__126;
  id v19 = __Block_byref_object_dispose__126;
  id v20 = 0;
  v13[4] = &v15;
  id v14 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HDQuantitySampleSeriesEntity_countForSeriesWithTransaction_error___block_invoke;
  v13[3] = &unk_1E6304108;
  LODWORD(self) = [(HDQuantitySampleSeriesEntity *)self startTimeEndTimeCountForSeriesWithTransaction:v6 error:&v14 handler:v13];
  id v7 = v14;
  uint64_t v8 = v7;
  if (self)
  {
    id v9 = (id)v16[5];
  }
  else if (objc_msgSend(v7, "hk_isHealthKitErrorWithCode:", 1100))
  {
    id v9 = &unk_1F17EEA90;
  }
  else
  {
    id v10 = v8;
    uint64_t v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v9 = 0;
  }

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __68__HDQuantitySampleSeriesEntity_countForSeriesWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [NSNumber numberWithLongLong:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)startTimeEndTimeCountForSeriesWithTransaction:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 protectedDatabase];
  uint64_t v11 = [(HDQuantitySampleSeriesEntity *)self HFDKeyWithDatabase:v10 error:a4];

  if (v11)
  {
    id v12 = [v8 protectedDatabase];
    uint64_t v13 = [(HDSQLiteEntity *)self dateForProperty:@"start_date" database:v12];

    if (v13)
    {
      uint64_t v14 = [v11 longLongValue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __92__HDQuantitySampleSeriesEntity_startTimeEndTimeCountForSeriesWithTransaction_error_handler___block_invoke;
      v17[3] = &unk_1E6304438;
      id v19 = v9;
      id v18 = v13;
      BOOL v15 = -[HDQuantitySampleSeriesEntity _getFirstTimeEndTimeCountWithTransaction:HFDKey:error:handler:]((uint64_t)self, v8, v14, (uint64_t)a4, v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Unable to get %@ for %@ with persistentID %lld", @"start_date", objc_opt_class(), -[HDSQLiteEntity persistentID](self, "persistentID"));
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __92__HDQuantitySampleSeriesEntity_startTimeEndTimeCountForSeriesWithTransaction_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);

  return v4(v3, a2);
}

- (BOOL)enumerateDataWithTransaction:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 protectedDatabase];
  uint64_t v11 = [(HDQuantitySampleSeriesEntity *)self HFDKeyWithDatabase:v10 error:a4];

  if (v11) {
    char v12 = objc_msgSend((id)objc_opt_class(), "enumerateDataWithTransaction:HFDKey:error:handler:", v8, objc_msgSend(v11, "longLongValue"), a4, v9);
  }
  else {
    char v12 = 0;
  }

  return v12;
}

+ (BOOL)enumerateDataWithTransaction:(id)a3 HFDKey:(int64_t)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__HDQuantitySampleSeriesEntity_enumerateDataWithTransaction_HFDKey_error_handler___block_invoke;
  v13[3] = &unk_1E62F9FD8;
  id v14 = v10;
  id v11 = v10;
  LOBYTE(a5) = [a1 enumerateRawDataWithTransaction:a3 HFDKey:a4 error:a5 handler:v13];

  return (char)a5;
}

uint64_t __82__HDQuantitySampleSeriesEntity_enumerateDataWithTransaction_HFDKey_error_handler___block_invoke(uint64_t a1, double a2, double a3, float a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4 == -1.0) {
    [MEMORY[0x1E4F2ADB0] datumWithValue:a3 timeInterval:a2];
  }
  else {
  double v5 = objc_msgSend(MEMORY[0x1E4F2ADB0], "datumWithTimestamp:value:duration:", a2);
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  return v6;
}

+ (BOOL)enumerateRawDataWithTransaction:(id)a3 HFDKey:(int64_t)a4 error:(id *)a5 handler:(id)a6
{
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __85__HDQuantitySampleSeriesEntity_enumerateRawDataWithTransaction_HFDKey_error_handler___block_invoke;
  v12[3] = &unk_1E6304460;
  id v13 = v9;
  id v10 = v9;
  LOBYTE(a5) = +[HDQuantitySeriesDataEntity enumerateSeries:a4 transaction:a3 error:a5 handler:v12];

  return (char)a5;
}

uint64_t __85__HDQuantitySampleSeriesEntity_enumerateRawDataWithTransaction_HFDKey_error_handler___block_invoke(uint64_t a1, __n128 a2, __n128 a3, double a4)
{
  float v4 = a4;
  return (*(uint64_t (**)(__n128, __n128, float))(*(void *)(a1 + 32) + 16))(a2, a3, v4);
}

uint64_t __94__HDQuantitySampleSeriesEntity__getFirstTimeEndTimeCountWithTransaction_HFDKey_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (!self)
  {

    goto LABEL_5;
  }
  if (![(HDSQLiteEntity *)self existsInDatabase:v6])
  {

    goto LABEL_10;
  }
  id v16 = 0;
  id v8 = [(HDQuantitySampleSeriesEntity *)self HFDKeyWithDatabase:v7 error:&v16];
  id v9 = v16;
  if (!v8)
  {
    _HKInitializeLogging();
    char v12 = (id)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int64_t v14 = [(HDSQLiteEntity *)self persistentID];
      *(_DWORD *)buf = 134218242;
      int64_t v18 = v14;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Failed to find HFD Key when deleting object with persistent id %lld: %{public}@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  BOOL v10 = +[HDQuantitySeriesDataEntity deleteSeriesDataWithIdentifier:database:error:](HDQuantitySeriesDataEntity, "deleteSeriesDataWithIdentifier:database:error:", [v8 longLongValue], v7, a4);

  if (v10)
  {
LABEL_10:
    v15.receiver = self;
    v15.super_class = (Class)HDQuantitySampleSeriesEntity;
    BOOL v11 = [(HDSQLiteEntity *)&v15 deleteFromDatabase:v7 error:a4];
    goto LABEL_11;
  }
LABEL_5:
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)willDeleteFromDatabase:(id)a3
{
}

+ (BOOL)deleteSeriesDataWithKey:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  return +[HDQuantitySeriesDataEntity deleteSeriesDataWithIdentifier:a3 database:a4 error:a5];
}

+ (BOOL)primitiveRemoveDatums:(id)a3 HFDKey:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a5;
  BOOL v10 = objc_msgSend(a3, "hk_map:", &__block_literal_global_452);
  BOOL v11 = [v9 protectedDatabase];
  LOBYTE(a6) = +[HDQuantitySeriesDataEntity deleteSeriesDataWithIdentifier:a4 timestamps:v10 database:v11 error:a6];

  return (char)a6;
}

id __79__HDQuantitySampleSeriesEntity_primitiveRemoveDatums_HFDKey_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 startDate];

  return v2;
}

+ (BOOL)supportsObjectMerging
{
  return 1;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v34 = 0;
    goto LABEL_43;
  }
  objc_super v15 = [v14 databaseForEntityClass:a1];
  id v16 = [a1 dataEntityForObject:v12 transaction:v14 error:a7];
  if (v16)
  {
    id v17 = v15;
    char v18 = [v16 existsInDatabase:v17];

    if (v18)
    {
      id v19 = v12;
      id v53 = v13;
      id v50 = v17;
      id v52 = [v19 codableQuantitySample];
      id v56 = 0;
      id v54 = v50;
      uint64_t v20 = -[HDQuantitySampleSeriesEntity _isFrozenInDatabase:error:]((uint64_t)v16, v54, (uint64_t)&v56);
      id v21 = v56;
      id v22 = v21;
      if (v20)
      {
        if (v20 == 2)
        {

          goto LABEL_7;
        }
        id v37 = v54;
        id v51 = v19;
        uint64_t v38 = [v16 HFDKeyWithDatabase:v37 error:a7];
        double v39 = v38;
        if (v38)
        {
          int64_t v40 = +[HDQuantitySampleSeriesEntity _hasSeriesDataWithDatabase:hfdKey:error:](HDQuantitySampleSeriesEntity, "_hasSeriesDataWithDatabase:hfdKey:error:", v37, [v38 longLongValue], a7);

          if (v40)
          {
            if (v40 != 2)
            {
              id v19 = v51;
              _HKInitializeLogging();
              id v43 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_INFO, "Cannot merge series data with frozen & final series", buf, 2u);
              }

              id v23 = v52;
              uint64_t v44 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
              goto LABEL_35;
            }
            id v19 = v51;
            double v41 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
            BOOL v49 = +[HDQuantitySampleSeriesEntity _deleteHFDSeriesIfFoundForPersistentID:database:error:]((uint64_t)HDQuantitySampleSeriesEntity, v41, v37, (uint64_t)a7);

            if (!v49)
            {
              double v34 = 0;
LABEL_39:
              id v23 = v52;
              goto LABEL_40;
            }
LABEL_7:
            id v23 = v52;
            unsigned __int8 v24 = [v52 quantitySeriesDatas];

            if (v24)
            {
              BOOL v25 = [v52 quantitySeriesDatas];
              uint64_t v26 = objc_msgSend(v25, "hk_map:", &__block_literal_global_454);

              LODWORD(v25) = -[HDQuantitySampleSeriesEntity _insertValues:database:error:](v16, v26, v54, (uint64_t)a7);
              if (!v25)
              {
                double v34 = 0;
LABEL_40:
                double v42 = v54;
                goto LABEL_41;
              }
            }
            if (![v52 hasFinal] || objc_msgSend(v52, "final"))
            {
              uint64_t v27 = objc_opt_class();
              double v28 = [v19 UUID];
              id v56 = 0;
              objc_super v29 = [v27 freezeSeriesWithIdentifier:v28 metadata:0 endDate:0 profile:v53 error:&v56];
              id v30 = v56;

              if ([v29 status] == 1
                && ([v29 frozenIdentifier],
                    double v31 = objc_claimAutoreleasedReturnValue(),
                    v31,
                    v31))
              {
                id v47 = v30;
                id v46 = [v29 frozenIdentifier];
                uint64_t v32 = HDDataEntityPredicateForDataUUID();
                *(void *)buf = 0;
                char v48 = +[HDDataEntity anyInDatabase:v54 predicate:v32 error:buf];
                id v33 = *(id *)buf;

                if (v48)
                {
                  double v34 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v48, "persistentID"));
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a7, 100, @"Failed to lookup frozen series entity during merge operation.", v33);
                  double v34 = 0;
                }

                id v30 = v47;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a7, 100, @"Failed to insert frozen series during merge operation.", v30);
                double v34 = 0;
              }

              goto LABEL_39;
            }
            uint64_t v44 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
LABEL_35:
            double v34 = (void *)v44;
            goto LABEL_40;
          }
LABEL_30:

          double v42 = v54;
          double v34 = 0;
          id v19 = v51;
          id v23 = v52;
LABEL_41:

          goto LABEL_42;
        }
      }
      else
      {
        id v36 = v21;
        id v37 = v36;
        id v51 = v19;
        if (v36)
        {
          if (a7)
          {
            id v37 = v36;
            *a7 = v37;
          }
          else
          {
            _HKLogDroppedError();
          }
        }
      }

      goto LABEL_30;
    }
    char v35 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
    double v34 = +[HDQuantitySampleSeriesEntity _insertDataObject:inDatabase:persistentID:error:]((uint64_t)a1, v12, v17, v35, (uint64_t)a7);
  }
  else
  {
    double v34 = 0;
  }
LABEL_42:

LABEL_43:

  return v34;
}

id __103__HDQuantitySampleSeriesEntity__mergeCodableSeriesDataFromQuantitySampleSeries_profile_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasStartDate]) {
    [v2 startDate];
  }
  else {
    [v2 endDate];
  }
  double v4 = v3;
  float v5 = -1.0;
  if ([v2 hasStartDate])
  {
    [v2 endDate];
    double v7 = v6;
    [v2 startDate];
    float v5 = v7 - v8;
  }
  id v9 = (void *)MEMORY[0x1E4F2ADB0];
  [v2 value];
  *(float *)&double v10 = v5;
  id v12 = [v9 datumWithTimestamp:v4 value:v11 duration:v10];

  return v12;
}

+ (int64_t)_hasSeriesDataWithDatabase:(id)a3 hfdKey:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  double v8 = +[HDQuantitySeriesDataEntity predicateForSeriesIdentifier:a4];
  v15[4] = &v17;
  id v16 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__HDQuantitySampleSeriesEntity__hasSeriesDataWithDatabase_hfdKey_error___block_invoke;
  v15[3] = &unk_1E6304410;
  BOOL v9 = +[HDQuantitySeriesDataEntity enumerateWithDatabase:v7 predicate:v8 error:&v16 handler:v15];
  id v10 = v16;

  if (v9)
  {
    if (*((unsigned char *)v18 + 24)) {
      int64_t v11 = 1;
    }
    else {
      int64_t v11 = 2;
    }
  }
  else
  {
    id v12 = v10;
    id v13 = v12;
    if (v12)
    {
      if (a5) {
        *a5 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int64_t v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __72__HDQuantitySampleSeriesEntity__hasSeriesDataWithDatabase_hfdKey_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

void __64__HDQuantitySampleSeriesEntity__setInsertionEra_database_error___block_invoke()
{
}

+ (id)removeValues:(id)a3 fromQuantitySeriesSample:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  objc_super v29 = __Block_byref_object_copy__126;
  id v30 = __Block_byref_object_dispose__126;
  id v31 = 0;
  id v13 = [v12 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__HDQuantitySampleSeriesEntity_removeValues_fromQuantitySeriesSample_profile_error___block_invoke;
  v20[3] = &unk_1E63044D0;
  unsigned __int8 v24 = &v26;
  id v25 = a1;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  LODWORD(a6) = [a1 performWriteTransactionWithHealthDatabase:v13 error:a6 block:v20];

  if (a6) {
    uint64_t v17 = (void *)v27[5];
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  _Block_object_dispose(&v26, 8);

  return v18;
}

BOOL __84__HDQuantitySampleSeriesEntity_removeValues_fromQuantitySeriesSample_profile_error___block_invoke(void *a1, void *a2, void *a3)
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = (void *)a1[4];
  id v7 = (void *)a1[5];
  double v8 = (void *)a1[6];
  id v82 = 0;
  id v81 = v6;
  id v9 = v7;
  id v10 = v5;
  id v80 = v8;
  self;
  id v11 = [v10 protectedDatabase];
  id v12 = [v9 UUID];
  id v13 = HDDataEntityPredicateForDataUUID();
  id v83 = 0;
  id v14 = +[HDDataEntity anyInDatabase:v11 predicate:v13 error:&v83];
  id v15 = v83;

  if (!v14)
  {
    if (v15)
    {
      id v21 = v15;
    }
    else
    {
      id v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = objc_opt_class();
      unsigned __int8 v24 = [v9 UUID];
      id v25 = objc_msgSend(v22, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v23, sel__removeValues_fromQuantitySeriesSample_transaction_profile_error_, @"No quantity series sample found with UUID \"%@\", v24);

      id v21 = v25;
      if (!v21)
      {
        id v17 = 0;
        id v15 = 0;
LABEL_18:
        id v20 = 0;
        goto LABEL_40;
      }
    }
    id v17 = v21;
    id v20 = 0;
    id v82 = v17;
    id v15 = v17;
    goto LABEL_40;
  }
  id v16 = [v10 protectedDatabase];
  id v17 = [v14 HFDKeyWithDatabase:v16 error:&v82];

  if (!v17
    || !+[HDQuantitySampleSeriesEntity primitiveRemoveDatums:HFDKey:transaction:error:](HDQuantitySampleSeriesEntity, "primitiveRemoveDatums:HFDKey:transaction:error:", v81, [v17 longLongValue], v10, &v82))
  {
    goto LABEL_18;
  }
  id v18 = [v14 countForSeriesWithTransaction:v10 error:&v82];
  if (v18)
  {
    id v79 = v18;
    uint64_t v19 = [v18 integerValue];
    if (v19 == [v9 count])
    {
      id v20 = v9;
LABEL_38:
      id v18 = v79;
      goto LABEL_39;
    }
    if (!v19)
    {
      uint64_t v78 = [v80 dataManager];
      id v33 = [v9 UUID];
      v84[0] = v33;
      double v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];
      char v35 = objc_alloc_init(HDDataDeletionConfiguration);
      [v78 deleteObjectsWithUUIDCollection:v34 configuration:v35 error:&v82];

      id v20 = 0;
      goto LABEL_38;
    }
    uint64_t v63 = [v17 longLongValue];
    id v26 = v9;
    id v67 = v14;
    id v68 = v10;
    id v69 = v80;
    v66 = v26;
    self;
    uint64_t v27 = [v26 UUID];
    uint64_t v58 = v19;
    v70 = (void *)[v27 copy];

    id v72 = v66;
    id v76 = v67;
    id v77 = v68;
    id v73 = v69;
    self;
    uint64_t v28 = -[HDQuantitySampleSeriesEntity _dataOriginProvenanceWithTransaction:profile:error:](v76, v77, v73, (uint64_t)&v82);
    if (v28)
    {
      __int16 v61 = v28;
      objc_super v29 = [v72 endDate];
      id v30 = -[HDQuantitySampleSeriesEntity _updatedSampleForQuantitySeriesSample:HFDKey:endDate:transaction:error:]((uint64_t)v76, v72, v63, v29, v77, (uint64_t)&v82);

      if (!v30) {
        goto LABEL_20;
      }
      id v74 = [v73 dataManager];
      v84[0] = v30;
      id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];
      char v32 = [v74 insertDataObjects:v31 withProvenance:v61 creationDate:&v82 error:CFAbsoluteTimeGetCurrent()];

      if (v32)
      {
        v75 = [v30 UUID];
      }
      else
      {
LABEL_20:
        v75 = 0;
      }

      uint64_t v28 = v61;
    }
    else
    {
      v75 = 0;
    }

    if (!v75)
    {
      id v20 = 0;
LABEL_37:

      goto LABEL_38;
    }
    id v36 = [v77 protectedDatabase];
    id v37 = HDDataEntityPredicateForDataUUID();
    id v62 = +[HDDataEntity anyInDatabase:v36 predicate:v37 error:&v82];

    uint64_t v38 = v62;
    if (v62)
    {
      if (v58 < 2) {
        goto LABEL_28;
      }
      id v59 = v76;
      id v39 = v62;
      id v40 = v77;
      double v41 = [v40 databaseForEntityClass:self];
      if ((-[HDQuantitySampleSeriesEntity _setHFDKey:database:error:](v59, 0, v41, (uint64_t)&v82) & 1) == 0)
      {

        goto LABEL_35;
      }
      int v64 = -[HDQuantitySampleSeriesEntity _setHFDKey:database:error:](v39, v63, v41, (uint64_t)&v82);

      uint64_t v38 = v62;
      if (v64)
      {
LABEL_28:
        id v42 = v76;
        id v57 = v70;
        id v60 = v38;
        id v65 = v73;
        id v56 = v42;
        self;
        id v43 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v42, "persistentID"));
        uint64_t v44 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v60, "persistentID"));
        BOOL v45 = +[HDAssociationEntity copyAssociationsFromChildID:v43 toObjectID:v44 profile:v65 error:&v82];

        if (v45)
        {
          uint64_t v46 = [v65 dataManager];
          v84[0] = v57;
          id v71 = (void *)v46;
          id v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];
          char v48 = objc_alloc_init(HDDataDeletionConfiguration);
          LOBYTE(v46) = [(id)v46 deleteObjectsWithUUIDCollection:v47 configuration:v48 error:&v82];

          if (v46)
          {
            uint64_t v38 = v62;
            id v20 = +[HDDataEntity objectWithUUID:v75 encodingOptions:0 profile:v65 error:&v82];
LABEL_36:

            goto LABEL_37;
          }
        }
        else
        {
        }
LABEL_35:
        id v20 = 0;
        uint64_t v38 = v62;
        goto LABEL_36;
      }
    }
    id v20 = 0;
    goto LABEL_36;
  }
  id v20 = 0;
LABEL_39:

LABEL_40:
  id v49 = v82;
  uint64_t v50 = *(void *)(a1[7] + 8);
  id v51 = *(void **)(v50 + 40);
  *(void *)(v50 + 40) = v20;

  id v52 = v49;
  id v53 = v52;
  if (v52)
  {
    if (a3) {
      *a3 = v52;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (*(void *)(*(void *)(a1[7] + 8) + 40)) {
    BOOL v54 = 1;
  }
  else {
    BOOL v54 = v53 == 0;
  }

  return v54;
}

+ (void)unitTesting_updateInsertionEra
{
}

+ (BOOL)unitTesting_insertValues:(id)a3 quantitySample:(id)a4 seriesVersion:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (!v13)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"HDQuantitySampleSeriesEntity.mm", 1687, @"Invalid parameter not satisfying: %@", @"values != nil" object file lineNumber description];
  }
  id v16 = [v14 UUID];
  id v17 = [v15 database];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __100__HDQuantitySampleSeriesEntity_unitTesting_insertValues_quantitySample_seriesVersion_profile_error___block_invoke;
  v23[3] = &unk_1E63044F8;
  id v18 = v16;
  id v24 = v18;
  id v26 = a1;
  SEL v27 = a2;
  id v19 = v13;
  id v25 = v19;
  int64_t v28 = a5;
  char v20 = [a1 performWriteTransactionWithHealthDatabase:v17 error:a7 block:v23];

  return v20;
}

BOOL __100__HDQuantitySampleSeriesEntity_unitTesting_insertValues_quantitySample_seriesVersion_profile_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = [v5 protectedDatabase];
  id v7 = HDDataEntityPredicateForDataUUID();
  id v22 = 0;
  double v8 = +[HDDataEntity anyInDatabase:v6 predicate:v7 error:&v22];
  id v9 = v22;

  if (v8)
  {
    id v10 = [v5 protectedDatabase];
    id v21 = 0;
    uint64_t v11 = -[HDQuantitySampleSeriesEntity _isFrozenInDatabase:error:]((uint64_t)v8, v10, (uint64_t)&v21);
    id v12 = v21;

    if (v11 == 2)
    {
      id v13 = [v5 protectedDatabase];
      id v14 = [v8 HFDKeyWithDatabase:v13 error:a3];

      if (v14)
      {
        uint64_t v15 = a1[5];
        uint64_t v20 = a1[8];
        uint64_t v16 = [v14 longLongValue];
        id v17 = [v5 protectedDatabase];
        BOOL v18 = +[HDQuantitySampleSeriesEntity primitiveInsertValues:v15 seriesVersion:v20 HFDKey:v16 database:v17 error:a3];
      }
      else
      {
        BOOL v18 = 0;
      }

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a3, 3, @"Unable to add data to a frozen series.", v12);
LABEL_8:
    BOOL v18 = 0;
    goto LABEL_16;
  }
  if (v9)
  {
    id v12 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[7], @"Unable to find quantity series '%@'"", a1[4]);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      id v9 = 0;
      goto LABEL_8;
    }
  }
  if (a3)
  {
    id v12 = v12;
    BOOL v18 = 0;
    *a3 = v12;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v18 = 0;
  }
  id v9 = v12;
LABEL_16:

  return v18;
}

- (BOOL)unitTesting_setInsertionEra:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = objc_opt_class();
  id v10 = [v8 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __74__HDQuantitySampleSeriesEntity_unitTesting_setInsertionEra_profile_error___block_invoke;
  v12[3] = &unk_1E6303A30;
  void v12[4] = self;
  void v12[5] = a3;
  LOBYTE(a5) = [v9 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v12];

  return (char)a5;
}

uint64_t __74__HDQuantitySampleSeriesEntity_unitTesting_setInsertionEra_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [a2 protectedDatabase];
  if (v4)
  {
    v11[0] = @"insertion_era";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__HDQuantitySampleSeriesEntity__setInsertionEra_database_error___block_invoke;
    v10[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
    void v10[4] = v5;
    uint64_t v8 = [v4 updateProperties:v7 database:v6 error:a3 bindingHandler:v10];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end