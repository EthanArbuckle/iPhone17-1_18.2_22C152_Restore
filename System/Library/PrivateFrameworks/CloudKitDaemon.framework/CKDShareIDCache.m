@interface CKDShareIDCache
+ (id)_caches;
+ (id)cacheForContainer:(id)a3;
+ (void)dropCacheConnectionForContainer:(id)a3;
- (CKDShareIDCache)init;
- (CKDShareIDSQLCache)cache;
- (id)initInternalWithContainer:(id)a3 error:(id *)a4;
- (id)knownShareIDsForZoneID:(id)a3;
- (id)shareIDForRecordID:(id)a3;
- (id)zoneShareIDForZoneID:(id)a3;
- (void)addRecord:(id)a3;
- (void)addRecordID:(id)a3 withParentID:(id)a4;
- (void)addShare:(id)a3;
- (void)addZoneShare:(id)a3;
- (void)removeRecordID:(id)a3;
- (void)removeShareID:(id)a3;
- (void)removeZone:(id)a3;
- (void)removeZoneShare:(id)a3;
- (void)setShareID:(id)a3 forRecordID:(id)a4;
@end

@implementation CKDShareIDCache

+ (id)_caches
{
  if (qword_1EBBCFF80 != -1) {
    dispatch_once(&qword_1EBBCFF80, &unk_1F20442D0);
  }
  v2 = (void *)qword_1EBBCFF78;
  return v2;
}

+ (id)cacheForContainer:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_entitlements(v4, v5, v6);
  int hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v7, v8, v9);

  if (hasTemporaryDeviceCapabilitiesEntitlement)
  {
    v11 = sub_1C4FC499C(v4);
    v14 = objc_msgSend__caches(a1, v12, v13);
    objc_sync_enter(v14);
    v17 = objc_msgSend__caches(a1, v15, v16);
    inited = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v11);

    if (!inited)
    {
      v20 = [CKDShareIDCache alloc];
      id v32 = 0;
      inited = objc_msgSend_initInternalWithContainer_error_(v20, v21, (uint64_t)v4, &v32);
      id v22 = v32;
      v25 = v22;
      if (!inited || v22)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v27 = (id)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v31 = objc_msgSend_containerID(v4, v28, v29);
          *(_DWORD *)buf = 138412290;
          v34 = v31;
          _os_log_error_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_ERROR, "Cannot initialize share ID SQL cache for container with ID: %@", buf, 0xCu);
        }
      }
      else
      {
        v25 = objc_msgSend__caches(a1, v23, v24);
        objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)inited, v11);
      }
    }
    objc_sync_exit(v14);
  }
  else
  {
    inited = 0;
  }

  return inited;
}

+ (void)dropCacheConnectionForContainer:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = v4;
  if (v4)
  {
    v8 = objc_msgSend_entitlements(v4, v5, v6);
    int hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v8, v9, v10);

    if (hasTemporaryDeviceCapabilitiesEntitlement)
    {
      v12 = sub_1C4FC499C(v7);
      v15 = objc_msgSend_containerID(v7, v13, v14);
      v18 = objc_msgSend__caches(a1, v16, v17);
      uint64_t v19 = objc_sync_enter(v18);
      v20 = (void *)MEMORY[0x1C8789E70](v19);
      v23 = objc_msgSend__caches(a1, v21, v22);
      v25 = objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v12);

      if (v25)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v26 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          int v31 = 138412290;
          id v32 = v15;
          _os_log_debug_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_DEBUG, "Dropping shareID cache connection for container with ID: %@", (uint8_t *)&v31, 0xCu);
        }
        uint64_t v29 = objc_msgSend__caches(a1, v27, v28);
        objc_msgSend_removeObjectForKey_(v29, v30, (uint64_t)v12);
      }
      objc_sync_exit(v18);
    }
  }
}

- (CKDShareIDCache)init
{
  id v2 = objc_alloc(MEMORY[0x1E4F1A018]);
  id v4 = (id)objc_msgSend_initWithCode_format_(v2, v3, 12, @"Use +[CKDShareIDCache cacheForContainer] instead");
  objc_exception_throw(v4);
}

