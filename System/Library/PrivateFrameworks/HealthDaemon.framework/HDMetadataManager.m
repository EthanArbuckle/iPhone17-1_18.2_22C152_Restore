@interface HDMetadataManager
+ (id)_metadataPredicateClassForKey:(uint64_t)a1;
- (BOOL)insertMetadata:(id)a3 forObjectID:(id)a4 sourceID:(id)a5 externalSyncObjectCode:(int64_t)a6 objectDeleted:(BOOL)a7 error:(id *)a8;
- (BOOL)insertMetadata:(id)a3 forObjectID:(id)a4 sourceID:(id)a5 externalSyncObjectCode:(int64_t)a6 objectDeleted:(BOOL)a7 transaction:(id)a8 error:(id *)a9;
- (BOOL)updateMetadataValue:(id)a3 forKey:(id)a4 object:(id)a5 error:(id *)a6;
- (HDMetadataManager)initWithProfile:(id)a3;
- (id)_keyEntityForKey:(char)a3 createIfNecessary:(uint64_t)a4 transaction:(uint64_t)a5 error:;
- (id)metadataForObjectID:(int64_t)a3 baseMetadata:(id)a4 keyFilter:(id)a5 statement:(id)a6 error:(id *)a7;
- (id)predicateWithMetadataKey:(id)a3 allowedValues:(id)a4;
- (id)predicateWithMetadataKey:(id)a3 exists:(BOOL)a4;
- (id)predicateWithMetadataKey:(id)a3 value:(id)a4 operatorType:(unint64_t)a5;
- (id)unitTest_metadataForObjectID:(int64_t)a3 keyFilter:(id)a4 error:(id *)a5;
- (id)unitTest_rawMetadataForObject:(id)a3 error:(id *)a4;
@end

@implementation HDMetadataManager

- (BOOL)insertMetadata:(id)a3 forObjectID:(id)a4 sourceID:(id)a5 externalSyncObjectCode:(int64_t)a6 objectDeleted:(BOOL)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if ([v14 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v18 = [WeakRetained database];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __100__HDMetadataManager_insertMetadata_forObjectID_sourceID_externalSyncObjectCode_objectDeleted_error___block_invoke;
    v21[3] = &unk_1E63046F0;
    v21[4] = self;
    id v22 = v14;
    id v23 = v15;
    id v24 = v16;
    int64_t v25 = a6;
    BOOL v26 = a7;
    BOOL v19 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v18 error:a8 block:v21];
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

uint64_t __100__HDMetadataManager_insertMetadata_forObjectID_sourceID_externalSyncObjectCode_objectDeleted_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertMetadata:*(void *)(a1 + 40) forObjectID:*(void *)(a1 + 48) sourceID:*(void *)(a1 + 56) externalSyncObjectCode:*(void *)(a1 + 64) objectDeleted:*(unsigned __int8 *)(a1 + 72) transaction:a2 error:a3];
}

