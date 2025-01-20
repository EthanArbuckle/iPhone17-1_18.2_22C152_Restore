@interface CKXProxyCache
- (CKXProxyCache)init;
- (NSMapTable)cachedProxies;
- (NSMutableArray)scopedProxies;
- (id)debugDescription;
- (id)proxyForClass:(Class)a3 withScope:(int64_t)a4;
- (int64_t)totalProxiesCreated;
- (int64_t)totalProxiesReclaimed;
- (int64_t)totalProxiesRetainedOutOfScope;
- (void)_putBackProxyWithoutCheckingScope:(id)a3;
- (void)dealloc;
- (void)putBackAllProxiesWithScope:(int64_t)a3;
- (void)setCachedProxies:(id)a3;
- (void)setScopedProxies:(id)a3;
- (void)setTotalProxiesCreated:(int64_t)a3;
- (void)setTotalProxiesReclaimed:(int64_t)a3;
- (void)setTotalProxiesRetainedOutOfScope:(int64_t)a3;
@end

@implementation CKXProxyCache

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_totalProxiesRetainedOutOfScope(self, a2, v2) >= 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v4 = (void *)*MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      v5 = v4;
      *(_DWORD *)buf = 134218496;
      uint64_t v14 = objc_msgSend_totalProxiesRetainedOutOfScope(self, v6, v7);
      __int16 v15 = 2048;
      uint64_t v16 = objc_msgSend_totalProxiesCreated(self, v8, v9);
      __int16 v17 = 2048;
      uint64_t v18 = objc_msgSend_totalProxiesReclaimed(self, v10, v11);
      _os_log_debug_impl(&dword_1DD237000, v5, OS_LOG_TYPE_DEBUG, "%lu proxies retained out of expected scope (%lu created, %lu reclaimed). This may cause degraded performance if it happens too often.", buf, 0x20u);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CKXProxyCache;
  [(CKXProxyCache *)&v12 dealloc];
}

- (CKXProxyCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)CKXProxyCache;
  v4 = [(CKXProxyCache *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v2, v3);
    cachedProxies = v4->_cachedProxies;
    v4->_cachedProxies = (NSMapTable *)v5;

    uint64_t v7 = objc_opt_new();
    scopedProxies = v4->_scopedProxies;
    v4->_scopedProxies = (NSMutableArray *)v7;
  }
  return v4;
}

