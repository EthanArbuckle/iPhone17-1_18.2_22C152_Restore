@interface HDServiceEntity
+ (BOOL)deleteService:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (BOOL)healthUpdatesEnabledForDevice:(id)a3 inDatabase:(id)a4 error:(id *)a5;
+ (BOOL)setHealthUpdatesEnabled:(BOOL)a3 forDevice:(id)a4 inDatabase:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)allServicesWithProfile:(id)a3 error:(id *)a4;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertOrUpdateService:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (id)tableAliases;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDServiceEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)allServicesWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__65;
  v29 = __Block_byref_object_dispose__65;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__65;
  v23 = __Block_byref_object_dispose__65;
  id v24 = 0;
  v7 = [v6 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__HDServiceEntity_allServicesWithProfile_error___block_invoke;
  v14[3] = &unk_1E62FC0E0;
  v16 = &v25;
  id v18 = a1;
  id v8 = v6;
  id v15 = v8;
  v17 = &v19;
  char v9 = [a1 performReadTransactionWithHealthDatabase:v7 error:a4 block:v14];

  if (v9)
  {
    if ([(id)v20[5] count])
    {
      v10 = [v8 database];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __48__HDServiceEntity_allServicesWithProfile_error___block_invoke_2;
      v13[3] = &unk_1E62FC108;
      v13[4] = &v19;
      v13[5] = a1;
      [a1 performWriteTransactionWithHealthDatabase:v10 error:a4 block:v13];
    }
    id v11 = (id)v26[5];
  }
  else
  {
    id v11 = 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

uint64_t __48__HDServiceEntity_allServicesWithProfile_error___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v8 = a2;
  id v9 = v3;
  v10 = self;
  id v11 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v11 setEntityClass:v10];
  [v11 setLimitCount:*MEMORY[0x1E4F65DE0]];
  id v12 = objc_alloc(MEMORY[0x1E4F65D60]);
  v13 = [v8 databaseForEntityClass:v10];
  v14 = (void *)[v12 initWithDatabase:v13 descriptor:v11];

  v26 = v9;
  id v15 = [v10 entityEncoderForProfile:v9 transaction:v8 purpose:1 encodingOptions:0 authorizationFilter:0];
  v16 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__65;
  v35 = __Block_byref_object_dispose__65;
  id v36 = 0;
  v17 = [v15 orderedProperties];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __69__HDServiceEntity__servicesWithDatabaseTransaction_profile_removals___block_invoke;
  v27[3] = &unk_1E62FC150;
  id v18 = v15;
  id v28 = v18;
  id v30 = &v31;
  id v19 = v16;
  id v29 = v19;
  [v14 enumeratePersistentIDsAndProperties:v17 error:0 enumerationHandler:v27];

  v20 = (void *)v32[5];
  if (v20) {
    id v6 = v20;
  }
  uint64_t v21 = v29;
  id v22 = v19;

  _Block_object_dispose(&v31, 8);
  objc_storeStrong(v5, v6);
  uint64_t v23 = *(void *)(a1[5] + 8);
  id v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;

  return 1;
}

+ (id)databaseTable
{
  return @"devices";
}

+ (id)tableAliases
{
  return &unk_1F17E9558;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_33;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"device_uuid";
  v4[1] = @"device_service";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)insertOrUpdateService:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v38 = __Block_byref_object_copy__65;
    v39 = __Block_byref_object_dispose__65;
    id v40 = 0;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke;
    id v28 = &unk_1E62FC0B8;
    id v32 = a1;
    id v11 = v8;
    id v29 = v11;
    uint64_t v31 = buf;
    id v30 = v10;
    if ([a1 performWriteTransactionWithHealthDatabase:v30 error:a5 block:&v25])
    {
      id v12 = *(void **)(*(void *)&buf[8] + 40);
    }
    else
    {
      _HKInitializeLogging();
      id v15 = (id)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v22 = (id)objc_opt_class();
        uint64_t v23 = objc_msgSend(v11, "identifier", v25, v26, v27, v28, v29);
        id v24 = [v23 UUIDString];
        *(_DWORD *)uint64_t v33 = 138543618;
        id v34 = v22;
        __int16 v35 = 2114;
        id v36 = v24;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: cannot insert service %{public}@ into database", v33, 0x16u);
      }
      id v12 = 0;
    }
    id v14 = v12;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v17 = v13;
      id v18 = objc_opt_class();
      id v19 = v18;
      v20 = [v8 identifier];
      uint64_t v21 = [v20 UUIDString];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: invalid parameters, service: %{public}@", buf, 0x16u);
    }
    id v14 = 0;
  }

  return v14;
}