- (id)metadataForObjectID:(int64_t)a3 baseMetadata:(id)a4 keyFilter:(id)a5 statement:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  id v40 = 0;
  id v14 = a4;
  id v15 = v12;
  id v16 = v13;
  if (self)
  {
    id v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__127;
    v51 = __Block_byref_object_dispose__127;
    id v52 = v14;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__HDMetadataManager__metadataForObjectID_baseMetadata_keyFilter_statement_error___block_invoke;
    aBlock[3] = &unk_1E6304678;
    id v45 = v15;
    v46 = &v47;
    v17 = _Block_copy(aBlock);
    v18 = [v16 transaction];
    v41[0] = (id)MEMORY[0x1E4F143A8];
    v41[1] = (id)3221225472;
    v41[2] = __81__HDMetadataManager__metadataForObjectID_baseMetadata_keyFilter_statement_error___block_invoke_2;
    v41[3] = &unk_1E63046A0;
    v41[4] = self;
    id v19 = v18;
    id v42 = v19;
    id v20 = v17;
    id v43 = v20;
    if ([v16 enumerateResultsForObjectID:a3 error:&v40 block:v41]) {
      id v21 = v48[5];
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    id v22 = 0;
  }

  id v23 = v40;
  id v24 = v23;
  if (v22 || !v23)
  {
    v38 = a7;
    v27 = [v16 database];
    id v39 = v24;
    id v28 = v22;
    v29 = (unsigned int (**)(id, void))v15;
    id v30 = v27;
    if (self && (!v29 || v29[2](v29, *MEMORY[0x1E4F2A1F0]) && v29[2](v29, *MEMORY[0x1E4F2A1F8])))
    {
      v41[0] = 0;
      id v47 = 0;
      BOOL v31 = +[HDDataExternalSyncIdentifierEntity populateSyncInfoForObjectID:a3 database:v30 localSourceIDOut:0 externalSyncObjectCodeOut:0 syncIdentifierOut:v41 syncVersionOut:&v47 deletedOut:0 errorOut:&v39];
      id v32 = v41[0];
      id v33 = v47;
      id v34 = 0;
      if (v31)
      {
        id v35 = v33;
        id v34 = v28;
        if (v32)
        {
          if (!v22) {
            id v34 = (id)objc_opt_new();
          }
          [v34 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F2A1F0]];
          [v34 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F2A1F8]];
        }
        id v33 = v35;
      }
    }
    else
    {
      id v34 = 0;
    }

    id v25 = v39;
    if (v34 || !v25)
    {
      v36 = (void *)MEMORY[0x1E4F1CC08];
      if (v34) {
        v36 = v34;
      }
      id v26 = v36;
    }
    else if (v38)
    {
      id v25 = v25;
      id v26 = 0;
      id *v38 = v25;
    }
    else
    {
      _HKLogDroppedError();
      id v26 = 0;
    }
  }
  else if (a7)
  {
    id v25 = v23;
    id v26 = 0;
    *a7 = v25;
  }
  else
  {
    _HKLogDroppedError();
    id v26 = 0;
    id v25 = v24;
  }

  return v26;
}

void __81__HDMetadataManager__metadataForObjectID_baseMetadata_keyFilter_statement_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v11))
  {
    v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v7 setObject:v5 forKeyedSubscript:v11];
  }
}

- (HDMetadataManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDMetadataManager;
  id v5 = [(HDMetadataManager *)&v16 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [HDDatabaseValueCache alloc];
    id v8 = [(HDMetadataManager *)v6 hk_classNameWithTag:@"entities"];
    uint64_t v9 = [(HDDatabaseValueCache *)v7 initWithName:v8];
    keyEntityCache = v6->_keyEntityCache;
    v6->_keyEntityCache = (HDDatabaseValueCache *)v9;

    id v11 = [HDDatabaseValueCache alloc];
    id v12 = [(HDMetadataManager *)v6 hk_classNameWithTag:@"keys"];
    uint64_t v13 = [(HDDatabaseValueCache *)v11 initWithName:v12];
    keyCache = v6->_keyCache;
    v6->_keyCache = (HDDatabaseValueCache *)v13;
  }
  return v6;
}

