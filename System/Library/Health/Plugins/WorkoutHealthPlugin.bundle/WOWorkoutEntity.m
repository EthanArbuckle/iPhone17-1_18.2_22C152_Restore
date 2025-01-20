@interface WOWorkoutEntity
+ (BOOL)_shouldInsertOrReplaceLocal:(id)a3 withRemote:(id)a4;
+ (BOOL)bind:(id)a3 provenance:(int64_t)a4 syncIdentity:(int64_t)a5 toBinder:(HDSQLiteStatementBinder *)a6;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)isPropertyFatal:(id)a3 version:(int64_t)a4;
+ (Class)classForPersistenceType:(unint64_t)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (double)_cleanupTombstoneExpirationIntervalForPersistenceType:(unint64_t)a3;
+ (id)_lookup:(id)a3 ofType:(unint64_t)a4 profile:(id)a5 transaction:(id)a6;
+ (id)_nonRaceConfigPredicate:(Class)a3;
+ (id)allProperties;
+ (id)dataProperties;
+ (id)databaseTable;
+ (id)dateProperties;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)integerProperties;
+ (id)persistenceFromRow:(HDSQLiteRow *)a3 type:(unint64_t)a4 profile:(id)a5 transaction:(id)a6;
+ (id)propertyForObjectModificationDate;
+ (id)propertyForObjectState;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)propertyForUUID;
+ (id)protoPersistenceFromRow:(HDSQLiteRow *)a3 type:(unint64_t)a4 profile:(id)a5 transaction:(id)a6;
+ (id)stringProperties;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (id)tableName;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)persistenceType;
+ (void)_cleanupDeletedObjectsWithProfile:(id)a3 type:(unint64_t)a4;
@end

@implementation WOWorkoutEntity

+ (id)allProperties
{
  v3 = +[NSMutableArray arrayWithObjects:@"uuid", @"serialization_version", @"serialized", @"sync_provenance", @"object_state", @"object_modification_date", @"sync_identity", @"proto", 0];
  v4 = [a1 integerProperties];
  [v3 addObjectsFromArray:v4];

  v5 = [a1 stringProperties];
  [v3 addObjectsFromArray:v5];

  v6 = [a1 dateProperties];
  [v3 addObjectsFromArray:v6];

  v7 = [a1 dataProperties];
  [v3 addObjectsFromArray:v7];

  return v3;
}

+ (id)integerProperties
{
  return &__NSArray0__struct;
}

+ (id)stringProperties
{
  return &__NSArray0__struct;
}

+ (id)dateProperties
{
  return &__NSArray0__struct;
}

+ (id)dataProperties
{
  return &__NSArray0__struct;
}

+ (id)propertyForUUID
{
  return @"uuid";
}

+ (id)propertyForObjectState
{
  return @"object_state";
}

