@interface NSSQLAttributeTrigger
- (BOOL)isEqualToExtension:(id)a3;
- (BOOL)validate:(id *)a3;
- (BOOL)validatePredicate:(uint64_t *)a3 error:;
- (NSArray)bulkUpdateSQLStrings;
- (NSArray)dropSQLStrings;
- (NSArray)insertSQLStrings;
- (NSSQLAttributeTrigger)initWithObjectFromUserInfo:(id)a3 onAttributeNamed:(id)a4 onEntity:(id)a5;
- (void)dealloc;
@end

@implementation NSSQLAttributeTrigger

- (NSSQLAttributeTrigger)initWithObjectFromUserInfo:(id)a3 onAttributeNamed:(id)a4 onEntity:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NSSQLAttributeTrigger;
  v8 = [(NSSQLAttributeTrigger *)&v11 init];
  if (v8)
  {
    if (a5) {
      v9 = (void *)[*((id *)a5 + 5) objectForKey:a4];
    }
    else {
      v9 = 0;
    }
    v8->_attribute = (NSSQLAttribute *)v9;
    v8->_entity = (NSSQLEntity *)a5;
    v8->_predicateString = (NSString *)a3;
    v8->_mToManyDecrementWhenClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v8->_mToManyIncrementWhenClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v8->_mToManyInnerFetchWhereClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v8->_mOfClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v8->_mOldMatchingClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v8->_mNewMatchingClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v8->_mColumnChangedClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v8->_destinationAttributes = (NSArray *)(id)NSArray_EmptyArray;
    v8->_mBulkChangeStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_mSqlDropStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_insertSQLStrings = 0;
  }
  return v8;
}