- (id)initInternalWithContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKDShareIDCache;
  v7 = [(CKDShareIDCache *)&v14 init];
  if (v7
    && (v8 = [CKDShareIDSQLCache alloc],
        uint64_t v10 = objc_msgSend_initWithContainer_error_(v8, v9, (uint64_t)v6, a4),
        cache = v7->_cache,
        v7->_cache = (CKDShareIDSQLCache *)v10,
        cache,
        v7->_cache)
    && (!a4 || !*a4))
  {
    v12 = v7;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)addShare:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_isZoneWideShare(v4, v5, v6))
  {
    uint64_t v9 = objc_msgSend_recordID(v4, v7, v8);
    objc_msgSend_addZoneShare_(self, v10, (uint64_t)v9);
  }
  else
  {
    uint64_t v9 = objc_msgSend_rootRecordID(v4, v7, v8);
    if (v9)
    {
      uint64_t v13 = objc_msgSend_recordID(v4, v11, v12);
      objc_msgSend_setShareID_forRecordID_(self, v14, (uint64_t)v13, v9);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v15 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "Warn: Unknown share type. Share is neither a zone share nor a record share: %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

- (void)addRecord:(id)a3
{
  id v23 = a3;
  uint64_t v6 = objc_msgSend_recordID(v23, v4, v5);
  uint64_t v8 = objc_msgSend_shareIDForRecordID_(self, v7, (uint64_t)v6);

  if (!v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_addShare_(self, v9, (uint64_t)v23);
    }
    else
    {
      v11 = objc_msgSend_share(v23, v9, v10);

      if (v11)
      {
        objc_super v14 = objc_msgSend_share(v23, v12, v13);
        id v17 = objc_msgSend_recordID(v14, v15, v16);
        objc_msgSend_setShareID_forRecordID_(self, v18, (uint64_t)v17, v6);
      }
      else
      {
        uint64_t v19 = objc_msgSend_parent(v23, v12, v13);
        objc_super v14 = objc_msgSend_recordID(v19, v20, v21);

        if (v14) {
          objc_msgSend_addRecordID_withParentID_(self, v22, (uint64_t)v6, v14);
        }
      }
    }
  }
}

- (void)addRecordID:(id)a3 withParentID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  uint64_t v10 = objc_msgSend_cache(v7, v8, v9);
  objc_msgSend_addOrUpdateRecordID_withParentID_(v10, v11, (uint64_t)v12, v6);

  objc_sync_exit(v7);
}

- (void)addZoneShare:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v7 = objc_msgSend_cache(v4, v5, v6);
  objc_msgSend_addZoneShareID_(v7, v8, (uint64_t)v9);

  objc_sync_exit(v4);
}

- (void)removeZoneShare:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v7 = objc_msgSend_cache(v4, v5, v6);
  objc_msgSend_removeZoneShareForZoneID_(v7, v8, (uint64_t)v9);

  objc_sync_exit(v4);
}

- (void)removeZone:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v7 = objc_msgSend_cache(v4, v5, v6);
  objc_msgSend_removeZoneWithID_(v7, v8, (uint64_t)v9);

  objc_sync_exit(v4);
}

- (id)zoneShareIDForZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v8 = objc_msgSend_cache(v5, v6, v7);
  uint64_t v10 = objc_msgSend_zoneShareIDForZoneID_(v8, v9, (uint64_t)v4);

  objc_sync_exit(v5);
  return v10;
}

- (id)knownShareIDsForZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v8 = objc_msgSend_cache(v5, v6, v7);
  uint64_t v10 = objc_msgSend_shareIDsForZoneID_(v8, v9, (uint64_t)v4);

  objc_sync_exit(v5);
  return v10;
}

- (id)shareIDForRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v8 = objc_msgSend_cache(v5, v6, v7);
  uint64_t v10 = objc_msgSend_shareIDForRecordID_(v8, v9, (uint64_t)v4);

  objc_sync_exit(v5);
  return v10;
}

- (void)setShareID:(id)a3 forRecordID:(id)a4
{
  id v17 = a3;
  id v9 = a4;
  if (!v17 || !v9)
  {
    v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CKDShareIDCache.m", 178, @"shareID must not be nil");
  }
  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v13 = objc_msgSend_cache(v10, v11, v12);
  objc_msgSend_addHierarchicalShareID_forRootRecordID_(v13, v14, (uint64_t)v17, v9);

  objc_sync_exit(v10);
}

- (void)removeShareID:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_cache(v4, v5, v6);
  objc_msgSend_removeShareID_(v7, v8, (uint64_t)v9);

  objc_sync_exit(v4);
}

- (void)removeRecordID:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_cache(v4, v5, v6);
  objc_msgSend_removeRecordID_(v7, v8, (uint64_t)v9);

  objc_sync_exit(v4);
}

- (CKDShareIDSQLCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
}

@end