+ (id)propertyForObjectModificationDate
{
  return @"object_modification_date";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (BOOL)isPropertyFatal:(id)a3 version:(int64_t)a4
{
  return 1;
}

+ (BOOL)bind:(id)a3 provenance:(int64_t)a4 syncIdentity:(int64_t)a5 toBinder:(HDSQLiteStatementBinder *)a6
{
  id v7 = a3;
  v8 = [v7 uuid];
  HDSQLiteBindUUIDToProperty();

  [v7 version];
  HDSQLiteBindInt64ToProperty();
  v9 = [v7 persistedData];
  HDSQLiteBindDataToProperty();

  HDSQLiteBindInt64ToProperty();
  [v7 objectState];
  HDSQLiteBindInt64ToProperty();
  v10 = [v7 objectModificationDate];
  HDSQLiteBindDateToProperty();

  HDSQLiteBindInt64ToProperty();
  v11 = [v7 persistedProtoData];
  HDSQLiteBindDataToProperty();

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v12 = [a1 integerProperties];
  id v13 = [v12 countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v66;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v66 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v65 + 1) + 8 * (void)v16);
        v18 = [v7 keyedNumbers];
        v19 = [v18 objectForKeyedSubscript:v17];

        if (v19)
        {
          v20 = [v7 keyedNumbers];
          v21 = [v20 objectForKeyedSubscript:v17];
          HDSQLiteBindNumberToProperty();
        }
        else
        {
          HDSQLiteBindNullToProperty();
        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v65 objects:v72 count:16];
    }
    while (v14);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v22 = [a1 stringProperties];
  id v23 = [v22 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v62;
    do
    {
      v26 = 0;
      do
      {
        if (*(void *)v62 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v61 + 1) + 8 * (void)v26);
        v28 = [v7 keyedStrings];
        v29 = [v28 objectForKeyedSubscript:v27];

        if (v29)
        {
          v30 = [v7 keyedStrings];
          v31 = [v30 objectForKeyedSubscript:v27];
          HDSQLiteBindStringToProperty();
        }
        else
        {
          HDSQLiteBindNullToProperty();
        }
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v61 objects:v71 count:16];
    }
    while (v24);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v32 = [a1 dateProperties];
  id v33 = [v32 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v58;
    do
    {
      v36 = 0;
      do
      {
        if (*(void *)v58 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v57 + 1) + 8 * (void)v36);
        v38 = [v7 keyedDates];
        v39 = [v38 objectForKeyedSubscript:v37];

        if (v39)
        {
          v40 = [v7 keyedDates];
          v41 = [v40 objectForKeyedSubscript:v37];
          HDSQLiteBindDateToProperty();
        }
        else
        {
          HDSQLiteBindNullToProperty();
        }
        v36 = (char *)v36 + 1;
      }
      while (v34 != v36);
      id v34 = [v32 countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v34);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v42 = objc_msgSend(a1, "dataProperties", 0);
  id v43 = [v42 countByEnumeratingWithState:&v53 objects:v69 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v54;
    do
    {
      v46 = 0;
      do
      {
        if (*(void *)v54 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void *)(*((void *)&v53 + 1) + 8 * (void)v46);
        v48 = [v7 keyedDatas];
        v49 = [v48 objectForKeyedSubscript:v47];

        if (v49)
        {
          v50 = [v7 keyedDatas];
          v51 = [v50 objectForKeyedSubscript:v47];
          HDSQLiteBindDataToProperty();
        }
        else
        {
          HDSQLiteBindNullToProperty();
        }
        v46 = (char *)v46 + 1;
      }
      while (v44 != v46);
      id v44 = [v42 countByEnumeratingWithState:&v53 objects:v69 count:16];
    }
    while (v44);
  }

  return 1;
}