- (BOOL)validate:(id *)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  v112 = 0;
  if (self)
  {
    v4 = self;
    v5 = (NSPredicate *)(id)[MEMORY[0x1E4F28F60] predicateWithFormat:self->_predicateString];
    v4->_predicate = v5;
    if (-[NSSQLAttributeTrigger validatePredicate:error:]((BOOL)v4, v5, (uint64_t *)&v112))
    {
      uint64_t v6 = [(NSSQLColumn *)v4->_attribute columnName];
      uint64_t v7 = [(NSSQLEntity *)v4->_entity tableName];
      uint64_t v111 = [(NSSQLEntity *)v4->_destinationEntity tableName];
      uint64_t v109 = [NSString stringWithFormat:@"ZT_%@_%@_%@", v7, v6, v111];
      entity = v4->_entity;
      if (entity) {
        primaryKey = entity->_primaryKey;
      }
      else {
        primaryKey = 0;
      }
      uint64_t v10 = [(NSSQLColumn *)primaryKey columnName];
      objc_super v11 = v4->_entity;
      if (v11) {
        entityKey = v11->_entityKey;
      }
      else {
        entityKey = 0;
      }
      uint64_t v108 = [(NSSQLColumn *)entityKey columnName];
      v110 = objc_opt_new();
      relationship = v4->_relationship;
      if (relationship && relationship->super._propertyType == 9)
      {
        uint64_t v14 = [(NSSQLRelationship *)v4->_relationship correlationTableName];
        uint64_t v15 = [(NSSQLProperty *)relationship columnName];
        v107 = -[NSSQLManyToMany inverseColumnName]((__CFString *)relationship);
        id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        v17 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_INSERT_INCREMENT", v109, v14];
        v18 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v17];
        [v16 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@ AFTER INSERT ON %@ FOR EACH ROW", v17, v14];
        [v16 appendString:@" BEGIN"];
        [v16 appendFormat:@" UPDATE %@ SET %@ = IFNULL(%@,0) + 1", v7, v6, v6];
        [v16 appendFormat:@" WHERE NEW.%@ IN (SELECT %@ FROM %@ WHERE %@)", v107, v10, v111, v4->_mToManyInnerFetchWhereClause];
        [v16 appendFormat:@" AND NEW.%@ = %@;", v15, v10];
        objc_msgSend(v16, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
          v7,
          v108,
          v10,
          v6,
          v6,
          v7,
          v10,
          v15);
        [v16 appendFormat:@" END"];
        [(NSMutableArray *)v4->_mSqlDropStrings addObject:v18];

        [v110 addObject:v16];
        id v19 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        v20 = (void *)[[NSString alloc] initWithFormat:@"%@_UPDATE_INCREMENT", v109];
        v21 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v20];
        [v19 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v20];
        [v19 appendFormat:@" AFTER UPDATE OF %@ ON %@ FOR EACH ROW", v4->_mOfClause, v111];
        [v19 appendFormat:@" WHEN %@", v4->_mToManyIncrementWhenClause];
        [v19 appendString:@" BEGIN"];
        [v19 appendFormat:@" UPDATE %@ SET %@ = IFNULL(%@,0) + 1", v7, v6, v6];
        objc_msgSend(v19, "appendFormat:", @" WHERE %@ IN (SELECT %@ FROM %@ WHERE %@ = NEW.%@ AND (%@));",
          v10,
          v15,
          v14,
          v107,
          v10,
          v4->_mNewMatchingClause);
        objc_msgSend(v19, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
          v7,
          v108,
          v10,
          v6,
          v6,
          v7,
          v10,
          v10);
        [v19 appendString:@" END"];
        [v110 addObject:v19];
        [(NSMutableArray *)v4->_mSqlDropStrings addObject:v21];

        id v22 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        v23 = (void *)[[NSString alloc] initWithFormat:@"%@_UPDATE_DECREMENT", v109];
        v24 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v23];
        [v22 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v23];
        [v22 appendFormat:@" AFTER UPDATE OF %@ ON %@ FOR EACH ROW", v4->_mOfClause, v111];
        [v22 appendFormat:@" WHEN %@", v4->_mToManyDecrementWhenClause];
        [v22 appendString:@" BEGIN"];
        [v22 appendFormat:@" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)", v7, v6, v6];
        objc_msgSend(v22, "appendFormat:", @" WHERE %@ IN (SELECT %@ FROM %@ WHERE %@ = NEW.%@ AND (%@));",
          v10,
          v15,
          v14,
          v107,
          v10,
          v4->_mOldMatchingClause);
        objc_msgSend(v22, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
          v7,
          v108,
          v10,
          v6,
          v6,
          v7,
          v10,
          v10);
        [v22 appendString:@" END"];
        [v110 addObject:v22];
        [(NSMutableArray *)v4->_mSqlDropStrings addObject:v24];

        id v25 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        v26 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_DELETE_DECREMENT", v109, v14];
        v27 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v26];
        [v25 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@ AFTER DELETE ON %@ FOR EACH ROW", v26, v14];
        [v25 appendFormat:@" BEGIN"];
        [v25 appendFormat:@" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)", v7, v6, v6];
        [v25 appendFormat:@" WHERE OLD.%@ IN (SELECT %@ FROM %@ WHERE %@)", v107, v10, v111, v4->_mToManyInnerFetchWhereClause];
        [v25 appendFormat:@" AND OLD.%@ = %@;", v15, v10];
        objc_msgSend(v25, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;",
          v7,
          v108,
          v10,
          v6,
          v6,
          v7,
          v10,
          v15);
        [v25 appendFormat:@" END"];
        [v110 addObject:v25];
        [(NSMutableArray *)v4->_mSqlDropStrings addObject:v27];

        id v28 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        v29 = (void *)[[NSString alloc] initWithFormat:@"%@_DELETE_DECREMENT", v109];
        v30 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v29];
        [v28 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@ AFTER DELETE ON %@ FOR EACH ROW WHEN %@", v29, v111, v4->_mOldMatchingClause];
        [v28 appendFormat:@" BEGIN"];
        [v28 appendFormat:@" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)", v7, v6, v6];
        objc_msgSend(v28, "appendFormat:", @" WHERE %@ IN (SELECT %@ FROM %@ WHERE %@ = OLD.%@ AND (%@));",
          v10,
          v15,
          v14,
          v107,
          v10,
          v4->_mOldMatchingClause);
        objc_msgSend(v28, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;",
          v7,
          v108,
          v10,
          v6,
          v6,
          v7,
          v10,
          v10);
        [v28 appendFormat:@" END"];
        [v110 addObject:v28];
        [(NSMutableArray *)v4->_mSqlDropStrings addObject:v30];

        v31 = (void *)[[NSString alloc] initWithFormat:@"COUNT_%@", v109];
        v32 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"CREATE TEMP TABLE %@ AS", v31];
        [v32 appendFormat:@" SELECT %@, COUNT(DISTINCT(%@.%@)) AS COUNT", v15, v111, v10];
        [v32 appendFormat:@" FROM %@, %@", v111, v14];
        [v32 appendFormat:@" WHERE %@ AND %@.%@ == %@.%@", v4->_mToManyInnerFetchWhereClause, v14, v107, v111, v10];
        [v32 appendFormat:@" GROUP BY %@;", v15];
        p_mBulkChangeStrings = (id *)&v4->_mBulkChangeStrings;
        [(NSMutableArray *)v4->_mBulkChangeStrings addObject:v32];

        v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" CREATE INDEX %@_INDEX ON %@(%@,COUNT);",
                        v31,
                        v31,
                        v15);
        [(NSMutableArray *)v4->_mBulkChangeStrings addObject:v34];

        uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" UPDATE %@ SET %@ = IFNULL((SELECT COUNT FROM %@ WHERE %@ = %@),0);",
                v7,
                v6,
                v31,
                v10,
                v15);
      }
      else
      {
        BOOL v37 = [(NSSQLProperty *)v4->_relationship isToMany];
        v38 = v4->_relationship;
        if (v37)
        {
          if (v38) {
            v38 = v38->_inverse;
          }
          uint64_t v39 = [(NSSQLProperty *)v38 columnName];
          id v40 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v41 = (void *)[[NSString alloc] initWithFormat:@"%@_INSERT_INCREMENT", v109];
          v42 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v41];
          [v40 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v41];
          [v40 appendFormat:@" AFTER INSERT ON %@ FOR EACH ROW WHEN %@", v111, v4->_mNewMatchingClause];
          [v40 appendFormat:@" BEGIN"];
          [v40 appendFormat:@" UPDATE %@ SET %@ = IFNULL(%@,0) + 1", v7, v6, v6];
          [v40 appendFormat:@" WHERE NEW.%@ = %@;", v39, v10];
          objc_msgSend(v40, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          [v40 appendFormat:@" END"];
          [v110 addObject:v40];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v42];

          id v43 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v44 = (void *)[[NSString alloc] initWithFormat:@"%@_UPDATE_INCREMENT", v109];
          v45 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v44];
          [v43 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v44];
          [v43 appendFormat:@" AFTER UPDATE OF %@ ON %@", v4->_mOfClause, v111];
          [v43 appendFormat:@" FOR EACH ROW WHEN (%@) AND (%@) AND (NEW.%@ == OLD.%@)", v4->_mNewMatchingClause, v4->_mColumnChangedClause, v39, v39];
          [v43 appendFormat:@" BEGIN"];
          [v43 appendFormat:@" UPDATE %@ SET %@ = IFNULL(%@,0) + 1", v7, v6, v6];
          [v43 appendFormat:@" WHERE NEW.%@ = %@;", v39, v10];
          objc_msgSend(v43, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          [v43 appendFormat:@" END"];
          [v110 addObject:v43];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v45];

          id v46 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v47 = (void *)[[NSString alloc] initWithFormat:@"%@_UPDATE_DECREMENT", v109];
          v48 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v47];
          [v46 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v47];
          [v46 appendFormat:@" AFTER UPDATE OF %@ ON %@", v4->_mOfClause, v111];
          [v46 appendFormat:@" FOR EACH ROW WHEN (%@) AND (%@) AND (OLD.%@ == NEW.%@)", v4->_mOldMatchingClause, v4->_mColumnChangedClause, v39, v39];
          [v46 appendFormat:@" BEGIN"];
          [v46 appendFormat:@" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)", v7, v6, v6];
          [v46 appendFormat:@" WHERE OLD.%@ = %@;", v39, v10];
          objc_msgSend(v46, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          [v46 appendFormat:@" END"];
          [v110 addObject:v46];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v48];

          id v49 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v50 = (void *)[[NSString alloc] initWithFormat:@"%@_DELETE_DECREMENT", v109];
          v51 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v50];
          [v49 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v50];
          [v49 appendFormat:@" AFTER DELETE ON %@ FOR EACH ROW WHEN %@", v111, v4->_mOldMatchingClause];
          [v49 appendFormat:@" BEGIN"];
          objc_msgSend(v49, "appendFormat:", @" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1) WHERE OLD.%@ = %@;",
            v7,
            v6,
            v6,
            v39,
            v10);
          objc_msgSend(v49, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          [v49 appendFormat:@" END"];
          [v110 addObject:v49];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v51];

          id v52 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v53 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_INSERT_INCREMENT", v109, v7];
          v54 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v53];
          [v52 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v53];
          [v52 appendFormat:@" AFTER INSERT ON %@ FOR EACH ROW", v7];
          [v52 appendFormat:@" BEGIN"];
          objc_msgSend(v52, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT COUNT(%@) FROM %@ WHERE (%@ = NEW.%@) AND (%@)) WHERE %@ = NEW.%@;",
            v7,
            v6,
            v10,
            v111,
            v39,
            v10,
            v4->_mToManyInnerFetchWhereClause,
            v10,
            v10);
          objc_msgSend(v52, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v10);
          [v52 appendFormat:@" END"];
          [v110 addObject:v52];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v54];

          id v55 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v56 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_UPDATE_INCREMENT", v109, v39];
          v57 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v56];
          [v55 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v56];
          [v55 appendFormat:@" AFTER UPDATE OF %@ ON %@ WHEN (%@) AND", v39, v111, v4->_mNewMatchingClause];
          [v55 appendFormat:@" ((NEW.%@ IS NOT NULL AND OLD.%@ IS NULL) OR (NEW.%@ != OLD.%@))", v39, v39, v39, v39];
          [v55 appendFormat:@" BEGIN"];
          objc_msgSend(v55, "appendFormat:", @" UPDATE %@ SET %@ = IFNULL(%@,0) + 1 WHERE %@ = NEW.%@;",
            v7,
            v6,
            v6,
            v10,
            v39);
          objc_msgSend(v55, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          [v55 appendFormat:@" END"];
          [v110 addObject:v55];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v57];

          id v58 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v59 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_UPDATE_DECREMENT", v109, v39];
          v60 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v59];
          [v58 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v59];
          [v58 appendFormat:@" AFTER UPDATE OF %@ ON %@ WHEN (%@) AND", v39, v111, v4->_mOldMatchingClause];
          [v58 appendFormat:@" ((OLD.%@ IS NOT NULL AND NEW.%@ IS NULL) OR (NEW.%@ != OLD.%@))", v39, v39, v39, v39];
          [v58 appendFormat:@" BEGIN"];
          objc_msgSend(v58, "appendFormat:", @" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1) WHERE %@ = OLD.%@;",
            v7,
            v6,
            v6,
            v10,
            v39);
          objc_msgSend(v58, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          [v58 appendFormat:@" END"];
          [v110 addObject:v58];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v60];

          v31 = (void *)[[NSString alloc] initWithFormat:@"COUNT_%@", v109];
          v61 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"CREATE TEMP TABLE %@ AS", v31];
          [v61 appendFormat:@" SELECT %@, COUNT(DISTINCT(%@.%@)) AS COUNT", v39, v111, v10];
          [v61 appendFormat:@" FROM %@", v111];
          [v61 appendFormat:@" WHERE %@", v4->_mToManyInnerFetchWhereClause];
          [v61 appendFormat:@" GROUP BY %@;", v39];
          p_mBulkChangeStrings = (id *)&v4->_mBulkChangeStrings;
          [(NSMutableArray *)v4->_mBulkChangeStrings addObject:v61];

          v62 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" CREATE INDEX %@_INDEX ON %@(%@,COUNT);",
                          v31,
                          v31,
                          v39);
          [(NSMutableArray *)v4->_mBulkChangeStrings addObject:v62];

          uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" UPDATE %@ SET %@ = IFNULL((SELECT COUNT FROM %@ WHERE %@ = %@), 0);",
                  v7,
                  v6,
                  v31,
                  v10,
                  v39);
        }
        else
        {
          if (!v38 || v38->super._propertyType != 7)
          {
LABEL_25:
            if ([v110 count])
            {
              uint64_t v97 = [v110 copy];

              if (v97)
              {
LABEL_32:
                v4->_insertSQLStrings = (NSArray *)v97;
                return 1;
              }
            }
            else
            {
            }
            uint64_t v98 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog(17, v98, v99, v100, v101, v102, v103, v104, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m");
            v105 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v114 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m";
              __int16 v115 = 1024;
              int v116 = 584;
              _os_log_fault_impl(&dword_18AB82000, v105, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            }
            uint64_t v97 = 0;
            goto LABEL_32;
          }
          uint64_t v71 = [(NSSQLProperty *)v38 columnName];
          id v72 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v73 = (void *)[[NSString alloc] initWithFormat:@"%@_INSERT_INCREMENT", v109];
          v74 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v73];
          [v72 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v73];
          [v72 appendFormat:@" AFTER INSERT ON %@ FOR EACH ROW WHEN %@", v111, v4->_mNewMatchingClause];
          [v72 appendFormat:@" BEGIN"];
          [v72 appendFormat:@" UPDATE %@ SET %@ = IFNULL(%@,0) + 1", v7, v6, v6];
          [v72 appendFormat:@" WHERE NEW.%@ = %@;", v10, v71];
          objc_msgSend(v72, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v71,
            v10);
          [v72 appendFormat:@" END"];
          [v110 addObject:v72];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v74];

          id v75 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v76 = (void *)[[NSString alloc] initWithFormat:@"%@_UPDATE_INCREMENT", v109];
          v77 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v76];
          [v75 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v76];
          [v75 appendFormat:@" AFTER UPDATE OF %@ ON %@", v4->_mOfClause, v111];
          [v75 appendFormat:@" FOR EACH ROW WHEN (%@) AND (%@)", v4->_mNewMatchingClause, v4->_mColumnChangedClause];
          [v75 appendFormat:@" BEGIN"];
          [v75 appendFormat:@" UPDATE %@ SET %@ = IFNULL(%@,0) + 1", v7, v6, v6];
          [v75 appendFormat:@" WHERE NEW.%@ = %@;", v10, v71];
          objc_msgSend(v75, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v71,
            v10);
          [v75 appendFormat:@" END"];
          [v110 addObject:v75];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v77];

          id v78 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v79 = (void *)[[NSString alloc] initWithFormat:@"%@_UPDATE_DECREMENT", v109];
          v80 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v79];
          [v78 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v79];
          [v78 appendFormat:@" AFTER UPDATE OF %@ ON %@", v4->_mOfClause, v111];
          [v78 appendFormat:@" FOR EACH ROW WHEN (%@) AND (%@)", v4->_mOldMatchingClause, v4->_mColumnChangedClause];
          [v78 appendFormat:@" BEGIN"];
          [v78 appendFormat:@" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)", v7, v6, v6];
          [v78 appendFormat:@" WHERE OLD.%@ = %@;", v10, v71];
          objc_msgSend(v78, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v71,
            v10);
          [v78 appendFormat:@" END"];
          [v110 addObject:v78];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v80];

          id v81 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v82 = (void *)[[NSString alloc] initWithFormat:@"%@_DELETE_DECREMENT", v109];
          v83 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v82];
          [v81 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v82];
          [v81 appendFormat:@" AFTER DELETE ON %@ FOR EACH ROW WHEN %@", v111, v4->_mOldMatchingClause];
          [v81 appendFormat:@" BEGIN"];
          objc_msgSend(v81, "appendFormat:", @" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1) WHERE OLD.%@ = %@;",
            v7,
            v6,
            v6,
            v10,
            v71);
          objc_msgSend(v81, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v71,
            v10);
          [v81 appendFormat:@" END"];
          [v110 addObject:v81];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v83];

          id v84 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v85 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_INSERT_INCREMENT", v109, v7];
          v86 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v85];
          [v84 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v85];
          [v84 appendFormat:@" AFTER INSERT ON %@ FOR EACH ROW", v7];
          [v84 appendFormat:@" BEGIN"];
          objc_msgSend(v84, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT COUNT(%@) FROM %@ WHERE (%@ = NEW.%@) AND (%@)) WHERE %@ = NEW.%@;",
            v7,
            v6,
            v10,
            v111,
            v10,
            v71,
            v4->_mToManyInnerFetchWhereClause,
            v10,
            v10);
          objc_msgSend(v84, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v10);
          [v84 appendFormat:@" END"];
          [v110 addObject:v84];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v86];

          id v87 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v88 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_UPDATE_TO_NULL", v109, v71];
          v89 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v88];
          [v87 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v88];
          [v87 appendFormat:@" AFTER UPDATE OF %@ ON %@ WHEN", v71, v7];
          [v87 appendFormat:@" (NEW.%@ IS NULL AND OLD.%@ IS NOT NULL)", v71, v71];
          [v87 appendFormat:@" BEGIN"];
          [v87 appendFormat:@" UPDATE %@ SET %@ = 0 WHERE %@ = NEW.%@;", v7, v6, v10, v10];
          objc_msgSend(v87, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v10);
          [v87 appendFormat:@" END"];
          [v110 addObject:v87];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v89];

          id v90 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v91 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_UPDATE_INCREMENT", v109, v71];
          v92 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v91];
          [v90 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v91];
          [v90 appendFormat:@" AFTER UPDATE OF %@ ON %@ WHEN", v71, v7];
          [v90 appendFormat:@" ((NEW.%@ IS NOT NULL AND OLD.%@ IS NULL) OR (NEW.%@ != OLD.%@))", v71, v71, v71, v71];
          [v90 appendFormat:@" BEGIN"];
          objc_msgSend(v90, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT COUNT(%@) FROM %@ WHERE %@ = NEW.%@ AND (%@)) WHERE %@ = NEW.%@;",
            v7,
            v6,
            v10,
            v111,
            v10,
            v71,
            v4->_mToManyInnerFetchWhereClause,
            v10,
            v10);
          objc_msgSend(v90, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v10);
          [v90 appendFormat:@" END"];
          [v110 addObject:v90];
          [(NSMutableArray *)v4->_mSqlDropStrings addObject:v92];

          v31 = (void *)[[NSString alloc] initWithFormat:@"COUNT_%@", v109];
          v93 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"CREATE TEMP TABLE %@ AS", v31];
          [v93 appendFormat:@" SELECT %@, COUNT(DISTINCT(%@)) AS COUNT", v10, v10];
          [v93 appendFormat:@" FROM %@", v111];
          [v93 appendFormat:@" WHERE %@", v4->_mToManyInnerFetchWhereClause];
          [v93 appendFormat:@" GROUP BY %@;", v10];
          p_mBulkChangeStrings = (id *)&v4->_mBulkChangeStrings;
          [(NSMutableArray *)v4->_mBulkChangeStrings addObject:v93];

          v94 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" CREATE INDEX %@_INDEX ON %@(%@,COUNT);",
                          v31,
                          v31,
                          v10);
          [(NSMutableArray *)v4->_mBulkChangeStrings addObject:v94];

          uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" UPDATE %@ SET %@ = IFNULL((SELECT COUNT FROM %@ WHERE %@ = %@), 0);",
                  v7,
                  v6,
                  v31,
                  v10,
                  v71);
        }
      }
      v95 = (void *)v35;
      [*p_mBulkChangeStrings addObject:v35];

      v96 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@" DROP TABLE %@;", v31];
      [*p_mBulkChangeStrings addObject:v96];

      goto LABEL_25;
    }
    self = v112;
  }
  if (!self)
  {
    uint64_t v63 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v63, v64, v65, v66, v67, v68, v69, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m");
    v70 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v114 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m";
      __int16 v115 = 1024;
      int v116 = 145;
      _os_log_fault_impl(&dword_18AB82000, v70, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  if (!a3) {
    return 0;
  }
  BOOL v36 = 0;
  *a3 = self;
  return v36;
}

- (BOOL)validatePredicate:(uint64_t *)a3 error:
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v83 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (objc_msgSend((id)objc_msgSend(a2, "leftExpression"), "expressionType") != 3)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F281F8];
        uint64_t v20 = *MEMORY[0x1E4F28588];
        v93[0] = @"offendingPredicate";
        v93[1] = v20;
        v94[0] = a2;
        v94[1] = @"Invalid trigger predicate, left expression must evaluate to an instance of NSKeyPathExpressionType.";
        uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
        objc_super v11 = v94;
        v12 = v93;
        goto LABEL_38;
      }
      uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "leftExpression"), "keyPath"), "componentsSeparatedByString:", @".");
      if ([v6 count] != 2)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F281F8];
        uint64_t v35 = *MEMORY[0x1E4F28588];
        v95[0] = @"offendingPredicate";
        v95[1] = v35;
        v96[0] = a2;
        v96[1] = @"Invalid trigger predicate, left expression must be a key-path with only two components.";
        uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
        objc_super v11 = v96;
        v12 = v95;
        goto LABEL_38;
      }
      if (objc_msgSend((id)objc_msgSend(a2, "rightExpression"), "expressionType"))
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F281F8];
        uint64_t v9 = *MEMORY[0x1E4F28588];
        v97[0] = @"offendingPredicate";
        v97[1] = v9;
        v98[0] = a2;
        v98[1] = @"Invalid trigger predicate, right expression must evaluate to an instance of NSConstantValueExpressionType.";
        uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
        objc_super v11 = v98;
        v12 = v97;
