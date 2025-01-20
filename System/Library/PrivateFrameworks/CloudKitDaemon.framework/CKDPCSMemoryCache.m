@interface CKDPCSMemoryCache
+ (void)initialize;
+ (void)registerEvictionTimer;
+ (void)runMemoryCacheEvictionInAllCaches;
+ (void)setupMemoryNotifications;
+ (void)startEvictionTimer;
+ (void)stopEvictionTimer;
- (BOOL)hasStatusToReport;
- (CKDPCSMemoryCache)init;
- (NSMutableDictionary)cacheEntries;
- (OS_dispatch_queue)accessQueue;
- (double)minAge;
- (double)oldestCacheEntry;
- (id)CKStatusReportArray;
- (unint64_t)_cacheCount;
- (unint64_t)maxEntries;
- (unint64_t)memoryCacheDeleteCount;
- (unint64_t)memoryCacheEvictCount;
- (unint64_t)memoryCacheHighwaterCount;
- (unint64_t)memoryCacheHitCount;
- (unint64_t)memoryCacheRequestCount;
- (unint64_t)memoryCacheUpdateCount;
- (void)_lockedEvictEntriesFromCache;
- (void)clearCache;
- (void)getPCSDataFromCacheForID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)runCacheEviction;
- (void)setAccessQueue:(id)a3;
- (void)setCacheEntries:(id)a3;
- (void)setMaxEntries:(unint64_t)a3;
- (void)setMemoryCacheDeleteCount:(unint64_t)a3;
- (void)setMemoryCacheEvictCount:(unint64_t)a3;
- (void)setMemoryCacheHighwaterCount:(unint64_t)a3;
- (void)setMemoryCacheHitCount:(unint64_t)a3;
- (void)setMemoryCacheRequestCount:(unint64_t)a3;
- (void)setMemoryCacheUpdateCount:(unint64_t)a3;
- (void)setMinAge:(double)a3;
- (void)setOldestCacheEntry:(double)a3;
- (void)setPCSData:(id)a3 forItemID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6;
@end

@implementation CKDPCSMemoryCache

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend_setupMemoryNotifications(a1, v3, v4);
    MEMORY[0x1F4181798](a1, sel_registerEvictionTimer, v5);
  }
}

+ (void)setupMemoryNotifications
{
  qword_1EBBCFB98 = 1;
  v2 = dispatch_get_global_queue(17, 0);
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, v2);
  uint64_t v4 = (void *)qword_1EBBCFBA0;
  qword_1EBBCFBA0 = (uint64_t)v3;

  uint64_t v5 = qword_1EBBCFBA0;
  dispatch_source_set_event_handler(v5, &unk_1F2042B90);
}

+ (void)runMemoryCacheEvictionInAllCaches
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v2 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v2, OS_LOG_TYPE_DEBUG, "Flushing all PCS memory caches", v7, 2u);
  }
  uint64_t v5 = objc_msgSend_sharedConnectionManager(CKDXPCConnectionManager, v3, v4);
  objc_msgSend_enumerateConnections_(v5, v6, (uint64_t)&unk_1F2042BB0);
}

+ (void)startEvictionTimer
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if ((byte_1EBBCFB90 & 1) == 0)
  {
    byte_1EBBCFB90 = 1;
    dispatch_resume((dispatch_object_t)qword_1EBBCFBA8);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    dispatch_source_t v3 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Started PCS memory cache timer.", v4, 2u);
    }
  }
  objc_sync_exit(v2);
}

+ (void)stopEvictionTimer
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (byte_1EBBCFB90 == 1)
  {
    byte_1EBBCFB90 = 0;
    dispatch_suspend((dispatch_object_t)qword_1EBBCFBA8);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    dispatch_source_t v3 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Stopped PCS memory cache timer.", v4, 2u);
    }
  }
  objc_sync_exit(v2);
}

+ (void)registerEvictionTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D801F0;
  block[3] = &unk_1E64F1B50;
  block[4] = a1;
  if (qword_1EBBD0180 != -1) {
    dispatch_once(&qword_1EBBD0180, block);
  }
}

- (CKDPCSMemoryCache)init
{
  v20.receiver = self;
  v20.super_class = (Class)CKDPCSMemoryCache;
  v2 = [(CKDPCSMemoryCache *)&v20 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cacheEntries = v2->_cacheEntries;
    v2->_cacheEntries = (NSMutableDictionary *)v3;

    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cloudkit.pcs.memorycache", v5);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v6;

    v10 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v8, v9);
    v2->_maxEntries = objc_msgSend_PCSCacheSize(v10, v11, v12);

    v15 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v13, v14);
    objc_msgSend_PCSCacheMinTime(v15, v16, v17);
    v2->_minAge = v18;

    v2->_oldestCacheEntry = 0.0;
  }
  return v2;
}