- (id)proxyForClass:(Class)a3 withScope:(int64_t)a4
{
  uint64_t v7 = objc_msgSend_cachedProxies(self, a2, (uint64_t)a3);
  uint64_t v9 = objc_msgSend_objectForKey_(v7, v8, (uint64_t)a3);

  if (objc_msgSend_count(v9, v10, v11))
  {
    inited = objc_msgSend_lastObject(v9, v12, v13);
    objc_msgSend_removeLastObject(v9, v15, v16);
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v23 = [a3 alloc];
  inited = objc_msgSend_initInternal(v23, v24, v25);
  uint64_t v28 = objc_msgSend_totalProxiesCreated(self, v26, v27);
  objc_msgSend_setTotalProxiesCreated_(self, v29, v28 + 1);
  if (a4)
  {
LABEL_3:
    objc_msgSend_setScope_(inited, v17, a4);
    v20 = objc_msgSend_scopedProxies(self, v18, v19);
    objc_msgSend_addObject_(v20, v21, (uint64_t)inited);
  }
LABEL_4:

  return inited;
}

- (void)_putBackProxyWithoutCheckingScope:(id)a3
{
  id v30 = a3;
  v6 = objc_msgSend_cachedProxies(self, v4, v5);
  uint64_t v7 = objc_opt_class();
  uint64_t v9 = objc_msgSend_objectForKey_(v6, v8, v7);

  if (!v9)
  {
    objc_super v12 = objc_msgSend_cachedProxies(self, v10, v11);
    uint64_t v13 = objc_opt_new();
    uint64_t v14 = objc_opt_class();
    objc_msgSend_setObject_forKey_(v12, v15, (uint64_t)v13, v14);
  }
  uint64_t v16 = (void *)MEMORY[0x1E01B2270]();
  objc_msgSend_reset(v30, v17, v18);
  v21 = objc_msgSend_cachedProxies(self, v19, v20);
  uint64_t v22 = objc_opt_class();
  v24 = objc_msgSend_objectForKey_(v21, v23, v22);
  objc_msgSend_addObject_(v24, v25, (uint64_t)v30);

  uint64_t v28 = objc_msgSend_totalProxiesReclaimed(self, v26, v27);
  objc_msgSend_setTotalProxiesReclaimed_(self, v29, v28 + 1);
}

- (void)putBackAllProxiesWithScope:(int64_t)a3
{
  uint64_t v5 = objc_opt_new();
  v8 = objc_msgSend_scopedProxies(self, v6, v7);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1DD316CD4;
  v31[3] = &unk_1E6CBAEE8;
  int64_t v33 = a3;
  v31[4] = self;
  id v9 = v5;
  id v32 = v9;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v10, (uint64_t)v31);

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1DD316D80;
  v26[3] = &unk_1E6CBAF10;
  v26[4] = &v27;
  objc_msgSend_enumerateRangesUsingBlock_(v9, v11, (uint64_t)v26);
  uint64_t v14 = v28[3];
  if (v14)
  {
    if (v14 == 1)
    {
      uint64_t Index = objc_msgSend_lastIndex(v9, v12, v13);
      uint64_t v18 = objc_msgSend_scopedProxies(self, v16, v17);
      if (Index + 1 == objc_msgSend_count(v18, v19, v20))
      {
        unint64_t v21 = v28[3];

        if (v21 < 2) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v22 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_error_impl(&dword_1DD237000, v22, OS_LOG_TYPE_ERROR, "Proxies not put back in expected order. This may cause degraded performance if it happens too often.", v25, 2u);
    }
  }
LABEL_11:
  id v23 = objc_msgSend_scopedProxies(self, v12, v13);
  objc_msgSend_removeObjectsAtIndexes_(v23, v24, (uint64_t)v9);

  _Block_object_dispose(&v27, 8);
}

- (id)debugDescription
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  v6 = objc_msgSend_cachedProxies(self, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    objc_msgSend_appendFormat_(v3, v10, @"Proxies by class:\n");
    objc_super v12 = objc_opt_new();
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    __int16 v15 = objc_msgSend_cachedProxies(self, v13, v14);
    uint64_t v18 = objc_msgSend_keyEnumerator(v15, v16, v17);

    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v59, v63, 16);
    if (v20)
    {
      uint64_t v22 = v20;
      uint64_t v23 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v60 != v23) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend_addObject_(v12, v21, *(void *)(*((void *)&v59 + 1) + 8 * i));
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v59, v63, 16);
      }
      while (v22);
    }

    v26 = objc_msgSend_sortedArrayUsingComparator_(v12, v25, (uint64_t)&unk_1F387CF40);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = sub_1DD317184;
    v57[3] = &unk_1E6CBAF58;
    v57[4] = self;
    id v58 = v3;
    objc_msgSend_enumerateObjectsUsingBlock_(v26, v27, (uint64_t)v57);
  }
  uint64_t v28 = objc_msgSend_scopedProxies(self, v10, v11);
  uint64_t v31 = objc_msgSend_count(v28, v29, v30);

  if (v31)
  {
    v34 = objc_opt_new();
    v37 = objc_msgSend_scopedProxies(self, v35, v36);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = sub_1DD317224;
    v55[3] = &unk_1E6CBAF80;
    id v56 = v34;
    id v38 = v34;
    objc_msgSend_enumerateObjectsUsingBlock_(v37, v39, (uint64_t)v55);

    objc_msgSend_appendFormat_(v3, v40, @"Active proxies by scope:\n");
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = sub_1DD317310;
    v53[3] = &unk_1E6CBAFA8;
    id v54 = v3;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v38, v41, (uint64_t)v53);
  }
  else if (!v9)
  {
    objc_msgSend_appendFormat_(v3, v32, @"No proxies in cache\n");
  }
  uint64_t v42 = objc_msgSend_totalProxiesCreated(self, v32, v33);
  objc_msgSend_appendFormat_(v3, v43, @"Total proxies created: %ld\n", v42);
  uint64_t v46 = objc_msgSend_totalProxiesReclaimed(self, v44, v45);
  objc_msgSend_appendFormat_(v3, v47, @"Total proxies reclaimed: %ld\n", v46);
  uint64_t v50 = objc_msgSend_totalProxiesRetainedOutOfScope(self, v48, v49);
  objc_msgSend_appendFormat_(v3, v51, @"Total proxies retained out of scope: %ld\n", v50);
  return v3;
}

- (int64_t)totalProxiesCreated
{
  return self->_totalProxiesCreated;
}

- (void)setTotalProxiesCreated:(int64_t)a3
{
  self->_totalProxiesCreated = a3;
}

- (int64_t)totalProxiesReclaimed
{
  return self->_totalProxiesReclaimed;
}

- (void)setTotalProxiesReclaimed:(int64_t)a3
{
  self->_totalProxiesReclaimed = a3;
}

- (int64_t)totalProxiesRetainedOutOfScope
{
  return self->_totalProxiesRetainedOutOfScope;
}

- (void)setTotalProxiesRetainedOutOfScope:(int64_t)a3
{
  self->_totalProxiesRetainedOutOfScope = a3;
}

- (NSMapTable)cachedProxies
{
  return self->_cachedProxies;
}

- (void)setCachedProxies:(id)a3
{
}

- (NSMutableArray)scopedProxies
{
  return self->_scopedProxies;
}

- (void)setScopedProxies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopedProxies, 0);
  objc_storeStrong((id *)&self->_cachedProxies, 0);
}

@end