uint64_t __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v47[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 56)];
  v7 = NSString;
  id v8 = [*(id *)(a1 + 56) disambiguatedDatabaseTable];
  id v9 = [v7 stringWithFormat:@"SELECT %@, %@ FROM %@ WHERE %@ = ? AND %@ = ?", *MEMORY[0x1E4F65C70], @"device_last_connect", v8, @"device_uuid", @"device_service"];

  uint64_t v42 = 0;
  v43 = (double *)&v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_2;
  v40[3] = &unk_1E62F43C8;
  id v41 = *(id *)(a1 + 32);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_3;
  v39[3] = &unk_1E62FC090;
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  v39[5] = &v42;
  v39[6] = v11;
  v39[4] = v10;
  if (([v6 executeSQL:v9 error:a3 bindingHandler:v40 enumerationHandler:v39] & 1) == 0)
  {
    uint64_t v21 = 0;
    goto LABEL_12;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = *(id *)(a1 + 40);
      id v34 = [v31 profile];
      id v32 = [v34 daemon];
      id v22 = [v32 analyticsSubmissionCoordinator];
      uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "type"));
      id v24 = [v31 profile];
      objc_msgSend(v22, "healthService_reportServiceTypeAdded:profileType:", v23, objc_msgSend(v24, "profileType"));
    }
    v47[0] = @"device_uuid";
    v47[1] = @"device_name";
    v47[2] = @"device_service";
    v47[3] = @"device_last_connect";
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    uint64_t v26 = *(void **)(a1 + 56);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_4;
    v36[3] = &unk_1E62F67E8;
    id v37 = *(id *)(a1 + 32);
    double v38 = Current;
    uint64_t v27 = [v26 insertOrReplaceEntity:0 database:v6 properties:v25 error:a3 bindingHandler:v36];
    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
    id v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = *(id *)(a1 + 40);
    uint64_t v33 = [v13 profile];
    id v14 = [v33 daemon];
    id v15 = [v14 analyticsSubmissionCoordinator];
    v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "type"));
    double v17 = v43[3];
    id v18 = [v13 profile];
    objc_msgSend(v15, "healthService_reportServiceType:duration:profileType:", v16, objc_msgSend(v18, "profileType"), Current - v17);
  }
  id v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v46 = @"device_last_connect";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_5;
  v35[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  *(double *)&v35[4] = Current;
  uint64_t v21 = [v19 updateProperties:v20 database:v6 error:a3 bindingHandler:v35];

  if (v21) {
LABEL_11:
  }
    uint64_t v21 = 1;
LABEL_12:

  _Block_object_dispose(&v42, 8);
  return v21;
}

uint64_t __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v5 = [*(id *)(a1 + 32) type];

  return sqlite3_bind_int64(a2, 2, v5);
}

uint64_t __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 48)) initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MEMORY[0x1C1879F40](a2, 1);
  return 0;
}

void __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  MEMORY[0x1C1879EF0](a2, @"device_uuid", v4);

  uint64_t v5 = [*(id *)(a1 + 32) name];
  MEMORY[0x1C1879EC0](a2, @"device_name", v5);

  MEMORY[0x1C1879E80](a2, @"device_service", [*(id *)(a1 + 32) type]);

  JUMPOUT(0x1C1879E50);
}

void __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_5()
{
}

+ (BOOL)deleteService:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __54__HDServiceEntity_deleteService_healthDatabase_error___block_invoke;
  uint64_t v23 = &unk_1E62F5200;
  id v26 = a1;
  id v11 = v9;
  id v24 = v11;
  id v12 = v10;
  id v25 = v12;
  SEL v27 = a2;
  char v13 = [a1 performWriteTransactionWithHealthDatabase:v12 error:a5 block:&v20];
  if ((v13 & 1) == 0)
  {
    _HKInitializeLogging();
    id v14 = (id)*MEMORY[0x1E4F29F98];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(v11, "identifier", v20, v21, v22, v23, v24);
      uint64_t v17 = [v16 UUIDString];
      id v18 = (void *)v17;
      if (a5) {
        id v19 = *a5;
      }
      else {
        id v19 = 0;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v17;
      __int16 v30 = 2114;
      id v31 = v19;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Cannot delete service %{public}@ from database. Error: %{public}@", buf, 0x16u);
    }
  }

  return v13;
}

