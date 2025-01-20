@interface HDQuantitySeriesHFDMigrationEntity
+ (BOOL)migrateDataFromDataStore:(const void *)a3 to:(void *)a4 database:(id)a5 recoveryAnalytics:(id)a6 error:(id *)a7;
+ (BOOL)migrateDataToSQLFromStore:(const void *)a3 database:(id)a4 error:(id *)a5;
+ (__n128)enumerateRawDataFromHFDWithStore:(NSError * *){__autoreleasing} HFDKey:(id)const& error:(id)const& handler:;
+ (__n128)migrateDataFromDataStore:to:database:recoveryAnalytics:error:;
+ (uint64_t)_enumerateAllSeriesWithDatabase:(uint64_t)a3 error:(void *)a4 handler:;
+ (uint64_t)enumerateRawDataFromHFDWithStore:(NSError * *){__autoreleasing} HFDKey:(id)const& error:(id)const& handler:;
+ (uint64_t)migrateDataFromDataStore:to:database:recoveryAnalytics:error:;
+ (void)enumerateRawDataFromHFDWithStore:(NSError * *){__autoreleasing} HFDKey:(id)const& error:(id)const& handler:;
+ (void)migrateDataFromDataStore:to:database:recoveryAnalytics:error:;
@end

@implementation HDQuantitySeriesHFDMigrationEntity

+ (uint64_t)_enumerateAllSeriesWithDatabase:(uint64_t)a3 error:(void *)a4 handler:
{
  id v6 = a2;
  id v7 = a4;
  self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__HDQuantitySeriesHFDMigrationEntity__enumerateAllSeriesWithDatabase_error_handler___block_invoke;
  v11[3] = &unk_1E62F5740;
  id v8 = v7;
  id v12 = v8;
  uint64_t v9 = [v6 executeUncachedSQL:@"SELECT quantity_sample_series.hfd_key, samples.start_date, samples.end_date, quantity_sample_series.count FROM quantity_sample_series LEFT JOIN samples ON quantity_sample_series.data_id = samples.data_id WHERE (quantity_sample_series.hfd_key IS NOT NULL)", a3, 0, v11 error bindingHandler enumerationHandler];

  return v9;
}

uint64_t __84__HDQuantitySeriesHFDMigrationEntity__enumerateAllSeriesWithDatabase_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  HDSQLiteColumnAsInt64();
  double v4 = MEMORY[0x1C1879F40](a2, 1);
  double v5 = MEMORY[0x1C1879F40](a2, 2);
  HDSQLiteColumnAsInt64();
  id v6 = *(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 32) + 16);
  v7.n128_f64[0] = v4;
  v8.n128_f64[0] = v5;

  return v6(v7, v8);
}

uint64_t __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke(void *a1, double a2, double a3, double a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  __n128 v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_2;
  v14[3] = &__block_descriptor_64_e23_v16__0__sqlite3_stmt__8l;
  v14[4] = a1[7];
  *(double *)&v14[5] = a2;
  *(double *)&v14[6] = a3;
  *(double *)&v14[7] = a4;
  char v9 = [v7 executeSQL:@"INSERT OR REPLACE INTO quantity_series_data (series_identifier, timestamp, value, duration) VALUES (?, ?, ?, ?)", &obj, v14, 0 error bindingHandler enumerationHandler];
  objc_storeStrong((id *)(v8 + 40), obj);
  if ((v9 & 1) == 0)
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "hd_isConstraintViolation");
    if (!result) {
      return result;
    }
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      double v17 = a3;
      __int16 v18 = 2048;
      double v19 = a4;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "[HFDToSQLite] Failed to insert quantity series datum (%f, %f); skipping",
        buf,
        0x16u);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    uint64_t v12 = *(void *)(a1[5] + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
  }
  return 1;
}

uint64_t __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 40));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
  double v4 = *(double *)(a1 + 56);

  return sqlite3_bind_double(a2, 4, v4);
}

uint64_t __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_286(uint64_t a1, __n128 a2, __n128 a3, float a4)
{
  return (*(uint64_t (**)(__n128, __n128, double))(*(void *)(a1 + 32) + 16))(a2, a3, a4);
}

