@interface CKDistributedTimestampMutableSparseVector
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setBackingState:(id)a3;
- (void)addClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4;
- (void)intersectVector:(id)a3;
- (void)minusVector:(id)a3;
- (void)removeClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4;
- (void)unionVector:(id)a3;
@end

@implementation CKDistributedTimestampMutableSparseVector

- (void)_setBackingState:(id)a3
{
  v5 = objc_msgSend_CKDeepCopyWithLeafNodeCopyBlock_(a3, a2, (uint64_t)&unk_1ED7EF638, v3);
  id v11 = (id)objc_msgSend_mutableCopy(v5, v6, v7, v8);

  objc_msgSend___setBackingStateNoCopy_(self, v9, (uint64_t)v11, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  v4 = objc_opt_new();
  uint64_t v8 = objc_msgSend_clockValues(v3, v5, v6, v7);
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  objc_sync_exit(v3);
  return v4;
}

- (void)minusVector:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = v4;
  objc_sync_enter(v6);
  if (objc_msgSend_timestampCount(v5, v7, v8, v9) && objc_msgSend_timestampCount(v6, v10, v11, v12))
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_18B183720;
    v13[3] = &unk_1E54658C0;
    v13[4] = v5;
    id v14 = v6;
    sub_18B183528(v5, v14, v13);
  }
  objc_sync_exit(v6);

  objc_sync_exit(v5);
}

- (void)intersectVector:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = v4;
  objc_sync_enter(v6);
  if (objc_msgSend_timestampCount(v5, v7, v8, v9) && objc_msgSend_timestampCount(v6, v10, v11, v12))
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_18B183998;
    v17[3] = &unk_1E54658C0;
    v17[4] = v5;
    id v18 = v6;
    sub_18B183528(v5, v18, v17);
  }
  else
  {
    v13 = objc_msgSend_clockValues(v5, v10, v11, v12);
    objc_msgSend_removeAllObjects(v13, v14, v15, v16);
  }
  objc_sync_exit(v6);

  objc_sync_exit(v5);
}

- (void)unionVector:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_18B183B98;
  v6[3] = &unk_1E54658C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  sub_18B183528(self, v5, v6);
}

- (void)addClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  if (objc_msgSend_count(v33, v8, v9, v10))
  {
    id v14 = objc_msgSend_clockValues(v7, v11, v12, v13);
    v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v6, v16);

    v21 = objc_msgSend_clockValues(v7, v18, v19, v20);
    v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v6, v23);

    if (!v24)
    {
      uint64_t v27 = objc_opt_new();

      v31 = objc_msgSend_clockValues(v7, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v31, v32, v27, (uint64_t)v6);

      v17 = (void *)v27;
    }
    objc_msgSend_addIndexes_(v17, v25, (uint64_t)v33, v26);
  }
  objc_sync_exit(v7);
}

- (void)removeClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  if (objc_msgSend_count(v28, v8, v9, v10))
  {
    id v14 = objc_msgSend_clockValues(v7, v11, v12, v13);
    v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v6, v16);

    objc_msgSend_removeIndexes_(v17, v18, (uint64_t)v28, v19);
    if (!objc_msgSend_count(v17, v20, v21, v22))
    {
      uint64_t v26 = objc_msgSend_clockValues(v7, v23, v24, v25);
      objc_msgSend_setObject_forKeyedSubscript_(v26, v27, 0, (uint64_t)v6);
    }
  }
  objc_sync_exit(v7);
}

@end