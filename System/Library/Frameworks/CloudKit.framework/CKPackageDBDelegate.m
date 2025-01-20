@interface CKPackageDBDelegate
- (BOOL)migrateDatabase:(id)a3 fromVersion:(int)a4;
- (int)userVersion;
@end

@implementation CKPackageDBDelegate

- (BOOL)migrateDatabase:(id)a3 fromVersion:(int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a4 > 0) {
    return 1;
  }
  uint64_t v6 = objc_msgSend_performDatabaseOperation_(a3, a2, (uint64_t)&unk_1ED7EF618, *(uint64_t *)&a4);
  if (!v6) {
    return 1;
  }
  v7 = (void *)v6;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v8 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_error_impl(&dword_18AF10000, v8, OS_LOG_TYPE_ERROR, "Error migrating package %@. Error was: %@", (uint8_t *)&v9, 0x16u);
  }

  return 0;
}

- (int)userVersion
{
  return 1;
}

@end