+ (BOOL)migrateDataToSQLFromStore:(const void *)a3 database:(id)a4 error:(id *)a5
{
  id v14 = a1;
  id v8 = a4;
  id v13 = v8;
  if (([v8 executeUncachedSQL:@"DELETE FROM quantity_series_data" error:a5] & 1) == 0) {
    goto LABEL_4;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  v12[2] = __79__HDQuantitySeriesHFDMigrationEntity_migrateDataToSQLFromStore_database_error___block_invoke;
  v12[3] = &__block_descriptor_56_ea8_32c92_ZTSKZ79__HDQuantitySeriesHFDMigrationEntity_migrateDataToSQLFromStore_database_error__E3__0_e21_B48__0q8d16d24q32__40l;
  v12[4] = a3;
  v12[5] = &v14;
  v12[6] = &v13;
  char v9 = +[HDQuantitySeriesHFDMigrationEntity _enumerateAllSeriesWithDatabase:error:handler:]((uint64_t)a1, v8, (uint64_t)a5, v12);
  id v8 = v13;
  if (v9)
  {
    char v10 = [v13 executeUncachedSQL:@"UPDATE quantity_sample_series SET series_location = 2" error:a5];
    id v8 = v13;
  }
  else
  {
LABEL_4:
    char v10 = 0;
  }

  return v10;
}

uint64_t __79__HDQuantitySeriesHFDMigrationEntity_migrateDataToSQLFromStore_database_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = **(id **)(a1 + 48);
  self;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  *(void *)v60 = 0;
  v61 = v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__47;
  v64 = __Block_byref_object_dispose__47;
  id v65 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke;
  aBlock[3] = &unk_1E62F9FB0;
  id v8 = v7;
  id v38 = v8;
  v39 = v60;
  v40 = &v42;
  uint64_t v41 = a2;
  char v9 = _Block_copy(aBlock);
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  v34 = __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_286;
  v35 = &unk_1E62F9FD8;
  id v10 = v9;
  id v36 = v10;
  v58 = &v32;
  self;
  uint64_t v56 = 2;
  uint64_t v57 = a2;
  uint64_t v54 = 1;
  uint64_t v55 = a2;
  char v53 = 0;
  char v52 = 1;
  v48 = &v53;
  v49 = &v52;
  v50 = &v58;
  id v51 = 0;
  LOBYTE(v47) = 0;
  v68 = 0;
  v11 = operator new(0x20uLL);
  void *v11 = &unk_1F171D670;
  v11[1] = &v59;
  v11[2] = &v47;
  v11[3] = &v48;
  v68 = v11;
  char v12 = health::DataStore::accessSampleHistoryWithIdentifierForReading<QuantitySampleValueBehaviorV1>(v6, (uint64_t)&v56, (uint64_t)buf);
  std::__function::__value_func<void ()(health::DataStore::SampleHistory<QuantitySampleValueBehaviorV1> const&)>::~__value_func[abi:ne180100](buf);
  if ((_BYTE)v47) {
    char v13 = 1;
  }
  else {
    char v13 = v12;
  }
  if (v13)
  {
    char v14 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v51, 1100, @"unable to access sample history during enumeration for (%lld, %lld)", v56, v57, v32, v33, v34, v35);
    char v14 = 0;
  }
  id v15 = v51;
  v16 = v15;
  if ((v14 & 1) != 0 || !v52)
  {
    if (v14)
    {
      id v21 = 0;
      int v22 = 1;
      id v23 = v15;
      goto LABEL_25;
    }
    id v23 = v15;
  }
  else
  {
    id v47 = v15;
    v48 = &v53;
    v49 = &v52;
    v50 = &v58;
    char v59 = 0;
    v68 = 0;
    double v17 = operator new(0x20uLL);
    *double v17 = &unk_1F171D770;
    v17[1] = &v46;
    v17[2] = &v59;
    v17[3] = &v48;
    v68 = v17;
    char v18 = health::DataStore::accessSampleHistoryWithIdentifierForReading<QuantitySampleValueBehaviorV0>(v6, (uint64_t)&v54, (uint64_t)buf);
    std::__function::__value_func<void ()(health::DataStore::SampleHistory<QuantitySampleValueBehaviorV0> const&)>::~__value_func[abi:ne180100](buf);
    if (v59) {
      char v19 = 1;
    }
    else {
      char v19 = v18;
    }
    if (v19)
    {
      char v20 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v47, 1100, @"unable to access sample history during enumeration for (%lld, %lld)", v54, v55);
      char v20 = 0;
    }
    id v23 = v47;

    if (v20) {
      goto LABEL_21;
    }
  }
  if (!v53 && (objc_msgSend(v23, "hk_isHealthKitErrorWithCode:", 1100) & 1) != 0)
  {
LABEL_21:
    id v21 = 0;
    int v22 = 1;
    goto LABEL_25;
  }
  id v24 = v23;
  id v21 = v24;
  if (v24) {
    id v25 = v24;
  }

  int v22 = 0;
  id v23 = v21;
