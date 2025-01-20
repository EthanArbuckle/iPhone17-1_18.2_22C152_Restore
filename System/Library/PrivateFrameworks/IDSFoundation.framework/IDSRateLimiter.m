@interface IDSRateLimiter
- (BOOL)underLimitForItem:(id)a3;
- (IDSRateLimiter)initWithLimit:(int64_t)a3 timeLimit:(double)a4;
- (NSMutableDictionary)cacheMap;
- (double)timeLimit;
- (double)timeToUnderLimit:(id)a3;
- (id)_unlockedDescription;
- (id)description;
- (int64_t)limit;
- (os_unfair_lock_s)lock;
- (void)cleanupExpiredItems;
- (void)clearAllItems;
- (void)clearItem:(id)a3;
- (void)noteItem:(id)a3;
- (void)setCacheMap:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setTimeLimit:(double)a3;
@end

@implementation IDSRateLimiter

- (IDSRateLimiter)initWithLimit:(int64_t)a3 timeLimit:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_encryption(MEMORY[0x1E4F6C350], a2, a3, a4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v14 = a3;
    __int16 v15 = 2048;
    double v16 = a4;
    _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "Setting up rate limiter {limit: %ld, timeLimit: %f}", buf, 0x16u);
  }

  v12.receiver = self;
  v12.super_class = (Class)IDSRateLimiter;
  v8 = [(IDSRateLimiter *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_limit = a3;
    v8->_timeLimit = a4;
    cacheMap = v8->_cacheMap;
    v8->_cacheMap = 0;

    v9->_lock._os_unfair_lock_opaque = 0;
  }
  return v9;
}

- (BOOL)underLimitForItem:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_cleanupExpiredItems(self, v5, v6, v7);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v12 = objc_msgSend_cacheMap(self, v9, v10, v11);
  __int16 v15 = objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v4, v14);

  if (v15)
  {
    uint64_t v19 = objc_msgSend_count(v15, v16, v17, v18);
    BOOL v23 = v19 < objc_msgSend_limit(self, v20, v21, v22);
  }
  else
  {
    BOOL v23 = 1;
  }
  v24 = objc_msgSend_encryption(MEMORY[0x1E4F6C350], v16, v17, v18);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    if (v23) {
      v28 = @"YES";
    }
    else {
      v28 = @"NO";
    }
    v29 = objc_msgSend__unlockedDescription(self, v25, v26, v27);
    int v31 = 138412802;
    v32 = v28;
    __int16 v33 = 2112;
    id v34 = v4;
    __int16 v35 = 2112;
    v36 = v29;
    _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_INFO, "Checking under limit {underLimit: %@, item: %@, cache: %@}", (uint8_t *)&v31, 0x20u);
  }
  os_unfair_lock_unlock(p_lock);

  return v23;
}

- (void)noteItem:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_cleanupExpiredItems(self, v5, v6, v7);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v12 = objc_msgSend_cacheMap(self, v9, v10, v11);

  if (!v12)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend_setCacheMap_(self, v17, (uint64_t)v16, v18);
  }
  uint64_t v19 = objc_msgSend_cacheMap(self, v13, v14, v15);
  double v22 = objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v4, v21);

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v23, v24, v25);
  double v29 = v28;
  if (v22) {
    uint64_t v30 = objc_msgSend_count(v22, v26, v27, v28) + 1;
  }
  else {
    uint64_t v30 = 1;
  }
  int v31 = [IDSNegativeInfo alloc];
  __int16 v33 = objc_msgSend_initWithTime_count_(v31, v32, v30, v29);
  uint64_t v37 = objc_msgSend_cacheMap(self, v34, v35, v36);
  objc_msgSend_setObject_forKeyedSubscript_(v37, v38, (uint64_t)v33, v39, v4);

  v43 = objc_msgSend_encryption(MEMORY[0x1E4F6C350], v40, v41, v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v47 = objc_msgSend__unlockedDescription(self, v44, v45, v46);
    int v48 = 138412546;
    id v49 = v4;
    __int16 v50 = 2112;
    v51 = v47;
    _os_log_impl(&dword_19D9BE000, v43, OS_LOG_TYPE_DEFAULT, "Noting item {item: %@, cache: %@}", (uint8_t *)&v48, 0x16u);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)clearItem:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = objc_msgSend_cacheMap(self, v6, v7, v8);
  objc_msgSend_removeObjectForKey_(v9, v10, (uint64_t)v4, v11);

  double v15 = objc_msgSend_cacheMap(self, v12, v13, v14);
  uint64_t v19 = objc_msgSend_count(v15, v16, v17, v18);

  if (!v19) {
    objc_msgSend_setCacheMap_(self, v20, 0, v22);
  }
  BOOL v23 = objc_msgSend_encryption(MEMORY[0x1E4F6C350], v20, v21, v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_msgSend__unlockedDescription(self, v24, v25, v26);
    int v28 = 138412546;
    id v29 = v4;
    __int16 v30 = 2112;
    int v31 = v27;
    _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "Clearing item {item: %@, cache: %@}", (uint8_t *)&v28, 0x16u);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)clearAllItems
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = objc_msgSend_cacheMap(self, v4, v5, v6);
  objc_msgSend_removeAllObjects(v7, v8, v9, v10);

  objc_msgSend_setCacheMap_(self, v11, 0, v12);
  id v16 = objc_msgSend_encryption(MEMORY[0x1E4F6C350], v13, v14, v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend__unlockedDescription(self, v17, v18, v19);
    int v21 = 138412290;
    double v22 = v20;
    _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "Clearing all items { cache: %@}", (uint8_t *)&v21, 0xCu);
  }
  os_unfair_lock_unlock(p_lock);
}

