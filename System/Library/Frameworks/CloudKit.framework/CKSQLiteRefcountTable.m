@interface CKSQLiteRefcountTable
+ (Class)entryClass;
+ (id)dbProperties;
- (CKSQLiteRefcountTable)initWithLogicalTableName:(id)a3 referentTable:(id)a4;
- (id)createTableSQL;
- (id)deleteUnreferenced;
- (id)finishInitializing;
- (unint64_t)refcountForObjectID:(id)a3;
@end

@implementation CKSQLiteRefcountTable

+ (id)dbProperties
{
  return &unk_1ED8469F8;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKSQLiteRefcountTable)initWithLogicalTableName:(id)a3 referentTable:(id)a4
{
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CKSQLiteRefcountTable;
  v12 = [(CKSQLiteTable *)&v24 initWithLogicalTableName:a3];
  if (v12)
  {
    if ((objc_msgSend_isIntegerPrimaryKeyTable(v8, v9, v10, v11) & 1) == 0)
    {
      v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)v12, @"CKSQLiteReferencedObjectTable.m", 70, @"Refcounted tables must have integer primary key");
    }
    objc_storeStrong((id *)&v12->_referentDBTable, a4);
    uint64_t v19 = objc_msgSend_primaryKeyProperty(v8, v16, v17, v18);
    referentPrimaryKey = v12->_referentPrimaryKey;
    v12->_referentPrimaryKey = (NSString *)v19;
  }
  return v12;
}

- (id)createTableSQL
{
  v33.receiver = self;
  v33.super_class = (Class)CKSQLiteRefcountTable;
  v3 = [(CKSQLiteTable *)&v33 createTableSQL];
  v7 = objc_msgSend_dbTableName(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_dbTableName(self->_referentDBTable, v8, v9, v10);
  objc_msgSend_appendFormat_(v3, v12, @" CREATE TRIGGER '%@_referent_insert' AFTER INSERT ON '%@' BEGIN ", v13, v7, v11);
  objc_msgSend_appendFormat_(v3, v14, @"INSERT INTO '%@' (objectID, refCount) VALUES (NEW.%@, 0); ",
    v15,
    v7,
    self->_referentPrimaryKey);
  objc_msgSend_appendFormat_(v3, v16, @"END;", v17);
  objc_msgSend_appendFormat_(v3, v18, @" CREATE TRIGGER '%@_referent_delete' AFTER DELETE ON '%@' BEGIN ", v19, v7, v11);
  objc_msgSend_appendFormat_(v3, v20, @"DELETE FROM '%@' WHERE objectID = OLD.%@; ",
    v21,
    v7,
    self->_referentPrimaryKey);
  objc_msgSend_appendFormat_(v3, v22, @"END;", v23);
  objc_msgSend_appendFormat_(v3, v24, @" CREATE TRIGGER '%@_unreferenced_delete' AFTER UPDATE OF refCount ON '%@' WHEN NEW.refCount=0 BEGIN ", v25, v7, v7);
  objc_msgSend_appendFormat_(v3, v26, @"DELETE FROM '%@' WHERE objectID = NEW.objectID; ", v27, v7);
  objc_msgSend_appendFormat_(v3, v28, @"DELETE FROM '%@' WHERE %@ = NEW.objectID; ",
    v29,
    v11,
    self->_referentPrimaryKey);
  objc_msgSend_appendFormat_(v3, v30, @"END;", v31);

  return v3;
}

- (id)deleteUnreferenced
{
  id v4 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, a2, 0, 0, &v4, &unk_1ED7EF118);
  id v2 = v4;

  return v2;
}

- (id)finishInitializing
{
  v17.receiver = self;
  v17.super_class = (Class)CKSQLiteRefcountTable;
  uint64_t v6 = [(CKSQLiteTable *)&v17 finishInitializing];
  if (!v6)
  {
    v7 = objc_msgSend_tableGroup(self, v3, v4, v5);
    int isFirstInstance = objc_msgSend_isFirstInstance(v7, v8, v9, v10);

    if (isFirstInstance)
    {
      uint64_t v6 = objc_msgSend_deleteUnreferenced(self, v12, v13, v14);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  referentDBTable = self->_referentDBTable;
  self->_referentDBTable = 0;

  return v6;
}

- (unint64_t)refcountForObjectID:(id)a3
{
  v3 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, a2, (uint64_t)a3, 0, off_1E5463160, 0);
  v7 = v3;
  if (v3)
  {
    id v8 = objc_msgSend_refCount(v3, v4, v5, v6);
    unint64_t v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  }
  else
  {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referentPrimaryKey, 0);

  objc_storeStrong((id *)&self->_referentDBTable, 0);
}

@end