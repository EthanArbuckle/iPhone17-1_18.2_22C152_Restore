@interface CKDIdentityCache
+ (CKDIdentityCache)cacheWithDeviceContext:(id)a3;
- (id)cache;
- (id)cachedIdentityForLookupInfo:(id)a3 container:(id)a4;
- (id)createTables:(id *)a3;
- (void)cacheUserIdentity:(id)a3 forLookupInfo:(id)a4 container:(id)a5;
- (void)removeCachedValueForLookupInfo:(id)a3 container:(id)a4;
@end

@implementation CKDIdentityCache

+ (CKDIdentityCache)cacheWithDeviceContext:(id)a3
{
  v4 = objc_msgSend_deviceScopedDatabase(a3, a2, (uint64_t)a3);
  v6 = objc_msgSend_tableGroupInDatabase_withName_error_(a1, v5, (uint64_t)v4, @"IdentityCache", 0);

  return (CKDIdentityCache *)v6;
}

- (id)createTables:(id *)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, (uint64_t)a3);
  objc_msgSend_publicIdentitiesExpirationTimeout(v3, v4, v5);
  double v7 = v6;

  v8 = [CKDIdentityCacheTable alloc];
  v10 = objc_msgSend_initWithLogicalTableName_entryCountLimit_dataSizeLimit_expirationTime_expireDelay_(v8, v9, @"cache", 0, 0, v7, 60.0);
  v14[0] = v10;
  v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v14, 1);

  return v12;
}

- (id)cache
{
  return (id)objc_msgSend_tableWithName_(self, a2, @"cache");
}

- (id)cachedIdentityForLookupInfo:(id)a3 container:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10 = objc_msgSend_cache(self, v8, v9);
  v12 = objc_msgSend_cachedIdentityForLookupInfo_container_(v10, v11, (uint64_t)v7, v6);

  return v12;
}

- (void)removeCachedValueForLookupInfo:(id)a3 container:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_cache(self, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteUserIdentityForLookupInfo_container_(v11, v10, (uint64_t)v7, v6);
}

- (void)cacheUserIdentity:(id)a3 forLookupInfo:(id)a4 container:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_cache(self, v10, v11);
  v14 = v12;
  if (v20)
  {
    v16 = objc_msgSend_insertUserIdentity_forLookupInfo_container_(v12, v13, (uint64_t)v20, v8, v9);
    if (v16 && objc_msgSend_CKIsUniqueConstraintError_(MEMORY[0x1E4F28C58], v15, (uint64_t)v16))
    {
      objc_msgSend_deleteUserIdentityForLookupInfo_container_(v14, v17, (uint64_t)v8, v9);
      id v19 = (id)objc_msgSend_insertUserIdentity_forLookupInfo_container_(v14, v18, (uint64_t)v20, v8, v9);
    }
  }
  else
  {
    objc_msgSend_deleteUserIdentityForLookupInfo_container_(v12, v13, (uint64_t)v8, v9);
  }
}

@end