+ (id)protoPersistenceFromRow:(HDSQLiteRow *)a3 type:(unint64_t)a4 profile:(id)a5 transaction:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  uint64_t v74 = HDSQLiteColumnWithNameAsInteger();
  v10 = HDSQLiteColumnWithNameAsUUID();
  if (v10)
  {
    uint64_t v11 = HDSQLiteColumnWithNameAsData();
    v12 = (void *)v11;
    if (v11)
    {
      v72 = (void *)v11;
      id v13 = HDSQLiteColumnWithNameAsData();
      uint64_t v14 = HDSQLiteColumnWithNameAsInteger();
      v73 = HDSQLiteColumnWithNameAsDate();
      if (!v73)
      {
        v73 = +[WOPersistence zeroObjectModificationDate];
      }
      uint64_t v15 = HDSQLiteColumnWithNameAsInteger();
      v16 = [v8 syncIdentityManager];
      id v92 = 0;
      uint64_t v17 = [v16 identityForEntityID:v15 transaction:v9 error:&v92];
      id v71 = v92;

      if (v17)
      {
        id v68 = v9;
        id v69 = v8;
        v18 = v13;
        id v19 = objc_alloc_init((Class)WOHealthBridgeProtoPersistence);
        [v19 setVersion:v74];
        [v19 setType:a4];
        long long v67 = v10;
        v20 = objc_msgSend(v10, "hk_dataForUUIDBytes");
        [v19 setUuid:v20];

        [v19 setPersistedData:v72];
        v70 = v18;
        [v19 setPersistedProtoData:v18];
        [v19 setObjectState:v14];
        [v73 timeIntervalSinceReferenceDate];
        objc_msgSend(v19, "setObjectModificationTimeSinceReferenceDate:");
        v21 = [v17 identity];
        v22 = [v21 hardwareIdentifier];
        id v23 = objc_msgSend(v22, "hk_dataForUUIDBytes");
        id v24 = [v19 syncIdentity];
        [v24 setHardwareIdentifier:v23];

        uint64_t v25 = [v17 identity];
        v26 = [v25 databaseIdentifier];
        uint64_t v27 = objc_msgSend(v26, "hk_dataForUUIDBytes");
        v28 = [v19 syncIdentity];
        [v28 setDatabaseIdentifier:v27];

        long long v66 = v17;
        v29 = [v17 identity];
        v30 = [v29 instanceDiscriminator];
        v31 = [v19 syncIdentity];
        [v31 setInstanceDiscriminator:v30];

        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        v32 = [a1 integerProperties];
        id v33 = [v32 countByEnumeratingWithState:&v88 objects:v96 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v89;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(void *)v89 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v88 + 1) + 8 * i);
              HDSQLiteColumnWithNameAsDouble();
              double v39 = v38;
              id v40 = objc_alloc_init((Class)WOHealthBridgeKeyedNumber);
              [v40 setKey:v37];
              [v40 setNumber:v39];
              [v19 addKeyedNumbers:v40];
            }
            id v34 = [v32 countByEnumeratingWithState:&v88 objects:v96 count:16];
          }
          while (v34);
        }

        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        v41 = [a1 stringProperties];
        id v42 = [v41 countByEnumeratingWithState:&v84 objects:v95 count:16];
        if (v42)
        {
          id v43 = v42;
          uint64_t v44 = *(void *)v85;
          while (2)
          {
            for (j = 0; j != v43; j = (char *)j + 1)
            {
              if (*(void *)v85 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v84 + 1) + 8 * (void)j);
              uint64_t v47 = HDSQLiteColumnWithNameAsString();
              if (v47)
              {
                id v48 = objc_alloc_init((Class)WOHealthBridgeKeyedString);
                [v48 setKey:v46];
                [v48 setString:v47];
                [v19 addKeyedStrings:v48];
              }
              else if ([a1 isPropertyFatal:v46 version:v74])
              {
                _HKInitializeLogging();
                if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
                  sub_B5B8();
                }
LABEL_58:

                id v63 = 0;
                goto LABEL_59;
              }
            }
            id v43 = [v41 countByEnumeratingWithState:&v84 objects:v95 count:16];
            if (v43) {
              continue;
            }
            break;
          }
        }

        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        v41 = [a1 dateProperties];
        id v49 = [v41 countByEnumeratingWithState:&v80 objects:v94 count:16];
        if (v49)
        {
          id v50 = v49;
          uint64_t v51 = *(void *)v81;
          while (2)
          {
            for (k = 0; k != v50; k = (char *)k + 1)
            {
              if (*(void *)v81 != v51) {
                objc_enumerationMutation(v41);
              }
              uint64_t v53 = *(void *)(*((void *)&v80 + 1) + 8 * (void)k);
              long long v54 = HDSQLiteColumnWithNameAsDate();
              if (v54)
              {
                id v55 = objc_alloc_init((Class)WOHealthBridgeKeyedDate);
                [v55 setKey:v53];
                [v54 timeIntervalSinceReferenceDate];
                objc_msgSend(v55, "setTimeSinceReferenceDate:");
                [v19 addKeyedDates:v55];
              }
              else if ([a1 isPropertyFatal:v53 version:v74])
              {
                _HKInitializeLogging();
                if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
                  sub_B5B8();
                }
                goto LABEL_58;
              }
            }
            id v50 = [v41 countByEnumeratingWithState:&v80 objects:v94 count:16];
            if (v50) {
              continue;
            }
            break;
          }
        }

        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        v41 = [a1 dataProperties];
        id v56 = [v41 countByEnumeratingWithState:&v76 objects:v93 count:16];
        if (v56)
        {
          id v57 = v56;
          uint64_t v58 = *(void *)v77;
          while (2)
          {
            for (m = 0; m != v57; m = (char *)m + 1)
            {
              if (*(void *)v77 != v58) {
                objc_enumerationMutation(v41);
              }
              uint64_t v60 = *(void *)(*((void *)&v76 + 1) + 8 * (void)m);
              long long v61 = HDSQLiteColumnWithNameAsData();
              if (v61)
              {
                id v62 = objc_alloc_init((Class)WOHealthBridgeKeyedData);
                [v62 setKey:v60];
                [v62 setOurData:v61];
                [v19 addKeyedDatas:v62];
              }
              else if ([a1 isPropertyFatal:v60 version:v74])
              {
                _HKInitializeLogging();
                if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
                  sub_B5B8();
                }
                goto LABEL_58;
              }
            }
            id v57 = [v41 countByEnumeratingWithState:&v76 objects:v93 count:16];
            if (v57) {
              continue;
            }
            break;
          }
        }

        id v63 = v19;