BOOL __81__HDMetadataManager__metadataForObjectID_baseMetadata_keyFilter_statement_error___block_invoke_2(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = a1[4];
  uint64_t v9 = [NSNumber numberWithLongLong:a2];
  uint64_t v10 = a1[5];
  id v11 = v9;
  id v12 = v11;
  if (v8)
  {
    uint64_t v13 = *(void **)(v8 + 24);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __52__HDMetadataManager__keyForKeyID_transaction_error___block_invoke;
    v26[3] = &unk_1E6304768;
    id v27 = v11;
    id v14 = [v13 fetchObjectForKey:v27 transaction:v10 error:a4 faultHandler:v26];
  }
  else
  {
    id v14 = 0;
  }

  if (v14)
  {
    (*(void (**)(void))(a1[6] + 16))();
    uint64_t v15 = a1[4];
    objc_super v16 = (void *)a1[6];
    id v17 = v14;
    id v18 = v7;
    id v19 = v16;
    if (!v15)
    {
LABEL_9:

      goto LABEL_10;
    }
    if ([v17 isEqualToString:*MEMORY[0x1E4F2BB40]]
      || [v17 isEqualToString:*MEMORY[0x1E4F2BB30]])
    {
      id v20 = (void *)MEMORY[0x1E4F2A140];
LABEL_8:
      (*((void (**)(id, void, id))v19 + 2))(v19, *v20, v18);
      goto LABEL_9;
    }
    if ([v17 isEqualToString:*MEMORY[0x1E4F2BB28]])
    {
      [v18 integerValue];
      uint64_t v22 = HKHeartRateMotionContextForPrivateHeartRateContext();
      id v23 = (uint64_t *)MEMORY[0x1E4F2A148];
    }
    else
    {
      if ([v17 isEqualToString:*MEMORY[0x1E4F2BAB0]])
      {
        id v20 = (void *)MEMORY[0x1E4F2A090];
        goto LABEL_8;
      }
      if (![v17 isEqualToString:*MEMORY[0x1E4F2BAC8]]) {
        goto LABEL_9;
      }
      uint64_t v22 = HKAppleIrregularRhythmNotificationsAlgorithmVersionForPrivateVersionString();
      id v23 = (uint64_t *)MEMORY[0x1E4F2A090];
    }
    uint64_t v24 = *v23;
    id v25 = [NSNumber numberWithInteger:v22];
    (*((void (**)(id, uint64_t, void *))v19 + 2))(v19, v24, v25);

    goto LABEL_9;
  }
LABEL_10:

  return v14 != 0;
}

- (id)unitTest_metadataForObjectID:(int64_t)a3 keyFilter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__127;
  uint64_t v22 = __Block_byref_object_dispose__127;
  id v23 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v10 = [WeakRetained database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HDMetadataManager_unitTest_metadataForObjectID_keyFilter_error___block_invoke;
  v14[3] = &unk_1E63046C8;
  objc_super v16 = &v18;
  int64_t v17 = a3;
  v14[4] = self;
  id v11 = v8;
  id v15 = v11;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:v10 error:a5 block:v14];

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __66__HDMetadataManager_unitTest_metadataForObjectID_keyFilter_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[HDMetadataValueStatement metadataValueStatementWithTransaction:a2];
  uint64_t v6 = [*(id *)(a1 + 32) metadataForObjectID:*(void *)(a1 + 56) baseMetadata:0 keyFilter:*(void *)(a1 + 40) statement:v5 error:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [v5 finish];
  return 1;
}

- (id)unitTest_rawMetadataForObject:(id)a3 error:(id *)a4
{
  id v21 = a3;
  id v19 = NSString;
  id v4 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v5 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v6 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v7 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v8 = [v19 stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@ FROM %@ INNER JOIN %@ ON %@ = %@ INNER JOIN %@ ON %@ = %@.%@ WHERE %@ = ?", @"key", @"value_type", @"string_value", @"numerical_value", @"date_value", @"data_value", v4, v5, @"data_id", @"object_id", v6, @"key_id", v7, *MEMORY[0x1E4F65C70], @"uuid"];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained database];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke;
  v23[3] = &unk_1E62F5A88;
  id v24 = v8;
  id v25 = v21;
  id v26 = v9;
  id v12 = v9;
  id v13 = v21;
  id v14 = v8;
  BOOL v15 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v11 error:a4 block:v23];

  if (v15) {
    objc_super v16 = v12;
  }
  else {
    objc_super v16 = 0;
  }
  id v17 = v16;

  return v17;
}

uint64_t __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 protectedDatabase];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke_2;
  v11[3] = &unk_1E62F43C8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke_3;
  v9[3] = &unk_1E62F3D38;
  id v10 = *(id *)(a1 + 48);
  uint64_t v7 = [v5 executeSQL:v6 error:a3 bindingHandler:v11 enumerationHandler:v9];

  return v7;
}

