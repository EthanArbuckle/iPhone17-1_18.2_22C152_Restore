@interface CKDProgressTracker
+ (unint64_t)_sizeForItem:(id)a3;
- (BOOL)hasCachedCompletedBytes;
- (BOOL)hasCachedTotalBytes;
- (CKDProgressTracker)init;
- (CKDProgressTracker)initWithTrackingID:(id)a3;
- (NSMapTable)completedBytesByItems;
- (NSString)trackingID;
- (double)lastItemPercentage;
- (double)updateProgressWithItem:(id)a3 progress:(double)a4;
- (unint64_t)_updateTotalBytes;
- (unint64_t)_updateTotalCompletedBytes;
- (unint64_t)cachedCompletedBytes;
- (unint64_t)cachedTotalBytes;
- (void)setCachedCompletedBytes:(unint64_t)a3;
- (void)setCachedTotalBytes:(unint64_t)a3;
- (void)setCompletedBytesByItems:(id)a3;
- (void)setHasCachedCompletedBytes:(BOOL)a3;
- (void)setHasCachedTotalBytes:(BOOL)a3;
- (void)setLastItemPercentage:(double)a3;
- (void)setTrackingID:(id)a3;
- (void)startTrackingItems:(id)a3;
- (void)stopTrackingItems:(id)a3;
@end

@implementation CKDProgressTracker

+ (unint64_t)_sizeForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (objc_msgSend_isConstructedAsset(v4, v5, v6)) {
      uint64_t v9 = objc_msgSend_constructedAssetEstimatedSize(v4, v7, v8);
    }
    else {
      uint64_t v9 = objc_msgSend_size(v4, v7, v8);
    }
    unint64_t v13 = v9;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = objc_msgSend_size(v3, v10, v11);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unint64_t v13 = 0;
        goto LABEL_12;
      }
      uint64_t v12 = objc_msgSend_fileSize(v3, v14, v15);
    }
    unint64_t v13 = v12;
  }
LABEL_12:

  return v13;
}

- (CKDProgressTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKDProgressTracker;
  id v4 = [(CKDProgressTracker *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v2, v3);
    completedBytesByItems = v4->_completedBytesByItems;
    v4->_completedBytesByItems = (NSMapTable *)v5;
  }
  return v4;
}

- (CKDProgressTracker)initWithTrackingID:(id)a3
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_init(self, v6, v7);
  uint64_t v9 = (CKDProgressTracker *)v8;
  if (v8) {
    objc_storeStrong((id *)(v8 + 48), a3);
  }

  return v9;
}

- (void)startTrackingItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, v25, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_setObject_forKey_(v5->_completedBytesByItems, v8, (uint64_t)&unk_1F20AD008, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v17, v25, 16);
    }
    while (v9);
  }

  *(_WORD *)&v5->_hasCachedTotalBytes = 0;
  objc_sync_exit(v5);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v12 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    unint64_t v13 = v12;
    v16 = objc_msgSend_trackingID(v5, v14, v15);
    *(_DWORD *)buf = 138412546;
    v22 = v16;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "%@ started tracking items: %@", buf, 0x16u);
  }
}

- (void)stopTrackingItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, v25, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_removeObjectForKey_(v5->_completedBytesByItems, v8, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v17, v25, 16);
    }
    while (v9);
  }

  *(_WORD *)&v5->_hasCachedTotalBytes = 0;
  objc_sync_exit(v5);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v12 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    unint64_t v13 = v12;
    v16 = objc_msgSend_trackingID(v5, v14, v15);
    *(_DWORD *)buf = 138412546;
    v22 = v16;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "%@ stopped tracking items: %@", buf, 0x16u);
  }
}

- (unint64_t)_updateTotalBytes
{
  if (self->_hasCachedTotalBytes) {
    return self->_cachedTotalBytes;
  }
  id v5 = objc_msgSend_keyEnumerator(self->_completedBytesByItems, a2, v2);
  uint64_t v8 = objc_msgSend_nextObject(v5, v6, v7);
  if (v8)
  {
    uint64_t v10 = (void *)v8;
    unint64_t v4 = 0;
    do
    {
      v4 += objc_msgSend__sizeForItem_(CKDProgressTracker, v9, (uint64_t)v10);
      uint64_t v13 = objc_msgSend_nextObject(v5, v11, v12);

      uint64_t v10 = (void *)v13;
    }
    while (v13);
  }
  else
  {
    unint64_t v4 = 0;
  }
  self->_cachedTotalBytes = v4;
  self->_hasCachedTotalBytes = 1;

  return v4;
}