LABEL_38:
        uint64_t v36 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:2];
        BOOL v37 = v7;
        uint64_t v38 = v8;
        goto LABEL_39;
      }
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rightExpression"), "constantValue"), "isNSNumber"))
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F281F8];
        uint64_t v58 = *MEMORY[0x1E4F28588];
        v99[0] = @"offendingPredicate";
        v99[1] = v58;
        v100[0] = a2;
        v100[1] = @"Invalid trigger predicate, right expression must evaluate to a constant integer value.";
        uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
        objc_super v11 = v100;
        v12 = v99;
        goto LABEL_38;
      }
      uint64_t v48 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rightExpression"), "constantValue"), "integerValue");
      if ((unint64_t)[a2 predicateOperatorType] > 5)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F281F8];
        uint64_t v59 = *MEMORY[0x1E4F28588];
        v101[0] = @"offendingPredicate";
        v101[1] = v59;
        v102[0] = a2;
        v102[1] = @"Invalid trigger predicate, predicate operator must be one of:\nNSLessThanPredicateOperatorType,\nNSLessThanOrEqualToPredicateOperatorType,\nNSGreaterThanPredicateOperatorType,\nNSGreaterThanOrEqualToPredicateOperatorType,\nNSEqualToPredicateOperatorType,\nNSNotEqualToPredicateOperatorType";
        uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
        objc_super v11 = v102;
        v12 = v101;
        goto LABEL_38;
      }
      uint64_t v49 = *(void *)(v5 + 24);
      uint64_t v50 = [v6 objectAtIndexedSubscript:0];
      if (v49) {
        v51 = (void *)[*(id *)(v49 + 40) objectForKey:v50];
      }
      else {
        v51 = 0;
      }
      uint64_t v52 = [v51 destinationEntity];
      uint64_t v53 = [v6 objectAtIndexedSubscript:1];
      if (v52) {
        v54 = (void *)[*(id *)(v52 + 40) objectForKey:v53];
      }
      else {
        v54 = 0;
      }
      uint64_t v55 = objc_msgSend((id)objc_msgSend(a2, "predicateOperator"), "symbol");
      unint64_t v56 = objc_msgSend((id)objc_msgSend(a2, "predicateOperator"), "operatorType");
      if (v56 > 5) {
        v57 = 0;
      }
      else {
        v57 = (void *)[objc_alloc(MEMORY[0x1E4F28F70]) initWithOperatorType:qword_18AE54258[v56]];
      }
      id v60 = (id)[v57 symbol];

      if (!v51)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F281F8];
        uint64_t v72 = *MEMORY[0x1E4F28588];
        v103[0] = @"offendingPredicate";
        v103[1] = v72;
        v104[0] = a2;
        v104[1] = @"Invalid trigger predicate, failed to find the relationship identified by the keyPath.";
        uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
        objc_super v11 = v104;
        v12 = v103;
        goto LABEL_38;
      }
      v61 = *(void **)(v5 + 40);
      if (!v61) {
        goto LABEL_68;
      }
      if (![v61 isEqual:v51])
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F281F8];
        uint64_t v73 = *MEMORY[0x1E4F28588];
        v105[0] = @"offendingPredicate";
        v105[1] = v73;
        v106[0] = a2;
        v106[1] = @"Invalid trigger predicate, this predicate appears to reference a different relationship than other predicates in this trigger.";
        uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
        objc_super v11 = v106;
        v12 = v105;
        goto LABEL_38;
      }
      if (!*(void *)(v5 + 40))
      {
LABEL_68:
        v62 = v51;
        *(void *)(v5 + 40) = v62;
        *(void *)(v5 + 48) = (id)[v62 destinationEntity];
      }
      if (!v54)
      {
        v74 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v75 = *MEMORY[0x1E4F281F8];
        *(void *)buf = a2;
        v107[0] = @"offendingPredicate";
        v107[1] = @"offendingAttribute";
        uint64_t v76 = [*(id *)(v5 + 32) name];
        v107[2] = *MEMORY[0x1E4F28588];
        *(void *)&buf[8] = v76;
        *(void *)&buf[16] = @"Invalid trigger predicate, unable to find the attribute specified by this predicate.";
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v107 count:3];
        BOOL v37 = v74;
        uint64_t v38 = v75;