void __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke_3(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsString();
  switch(HDSQLiteColumnWithNameAsInt64())
  {
    case 0:
      uint64_t v3 = HDSQLiteColumnWithNameAsString();
      goto LABEL_8;
    case 1:
      uint64_t v3 = HDSQLiteColumnWithNameAsNumber();
      goto LABEL_8;
    case 2:
      uint64_t v3 = HDSQLiteColumnWithNameAsDate();
      goto LABEL_8;
    case 3:
      id v5 = (void *)MEMORY[0x1E4F2B370];
      uint64_t v6 = (void *)MEMORY[0x1E4F2B618];
      uint64_t v7 = HDSQLiteColumnWithNameAsString();
      id v8 = [v6 unitFromString:v7];
      HDSQLiteColumnWithNameAsDouble();
      id v4 = objc_msgSend(v5, "quantityWithUnit:doubleValue:", v8);

      goto LABEL_9;
    case 4:
      uint64_t v3 = HDSQLiteColumnWithNameAsData();
LABEL_8:
      id v4 = (void *)v3;
LABEL_9:
      if (v2) {
        BOOL v9 = v4 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9) {
        [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v2];
      }
      break;
    default:
      id v4 = 0;
      break;
  }

  return 1;
}

- (BOOL)insertMetadata:(id)a3 forObjectID:(id)a4 sourceID:(id)a5 externalSyncObjectCode:(int64_t)a6 objectDeleted:(BOOL)a7 transaction:(id)a8 error:(id *)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = v13;
  id v18 = v14;
  id v19 = v16;
  uint64_t v20 = v19;
  if (self)
  {
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x2020000000;
    char v66 = 1;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__127;
    v61 = __Block_byref_object_dispose__127;
    id v62 = 0;
    uint64_t v21 = [v18 longLongValue];
    uint64_t v22 = [v20 databaseForEntityClass:objc_opt_class()];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __67__HDMetadataManager__insertMetadata_forObjectID_transaction_error___block_invoke;
    v50[3] = &unk_1E6304718;
    v50[4] = self;
    id v23 = v17;
    id v51 = v23;
    id v24 = v20;
    id v52 = v24;
    v54 = &v57;
    v55 = &v63;
    uint64_t v56 = v21;
    id v25 = v22;
    id v53 = v25;
    [v23 enumerateKeysAndObjectsUsingBlock:v50];
    id v49 = v17;
    if (*((unsigned char *)v64 + 24))
    {
      BOOL v26 = 1;
    }
    else
    {
      id v27 = (id)v58[5];
      id v28 = v27;
      if (v27)
      {
        if (a9) {
          *a9 = v27;
        }
        else {
          _HKLogDroppedError();
        }
      }

      BOOL v26 = *((unsigned char *)v64 + 24) != 0;
    }

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v63, 8);

    if (v26)
    {
      id v45 = v15;
      id v46 = v18;
      id v29 = v15;
      id v30 = v24;
      uint64_t v31 = *MEMORY[0x1E4F2A1F0];
      id v32 = v23;
      id v33 = [v32 objectForKeyedSubscript:v31];
      id v34 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F2A1F8]];

      if (v33)
      {
        v44 = v30;
        p_profile = &self->_profile;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        v37 = [WeakRetained sourceManager];
        v38 = [v37 localSourceForSourceID:v29 copyIfNecessary:1 error:a9];

        if (v38)
        {
          id v39 = objc_loadWeakRetained((id *)p_profile);
          id v40 = [v44 databaseForEntityClass:objc_opt_class()];
          LOBYTE(v43) = a7;
          BOOL v41 = +[HDDataExternalSyncIdentifierEntity insertSyncIdentifierWithProfile:database:objectID:localSourceID:externalSyncObjectCode:syncIdentifier:syncVersion:deleted:errorOut:](HDDataExternalSyncIdentifierEntity, "insertSyncIdentifierWithProfile:database:objectID:localSourceID:externalSyncObjectCode:syncIdentifier:syncVersion:deleted:errorOut:", v39, v40, [v46 longLongValue], objc_msgSend(v38, "persistentID"), a6, v33, v34, v43, a9);
        }
        else
        {
          BOOL v41 = 0;
        }
        id v15 = v45;
        id v17 = v49;

        id v30 = v44;
      }
      else
      {
        BOOL v41 = 1;
        id v15 = v45;
        id v17 = v49;
      }
    }
    else
    {
      BOOL v41 = 0;
      id v17 = v49;
    }
  }
  else
  {

    BOOL v41 = 0;
  }

  return v41;
}

