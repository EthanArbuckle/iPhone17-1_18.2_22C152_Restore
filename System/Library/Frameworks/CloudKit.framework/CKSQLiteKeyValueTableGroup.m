@interface CKSQLiteKeyValueTableGroup
+ (id)keyValueStoreInDatabase:(id)a3 create:(BOOL)a4;
- (id)createTables:(id *)a3;
@end

@implementation CKSQLiteKeyValueTableGroup

+ (id)keyValueStoreInDatabase:(id)a3 create:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 0x10000;
  }
  id v6 = a3;
  v8 = objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(a1, v7, 0, 0, @"KeyValueStore");
  id v15 = 0;
  v10 = objc_msgSend_tableGroupInDatabase_withName_options_error_(a1, v9, (uint64_t)v6, (uint64_t)v8, v5, &v15);

  id v11 = v15;
  v12 = v10;
  if (v12) {
    v12 = (void *)v12[17];
  }
  v13 = v12;

  return v13;
}

- (id)createTables:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = [CKSQLiteKeyValueStore alloc];
  v7 = (CKSQLiteKeyValueStore *)objc_msgSend_initWithLogicalTableName_(v4, v5, @"KeyValue", v6);
  store = self->_store;
  self->_store = v7;

  v12[0] = self->_store;
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v12, 1);

  return v10;
}

- (void).cxx_destruct
{
}

@end