LABEL_25:

  v26 = (void *)*((void *)v61 + 5);
  if (v26)
  {
    id v21 = v26;
    LOBYTE(v22) = 0;
  }
  else if (v22)
  {
    if (*((unsigned char *)v43 + 24))
    {
      _HKInitializeLogging();
      v27 = *MEMORY[0x1E4F29F18];
      LOBYTE(v22) = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v67 = a2;
        _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_INFO, "Suppressed constraint violations for migration of quantity series %lld", buf, 0xCu);
      }
    }
    else
    {
      LOBYTE(v22) = 1;
    }
  }

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(&v42, 8);

  id v28 = v21;
  if ((v22 & 1) == 0)
  {
    id v29 = v28;
    id v30 = v29;
    if (v29)
    {
      if (a4)
      {
        id v30 = v29;
        *a4 = v30;
      }
      else
      {
        _HKLogDroppedError();
      }
      id v28 = v30;
    }
    else
    {
      id v28 = 0;
    }
  }
  return 1;
}

+ (BOOL)migrateDataFromDataStore:(const void *)a3 to:(void *)a4 database:(id)a5 recoveryAnalytics:(id)a6 error:(id *)a7
{
  id v12 = a6;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  v33[8] = a4;
  uint64_t v34 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3321888768;
  v33[2] = __99__HDQuantitySeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error___block_invoke;
  v33[3] = &__block_descriptor_72_ea8_32c112_ZTSKZ99__HDQuantitySeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error__E3__1_e21_B48__0q8d16d24q32__40l;
  v33[4] = &v34;
  v33[5] = &v36;
  v33[6] = &v35;
  v33[7] = a3;
  int v13 = +[HDQuantitySeriesHFDMigrationEntity _enumerateAllSeriesWithDatabase:error:handler:]((uint64_t)a1, a5, (uint64_t)a7, v33);
  if (v13)
  {
    char v14 = NSNumber;
    id v15 = [v12 objectForKeyedSubscript:@"quantitySeriesRecoveredCount"];
    uint64_t v16 = [v15 longLongValue];
    double v17 = [v14 numberWithLongLong:v36 + v16];
    [v12 setObject:v17 forKeyedSubscript:@"quantitySeriesRecoveredCount"];

    char v18 = NSNumber;
    char v19 = [v12 objectForKeyedSubscript:@"quantitySeriesDiscardedCount"];
    uint64_t v20 = [v19 longLongValue];
    id v21 = [v18 numberWithLongLong:v35 + v20];
    [v12 setObject:v21 forKeyedSubscript:@"quantitySeriesDiscardedCount"];

    int v22 = NSNumber;
    uint64_t v23 = v34;
    if (v34)
    {
      char v19 = [v12 objectForKeyedSubscript:@"quantitySeriesRecoveredCount"];
      uint64_t v24 = [v19 longLongValue];
      double v25 = (double)v24 / (double)v34;
    }
    else
    {
      double v25 = 1.0;
    }
    v26 = [v22 numberWithDouble:v25];
    [v12 setObject:v26 forKeyedSubscript:@"quantitySeriesMigrationFraction"];

    if (v23) {
    v27 = NSNumber;
    }
    uint64_t v28 = v34;
    if (v34)
    {
      char v19 = [v12 objectForKeyedSubscript:@"quantitySeriesDiscardedCount"];
      [v19 doubleValue];
      double v30 = v29 / (double)v34;
    }
    else
    {
      double v30 = 1.0;
    }
    v31 = [v27 numberWithDouble:v30];
    [v12 setObject:v31 forKeyedSubscript:@"quantitySeriesDiscardFraction"];

    if (v28) {
  }
    }

  return v13;
}