uint64_t __54__HDServiceEntity_deleteService_healthDatabase_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  id v6 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  self;
  id v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = [v7 identifier];
  id v10 = _HDSQLiteValueForUUID();
  id v11 = [v8 predicateWithProperty:@"device_uuid" equalToValue:v10];

  id v12 = (void *)MEMORY[0x1E4F65D00];
  char v13 = NSNumber;
  uint64_t v14 = [v7 type];

  id v15 = [v13 numberWithInteger:v14];
  v16 = [v12 predicateWithProperty:@"device_service" equalToValue:v15];

  uint64_t v17 = (void *)MEMORY[0x1E4F65D08];
  v29[0] = v11;
  v29[1] = v16;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v19 = [v17 predicateMatchingAllPredicates:v18];

  uint64_t v20 = [v6 anyInDatabase:v5 predicate:v19 error:a3];

  if (!v20)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 56), @"Could not find the health service in the database."");
      uint64_t v27 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v27 = 0;
    goto LABEL_9;
  }
  if (![v20 deleteFromDatabase:v5 error:a3]) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = *(id *)(a1 + 40);
    id v22 = [v21 profile];
    uint64_t v23 = [v22 daemon];
    id v24 = [v23 analyticsSubmissionCoordinator];
    id v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "type"));
    id v26 = [v21 profile];

    objc_msgSend(v24, "healthService_reportServiceTypeRemoved:profileType:", v25, objc_msgSend(v26, "profileType"));
  }
  uint64_t v27 = 1;
LABEL_9:

  return v27;
}

uint64_t __48__HDServiceEntity_allServicesWithProfile_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 138412546;
    long long v16 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_msgSend(*(id *)(a1 + 40), "entityWithPersistentID:", v10, v16);
        id v17 = 0;
        char v12 = [v11 deleteFromDatabase:v3 error:&v17];
        id v13 = v17;
        if ((v12 & 1) == 0)
        {
          _HKInitializeLogging();
          uint64_t v14 = *MEMORY[0x1E4F29F98];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F98], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v16;
            uint64_t v23 = v10;
            __int16 v24 = 2114;
            id v25 = v13;
            _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "Failed to delete expired service with id %@: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }

  return 1;
}

+ (BOOL)healthUpdatesEnabledForDevice:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    id v9 = (void *)MEMORY[0x1E4F65D00];
    uint64_t v10 = _HDSQLiteValueForUUID();
    id v11 = [v9 predicateWithProperty:@"device_uuid" equalToValue:v10];

    uint64_t v12 = objc_opt_class();
    v25[0] = @"device_enabled";
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__HDServiceEntity_healthUpdatesEnabledForDevice_inDatabase_error___block_invoke;
    v16[3] = &unk_1E62F9E08;
    v16[4] = &v21;
    v16[5] = &v17;
    LOBYTE(v12) = [(id)v12 enumerateProperties:v13 withPredicate:v11 healthDatabase:v8 error:a5 enumerationHandler:v16];

    if (v12)
    {
      if (!*((unsigned char *)v18 + 24)) {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 313, @"device not found");
      }
      BOOL v14 = *((unsigned char *)v22 + 24) != 0;
    }
    else
    {
      BOOL v14 = 0;
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

uint64_t __66__HDServiceEntity_healthUpdatesEnabledForDevice_inDatabase_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MEMORY[0x1C1879F00](a4, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return 0;
}

+ (BOOL)setHealthUpdatesEnabled:(BOOL)a3 forDevice:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = (void *)MEMORY[0x1E4F65D00];
  id v10 = a5;
  id v11 = _HDSQLiteValueForUUID();
  uint64_t v12 = [v9 predicateWithProperty:@"device_uuid" equalToValue:v11];

  v17[0] = @"device_enabled";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__HDServiceEntity_setHealthUpdatesEnabled_forDevice_inDatabase_error___block_invoke;
  v15[3] = &__block_descriptor_33_e34_v16__0__HDSQLiteStatementBinder__8l;
  BOOL v16 = a3;
  LOBYTE(a6) = [a1 updateProperties:v13 predicate:v12 healthDatabase:v10 error:a6 bindingHandler:v15];

  return (char)a6;
}

void __70__HDServiceEntity_setHealthUpdatesEnabled_forDevice_inDatabase_error___block_invoke()
{
}

uint64_t __69__HDServiceEntity__servicesWithDatabaseTransaction_profile_removals___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v6 = *(void **)(a1 + 32);
  id v17 = 0;
  id v7 = [v6 objectForPersistentID:a2 row:a4 error:&v17];
  id v8 = v17;
  id v9 = v8;
  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
  }
  else if (v8)
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Failed to instantiate non-deprecated service: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    id v15 = [NSNumber numberWithLongLong:a2];
    [v11 addObject:v15];
  }
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(HDEntityEncoder *)[_HDServiceEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end