LABEL_59:
        id v9 = v68;
        id v8 = v69;
        uint64_t v17 = v66;
        v10 = v67;
        long long v64 = v71;
        v12 = v72;

        id v13 = v70;
      }
      else
      {
        _HKInitializeLogging();
        v12 = v72;
        if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_FAULT))
        {
          long long v64 = v71;
          sub_B544();
          id v63 = 0;
        }
        else
        {
          id v63 = 0;
          long long v64 = v71;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_B510();
      }
      id v63 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_B4DC();
    }
    id v63 = 0;
  }

  return v63;
}

+ (id)persistenceFromRow:(HDSQLiteRow *)a3 type:(unint64_t)a4 profile:(id)a5 transaction:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = HDSQLiteColumnWithNameAsInteger();
  v12 = HDSQLiteColumnWithNameAsUUID();
  if (v12)
  {
    id v13 = HDSQLiteColumnWithNameAsData();
    if (v13)
    {
      id obj = (id)a4;
      uint64_t v14 = HDSQLiteColumnWithNameAsData();
      id v69 = (id)HDSQLiteColumnWithNameAsInteger();
      id v68 = HDSQLiteColumnWithNameAsDate();
      if (!v68)
      {
        id v68 = +[WOPersistence zeroObjectModificationDate];
      }
      uint64_t v15 = HDSQLiteColumnWithNameAsInteger();
      v16 = [v9 syncIdentityManager];
      id v89 = 0;
      uint64_t v17 = [v16 identityForEntityID:v15 transaction:v10 error:&v89];
      id v67 = v89;

      v18 = (void *)v17;
      if (v17)
      {
        id v59 = v10;
        id v60 = v9;
        id v19 = objc_alloc((Class)WOSyncIdentity);
        id v63 = [v18 identity];
        v20 = [v63 hardwareIdentifier];
        [v18 identity];
        v21 = long long v66 = v14;
        [v21 databaseIdentifier];
        v22 = long long v65 = v12;
        uint64_t v58 = v18;
        [v18 identity];
        v24 = id v23 = v13;
        uint64_t v25 = [v24 instanceDiscriminator];
        id v26 = [v19 initWithHardwareIdentifier:v20 databaseIdentifier:v22 instanceDiscriminator:v25];

        id v57 = v26;
        long long v61 = v23;
        id v64 = [objc_alloc((Class)WOPersistence) initWithVersion:v11 type:obj uuid:v65 persistedData:v23 persistedProtoData:v66 objectState:v69 objectModificationDate:v68 syncIdentity:v26];
        uint64_t v27 = +[NSMutableDictionary dictionary];
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        v28 = [a1 integerProperties];
        id v29 = [v28 countByEnumeratingWithState:&v85 objects:v93 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v86;
          while (2)
          {
            for (i = 0; i != v30; i = (char *)i + 1)
            {
              if (*(void *)v86 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v85 + 1) + 8 * i);
              id v34 = HDSQLiteColumnWithNameAsNumber();
              if (v34)
              {
                [v27 setObject:v34 forKeyedSubscript:v33];
              }
              else if ([a1 isPropertyFatal:v33 version:v11])
              {
                _HKInitializeLogging();
                if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
                  sub_B5B8();
                }
                id v53 = 0;
                id v10 = v59;
                id v9 = v60;
                v12 = v65;
                id v55 = v57;
                v18 = v58;
                long long v54 = v67;
                goto LABEL_69;
              }
            }
            id v30 = [v28 countByEnumeratingWithState:&v85 objects:v93 count:16];
            if (v30) {
              continue;
            }
            break;
          }
        }

        [v64 setKeyedNumbers:v27];
        v28 = +[NSMutableDictionary dictionary];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id obja = [a1 stringProperties];
        id v35 = [obja countByEnumeratingWithState:&v81 objects:v92 count:16];
        if (v35)
        {
          id v36 = v35;
          uint64_t v37 = *(void *)v82;
          while (2)
          {
            for (j = 0; j != v36; j = (char *)j + 1)
            {
              if (*(void *)v82 != v37) {
                objc_enumerationMutation(obja);
              }
              uint64_t v39 = *(void *)(*((void *)&v81 + 1) + 8 * (void)j);
              id v40 = HDSQLiteColumnWithNameAsString();
              if (v40)
              {
                [v28 setObject:v40 forKeyedSubscript:v39];
              }
              else if ([a1 isPropertyFatal:v39 version:v11])
              {
                _HKInitializeLogging();
                if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
                  sub_B5B8();
                }
                id v53 = 0;
                id v10 = v59;
                id v9 = v60;
                v12 = v65;
                id v55 = v57;
                v18 = v58;
                long long v54 = v67;
                goto LABEL_68;
              }
            }
            id v36 = [obja countByEnumeratingWithState:&v81 objects:v92 count:16];
            if (v36) {
              continue;
            }
            break;
          }
        }

        [v64 setKeyedStrings:v28];
        id obja = +[NSMutableDictionary dictionary];
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v70 = [a1 dateProperties];
        id v41 = [v70 countByEnumeratingWithState:&v77 objects:v91 count:16];
        if (v41)
        {
          id v42 = v41;
          uint64_t v43 = *(void *)v78;
          while (2)
          {
            for (k = 0; k != v42; k = (char *)k + 1)
            {
              if (*(void *)v78 != v43) {
                objc_enumerationMutation(v70);
              }
              uint64_t v45 = *(void *)(*((void *)&v77 + 1) + 8 * (void)k);
              uint64_t v46 = HDSQLiteColumnWithNameAsDate();
              if (v46)
              {
                [obja setObject:v46 forKeyedSubscript:v45];
              }
              else if ([a1 isPropertyFatal:v45 version:v11])
              {
                _HKInitializeLogging();
                if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
                  sub_B5B8();
                }
LABEL_66:
                id v53 = 0;
                goto LABEL_67;
              }
            }
            id v42 = [v70 countByEnumeratingWithState:&v77 objects:v91 count:16];
            if (v42) {
              continue;
            }
            break;
          }
        }

        [v64 setKeyedDates:obja];
        id v70 = +[NSMutableDictionary dictionary];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v62 = [a1 dataProperties];
        id v47 = [v62 countByEnumeratingWithState:&v73 objects:v90 count:16];
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v74;
          while (2)
          {
            for (m = 0; m != v48; m = (char *)m + 1)
            {
              if (*(void *)v74 != v49) {
                objc_enumerationMutation(v62);
              }
              uint64_t v51 = *(void *)(*((void *)&v73 + 1) + 8 * (void)m);
              v52 = HDSQLiteColumnWithNameAsData();
              if (v52)
              {
                [v70 setObject:v52 forKeyedSubscript:v51];
              }
              else if ([a1 isPropertyFatal:v51 version:v11])
              {
                _HKInitializeLogging();
                if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
                  sub_B5B8();
                }

                goto LABEL_66;
              }
            }
            id v48 = [v62 countByEnumeratingWithState:&v73 objects:v90 count:16];
            if (v48) {
              continue;
            }
            break;
          }
        }

        [v64 setKeyedDatas:v70];
        id v53 = v64;