uint64_t __99__HDQuantitySeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5, double a6)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = a3;
  uint64_t v37 = a2;
  ++**(void **)(a1 + 32);
  uint64_t v35 = 0;
  __int16 v34 = 0;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  double v32 = a6 + 86400.0;
  double v33 = a5 + -86400.0;
  char v31 = 0;
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  int v13 = operator new(0x30uLL);
  void *v13 = &unk_1F171D160;
  v13[1] = (char *)&v34 + 1;
  v13[2] = &v33;
  v13[3] = &v32;
  v13[4] = &v35;
  v13[5] = &v31;
  v44[3] = v13;
  v43 = 0;
  char v14 = operator new(0x40uLL);
  *char v14 = &unk_1F171D1F0;
  v14[1] = &v35;
  v14[2] = &v36;
  v14[3] = (char *)&v34 + 1;
  v14[4] = v10;
  v14[5] = &v34;
  v14[6] = &v37;
  v14[7] = v9;
  v43 = v14;
  v41[0] = 1;
  v41[1] = a2;
  _HKInitializeLogging();
  id v15 = (os_log_t *)MEMORY[0x1E4F29F18];
  uint64_t v16 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = 1;
    __int16 v49 = 2048;
    uint64_t v50 = a2;
    _os_log_debug_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEBUG, "HFD rebuild: Migrating (%lld, %llu)", buf, 0x16u);
  }
  *(void *)buf = 0;
  char v46 = 0;
  double v17 = operator new(0x30uLL);
  *double v17 = &unk_1F171CE80;
  v17[1] = v44;
  v17[2] = v12;
  v17[3] = v41;
  v17[4] = v42;
  v17[5] = buf;
  char v46 = v17;
  health::DataStore::accessSampleHistoryWithIdentifierForReading<QuantitySampleValueBehaviorV0>(v11, (uint64_t)v41, (uint64_t)v45);
  std::__function::__value_func<void ()(health::DataStore::SampleHistory<QuantitySampleValueBehaviorV0> const&)>::~__value_func[abi:ne180100](v45);
  if (*(void *)buf)
  {
    id v18 = *(id *)buf;
    char v19 = v18;
    if (a4) {
      *a4 = v18;
    }
    else {
      _HKLogDroppedError();
    }

    std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v42);
    std::__function::__value_func<double ()(double,double)>::~__value_func[abi:ne180100](v44);
    return 0;
  }
  else
  {
    std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v42);
    std::__function::__value_func<double ()(double,double)>::~__value_func[abi:ne180100](v44);
    if (v31)
    {
      return 1;
    }
    else
    {
      uint64_t v21 = *(void *)(a1 + 64);
      uint64_t v30 = *(void *)(a1 + 56);
      uint64_t v22 = v37;
      uint64_t v23 = operator new(0x30uLL);
      *uint64_t v23 = &unk_1F171D5E0;
      v23[1] = (char *)&v34 + 1;
      v23[2] = &v33;
      v23[3] = &v32;
      v23[4] = &v35;
      v23[5] = &v34;
      v41[3] = v23;
      v40 = 0;
      uint64_t v24 = operator new(0x40uLL);
      *uint64_t v24 = &unk_1F171D1F0;
      v24[1] = &v35;
      v24[2] = &v36;
      v24[3] = (char *)&v34 + 1;
      v24[4] = v10;
      v24[5] = &v34;
      v24[6] = &v37;
      v24[7] = v9;
      v40 = v24;
      v38[0] = 2;
      v38[1] = v22;
      _HKInitializeLogging();
      double v25 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = 2;
        __int16 v49 = 2048;
        uint64_t v50 = v22;
        _os_log_debug_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEBUG, "HFD rebuild: Migrating (%lld, %llu)", buf, 0x16u);
      }
      id v47 = 0;
      id v51 = 0;
      v26 = operator new(0x30uLL);
      void *v26 = &unk_1F171D300;
      v26[1] = v41;
      v26[2] = v21;
      v26[3] = v38;
      v26[4] = v39;
      v26[5] = &v47;
      id v51 = v26;
      health::DataStore::accessSampleHistoryWithIdentifierForReading<QuantitySampleValueBehaviorV1>(v30, (uint64_t)v38, (uint64_t)buf);
      std::__function::__value_func<void ()(health::DataStore::SampleHistory<QuantitySampleValueBehaviorV1> const&)>::~__value_func[abi:ne180100](buf);
      BOOL v20 = v47 == 0;
      if (v47)
      {
        id v27 = v47;
        uint64_t v28 = v27;
        if (a4) {
          *a4 = v27;
        }
        else {
          _HKLogDroppedError();
        }
      }
      std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v39);
      std::__function::__value_func<_HDRawQuantitySampleValueV1 ()(double,_HDRawQuantitySampleValueV1)>::~__value_func[abi:ne180100](v41);
    }
  }
  return v20;
}

+ (void)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
}

+ (__n128)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
  *(void *)a2 = &unk_1F171D5E0;
  __n128 result = *(__n128 *)(a1 + 8);
  long long v3 = *(_OWORD *)(a1 + 24);
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
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

+ (void)enumerateRawDataFromHFDWithStore:(NSError * *){__autoreleasing} HFDKey:(id)const& error:(id)const& handler:
{
}

+ (__n128)enumerateRawDataFromHFDWithStore:(NSError * *){__autoreleasing} HFDKey:(id)const& error:(id)const& handler:
{
  *(void *)a2 = &unk_1F171D7E0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

+ (uint64_t)enumerateRawDataFromHFDWithStore:(NSError * *){__autoreleasing} HFDKey:(id)const& error:(id)const& handler:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end