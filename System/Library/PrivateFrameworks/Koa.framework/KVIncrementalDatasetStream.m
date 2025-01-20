@interface KVIncrementalDatasetStream
- (BOOL)addOrUpdateCascadeItem:(id)a3 error:(id *)a4;
- (BOOL)addOrUpdateItem:(id)a3 error:(id *)a4;
- (BOOL)removeItemWithItemId:(id)a3 error:(id *)a4;
- (unint64_t)priorVersion;
@end

@implementation KVIncrementalDatasetStream

- (BOOL)removeItemWithItemId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12 = objc_msgSend_donation(self, v7, v8, v9, v10, v11);
  id v21 = 0;
  char v16 = objc_msgSend_removeItemWithSourceItemIdentifier_error_(v12, v13, (uint64_t)v6, (uint64_t)&v21, v14, v15);

  id v17 = v21;
  if ((v16 & 1) == 0)
  {
    v18 = sub_1BC3DC60C(v17);
    v19 = v18;
    if (a4 && v18) {
      *a4 = v18;
    }
  }
  return v16;
}

- (BOOL)addOrUpdateItem:(id)a3 error:(id *)a4
{
  uint64_t v11 = objc_msgSend__cascadeItemFromItem_error_(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  if (v11) {
    char updated = objc_msgSend_addOrUpdateCascadeItem_error_(self, v8, (uint64_t)v11, (uint64_t)a4, v9, v10);
  }
  else {
    char updated = 0;
  }

  return updated;
}

- (BOOL)addOrUpdateCascadeItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12 = objc_msgSend_donation(self, v7, v8, v9, v10, v11);
  id v21 = 0;
  char updated = objc_msgSend_addOrUpdateItem_error_(v12, v13, (uint64_t)v6, (uint64_t)&v21, v14, v15);

  id v17 = v21;
  if ((updated & 1) == 0)
  {
    v18 = sub_1BC3DC60C(v17);
    v19 = v18;
    if (a4 && v18) {
      *a4 = v18;
    }
  }
  return updated;
}

- (unint64_t)priorVersion
{
  id v6 = objc_msgSend_donation(self, a2, v2, v3, v4, v5);
  unint64_t v12 = objc_msgSend_priorVersion(v6, v7, v8, v9, v10, v11);

  return v12;
}

@end