LABEL_39:
        uint64_t v39 = [v37 errorWithDomain:v38 code:134060 userInfo:v36];
        uint64_t v26 = v39;
        if (v39)
        {
          uint64_t v83 = v39;
        }
        else
        {
          uint64_t v40 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v40, v41, v42, v43, v44, v45, v46, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m");
          v47 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v89 = 136315394;
            id v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m";
            __int16 v91 = 1024;
            int v92 = 837;
            _os_log_fault_impl(&dword_18AB82000, v47, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v89, 0x12u);
          }
        }
        if (v26) {
          goto LABEL_44;
        }
        goto LABEL_35;
      }
      uint64_t v63 = *(void *)(v5 + 32);
      if (v63) {
        *(_WORD *)(v63 + 32) |= 8u;
      }
      if (([*(id *)(v5 + 56) containsObject:v54] & 1) == 0)
      {
        uint64_t v64 = (void *)[*(id *)(v5 + 56) mutableCopy];
        [v64 addObject:v54];

        *(void *)(v5 + 56) = [v64 copy];
        uint64_t v65 = (void *)v51[7];
        if (v65) {
          -[NSSQLAttribute addKeyForTriggerOnRelationship:](v54, v65);
        }
        uint64_t v66 = [*(id *)(v5 + 80) length];
        uint64_t v67 = *(void **)(v5 + 80);
        uint64_t v68 = [v54 columnName];
        uint64_t v69 = [v54 columnName];
        if (v66) {
          v70 = @" OR (NEW.%@ %@ %ld AND OLD.%@ %@ %ld)";
        }
        else {
          v70 = @"(NEW.%@ %@ %ld AND OLD.%@ %@ %ld)";
        }
        uint64_t v71 = @" OR (NEW.%@ %@ %ld AND OLD.%@ %@ %ld)";
        objc_msgSend(v67, "appendFormat:", v70, v68, v55, v48, v69, v60, v48);
        if (![*(id *)(v5 + 72) length]) {
          uint64_t v71 = @"(NEW.%@ %@ %ld AND OLD.%@ %@ %ld)";
        }
        objc_msgSend(*(id *)(v5 + 72), "appendFormat:", v71, objc_msgSend(v54, "columnName"), v60, v48, objc_msgSend(v54, "columnName"), v55, v48);
        if ([*(id *)(v5 + 88) length]) {
          [*(id *)(v5 + 88) appendString:@", "];
        }
        objc_msgSend(*(id *)(v5 + 88), "appendString:", objc_msgSend(v54, "columnName"));
        if ([*(id *)(v5 + 112) length]) {
          [*(id *)(v5 + 112) appendString:@" OR "];
        }
        [*(id *)(v5 + 112) appendFormat:@"NEW.%@ != OLD.%@", objc_msgSend(v54, "columnName"), objc_msgSend(v54, "columnName")];
      }
      [*(id *)(v5 + 64) appendFormat:@"%@ %@ %ld", objc_msgSend(v54, "columnName"), v55, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rightExpression"), "constantValue"), "integerValue")];
      [*(id *)(v5 + 96) appendFormat:@"OLD.%@ %@ %ld", objc_msgSend(v54, "columnName"), v55, v48];
      [*(id *)(v5 + 104) appendFormat:@"NEW.%@ %@ %ld", objc_msgSend(v54, "columnName"), v55, v48];
      return 1;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([a2 compoundPredicateType] == 1 || objc_msgSend(a2, "compoundPredicateType") == 2)
      {
        v77 = a3;
        uint64_t v78 = [*(id *)(v5 + 64) length];
        if (v78)
        {
          objc_msgSend(*(id *)(v5 + 64), "appendString:", @"(");
          objc_msgSend(*(id *)(v5 + 96), "appendString:", @"(");
          objc_msgSend(*(id *)(v5 + 104), "appendString:", @"(");
        }
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        v13 = (void *)[a2 subpredicates];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v79 objects:v88 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v80;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v80 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v79 + 1) + 8 * i);
              if ([*(id *)(v5 + 64) length]
                && objc_msgSend(*(id *)(v5 + 64), "characterAtIndex:", objc_msgSend(*(id *)(v5 + 64), "length") - 1) != 40)
              {
                if ([a2 compoundPredicateType] == 1) {
                  id v19 = @"AND";
                }
                else {
                  id v19 = @"OR";
                }
                [*(id *)(v5 + 64) appendFormat:@" %@ ", v19];
                [*(id *)(v5 + 96) appendFormat:@" %@ ", v19];
                [*(id *)(v5 + 104) appendFormat:@" %@ ", v19];
              }
              if (!-[NSSQLAttributeTrigger validatePredicate:error:](v5, v18, &v83))
              {
                a3 = v77;
                if (v78)
                {
                  [*(id *)(v5 + 64) appendString:@""]);
                  [*(id *)(v5 + 96) appendString:@""]);
                  [*(id *)(v5 + 104) appendString:@""]);
                }
                goto LABEL_34;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v79 objects:v88 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
        if (v78)
        {
          [*(id *)(v5 + 64) appendString:@""]);
          [*(id *)(v5 + 96) appendString:@""]);
          [*(id *)(v5 + 104) appendString:@""]);
        }
        return 1;
      }
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F281F8];
      v86[0] = @"offendingPredicate";
      if (!a2) {
        a2 = (void *)[MEMORY[0x1E4F1CA98] null];
      }
      v86[1] = *MEMORY[0x1E4F28588];
      v87[0] = a2;
      v87[1] = @"Invalid trigger predicate, compound predicates must be AND or OR predicates.";
      v23 = (void *)MEMORY[0x1E4F1C9E8];
      v24 = v87;
      id v25 = v86;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F281F8];
      v84[0] = @"offendingPredicate";
      if (!a2) {
        a2 = (void *)[MEMORY[0x1E4F1CA98] null];
      }
      v84[1] = *MEMORY[0x1E4F28588];
      v85[0] = a2;
      v85[1] = @"Invalid trigger predicate, predicate must evaluate to an instance of NSComparisonPredicate or NSCompoundPredicate.";
      v23 = (void *)MEMORY[0x1E4F1C9E8];
      v24 = v85;
      id v25 = v84;
    }
    uint64_t v83 = objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 134060, objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 2));