- (void)_lockedEvictEntriesFromCache
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_accessQueue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  v7 = objc_msgSend_cacheEntries(self, v5, v6);
  unint64_t v10 = objc_msgSend_count(v7, v8, v9);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v11, v12);
  double v14 = v13;
  objc_msgSend_minAge(self, v15, v16);
  double v18 = v14 - v17;
  uint64_t v19 = qword_1EBBCFB98;
  unint64_t v70 = v10;
  if (v10 > objc_msgSend_maxEntries(self, v20, v21)
    || v10 && v19 != 1 && (objc_msgSend_oldestCacheEntry(self, v22, v23), v24 < v18))
  {
    LODWORD(v24) = 1068708659;
    if (v19 != 4) {
      *(float *)&double v24 = 1.0;
    }
    float v25 = v19 == 2 ? 1.2 : *(float *)&v24;
    uint64_t v26 = objc_msgSend_maxEntries(self, v22, v23, v24, v10);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v27, v28);
    double v30 = v29;
    objc_msgSend_minAge(self, v31, v32);
    double v34 = v33;
    objc_msgSend_oldestCacheEntry(self, v35, v36);
    if (v37 != 0.0)
    {
      objc_msgSend_oldestCacheEntry(self, v22, v23);
      if (v38 < v30 + v34 * ((2.0 - v25) * -5.0)) {
        goto LABEL_10;
      }
    }
    unint64_t v10 = (unint64_t)(float)-(float)((float)(unint64_t)v26 - (float)((float)v70 * v25));
    if (v10)
    {
LABEL_10:
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v39 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v77 = v10;
        __int16 v78 = 2048;
        v79 = self;
        _os_log_debug_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_DEBUG, "Attempting to evict %lu items from PCS memory cache %p", buf, 0x16u);
      }
      objc_msgSend_keysSortedByValueUsingComparator_(v7, v40, (uint64_t)&unk_1F2042BF0);
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v71, v75, 16);
      if (v43)
      {
        uint64_t v45 = v43;
        unint64_t v46 = 0;
        uint64_t v47 = *(void *)v72;
        double v48 = 1.79769313e308;
        while (2)
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v72 != v47) {
              objc_enumerationMutation(v41);
            }
            uint64_t v50 = *(void *)(*((void *)&v71 + 1) + 8 * i);
            v51 = objc_msgSend_objectForKey_(v7, v44, v50);
            objc_msgSend_lastAccess(v51, v52, v53);
            if (v56 < v48)
            {
              objc_msgSend_lastAccess(v51, v54, v55);
              double v48 = v57;
            }
            if (v46 >= v10)
            {

              goto LABEL_33;
            }
            objc_msgSend_lastAccess(v51, v54, v55);
            if (v60 <= v18 || v70 - v46 > objc_msgSend_maxEntries(self, v58, v59))
            {
              objc_msgSend_removeObjectForKey_(v7, v58, v50);
              ++v46;
              double v48 = 1.79769313e308;
            }
          }
          uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v71, v75, 16);
          if (v45) {
            continue;
          }
          break;
        }
LABEL_33:

        if (v48 < 1.79769313e308) {
          objc_msgSend_setOldestCacheEntry_(self, v61, v62, v48);
        }
        if (v46)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v63 = *MEMORY[0x1E4F1A528];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            unint64_t v77 = v46;
            __int16 v78 = 2048;
            v79 = self;
            _os_log_debug_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_DEBUG, "Evicted %lu items from PCS memory cache %p", buf, 0x16u);
          }
          uint64_t v66 = objc_msgSend_memoryCacheEvictCount(self, v64, v65);
          objc_msgSend_setMemoryCacheEvictCount_(self, v67, v66 + v46);
        }
      }
      else
      {
      }
    }
  }
  if (objc_msgSend_count(v7, v22, v23, v70)) {
    objc_msgSend_startEvictionTimer(CKDPCSMemoryCache, v68, v69);
  }
}

- (void)getPCSDataFromCacheForID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v10, v11);
  dispatch_assert_queue_not_V2(v12);

  uint64_t v15 = objc_msgSend_memoryCacheRequestCount(self, v13, v14);
  objc_msgSend_setMemoryCacheRequestCount_(self, v16, v15 + 1);
  double v17 = sub_1C4D53F40((uint64_t)v9, (const char *)a4);

  objc_super v20 = objc_msgSend_accessQueue(self, v18, v19);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D80A94;
  block[3] = &unk_1E64F0FA0;
  block[4] = self;
  id v24 = v17;
  id v25 = v8;
  id v21 = v8;
  id v22 = v17;
  dispatch_async(v20, block);
}

- (void)setPCSData:(id)a3 forItemID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  uint64_t v15 = objc_msgSend_accessQueue(self, v13, v14);
  dispatch_assert_queue_not_V2(v15);

  uint64_t v16 = sub_1C4D53F40((uint64_t)v12, (const char *)a5);

  uint64_t v19 = objc_msgSend_accessQueue(self, v17, v18);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1C4D80E50;
  v23[3] = &unk_1E64F1B98;
  id v24 = v10;
  id v25 = self;
  id v26 = v16;
  id v27 = v11;
  id v20 = v11;
  id v21 = v16;
  id v22 = v10;
  dispatch_async(v19, v23);
}

