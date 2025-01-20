@interface HDLocationSeriesHFDMigrationEntity
+ (BOOL)migrateDataFromDataStore:(const void *)a3 to:(void *)a4 database:(id)a5 recoveryAnalytics:(id)a6 error:(id *)a7;
+ (BOOL)migrateDataToSQLFromStore:(const void *)a3 database:(id)a4 error:(id *)a5;
+ (__n128)migrateDataFromDataStore:to:database:recoveryAnalytics:error:;
+ (double)migrateDataFromDataStore:to:database:recoveryAnalytics:error:;
+ (uint64_t)enumerateAllKeys:(uint64_t)a3 error:(void *)a4 enumerationHandler:;
+ (uint64_t)migrateDataFromDataStore:to:database:recoveryAnalytics:error:;
+ (void)migrateDataFromDataStore:to:database:recoveryAnalytics:error:;
@end

@implementation HDLocationSeriesHFDMigrationEntity

+ (uint64_t)enumerateAllKeys:(uint64_t)a3 error:(void *)a4 enumerationHandler:
{
  id v6 = a2;
  id v7 = a4;
  self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__HDLocationSeriesHFDMigrationEntity_enumerateAllKeys_error_enumerationHandler___block_invoke;
  v11[3] = &unk_1E62F5740;
  id v8 = v7;
  id v12 = v8;
  uint64_t v9 = [v6 executeUncachedSQL:@"SELECT data_series.hfd_key, samples.start_date, samples.end_date FROM data_series LEFT JOIN samples ON data_series.data_id = samples.data_id WHERE (data_series.hfd_key IS NOT NULL)", a3, 0, v11 error bindingHandler enumerationHandler];

  return v9;
}

uint64_t __80__HDLocationSeriesHFDMigrationEntity_enumerateAllKeys_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  HDSQLiteColumnAsInt64();
  double v4 = MEMORY[0x1C1879F40](a2, 1);
  v7.n128_f64[0] = MEMORY[0x1C1879F40](a2, 2);
  v5 = *(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 32) + 16);
  v6.n128_u64[0] = v7.n128_u64[0];
  v7.n128_f64[0] = v4;

  return v5(v7, v6);
}

+ (BOOL)migrateDataFromDataStore:(const void *)a3 to:(void *)a4 database:(id)a5 recoveryAnalytics:(id)a6 error:(id *)a7
{
  id v12 = a6;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3321888768;
  v33[2] = __99__HDLocationSeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error___block_invoke;
  v33[3] = &__block_descriptor_72_ea8_32c112_ZTSKZ99__HDLocationSeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error__E3__0_e18_B40__0q8d16d24__32l;
  v33[4] = &v34;
  v33[5] = &v35;
  v33[6] = a3;
  v33[7] = a4;
  v33[8] = &v36;
  uint64_t v34 = 0;
  int v13 = +[HDLocationSeriesHFDMigrationEntity enumerateAllKeys:error:enumerationHandler:]((uint64_t)a1, a5, (uint64_t)a7, v33);
  if (v13)
  {
    v14 = NSNumber;
    v15 = [v12 objectForKeyedSubscript:@"workoutRouteRecoveredCount"];
    uint64_t v16 = [v15 longLongValue];
    v17 = [v14 numberWithLongLong:v36 + v16];
    [v12 setObject:v17 forKeyedSubscript:@"workoutRouteRecoveredCount"];

    v18 = NSNumber;
    v19 = [v12 objectForKeyedSubscript:@"workoutRouteDiscardedCount"];
    uint64_t v20 = [v19 longLongValue];
    v21 = [v18 numberWithLongLong:v35 + v20];
    [v12 setObject:v21 forKeyedSubscript:@"workoutRouteDiscardedCount"];

    v22 = NSNumber;
    uint64_t v23 = v34;
    if (v34)
    {
      v19 = [v12 objectForKeyedSubscript:@"workoutRouteRecoveredCount"];
      uint64_t v24 = [v19 longLongValue];
      double v25 = (double)v24 / (double)v34;
    }
    else
    {
      double v25 = 1.0;
    }
    v26 = [v22 numberWithDouble:v25];
    [v12 setObject:v26 forKeyedSubscript:@"workoutRouteMigrationFraction"];

    if (v23) {
    v27 = NSNumber;
    }
    uint64_t v28 = v34;
    if (v34)
    {
      v19 = [v12 objectForKeyedSubscript:@"workoutRouteDiscardedCount"];
      [v19 doubleValue];
      double v30 = v29 / (double)v34;
    }
    else
    {
      double v30 = 1.0;
    }
    v31 = [v27 numberWithDouble:v30];
    [v12 setObject:v31 forKeyedSubscript:@"workoutRouteDiscardFraction"];

    if (v28) {
  }
    }

  return v13;
}

