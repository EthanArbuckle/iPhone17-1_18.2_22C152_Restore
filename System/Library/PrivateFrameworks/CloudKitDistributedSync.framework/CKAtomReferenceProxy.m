@interface CKAtomReferenceProxy
- (id)location;
- (id)reference;
- (id)timestamp;
- (unint64_t)size;
- (unsigned)type;
@end

@implementation CKAtomReferenceProxy

- (unint64_t)size
{
  v4 = objc_msgSend_backingStore(self, a2, v2);
  v6 = v4;
  if (v4)
  {
    v7 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_valueSizeForField_(v7, v11, v10[24]);

    v15 = objc_msgSend_location(self, v13, v14);
    uint64_t v18 = objc_msgSend_size(v15, v16, v17);

    v21 = objc_msgSend_timestamp(self, v19, v20);
    unint64_t v24 = v18 + v12 + objc_msgSend_size(v21, v22, v23);
  }
  else
  {
    unint64_t v24 = 0;
  }

  return v24;
}

- (unsigned)type
{
  v4 = objc_msgSend_backingStore(self, a2, v2);
  v6 = v4;
  if (v4)
  {
    unsigned __int8 v18 = 0;
    v7 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v10 = objc_msgSend_binding(v6, v8, v9);
    uint64_t v11 = v10[24];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_copyData_forField_inStruct_(v7, v14, (uint64_t)&v18, v11, &v17);

    unsigned __int8 v15 = v18;
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (id)location
{
  v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[25], 0);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)timestamp
{
  v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[8], 0);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)reference
{
  v3 = [CKAtomReference alloc];
  v6 = objc_msgSend_location(self, v4, v5);
  uint64_t v9 = objc_msgSend_mergeableValueID(v6, v7, v8);
  uint64_t v12 = objc_msgSend_timestamp(self, v10, v11);
  unsigned __int8 v15 = objc_msgSend_timestamp(v12, v13, v14);
  uint64_t v18 = objc_msgSend_type(self, v16, v17);
  uint64_t v20 = objc_msgSend_initWithMergeableValueID_timestamp_type_(v3, v19, (uint64_t)v9, v15, v18);

  return v20;
}

@end