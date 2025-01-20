@interface CKDAssetVolumeTable
+ (Class)entryClass;
+ (id)dbProperties;
- (CKDAssetVolumeTable)initWithLogicalTableName:(id)a3;
- (id)unmountedAssetVolumes;
- (id)volumeIndexForVolumeUUID:(id)a3;
- (id)volumeUUIDWithVolumeIndex:(id)a3;
- (id)wakeFromDatabase;
- (void)_lockedSetVolumeIndex:(id)a3 forVolumeUUID:(id)a4;
@end

@implementation CKDAssetVolumeTable

+ (id)dbProperties
{
  return &unk_1F20ABFD8;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKDAssetVolumeTable)initWithLogicalTableName:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKDAssetVolumeTable;
  v3 = [(CKSQLiteTable *)&v9 initWithLogicalTableName:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    volumeIndexByVolumeUUID = v3->_volumeIndexByVolumeUUID;
    v3->_volumeIndexByVolumeUUID = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    volumeUUIDByVolumeIndex = v3->_volumeUUIDByVolumeIndex;
    v3->_volumeUUIDByVolumeIndex = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (id)wakeFromDatabase
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4F076F8;
  v4[3] = &unk_1E64F5DC0;
  v4[4] = self;
  v2 = objc_msgSend_enumerateEntriesWithBlock_(self, a2, (uint64_t)v4);
  return v2;
}

- (void)_lockedSetVolumeIndex:(id)a3 forVolumeUUID:(id)a4
{
  volumeIndexByVolumeUUID = self->_volumeIndexByVolumeUUID;
  id v7 = a4;
  id v10 = a3;
  objc_msgSend_setObject_forKeyedSubscript_(volumeIndexByVolumeUUID, v8, (uint64_t)v10, v7);
  objc_msgSend_setObject_forKeyedSubscript_(self->_volumeUUIDByVolumeIndex, v9, (uint64_t)v7, v10);
}

- (id)volumeIndexForVolumeUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v7 = 0;
    goto LABEL_17;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = objc_msgSend_objectForKeyedSubscript_(self->_volumeIndexByVolumeUUID, v6, (uint64_t)v4);
  if (!v7)
  {
    v8 = objc_opt_new();
    objc_msgSend_setVolumeUUID_(v8, v9, (uint64_t)v4);
    uint64_t v11 = objc_msgSend_insertObject_(self, v10, (uint64_t)v8);
    v14 = (void *)MEMORY[0x1E4F1A550];
    v15 = (os_log_t *)MEMORY[0x1E4F1A4F8];
    if (v11)
    {
      v16 = (void *)v11;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v17 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        id v25 = v16;
        _os_log_error_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_ERROR, "volumeIndexForVolumeUUID failed: %@", (uint8_t *)&v24, 0xCu);
      }

      goto LABEL_9;
    }
    id v7 = objc_msgSend_volumeIndex(v8, v12, v13);
    v21 = objc_msgSend_volumeIndex(v8, v19, v20);
    objc_msgSend__lockedSetVolumeIndex_forVolumeUUID_(self, v22, (uint64_t)v21, v4);

    if (!v7)
    {
LABEL_9:
      if (*v14 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v18 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
      {
        int v24 = 138543362;
        id v25 = v4;
        _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "volumeIndexForVolumeUUID is returning nil for volumeUUID=%{public}@", (uint8_t *)&v24, 0xCu);
      }
      id v7 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
LABEL_17:

  return v7;
}

- (id)volumeUUIDWithVolumeIndex:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = objc_msgSend_objectForKeyedSubscript_(self->_volumeUUIDByVolumeIndex, v6, (uint64_t)v4);
  if (!v7)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v8 = *MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_INFO))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_INFO, "volumeUUIDWithVolumeIndex is returning nil for volumeIndex=%{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)unmountedAssetVolumes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4F07CA0;
  v9[3] = &unk_1E64F5DE8;
  id v4 = v3;
  id v10 = v4;
  id v11 = self;
  id v6 = (id)objc_msgSend_enumerateEntriesWithBlock_(self, v5, (uint64_t)v9);
  id v7 = v4;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeIndexByVolumeUUID, 0);
  objc_storeStrong((id *)&self->_volumeUUIDByVolumeIndex, 0);
}

@end