uint64_t __99__HDLocationSeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = a3;
  uint64_t v13 = a2;
  ++**(void **)(a1 + 32);
  v11[0] = a4 + -86400.0;
  v11[1] = a5 + 86400.0;
  v11[2] = *(double *)(a1 + 40);
  unsigned __int8 v10 = 0;
  uint64_t v6 = *(void *)(a1 + 64);
  __n128 v7 = (char *)operator new(0x40uLL);
  *(void *)__n128 v7 = &unk_1F17210D8;
  *((void *)v7 + 1) = &v13;
  *((void *)v7 + 2) = &v10;
  long long v8 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v7 + 24) = v8;
  *((void *)v7 + 5) = v11;
  *((void *)v7 + 6) = v6;
  *((void *)v7 + 7) = &v12;
  v14[3] = v7;
  health::DataStore::performReadTransactionWithLambda(v8, (uint64_t)v14);
  std::__function::__value_func<void ()(health::DataStore::ReadTransaction const&)>::~__value_func[abi:ne180100](v14);
  return v10;
}

uint64_t __90__HDLocationSeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = (void *)a1[4];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__HDLocationSeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_2;
  v15[3] = &unk_1E62F5768;
  uint64_t v17 = a1[6];
  id v18 = 0;
  id v7 = v5;
  id v16 = v7;
  uint64_t v8 = [v6 executeSQL:@"INSERT OR REPLACE INTO location_series_data (series_identifier, timestamp, latitude, longitude, altitude, speed, course, horizontal_accuracy, vertical_accuracy, speed_accuracy, course_accuracy, signal_environment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", &v18, v15, 0 error bindingHandler enumerationHandler];
  id v9 = v18;
  unsigned __int8 v10 = v9;
  if ((v8 & 1) != 0 || !objc_msgSend(v9, "hd_isConstraintViolation"))
  {
    id v12 = v10;
    uint64_t v13 = v12;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v7;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "[HFDToSQLite] Could not encode HFD location %@ in SQLite (%@); suppressing",
        buf,
        0x16u);
    }
    uint64_t v8 = 1;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }

  return v8;
}

uint64_t __90__HDLocationSeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  double v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 clientLocation];
    double v5 = v16;
  }
  else
  {
    double v5 = 0.0;
  }
  sqlite3_bind_double(a2, 2, v5);
  [*(id *)(a1 + 32) coordinate];
  sqlite3_bind_double(a2, 3, v6);
  [*(id *)(a1 + 32) coordinate];
  sqlite3_bind_double(a2, 4, v7);
  [*(id *)(a1 + 32) altitude];
  sqlite3_bind_double(a2, 5, v8);
  [*(id *)(a1 + 32) speed];
  sqlite3_bind_double(a2, 6, v9);
  [*(id *)(a1 + 32) course];
  sqlite3_bind_double(a2, 7, v10);
  [*(id *)(a1 + 32) horizontalAccuracy];
  sqlite3_bind_double(a2, 8, v11);
  [*(id *)(a1 + 32) verticalAccuracy];
  sqlite3_bind_double(a2, 9, v12);
  [*(id *)(a1 + 32) speedAccuracy];
  sqlite3_bind_double(a2, 10, v13);
  [*(id *)(a1 + 32) courseAccuracy];
  sqlite3_bind_double(a2, 11, v14);
  return sqlite3_bind_int(a2, 12, [*(id *)(a1 + 32) signalEnvironmentType]);
}

