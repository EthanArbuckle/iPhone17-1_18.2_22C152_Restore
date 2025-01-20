@interface NSSQLBatchOperationRequestContext
- (uint64_t)createDropTemporaryTablesForBatchOperationTriggers;
- (uint64_t)createObjectIDCaptureStatementsForDrop:(uint64_t)a1;
- (uint64_t)createTemporaryTablesForBatchOperationTriggers;
- (void)createTriggerForUpdateOnEntity:(void *)a3 onAttributes:(char)a4 forDrop:;
- (void)dealloc;
@end

@implementation NSSQLBatchOperationRequestContext

- (void)dealloc
{
  self->_tempTableName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBatchOperationRequestContext;
  [(NSSQLStoreRequestContext *)&v3 dealloc];
}

- (uint64_t)createObjectIDCaptureStatementsForDrop:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v4 = (void *)[(id)a1 persistentStoreRequest];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((a2 & 1) == 0) {
        objc_setProperty_nonatomic((id)a1, v10, @"TEMP_CDBATCHUPDATEOBJECTIDS", 88);
      }
      v11 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[v4 entity]);
      uint64_t v12 = [v11 model];
      if (!v12 || !*(_DWORD *)(v12 + 60) || [*(id *)(a1 + 32) _allowAncillaryEntities])
      {
        v13 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
        if (a2) {
          uint64_t v14 = -[NSSQLBatchOperationRequestContext createDropTemporaryTablesForBatchOperationTriggers]((void *)a1);
        }
        else {
          uint64_t v14 = -[NSSQLBatchOperationRequestContext createTemporaryTablesForBatchOperationTriggers](a1);
        }
        [v13 addObjectsFromArray:v14];
        objc_msgSend(v13, "addObjectsFromArray:", -[NSSQLBatchOperationRequestContext createTriggerForUpdateOnEntity:onAttributes:forDrop:](a1, v11, objc_msgSend((id)objc_msgSend(v4, "propertiesToUpdate"), "allKeys"), a2));
        return (uint64_t)v13;
      }
    }
    else
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Unexpected batch operation: %@"];
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v4);
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v4;
        _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Unexpected batch operation: %@", buf, 0xCu);
      }
    }
    return MEMORY[0x1E4F1CBF0];
  }
  if ((a2 & 1) == 0) {
    objc_setProperty_nonatomic((id)a1, v5, @"TEMP_CDBATCHINSERTOBJECTIDS", 88);
  }
  v6 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[v4 entity]);
  uint64_t v7 = [v6 model];
  if (v7 && *(_DWORD *)(v7 + 60) && ![*(id *)(a1 + 32) _allowAncillaryEntities]) {
    return MEMORY[0x1E4F1CBF0];
  }
  if (!v6) {
    return 0;
  }
  v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  if (a2) {
    uint64_t v9 = -[NSSQLBatchOperationRequestContext createDropTemporaryTablesForBatchOperationTriggers]((void *)a1);
  }
  else {
    uint64_t v9 = -[NSSQLBatchOperationRequestContext createTemporaryTablesForBatchOperationTriggers](a1);
  }
  [v8 addObjectsFromArray:v9];
  v23 = (void *)[[NSString alloc] initWithFormat:@"ZQ_%@_%@_%@", @"INSERT", *(void *)(a1 + 88), objc_msgSend(v6, "name")];
  if (a2)
  {
    v24 = [NSSQLiteStatement alloc];
    v25 = -[NSSQLiteStatement initWithEntity:sqlString:](v24, "initWithEntity:sqlString:", v6, [NSString stringWithFormat:@"DROP TRIGGER IF EXISTS %@", v23]);
  }
  else
  {
    v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"INSERT INTO %@ (ENTITYID, PRIMEKEY, TYPE) SELECT %@, %@, %ld;",
                    *(void *)(a1 + 88),
                    @"NEW.Z_ENT",
                    @"NEW.Z_PK",
                    0);
    v27 = [NSSQLiteStatement alloc];
    v25 = -[NSSQLiteStatement initWithEntity:sqlString:](v27, "initWithEntity:sqlString:", v6, [NSString stringWithFormat:@"CREATE TEMPORARY TRIGGER IF NOT EXISTS %@ AFTER %@ ON %@ FOR EACH ROW BEGIN %@ END", v23, @"INSERT", objc_msgSend(v6, "tableName"), v26]);
  }
  *(void *)buf = v25;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];

  [v8 addObjectsFromArray:v28];
  objc_msgSend(v8, "addObjectsFromArray:", -[NSSQLBatchOperationRequestContext createTriggerForUpdateOnEntity:onAttributes:forDrop:](a1, v6, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "entityDescription"), "attributesByName"), "allValues"), a2));
  v29 = (void *)MEMORY[0x1E4F1C978];

  return [v29 arrayWithArray:v8];
}