- (unint64_t)_updateTotalCompletedBytes
{
  if (self->_hasCachedCompletedBytes) {
    return self->_cachedCompletedBytes;
  }
  id v5 = objc_msgSend_objectEnumerator(self->_completedBytesByItems, a2, v2);
  uint64_t v8 = objc_msgSend_nextObject(v5, v6, v7);
  if (v8)
  {
    uint64_t v11 = (void *)v8;
    unint64_t v4 = 0;
    do
    {
      v4 += objc_msgSend_unsignedLongLongValue(v11, v9, v10);
      uint64_t v14 = objc_msgSend_nextObject(v5, v12, v13);

      uint64_t v11 = (void *)v14;
    }
    while (v14);
  }
  else
  {
    unint64_t v4 = 0;
  }
  self->_cachedCompletedBytes = v4;
  self->_hasCachedCompletedBytes = 1;

  return v4;
}

- (double)updateProgressWithItem:(id)a3 progress:(double)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  unint64_t updated = objc_msgSend__updateTotalBytes(v7, v8, v9);
  double v13 = 0.0;
  if (updated)
  {
    unint64_t v15 = objc_msgSend__updateTotalCompletedBytes(v7, v10, v11);
    if (v6)
    {
      long long v17 = objc_msgSend_objectForKey_(v7->_completedBytesByItems, v14, (uint64_t)v6);
      if (v17)
      {
        unint64_t v18 = objc_msgSend__sizeForItem_(CKDProgressTracker, v16, (uint64_t)v6);
        double v21 = (double)v18 * a4;
        uint64_t v22 = v18 >= (unint64_t)v21 ? (unint64_t)v21 : v18;
        if (v22 != objc_msgSend_unsignedLongLongValue(v17, v19, v20))
        {
          unint64_t v25 = objc_msgSend_unsignedLongLongValue(v17, v23, v24);
          if (v15 >= v25) {
            unint64_t v27 = v15 - v25;
          }
          else {
            unint64_t v27 = 0;
          }
          completedBytesByItems = v7->_completedBytesByItems;
          v29 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v26, v22);
          objc_msgSend_setObject_forKey_(completedBytesByItems, v30, (uint64_t)v29, v6);
          unint64_t v15 = v27 + v22;
        }
      }
    }
    if (v15 >= updated) {
      unint64_t v31 = updated;
    }
    else {
      unint64_t v31 = v15;
    }
    v7->_cachedCompletedBytes = v31;
    v7->_hasCachedCompletedBytes = 1;
    unint64_t v32 = (unint64_t)(v7->_lastItemPercentage * (double)updated);
    if (updated < v32) {
      unint64_t v32 = updated;
    }
    unint64_t v33 = v32 + updated;
    if (v33) {
      double v13 = (double)v31 / (double)v33;
    }
  }
  objc_sync_exit(v7);

  return v13;
}

- (double)lastItemPercentage
{
  return self->_lastItemPercentage;
}

- (void)setLastItemPercentage:(double)a3
{
  self->_lastItemPercentage = a3;
}

- (BOOL)hasCachedTotalBytes
{
  return self->_hasCachedTotalBytes;
}

- (void)setHasCachedTotalBytes:(BOOL)a3
{
  self->_hasCachedTotalBytes = a3;
}

- (BOOL)hasCachedCompletedBytes
{
  return self->_hasCachedCompletedBytes;
}

- (void)setHasCachedCompletedBytes:(BOOL)a3
{
  self->_hasCachedCompletedBytes = a3;
}

- (unint64_t)cachedTotalBytes
{
  return self->_cachedTotalBytes;
}

- (void)setCachedTotalBytes:(unint64_t)a3
{
  self->_cachedTotalBytes = a3;
}

- (unint64_t)cachedCompletedBytes
{
  return self->_cachedCompletedBytes;
}

- (void)setCachedCompletedBytes:(unint64_t)a3
{
  self->_cachedCompletedBytes = a3;
}

- (NSMapTable)completedBytesByItems
{
  return self->_completedBytesByItems;
}

- (void)setCompletedBytesByItems:(id)a3
{
}

- (NSString)trackingID
{
  return self->_trackingID;
}

- (void)setTrackingID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingID, 0);
  objc_storeStrong((id *)&self->_completedBytesByItems, 0);
}

@end