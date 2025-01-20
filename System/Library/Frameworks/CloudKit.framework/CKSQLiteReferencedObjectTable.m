@interface CKSQLiteReferencedObjectTable
- (id)databaseReferenceValueForEntry:(id)a3 error:(id *)a4;
- (id)didCreateDatabaseTable;
- (id)entryForDatabaseReferenceValue:(id)a3 error:(id *)a4;
- (id)extraGroupTables:(id)a3;
- (id)lookupRefcountTable;
- (id)refcountTableName;
- (id)refcountTriggerSQLForProperty:(id)a3 inTable:(id)a4;
- (id)wakeFromDatabase;
- (unint64_t)refcountForEntry:(id)a3;
@end

@implementation CKSQLiteReferencedObjectTable

- (id)refcountTableName
{
  v4 = objc_msgSend_logicalTableName(self, a2, v2, v3);
  v7 = objc_msgSend_stringByAppendingString_(v4, v5, @"_refcount", v6);

  return v7;
}

- (id)lookupRefcountTable
{
  refcountTable = self->_refcountTable;
  if (!refcountTable)
  {
    uint64_t v6 = objc_msgSend_refcountTableName(self, a2, v2, v3);
    v10 = objc_msgSend_tableGroup(self, v7, v8, v9);
    objc_msgSend_tableWithName_(v10, v11, (uint64_t)v6, v12);
    v13 = (CKSQLiteRefcountTable *)objc_claimAutoreleasedReturnValue();
    v14 = self->_refcountTable;
    self->_refcountTable = v13;

    refcountTable = self->_refcountTable;
  }

  return refcountTable;
}

- (id)refcountTriggerSQLForProperty:(id)a3 inTable:(id)a4
{
  id v6 = a3;
  v10 = objc_msgSend_dbTableName(a4, v7, v8, v9);
  v14 = objc_msgSend_lookupRefcountTable(self, v11, v12, v13);
  v18 = objc_msgSend_dbTableName(v14, v15, v16, v17);

  id v19 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v22 = objc_msgSend_stringWithFormat_(NSString, v20, @"%@_%@", v21, v10, v6);
  v26 = objc_msgSend_primaryKeyProperty(self, v23, v24, v25);
  objc_msgSend_appendFormat_(v19, v27, @" CREATE TRIGGER '%@_insert_retain' AFTER INSERT ON '%@' WHEN NEW.%@ IS NOT NULL BEGIN ", v28, v22, v10, v6);
  objc_msgSend_appendFormat_(v19, v29, @"UPDATE '%@' SET refCount = refCount + 1 WHERE objectID = NEW.%@; ",
    v30,
    v18,
    v26);
  objc_msgSend_appendString_(v19, v31, @"END;", v32);
  objc_msgSend_appendFormat_(v19, v33, @" CREATE TRIGGER '%@_delete_release' AFTER DELETE ON '%@' WHEN NEW.%@ IS NOT NULL BEGIN ", v34, v22, v10, v6);
  objc_msgSend_appendFormat_(v19, v35, @"UPDATE '%@' SET refCount = refCount - 1 WHERE objectID = OLD.%@;",
    v36,
    v18,
    v6);
  objc_msgSend_appendString_(v19, v37, @"END;", v38);
  objc_msgSend_appendFormat_(v19, v39, @" CREATE TRIGGER '%@_update_retain_new' BEFORE UPDATE ON '%@' WHEN NEW.%@ IS NOT NULL BEGIN ", v40, v22, v10, v6);
  objc_msgSend_appendFormat_(v19, v41, @"UPDATE '%@' SET refCount = refCount + 1 WHERE objectID = NEW.%@; ",
    v42,
    v18,
    v6);
  objc_msgSend_appendString_(v19, v43, @"END;", v44);
  objc_msgSend_appendFormat_(v19, v45, @" CREATE TRIGGER '%@_update_release_old' AFTER UPDATE ON '%@' WHEN OLD.%@ IS NOT NULL BEGIN ", v46, v22, v10, v6);
  objc_msgSend_appendFormat_(v19, v47, @"UPDATE '%@' SET refCount = refCount - 1 WHERE objectID = OLD.%@; ",
    v48,
    v18,
    v6);

  objc_msgSend_appendString_(v19, v49, @"END;", v50);

  return v19;
}

- (id)extraGroupTables:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKSQLiteReferencedObjectTable;
  v4 = [(CKSQLiteTable *)&v17 extraGroupTables:a3];
  uint64_t v8 = objc_msgSend_refcountTableName(self, v5, v6, v7);
  v11 = objc_msgSend_objectForKey_(v4, v9, (uint64_t)v8, v10);

  if (!v11)
  {
    uint64_t v12 = [CKSQLiteRefcountTable alloc];
    v14 = objc_msgSend_initWithLogicalTableName_referentTable_(v12, v13, (uint64_t)v8, (uint64_t)self);
    objc_msgSend_setObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)v8);
  }

  return v4;
}

- (id)didCreateDatabaseTable
{
  v9.receiver = self;
  v9.super_class = (Class)CKSQLiteReferencedObjectTable;
  uint64_t v6 = [(CKSQLiteTable *)&v9 didCreateDatabaseTable];
  if (!v6) {
    id v7 = (id)objc_msgSend_lookupRefcountTable(self, v3, v4, v5);
  }

  return v6;
}

- (id)wakeFromDatabase
{
  v9.receiver = self;
  v9.super_class = (Class)CKSQLiteReferencedObjectTable;
  uint64_t v6 = [(CKSQLiteTable *)&v9 wakeFromDatabase];
  if (!v6) {
    id v7 = (id)objc_msgSend_lookupRefcountTable(self, v3, v4, v5);
  }

  return v6;
}

- (id)databaseReferenceValueForEntry:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_primaryKeyProperty(self, v7, v8, v9);
  v14 = objc_msgSend_primaryKeyPropertyInfo(self, v11, v12, v13);
  uint64_t v16 = objc_msgSend_valueForProperty_propertyInfo_inObject_(self, v15, (uint64_t)v10, (uint64_t)v14, v6);
  if (v16) {
    goto LABEL_2;
  }
  objc_msgSend_willStoreReferenceToUnsavedEntry_(self, v17, (uint64_t)v6, v18);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    uint64_t v16 = objc_msgSend_valueForProperty_propertyInfo_inObject_(self, v22, (uint64_t)v10, (uint64_t)v14, v6);
LABEL_2:
    id v19 = (void *)v16;
    id v20 = 0;
    goto LABEL_3;
  }
  if (a4)
  {
    id v20 = v20;
    id v19 = 0;
    *a4 = v20;
  }
  else
  {
    id v19 = 0;
  }
LABEL_3:

  return v19;
}

- (id)entryForDatabaseReferenceValue:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, a2, (uint64_t)a3, 0, off_1E5463178, a4);
}

- (unint64_t)refcountForEntry:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_primaryKeyProperty(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_primaryKeyPropertyInfo(self, v9, v10, v11);
  v14 = objc_msgSend_valueForProperty_propertyInfo_inObject_(self, v13, (uint64_t)v8, (uint64_t)v12, v4);

  unint64_t v17 = objc_msgSend_refcountForObjectID_(self->_refcountTable, v15, (uint64_t)v14, v16);
  return v17;
}

- (void).cxx_destruct
{
}

@end