void __67__HDMetadataManager__insertMetadata_forObjectID_transaction_error___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v10 = a1[4];
  BOOL v9 = (void *)a1[5];
  id v11 = v7;
  id v12 = v9;
  if (!v10) {
    goto LABEL_8;
  }
  if (qword_1EBA18D78 != -1) {
    dispatch_once(&qword_1EBA18D78, &__block_literal_global_152);
  }
  id v13 = (id)_MergedGlobals_214;
  char v14 = [v13 containsObject:v11];

  if ((v14 & 1) != 0
    || [v11 isEqualToString:*MEMORY[0x1E4F2A148]]
    && ([v12 objectForKeyedSubscript:*MEMORY[0x1E4F2BB28]],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
  }
  else
  {
LABEL_8:

    uint64_t v16 = a1[4];
    uint64_t v17 = a1[6];
    uint64_t v18 = *(void *)(a1[8] + 8);
    id obj = *(id *)(v18 + 40);
    id v19 = -[HDMetadataManager _keyEntityForKey:createIfNecessary:transaction:error:](v16, v11, 1, v17, (uint64_t)&obj);
    objc_storeStrong((id *)(v18 + 40), obj);
    if (!v19
      || (uint64_t v20 = [v19 persistentID],
          uint64_t v21 = a1[10],
          uint64_t v22 = a1[7],
          uint64_t v23 = *(void *)(a1[8] + 8),
          id v25 = *(id *)(v23 + 40),
          BOOL v24 = +[HDMetadataValueEntity _insertMetadataValueWithKeyID:v20 objectID:v21 value:v8 database:v22 error:&v25], objc_storeStrong((id *)(v23 + 40), v25), !v24))
    {
      *a4 = 1;
      *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 0;
    }
  }
}

- (id)_keyEntityForKey:(char)a3 createIfNecessary:(uint64_t)a4 transaction:(uint64_t)a5 error:
{
  id v9 = a2;
  uint64_t v10 = v9;
  if (a1)
  {
    id v11 = *(void **)(a1 + 16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__HDMetadataManager__keyEntityForKey_createIfNecessary_transaction_error___block_invoke;
    v14[3] = &unk_1E6304740;
    id v15 = v9;
    char v16 = a3;
    id v12 = [v11 fetchObjectForKey:v15 transaction:a4 error:a5 faultHandler:v14];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __49__HDMetadataManager__ignoredInsertedMetadataKeys__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F2A1F0], *MEMORY[0x1E4F2A1F8], 0);
  id v1 = (void *)_MergedGlobals_214;
  _MergedGlobals_214 = v0;
}

- (BOOL)updateMetadataValue:(id)a3 forKey:(id)a4 object:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HDMetadataManager.m", 424, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v15 = [WeakRetained database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61__HDMetadataManager_updateMetadataValue_forKey_object_error___block_invoke;
  v22[3] = &unk_1E62FB0D0;
  id v23 = v13;
  BOOL v24 = self;
  id v25 = v12;
  id v26 = v11;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  BOOL v19 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v15 error:a6 block:v22];

  return v19;
}