LABEL_67:
        id v10 = v59;
        id v9 = v60;
        v12 = v65;
        id v55 = v57;
        v18 = v58;
        long long v54 = v67;

LABEL_68:
LABEL_69:

        id v13 = v61;
        uint64_t v14 = v66;
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_FAULT))
        {
          long long v54 = v67;
          sub_B544();
          id v53 = 0;
        }
        else
        {
          id v53 = 0;
          long long v54 = v67;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_B510();
      }
      id v53 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_B4DC();
    }
    id v53 = 0;
  }

  return v53;
}

+ (Class)classForPersistenceType:(unint64_t)a3
{
  if (a3 - 2 <= 2)
  {
    objc_opt_class();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)a1;
}

+ (double)_cleanupTombstoneExpirationIntervalForPersistenceType:(unint64_t)a3
{
  return 31557600.0;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)databaseTable
{
  v2 = [a1 tableName];
  uint64_t v3 = +[NSString stringWithFormat:@"%@_%@", @"WorkoutHealthPlugin", v2];

  return v3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  if ([a1 isEqual:objc_opt_class()])
  {
    uint64_t v3 = 2;
  }
  else if ([a1 isEqual:objc_opt_class()])
  {
    uint64_t v3 = 3;
  }
  else if ([a1 isEqual:objc_opt_class()])
  {
    uint64_t v3 = 4;
  }
  else
  {
    _HKInitializeLogging();
    v4 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_B620(v4);
    }
    uint64_t v3 = 0;
  }
  v5 = +[HDSyncEntityIdentifier identifierWithSchema:@"WorkoutHealthPlugin" entity:v3];

  return (HDSyncEntityIdentifier *)v5;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [a5 database];
  id v12 = [a1 nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v10 healthDatabase:v11 error:a6];

  _HKInitializeLogging();
  id v13 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG)) {
    sub_B6B8(v13, (uint64_t)a1, (uint64_t)v12);
  }
  return (int64_t)v12;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v9 = a3;
  id v56 = a5;
  id v57 = a6;
  uint64_t v58 = v9;
  id v10 = [v9 count];
  _HKInitializeLogging();
  uint64_t v11 = (void *)HKLogWorkouts;
  BOOL v12 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = v11;
      uint64_t v14 = objc_opt_class();
      id v15 = v14;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = [v58 count];
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[WOSync] %{public}@ received %{public}lu sync objects.", buf, 0x16u);
    }
    id v60 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v58, "count"));
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v16 = v58;
    id v17 = [v16 countByEnumeratingWithState:&v72 objects:v85 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v73;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v73 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v72 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v60 addObject:v20];
          }
          else
          {
            _HKInitializeLogging();
            v21 = (void *)HKLogWorkouts;
            if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
            {
              v22 = v21;
              id v23 = objc_opt_class();
              id v24 = v23;
              uint64_t v25 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v23;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v25;
              id v26 = v25;
              _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "[WOSync] %{public}@ received non-WOPersistence codable %{public}@", buf, 0x16u);
            }
          }
        }
        id v17 = [v16 countByEnumeratingWithState:&v72 objects:v85 count:16];
      }
      while (v17);
    }

    BOOL v27 = [v60 count] == 0;
    _HKInitializeLogging();
    v28 = (void *)HKLogWorkouts;
    BOOL v29 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      if (v29)
      {
        id v50 = v28;
        uint64_t v51 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v51;
        id v52 = v51;
        _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "[WOSync] %{public}@ received zero decodable entities from sync, nothing to do.", buf, 0xCu);
      }
      int64_t v47 = 0;
    }
    else
    {
      if (v29)
      {
        id v30 = v28;
        uint64_t v31 = objc_opt_class();
        id v32 = v31;
        id v33 = [v60 count];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v33;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "[WOSync] %{public}@ decoded %{public}lu entities from sync.", buf, 0x16u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v84 = 0;
      id v34 = +[NSMutableSet set];
      id v35 = [v57 database];
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_5DD4;
      v65[3] = &unk_14768;
      id v66 = v60;
      id v36 = v57;
      id v67 = v36;
      id v71 = a1;
      id v68 = v56;
      id v70 = buf;
      id v37 = v34;
      id v69 = v37;
      unsigned int v38 = [a1 performWriteTransactionWithHealthDatabase:v35 error:v55 block:v65];

      [a1 _cleanupDeletedObjectsWithProfile:v36 type:2];
      [a1 _cleanupDeletedObjectsWithProfile:v36 type:3];
      if (*(uint64_t *)(*(void *)&buf[8] + 24) >= 1)
      {
        _HKInitializeLogging();
        uint64_t v39 = HKLogWorkouts;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = objc_opt_class();
          uint64_t v41 = *(void *)(*(void *)&buf[8] + 24);
          *(_DWORD *)long long v77 = 138543874;
          long long v78 = v40;
          __int16 v79 = 2048;
          uint64_t v80 = v41;
          __int16 v81 = 2114;
          id v82 = v37;
          id v42 = v40;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "[WOSync] %{public}@ syncedEntitesChangeCount: %ld, posting sync notifications: %{public}@", v77, 0x20u);
        }
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v43 = v37;
        id v44 = [v43 countByEnumeratingWithState:&v61 objects:v76 count:16];
        if (v44)
        {
          uint64_t v45 = *(void *)v62;
          do
          {
            for (j = 0; j != v44; j = (char *)j + 1)
            {
              if (*(void *)v62 != v45) {
                objc_enumerationMutation(v43);
              }
              notify_post((const char *)[*(id *)(*((void *)&v61 + 1) + 8 * (void)j) cStringUsingEncoding:4]);
            }
            id v44 = [v43 countByEnumeratingWithState:&v61 objects:v76 count:16];
          }
          while (v44);
        }
      }
      int64_t v47 = v38 ^ 1;
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    if (v12)
    {
      id v48 = v11;
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = objc_opt_class();
      id v49 = *(id *)&buf[4];
      _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "[WOSync] %{public}@ received zero sync objects, nothing to do.", buf, 0xCu);
    }
    int64_t v47 = 0;
  }

  return v47;
}