BOOL __90__HDLocationSeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_299(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  __int16 v18 = 0;
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = v5;
  double v6 = operator new(0x30uLL);
  *double v6 = &unk_1F1721868;
  v6[1] = &v18;
  v6[2] = v5;
  v6[3] = a1 + 4;
  v6[4] = &v19;
  v6[5] = (char *)&v18 + 1;
  v22[3] = v6;
  char v7 = health::DataStore::accessSampleHistoryWithIdentifierForReading<LocationHistoryBehaviorV1>(v4, (uint64_t)&buf, (uint64_t)v22);
  std::__function::__value_func<void ()(health::DataStore::SampleHistory<LocationHistoryBehaviorV1> const&)>::~__value_func[abi:ne180100](v22);
  LOBYTE(v18) = v7;
  if (HIBYTE(v18)) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[7];
    *(void *)&long long buf = 3;
    *((void *)&buf + 1) = v10;
    __int16 v21 = 0;
    double v11 = operator new(0x28uLL);
    void *v11 = &unk_1F1721968;
    v11[1] = &v18;
    v11[2] = v10;
    double v11[3] = a1 + 4;
    void v11[4] = &v19;
    __int16 v21 = v11;
    LOBYTE(v18) = health::DataStore::accessSampleHistoryWithIdentifierForReading<LocationHistoryBehaviorV2>(v9, (uint64_t)&buf, (uint64_t)v20);
    std::__function::__value_func<void ()(health::DataStore::SampleHistory<LocationHistoryBehaviorV2> const&)>::~__value_func[abi:ne180100](v20);
  }
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    _HKInitializeLogging();
    double v12 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = a1[7];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_fault_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_FAULT, "[HFDToSQLite] Suppressed constraint violations when migrating location series %lld", (uint8_t *)&buf, 0xCu);
    }
  }
  id v13 = v19;
  if (v19)
  {
    id v14 = v19;
    v15 = v14;
    if (a2) {
      *a2 = v14;
    }
    else {
      _HKLogDroppedError();
    }
  }
  return v13 == 0;
}

+ (BOOL)migrateDataToSQLFromStore:(const void *)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([v8 executeUncachedSQL:@"DELETE FROM location_series_data" error:a5])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__HDLocationSeriesHFDMigrationEntity_migrateDataToSQLFromStore_database_error___block_invoke;
    v12[3] = &unk_1E6308238;
    id v14 = a3;
    id v15 = a1;
    id v9 = v8;
    id v13 = v9;
    if (+[HDLocationSeriesHFDMigrationEntity enumerateAllKeys:error:enumerationHandler:]((uint64_t)a1, v9, (uint64_t)a5, v12))char v10 = [v9 executeUncachedSQL:@"UPDATE data_series SET series_location = 2" error:a5]; {
    else
    }
      char v10 = 0;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

uint64_t __79__HDLocationSeriesHFDMigrationEntity_migrateDataToSQLFromStore_database_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = *(id *)(a1 + 32);
  self;
  *(void *)long long buf = 0;
  __int16 v18 = buf;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__HDLocationSeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke;
  aBlock[3] = &unk_1E63081E8;
  id v6 = v5;
  id v15 = buf;
  uint64_t v16 = a2;
  id v14 = v6;
  double v12 = _Block_copy(aBlock);
  id v7 = v12;
  LOBYTE(a2) = HKWithAutoreleasePool();

  _Block_object_dispose(buf, 8);
  id v8 = 0;

  if ((a2 & 1) == 0)
  {
    id v9 = v8;
    id v10 = v9;
    if (v9)
    {
      if (a3)
      {
        id v10 = v9;
        *a3 = v10;
      }
      else
      {
        _HKLogDroppedError();
      }
      id v8 = v10;
    }
    else
    {
      id v8 = 0;
    }
  }
  return 1;
}

+ (void)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
}

+ (__n128)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
  __n128 v6 = *a3;
  __n128 v7 = a3[1];
  __n128 v8 = a3[2];
  +[HDLocationSeriesHFDMigrationEntity migrateDataFromDataStore:to:database:recoveryAnalytics:error:]::$_0::operator() const(long long,double,double,NSError * {__autoreleasing}*)::{lambda(double,long long)#1}::operator()(*(double **)(a1 + 8), **(void **)(a1 + 16), *a2);
  *a4 = v6;
  a4[1] = v7;
  __n128 result = v8;
  a4[2] = v8;
  return result;
}

+ (uint64_t)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

+ (double)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*result > a3 || result[1] < a3)
  {
    __n128 v6 = result;
    _HKInitializeLogging();
    uint64_t v4 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v8 = a2;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "Discarding workout route with hfd key %ld for out of range data", buf, 0xCu);
    }
    ++**((void **)v6 + 2);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    _ZN6health21data_corruption_errorCI1St13runtime_errorEPKc(exception, "Invalid datum dates.");
  }
  return result;
}

@end