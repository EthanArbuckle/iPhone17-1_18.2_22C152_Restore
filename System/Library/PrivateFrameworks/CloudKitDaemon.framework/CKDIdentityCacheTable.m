@interface CKDIdentityCacheTable
+ (Class)entryClass;
+ (id)dbProperties;
- (id)cachedIdentityForLookupInfo:(id)a3 container:(id)a4;
- (id)insertUserIdentity:(id)a3 forLookupInfo:(id)a4 container:(id)a5;
- (id)objectClassesForProperty:(id)a3;
- (id)predicateForMatchingLookupInfoInContainer;
- (id)valuesDictionaryForLookupInfo:(id)a3 container:(id)a4;
- (void)deleteUserIdentityForLookupInfo:(id)a3 container:(id)a4;
@end

@implementation CKDIdentityCacheTable

+ (id)dbProperties
{
  return &unk_1F20ABA10;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)objectClassesForProperty:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDIdentityCacheTable;
  v5 = [(CKSQLiteTable *)&v11 objectClassesForProperty:v4];
  if ((objc_msgSend_isEqualToString_(v4, v6, @"lookupInfo") & 1) != 0
    || objc_msgSend_isEqualToString_(v4, v7, @"identity"))
  {
    uint64_t v8 = objc_opt_class();
    objc_msgSend_addObject_(v5, v9, v8);
  }

  return v5;
}

- (id)valuesDictionaryForLookupInfo:(id)a3 container:(id)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v9 = objc_msgSend_containerID(v5, v7, v8);
  v12 = objc_msgSend_containerIdentifier(v9, v10, v11);

  v15 = objc_msgSend_directoryContext(v5, v13, v14);

  v18 = objc_msgSend_dataSeparationHash(v15, v16, v17);

  v22[0] = @"LOOKUPINFO";
  v22[1] = @"ID";
  v23[0] = v6;
  v23[1] = v12;
  v22[2] = @"HASH";
  v23[2] = v18;
  v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v23, v22, 3);

  return v20;
}

- (id)predicateForMatchingLookupInfoInContainer
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], a2, @"lookupInfo = $LOOKUPINFO AND containerIdentifier = $ID AND dataSeparationHash = $HASH");
}

- (void)deleteUserIdentityForLookupInfo:(id)a3 container:(id)a4
{
  id v5 = objc_msgSend_valuesDictionaryForLookupInfo_container_(self, a2, (uint64_t)a3, a4);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4D85B98;
  v7[3] = &unk_1E64F1C68;
  v7[4] = self;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v6, (uint64_t)v5, off_1E64F1C48, 0, v7);
}

- (id)insertUserIdentity:(id)a3 forLookupInfo:(id)a4 container:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(CKDIdentityCacheTableEntry);
  objc_msgSend_setLookupInfo_(v11, v12, (uint64_t)v9);

  v15 = objc_msgSend_containerID(v8, v13, v14);
  v18 = objc_msgSend_containerIdentifier(v15, v16, v17);
  objc_msgSend_setContainerIdentifier_(v11, v19, (uint64_t)v18);

  v22 = objc_msgSend_directoryContext(v8, v20, v21);

  v25 = objc_msgSend_dataSeparationHash(v22, v23, v24);
  objc_msgSend_setDataSeparationHash_(v11, v26, (uint64_t)v25);

  v27 = (void *)MEMORY[0x1E4F1C9C8];
  v30 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v28, v29);
  objc_msgSend_publicIdentitiesExpirationTimeout(v30, v31, v32);
  v35 = objc_msgSend_dateWithTimeIntervalSinceNow_(v27, v33, v34);
  objc_msgSend_setExpirationDate_(v11, v36, (uint64_t)v35);

  objc_msgSend_setIdentity_(v11, v37, (uint64_t)v10);
  v39 = objc_msgSend_insertObject_(self, v38, (uint64_t)v11);

  return v39;
}

- (id)cachedIdentityForLookupInfo:(id)a3 container:(id)a4
{
  id v5 = objc_msgSend_valuesDictionaryForLookupInfo_container_(self, a2, (uint64_t)a3, a4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4D85DD0;
  v13[3] = &unk_1E64F0370;
  v13[4] = self;
  v7 = objc_msgSend_entryWithValues_label_error_setupBlock_(self, v6, (uint64_t)v5, off_1E64F1C88, 0, v13);
  id v10 = objc_msgSend_identity(v7, v8, v9);
  objc_msgSend_setIsCached_(v10, v11, 1);

  return v10;
}

@end