- (void)runCacheEviction
{
  uint64_t v4 = objc_msgSend_accessQueue(self, a2, v2);
  dispatch_assert_queue_not_V2(v4);

  v7 = objc_msgSend_accessQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D8118C;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_sync(v7, block);
}

- (void)clearCache
{
  uint64_t v4 = objc_msgSend_accessQueue(self, a2, v2);
  dispatch_assert_queue_not_V2(v4);

  v7 = objc_msgSend_accessQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D81234;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_sync(v7, block);
}

- (unint64_t)_cacheCount
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v4 = objc_msgSend_accessQueue(self, a2, v2);
  dispatch_assert_queue_not_V2(v4);

  v7 = objc_msgSend_accessQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D81414;
  v10[3] = &unk_1E64F1BC0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (BOOL)hasStatusToReport
{
  return objc_msgSend__cacheCount(self, a2, v2) != 0;
}

- (id)CKStatusReportArray
{
  uint64_t v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend__cacheCount(self, v4, v5);
  uint64_t v50 = NSString;
  uint64_t v9 = objc_msgSend_maxEntries(self, v7, v8);
  uint64_t v49 = objc_msgSend_maxEntries(self, v10, v11);
  uint64_t v48 = objc_msgSend_memoryCacheHighwaterCount(self, v12, v13);
  objc_msgSend_minAge(self, v14, v15);
  uint64_t v17 = v16;
  objc_msgSend_oldestCacheEntry(self, v18, v19);
  uint64_t v21 = v20;
  uint64_t v24 = objc_msgSend_memoryCacheHitCount(self, v22, v23);
  uint64_t v27 = objc_msgSend_memoryCacheRequestCount(self, v25, v26);
  uint64_t v30 = objc_msgSend_memoryCacheHitCount(self, v28, v29);
  uint64_t v33 = objc_msgSend_memoryCacheRequestCount(self, v31, v32);
  uint64_t updated = objc_msgSend_memoryCacheUpdateCount(self, v34, v35);
  uint64_t v39 = objc_msgSend_memoryCacheDeleteCount(self, v37, v38);
  uint64_t v42 = objc_msgSend_memoryCacheEvictCount(self, v40, v41);
  if ((unint64_t)(qword_1EBBCFB98 - 1) > 3) {
    v44 = @"unknown";
  }
  else {
    v44 = off_1E64F1BE0[qword_1EBBCFB98 - 1];
  }
  uint64_t v45 = objc_msgSend_stringWithFormat_(v50, v43, @"[%0.2f%% full: %lu/%lu (max: %lu) (%f min, %f oldest)] [Hit rate %0.2f%% (%lu/%lu), Updates: %lu, Deletes: %lu, Evictions: %lu Memory Status: %@]", (float)((float)(unint64_t)v6 / (float)(unint64_t)v9) * 100.0, v6, v49, v48, v17, v21, (float)((float)(unint64_t)v24 / (float)(unint64_t)v27) * 100.0, v30, v33, updated, v39, v42, v44);
  objc_msgSend_addObject_(v3, v46, (uint64_t)v45);

  return v3;
}

- (unint64_t)maxEntries
{
  return self->_maxEntries;
}

- (void)setMaxEntries:(unint64_t)a3
{
  self->_maxEntries = a3;
}

- (double)minAge
{
  return self->_minAge;
}

- (void)setMinAge:(double)a3
{
  self->_minAge = a3;
}

- (NSMutableDictionary)cacheEntries
{
  return self->_cacheEntries;
}

- (void)setCacheEntries:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (double)oldestCacheEntry
{
  return self->_oldestCacheEntry;
}

- (void)setOldestCacheEntry:(double)a3
{
  self->_oldestCacheEntry = a3;
}

- (unint64_t)memoryCacheRequestCount
{
  return self->_memoryCacheRequestCount;
}

- (void)setMemoryCacheRequestCount:(unint64_t)a3
{
  self->_memoryCacheRequestCount = a3;
}

- (unint64_t)memoryCacheHitCount
{
  return self->_memoryCacheHitCount;
}

- (void)setMemoryCacheHitCount:(unint64_t)a3
{
  self->_memoryCacheHitCount = a3;
}

- (unint64_t)memoryCacheHighwaterCount
{
  return self->_memoryCacheHighwaterCount;
}

- (void)setMemoryCacheHighwaterCount:(unint64_t)a3
{
  self->_memoryCacheHighwaterCount = a3;
}

- (unint64_t)memoryCacheDeleteCount
{
  return self->_memoryCacheDeleteCount;
}

- (void)setMemoryCacheDeleteCount:(unint64_t)a3
{
  self->_memoryCacheDeleteCount = a3;
}

- (unint64_t)memoryCacheUpdateCount
{
  return self->_memoryCacheUpdateCount;
}

- (void)setMemoryCacheUpdateCount:(unint64_t)a3
{
  self->_memoryCacheUpdateCount = a3;
}

- (unint64_t)memoryCacheEvictCount
{
  return self->_memoryCacheEvictCount;
}

- (void)setMemoryCacheEvictCount:(unint64_t)a3
{
  self->_memoryCacheEvictCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_cacheEntries, 0);
}

@end