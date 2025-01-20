@interface CKDRecordCache
+ (id)recordCacheForContainer:(id)a3;
+ (id)recordCacheInDatabase:(id)a3 withContainer:(id)a4;
+ (id)recordCacheWithPath:(id)a3 forContainer:(id)a4;
- (id)createTables:(id *)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
@end

@implementation CKDRecordCache

+ (id)recordCacheInDatabase:(id)a3 withContainer:(id)a4
{
  id v6 = a3;
  v9 = objc_msgSend_containerID(a4, v7, v8);
  v12 = objc_msgSend_containerIdentifier(v9, v10, v11);
  uint64_t v15 = objc_msgSend_specialContainerType(v9, v13, v14);
  uint64_t v17 = objc_msgSend_tableGroupOptionsForContainerType_(a1, v16, v15);
  v19 = objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(CKDRecordCache, v18, 2, v12, @"RecordCache");
  v21 = objc_msgSend_tableGroupInDatabase_withName_options_error_(a1, v20, (uint64_t)v6, v19, v17, 0);

  return v21;
}

+ (id)recordCacheWithPath:(id)a3 forContainer:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1A370];
  id v7 = a4;
  id v8 = a3;
  uint64_t v11 = objc_msgSend_deviceContext(v7, v9, v10);
  uint64_t v14 = objc_msgSend_deviceScopedDatabase(v11, v12, v13);
  v16 = objc_msgSend_databaseInDirectory_registryDatabase_options_error_(v6, v15, (uint64_t)v8, v14, 0, 0);

  v18 = objc_msgSend_recordCacheInDatabase_withContainer_(a1, v17, (uint64_t)v16, v7);

  return v18;
}

+ (id)recordCacheForContainer:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_directoryContext(v4, v5, v6);
  uint64_t v10 = objc_msgSend_daemonDatabaseDirectory(v7, v8, v9);

  uint64_t v13 = objc_msgSend_path(v10, v11, v12);
  uint64_t v15 = objc_msgSend_recordCacheWithPath_forContainer_(a1, v14, (uint64_t)v13, v4);

  return v15;
}

- (id)createTables:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(CKDRecordCacheTable);
  rc = self->_rc;
  self->_rc = v4;

  v9[0] = self->_rc;
  id v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v9, 1);
  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_rc;
}

- (void).cxx_destruct
{
}

@end