LABEL_34:
    uint64_t v26 = v83;
    if (v83)
    {
LABEL_44:
      if (a3)
      {
        result = 0;
        *a3 = v26;
        return result;
      }
      return 0;
    }
LABEL_35:
    uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m");
    v34 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 676;
    _os_log_fault_impl(&dword_18AB82000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    return 0;
  }
  return result;
}

- (void)dealloc
{
  self->_attribute = 0;
  self->_entity = 0;

  self->_relationship = 0;
  self->_destinationEntity = 0;

  self->_destinationAttributes = 0;
  self->_predicate = 0;

  self->_predicateString = 0;
  self->_mToManyInnerFetchWhereClause = 0;

  self->_mToManyIncrementWhenClause = 0;
  self->_mToManyDecrementWhenClause = 0;

  self->_mOfClause = 0;
  self->_mOldMatchingClause = 0;

  self->_mNewMatchingClause = 0;
  self->_mColumnChangedClause = 0;

  self->_mBulkChangeStrings = 0;
  self->_mSqlDropStrings = 0;

  self->_insertSQLStrings = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLAttributeTrigger;
  [(NSSQLAttributeTrigger *)&v3 dealloc];
}

- (BOOL)isEqualToExtension:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NSSQLAttributeTrigger;
  if (-[NSSQLAttributeTrigger isEqual:](&v11, sel_isEqual_)) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3)
    {
      if ([(NSString *)self->_predicateString isEqualToString:objc_getProperty(a3, v6, 16, 1)]
        && [(NSSQLProperty *)self->_attribute isEqual:objc_getProperty(a3, v7, 32, 1)])
      {
        entity = self->_entity;
        id Property = objc_getProperty(a3, v8, 24, 1);
        return [(NSStoreMapping *)entity isEqual:Property];
      }
    }
    else if ([(NSString *)self->_predicateString isEqualToString:0] {
           && [(NSSQLProperty *)self->_attribute isEqual:0])
    }
    {
      id Property = 0;
      entity = self->_entity;
      return [(NSStoreMapping *)entity isEqual:Property];
    }
  }
  return 0;
}

- (NSArray)bulkUpdateSQLStrings
{
  v2 = (void *)[(NSMutableArray *)self->_mBulkChangeStrings copy];

  return (NSArray *)v2;
}

- (NSArray)dropSQLStrings
{
  v2 = (void *)[(NSMutableArray *)self->_mSqlDropStrings copy];

  return (NSArray *)v2;
}

- (NSArray)insertSQLStrings
{
  return self->_insertSQLStrings;
}

@end