@interface CKDistributedTimestampClockVector
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setBackingState:(id)a3;
- (void)addClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4;
- (void)addClockValuesInIndexSet:(id)a3 withClockType:(unsigned __int8)a4 forSiteIdentifier:(id)a5;
- (void)intersectVector:(id)a3;
- (void)minusVector:(id)a3;
- (void)unionVector:(id)a3;
@end

@implementation CKDistributedTimestampClockVector

- (void)_setBackingState:(id)a3
{
  id v7 = (id)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, v3);
  objc_msgSend___setBackingStateNoCopy_(self, v5, (uint64_t)v7, v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  return v4;
}

- (void)intersectVector:(id)a3
{
  id v17 = a3;
  uint64_t v7 = objc_msgSend_backingVector(self, v4, v5, v6);
  v11 = objc_msgSend_backingVector(v17, v8, v9, v10);
  uint64_t v15 = objc_msgSend_vectorExpansionState(self, v12, v13, v14);
  objc_msgSend_clockVector_intersectVector_withExpansionState_(v7, v16, (uint64_t)v11, v15);
}

- (void)minusVector:(id)a3
{
  id v17 = a3;
  uint64_t v7 = objc_msgSend_backingVector(self, v4, v5, v6);
  v11 = objc_msgSend_backingVector(v17, v8, v9, v10);
  uint64_t v15 = objc_msgSend_vectorExpansionState(self, v12, v13, v14);
  objc_msgSend_clockVector_minusVector_withExpansionState_(v7, v16, (uint64_t)v11, v15);
}

- (void)unionVector:(id)a3
{
  id v39 = a3;
  uint64_t v7 = objc_msgSend_backingVector(self, v4, v5, v6);
  objc_sync_enter(v7);
  v11 = objc_msgSend_backingVector(v39, v8, v9, v10);
  objc_sync_enter(v11);
  uint64_t v15 = objc_msgSend_backingVector(self, v12, v13, v14);
  v19 = objc_msgSend_backingVector(v39, v16, v17, v18);
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v15, v20, (uint64_t)v19, v21);

  v25 = objc_msgSend_backingVector(self, v22, v23, v24);
  v29 = objc_msgSend_backingVector(v39, v26, v27, v28);
  objc_msgSend_addAllClockValuesFromVector_(v25, v30, (uint64_t)v29, v31);

  objc_sync_exit(v11);
  v35 = objc_msgSend_backingVector(self, v32, v33, v34);
  objc_msgSend_clockVector_maintainInvariants(v35, v36, v37, v38);

  objc_sync_exit(v7);
}

- (void)addClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4
{
}

- (void)addClockValuesInIndexSet:(id)a3 withClockType:(unsigned __int8)a4 forSiteIdentifier:(id)a5
{
  uint64_t v6 = a4;
  id v30 = a3;
  id v8 = a5;
  v12 = objc_msgSend_backingVector(self, v9, v10, v11);
  objc_sync_enter(v12);
  v16 = objc_msgSend_backingVector(self, v13, v14, v15);
  objc_msgSend_clockVector_checkInvariantsAgainstClockValues_withSiteIdentifier_ofType_(v16, v17, (uint64_t)v30, (uint64_t)v8, v6);

  uint64_t v21 = objc_msgSend_backingVector(self, v18, v19, v20);
  objc_msgSend_addClockValuesInIndexSet_withAttribute_forSiteIdentifier_(v21, v22, (uint64_t)v30, (v6 << 8), v8);

  v26 = objc_msgSend_backingVector(self, v23, v24, v25);
  objc_msgSend_clockVector_maintainInvariants(v26, v27, v28, v29);

  objc_sync_exit(v12);
}

@end