+ (BOOL)_shouldInsertOrReplaceLocal:(id)a3 withRemote:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 uuid];
  id v8 = [v6 uuid];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9
    && ([v5 objectModificationDate],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v6 objectModificationDate],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = (char *)[v10 compare:v11],
        v11,
        v10,
        (unint64_t)(v12 + 1) >= 2))
  {
    if (v12 == (unsigned char *)&dword_0 + 1)
    {
      id v15 = [v6 objectModificationDate];
      [v15 timeIntervalSinceReferenceDate];
      char v13 = v16 == 0.0;
    }
    else
    {
      _HKInitializeLogging();
      id v17 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = v17;
        id v19 = objc_opt_class();
        id v20 = v19;
        v21 = [v5 uuid];
        v22 = [v5 objectModificationDate];
        id v23 = [v6 objectModificationDate];
        int v24 = 138544130;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        BOOL v27 = v21;
        __int16 v28 = 2112;
        BOOL v29 = v22;
        __int16 v30 = 2112;
        uint64_t v31 = v23;
        _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "[WOSync] %{public}@ (%@) objectModificationDate comparison failed (local: %@, remote: %@), keep local object", (uint8_t *)&v24, 0x2Au);
      }
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

+ (id)_lookup:(id)a3 ofType:(unint64_t)a4 profile:(id)a5 transaction:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  BOOL v12 = +[WOWorkoutEntity classForPersistenceType:a4];
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_6948;
  id v36 = sub_6958;
  id v37 = 0;
  char v13 = [(objc_class *)v12 propertyForUUID];
  uint64_t v14 = +[HDSQLiteComparisonPredicate predicateWithProperty:v13 equalToValue:v9];

  id v15 = [(objc_class *)v12 allProperties];
  double v16 = [v10 database];
  unint64_t v30 = a4;
  id v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_6960;
  v25[3] = &unk_14790;
  BOOL v29 = v12;
  id v17 = v10;
  id v26 = v17;
  id v18 = v11;
  id v27 = v18;
  __int16 v28 = &v32;
  [(objc_class *)v12 enumerateProperties:v15 withPredicate:v14 healthDatabase:v16 error:&v31 enumerationHandler:v25];
  id v19 = v31;

  if (v19)
  {
    _HKInitializeLogging();
    id v20 = HKLogWorkouts;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v23 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v39 = v23;
      __int16 v40 = 2112;
      id v41 = v9;
      __int16 v42 = 2112;
      id v43 = v19;
      id v24 = v23;
      _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "[WOSync] %{public}@ unable to lookup local entity of uuid %@, error: %@", buf, 0x20u);
    }
  }
  id v21 = (id)v33[5];

  _Block_object_dispose(&v32, 8);

  return v21;
}