- (double)timeToUnderLimit:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_cleanupExpiredItems(self, v5, v6, v7);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v12 = objc_msgSend_cacheMap(self, v9, v10, v11);
  double v15 = objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v4, v14);

  double v19 = 0.0;
  if (v15)
  {
    uint64_t v20 = objc_msgSend_count(v15, v16, v17, v18);
    if (v20 >= objc_msgSend_limit(self, v21, v22, v23))
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v16, v17, v18);
      double v25 = v24;
      objc_msgSend_timeLimit(self, v26, v27, v24);
      double v29 = v28;
      objc_msgSend_time(v15, v30, v31, v28);
      double v18 = v29 - (v25 - v32);
      double v19 = fmax(v18, 0.0);
    }
  }
  __int16 v33 = objc_msgSend_encryption(MEMORY[0x1E4F6C350], v16, v17, v18);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    uint64_t v37 = objc_msgSend__unlockedDescription(self, v34, v35, v36);
    int v39 = 134218498;
    double v40 = v19;
    __int16 v41 = 2112;
    id v42 = v4;
    __int16 v43 = 2112;
    v44 = v37;
    _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_INFO, "Checking time until {timeUntilUnder: %f, item: %@, cache: %@}", (uint8_t *)&v39, 0x20u);
  }
  os_unfair_lock_unlock(p_lock);

  return v19;
}

- (void)cleanupExpiredItems
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_unfair_lock_lock(&self->_lock);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v6 = objc_msgSend_cacheMap(self, v4, v5, 0.0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v94, v8, v103, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v95 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void *)(*((void *)&v94 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_cacheMap(self, v10, v11, v12);
        uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, v16, v19);

        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v21, v22, v23);
        double v25 = v24;
        objc_msgSend_time(v20, v26, v27, v24);
        double v29 = v25 - v28;
        objc_msgSend_timeLimit(self, v30, v31, v28);
        if (v29 > v33) {
          objc_msgSend_addObject_(v3, v32, v16, v33);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v94, v12, v103, 16);
    }
    while (v13);
  }

  uint64_t v37 = objc_msgSend_count(v3, v34, v35, v36);
  __int16 v41 = objc_msgSend_encryption(MEMORY[0x1E4F6C350], v38, v39, v40);
  BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
  if (v37)
  {
    if (v42)
    {
      double v46 = objc_msgSend__unlockedDescription(self, v43, v44, v45);
      *(_DWORD *)buf = 138412546;
      id v100 = v3;
      __int16 v101 = 2112;
      v102 = v46;
      _os_log_impl(&dword_19D9BE000, v41, OS_LOG_TYPE_INFO, "Cleaning expired negative items {removeItems: %@, cache: %@}", buf, 0x16u);
    }
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v47, v48, v49);
    double v51 = v50;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v52 = v3;
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v90, v54, v98, 16);
    if (v55)
    {
      uint64_t v59 = v55;
      uint64_t v60 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v59; ++j)
        {
          if (*(void *)v91 != v60) {
            objc_enumerationMutation(v52);
          }
          uint64_t v62 = *(void *)(*((void *)&v90 + 1) + 8 * j);
          v63 = objc_msgSend_cacheMap(self, v56, v57, v58);
          v66 = objc_msgSend_objectForKeyedSubscript_(v63, v64, v62, v65);

          if (v66)
          {
            objc_msgSend_time(v66, v67, v68, v69);
            double v71 = v51 - v70;
            objc_msgSend_timeLimit(self, v72, v73, v70);
            if (v71 > v76)
            {
              v77 = objc_msgSend_cacheMap(self, v74, v75, v76);
              objc_msgSend_removeObjectForKey_(v77, v78, v62, v79);
            }
          }
        }
        uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v56, (uint64_t)&v90, v58, v98, 16);
      }
      while (v59);
    }

    v83 = objc_msgSend_cacheMap(self, v80, v81, v82);
    uint64_t v87 = objc_msgSend_count(v83, v84, v85, v86);

    if (!v87) {
      objc_msgSend_setCacheMap_(self, v88, 0, v89);
    }
  }
  else
  {
    if (v42)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v41, OS_LOG_TYPE_INFO, "No expired items to clean", buf, 2u);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v7 = objc_msgSend_cacheMap(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);

  os_unfair_lock_unlock(p_lock);
  double v12 = NSString;
  uint64_t v13 = objc_opt_class();
  double v15 = objc_msgSend_stringWithFormat_(v12, v14, @"<%@: %p> limit: %ld timeLimit: %f map: %@", self->_timeLimit, v13, self, self->_limit, *(void *)&self->_timeLimit, v11);

  return v15;
}

- (id)_unlockedDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p> limit: %ld timeLimit: %f map: %@", self->_timeLimit, v4, self, self->_limit, *(void *)&self->_timeLimit, self->_cacheMap);
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (double)timeLimit
{
  return self->_timeLimit;
}

- (void)setTimeLimit:(double)a3
{
  self->_timeLimit = a3;
}

- (NSMutableDictionary)cacheMap
{
  return self->_cacheMap;
}

- (void)setCacheMap:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end