BOOL __61__HDMetadataManager_updateMetadataValue_forKey_object_error___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v7 = a1[4];
  id v23 = 0;
  id v8 = +[HDDataEntity dataEntityForObject:v7 transaction:v6 error:&v23];
  id v9 = v23;
  uint64_t v10 = v9;
  if (v8)
  {

    uint64_t v11 = a1[5];
    id v12 = (void *)a1[6];
    id v22 = 0;
    uint64_t v3 = -[HDMetadataManager _keyEntityForKey:createIfNecessary:transaction:error:](v11, v12, 0, (uint64_t)v6, (uint64_t)&v22);
    id v13 = v22;
    uint64_t v10 = v13;
    if (v3)
    {
      uint64_t v14 = [v3 persistentID];
      uint64_t v15 = [v8 persistentID];
      uint64_t v16 = a1[7];
      id v17 = [v6 databaseForEntityClass:objc_opt_class()];
      BOOL v18 = +[HDMetadataValueEntity _updateMetadataValueForKeyID:v14 objectID:v15 value:v16 database:v17 error:a3];
      BOOL v19 = v10;
LABEL_22:

      uint64_t v10 = v19;
LABEL_23:

      goto LABEL_24;
    }
    if (v13)
    {
      id v17 = v13;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"Metadata key \"%@\" not found", a1[6]);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
LABEL_15:
      if (a3) {
        *a3 = v17;
      }
      else {
        _HKLogDroppedError();
      }

      uint64_t v3 = 0;
      BOOL v19 = 0;
      BOOL v18 = 0;
      if (v10) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    uint64_t v3 = 0;
LABEL_21:
    BOOL v19 = 0;
    BOOL v18 = 0;
    goto LABEL_22;
  }
  if (v9)
  {
    id v17 = v9;
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = [(id)a1[4] UUID];
    objc_msgSend(v20, "hk_error:format:", 118, @"Object with UUID %@ not found", v3);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17) {
      goto LABEL_21;
    }
  }
  if (a3) {
    *a3 = v17;
  }
  else {
    _HKLogDroppedError();
  }

  BOOL v18 = 0;
  if (!v10)
  {
    BOOL v19 = 0;
    goto LABEL_22;
  }
LABEL_24:

  return v18;
}

- (id)predicateWithMetadataKey:(id)a3 allowedValues:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(+[HDMetadataManager _metadataPredicateClassForKey:]((uint64_t)HDMetadataManager, v6), "predicateWithMetadataKey:allowedValues:", v6, v5);

  return v7;
}

+ (id)_metadataPredicateClassForKey:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (([v2 isEqualToString:*MEMORY[0x1E4F2A1F0]] & 1) == 0) {
    [v2 isEqualToString:*MEMORY[0x1E4F2A1F8]];
  }
  uint64_t v3 = objc_opt_class();

  return v3;
}

- (id)predicateWithMetadataKey:(id)a3 value:(id)a4 operatorType:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_msgSend(+[HDMetadataManager _metadataPredicateClassForKey:]((uint64_t)HDMetadataManager, v8), "predicateWithMetadataKey:value:operatorType:", v8, v7, a5);

  return v9;
}

- (id)predicateWithMetadataKey:(id)a3 exists:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_msgSend(+[HDMetadataManager _metadataPredicateClassForKey:]((uint64_t)HDMetadataManager, v5), "predicateWithMetadataKey:exists:", v5, v4);

  return v6;
}

id __74__HDMetadataManager__keyEntityForKey_createIfNecessary_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  uint64_t v7 = *(void *)(a1 + 32);
  id v14 = 0;
  id v8 = +[HDMetadataKeyEntity _entityForKey:v7 database:v6 error:&v14];
  id v9 = v14;
  id v10 = v9;
  if (!v8)
  {
    if (!*(unsigned char *)(a1 + 40)
      || v9
      || (uint64_t v11 = *(void *)(a1 + 32),
          id v13 = 0,
          +[HDMetadataKeyEntity _insertEntityWithKey:v11 database:v6 error:&v13], id v8 = objc_claimAutoreleasedReturnValue(), v10 = v13, !v8))
    {
      id v10 = v10;
      if (v10)
      {
        if (a3) {
          *a3 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v8 = 0;
    }
  }

  return v8;
}

id __52__HDMetadataManager__keyForKeyID_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 databaseForEntityClass:objc_opt_class()];

  id v5 = +[HDMetadataKeyEntity _keyForPersistentID:*(void *)(a1 + 32) database:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCache, 0);
  objc_storeStrong((id *)&self->_keyEntityCache, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end