+ (void)_cleanupDeletedObjectsWithProfile:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[WOWorkoutEntity classForPersistenceType:a4];
  id v8 = [(objc_class *)v7 propertyForObjectState];
  id v9 = +[HDSQLiteComparisonPredicate predicateWithProperty:v8 equalToValue:&off_159C8];

  +[NSDate timeIntervalSinceReferenceDate];
  double v11 = v10;
  [a1 _cleanupTombstoneExpirationIntervalForPersistenceType:a4];
  double v13 = v11 - v12;
  uint64_t v14 = [(objc_class *)v7 propertyForObjectModificationDate];
  id v15 = +[NSNumber numberWithDouble:v13];
  double v16 = +[HDSQLiteComparisonPredicate predicateWithProperty:v14 lessThanValue:v15];

  id v17 = +[HDSQLitePredicate compoundPredicateWithPredicate:v16 otherPredicate:v9];
  id v18 = [v6 database];
  id v38 = a1;
  id v39 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_6D5C;
  v35[3] = &unk_147B8;
  id v19 = v17;
  id v36 = v19;
  id v20 = v6;
  id v37 = v20;
  unsigned int v21 = [a1 performWriteTransactionWithHealthDatabase:v18 error:&v39 block:v35];
  v22 = (__CFString *)v39;

  if (v22)
  {
    _HKInitializeLogging();
    id v23 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR))
    {
      log = v23;
      id v31 = objc_opt_class();
      id v33 = v31;
      uint64_t v32 = NSStringForWOPersistenceType();
      *(_DWORD *)buf = 138544130;
      id v41 = v31;
      __int16 v42 = 2114;
      uint64_t v43 = (uint64_t)v32;
      __int16 v44 = 2048;
      double v45 = v13;
      __int16 v46 = 2112;
      CFStringRef v47 = v22;
      _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[WOSync] %{public}@ unable to cleanup deleted '%{public}@' objects (tombstones) older than %.2f secs, error: %@", buf, 0x2Au);
    }
  }
  _HKInitializeLogging();
  id v24 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = v24;
    id v26 = objc_opt_class();
    id v27 = v26;
    uint64_t v28 = NSStringForWOPersistenceType();
    BOOL v29 = (void *)v28;
    CFStringRef v30 = @"NO";
    *(_DWORD *)buf = 138544130;
    id v41 = v26;
    __int16 v42 = 2114;
    if (v21) {
      CFStringRef v30 = @"YES";
    }
    uint64_t v43 = v28;
    __int16 v44 = 2048;
    double v45 = v13;
    __int16 v46 = 2112;
    CFStringRef v47 = v30;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "[WOSync] %{public}@ cleanup deleted '%{public}@' objects (tombstones) older than %.2f secs, success: %@", buf, 0x2Au);
  }
}