- (uint64_t)createTemporaryTablesForBatchOperationTriggers
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [NSSQLiteStatement alloc];
  objc_super v3 = -[NSSQLiteStatement initWithEntity:sqlString:](v2, "initWithEntity:sqlString:", 0, [NSString stringWithFormat:@"CREATE TEMP TABLE IF NOT EXISTS %@ (ENTITYID INTEGER, PRIMEKEY INTEGER, TYPE INTEGER, ATTRIBUTENAME VARCHAR)", *(void *)(a1 + 88)]);
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (uint64_t)createDropTemporaryTablesForBatchOperationTriggers
{
  v1 = a1;
  v3[1] = *MEMORY[0x1E4F143B8];
  if (a1) {
    a1 = (void *)a1[1];
  }
  v3[0] = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]((NSSQLiteStatement *)[a1 adapter], v1[11]);
  return [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (void)createTriggerForUpdateOnEntity:(void *)a3 onAttributes:(char)a4 forDrop:
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v51 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count") + 1);
  v8 = (void *)[[NSString alloc] initWithFormat:@"ZQ_UPDATE_%@_%@", *(void *)(a1 + 88), objc_msgSend(a2, "name")];
  char v50 = a4;
  uint64_t v49 = a1;
  if (a4)
  {
    uint64_t v9 = [NSSQLiteStatement alloc];
    uint64_t v48 = (uint64_t)v8;
    v10 = (id *)a2;
    v11 = -[NSSQLiteStatement initWithEntity:sqlString:](v9, "initWithEntity:sqlString:", a2, [NSString stringWithFormat:@"DROP TRIGGER IF EXISTS %@"]);
  }
  else
  {
    uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"INSERT INTO %@ (ENTITYID, PRIMEKEY, TYPE) SELECT OLD.Z_ENT, OLD.Z_PK, %ld;",
                    *(void *)(a1 + 88),
                    1);
    v13 = [NSSQLiteStatement alloc];
    uint64_t v14 = NSString;
    [a2 tableName];
    uint64_t v48 = (uint64_t)v8;
    uint64_t v15 = [v14 stringWithFormat:@"CREATE TEMPORARY TRIGGER IF NOT EXISTS %@ AFTER UPDATE ON %@ FOR EACH ROW BEGIN %@ END"];
    v10 = (id *)a2;
    v11 = [(NSSQLiteStatement *)v13 initWithEntity:a2 sqlString:v15];
  }
  [v51 addObject:v11];

  uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v17 = [a3 countByEnumeratingWithState:&v59 objects:v64 count:16];
  uint64_t v18 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v60 != v20) {
          objc_enumerationMutation(a3);
        }
        v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v16, "addObjectsFromArray:", objc_msgSend(v22, "_flattenElements:", objc_msgSend(v22, "elements")));
        }
        else {
          [v16 addObject:v22];
        }
      }
      uint64_t v19 = [a3 countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v19);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v23 = [v16 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    v25 = v10;
    uint64_t v26 = *(void *)v56;
    id obj = v16;
    do
    {
      uint64_t v27 = 0;
      uint64_t v52 = v24;
      do
      {
        if (*(void *)v56 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void **)(*((void *)&v55 + 1) + 8 * v27);
        if (([v28 isTransient] & 1) == 0)
        {
          uint64_t v29 = [v28 _qualifiedName];
          if (v25) {
            v30 = (void *)[v25[5] objectForKey:v29];
          }
          else {
            v30 = 0;
          }
          if ([v30 columnName])
          {
            v31 = v25;
            uint64_t v32 = (void *)[[NSString alloc] initWithFormat:@"ZQ_UPDATE_%@_%@_%@", *(void *)(v49 + v18[1020]), objc_msgSend(v25, "name"), objc_msgSend(v28, "name")];
            if (v50)
            {
              v33 = [NSSQLiteStatement alloc];
              uint64_t v48 = (uint64_t)v32;
              v34 = -[NSSQLiteStatement initWithEntity:sqlString:](v33, "initWithEntity:sqlString:", v31, [NSString stringWithFormat:@"DROP TRIGGER IF EXISTS %@"]);
            }
            else
            {
              uint64_t v18 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
              v43 = objc_msgSend([NSString alloc], "initWithFormat:", @"INSERT INTO %@ (ENTITYID, PRIMEKEY, TYPE, ATTRIBUTENAME) SELECT OLD.Z_ENT, OLD.Z_PK, %ld, '%@';",
                              *(void *)(v49 + 88),
                              1,
                              [v28 name]);
              v44 = [NSSQLiteStatement alloc];
              v45 = NSString;
              [v31 tableName];
              uint64_t v48 = (uint64_t)v32;
              v34 = -[NSSQLiteStatement initWithEntity:sqlString:](v44, "initWithEntity:sqlString:", v31, [v45 stringWithFormat:@"CREATE TEMPORARY TRIGGER IF NOT EXISTS %@ AFTER UPDATE ON %@ FOR EACH ROW WHEN OLD.%@ IS NOT NEW.%@ BEGIN %@ END"]);
            }
            v25 = v31;
            uint64_t v24 = v52;
            [v51 addObject:v34];
          }
          else
          {
            uint64_t v35 = [NSString stringWithUTF8String:"Expected an attribute for the entity"];
            _NSCoreDataLog(17, v35, v36, v37, v38, v39, v40, v41, v48);
            v42 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_18AB82000, v42, OS_LOG_TYPE_FAULT, "CoreData: Expected an attribute for the entity", buf, 2u);
            }
          }
        }
        ++v27;
      }
      while (v24 != v27);
      uint64_t v16 = obj;
      uint64_t v46 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
      uint64_t v24 = v46;
    }
    while (v46);
  }

  return v51;
}

@end