+ (id)_nonRaceConfigPredicate:(Class)a3
{
  if ([a1 isEqual:objc_opt_class()])
  {
    v4 = [(objc_class *)a3 propertyForConfigurationType];
    id v5 = +[HDSQLiteComparisonPredicate predicateWithProperty:v4 notEqualToValue:&off_159E0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  double v16 = +[NSMutableSet set];
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = -1;
  id v17 = [v14 database];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_702C;
  v24[3] = &unk_14808;
  id v29 = a1;
  id v18 = v13;
  int64_t v30 = var0;
  int64_t v31 = var1;
  id v25 = v18;
  uint64_t v28 = &v32;
  id v19 = v14;
  id v26 = v19;
  id v20 = v16;
  id v27 = v20;
  LODWORD(a1) = [a1 performReadTransactionWithHealthDatabase:v17 error:a7 block:v24];

  if (a1)
  {
    unsigned int v21 = [v20 allObjects];
    unsigned __int8 v22 = [v15 sendCodableChange:v21 resultAnchor:v33[3] sequence:0 done:1 error:a7];
  }
  else
  {
    unsigned __int8 v22 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v22;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)WOPersistence) initWithData:v3];

  return v4;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)tableName
{
  objc_opt_class();
  uint64_t v2 = sub_7308();
  sub_72EC(v2);
  return &stru_153A0;
}

+ (unint64_t)persistenceType
{
  objc_opt_class();
  uint64_t v2 = sub_7308();
  sub_72EC(v2);
  return 0;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  objc_opt_class();
  uint64_t v3 = sub_7308();
  sub_72EC(v3);
  return 0;
}

@end