@interface CKAtomReferenceMutableProxy
- (id)location;
- (id)timestamp;
- (void)assignLocationFromProxy:(id)a3;
- (void)assignTimestampFromProxy:(id)a3;
- (void)copyFromReadProxy:(id)a3;
- (void)copyFromReference:(id)a3;
- (void)setType:(unsigned __int8)a3;
@end

@implementation CKAtomReferenceMutableProxy

- (void)copyFromReadProxy:(id)a3
{
  id v45 = a3;
  v7 = objc_msgSend_backingStore(self, v5, v6);
  if (v7)
  {
    id v10 = v45;
    if (v10)
    {
      v11 = objc_msgSend_binding(v7, v8, v9);
      v14 = objc_msgSend_binding(v7, v12, v13);
      uint64_t v15 = objc_opt_class();
      uint64_t v17 = objc_msgSend_structTokenForClass_(v14, v16, v15);
      objc_msgSend_proxyClassForStructToken_(v11, v18, v17);
      v19 = (objc_class *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
        v43 = NSStringFromClass(v19);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v44, (uint64_t)a2, self, @"CKAtomSerialization.mm", 946, @"Proxy needs to be of type %@", v43);
      }
      uint64_t v22 = objc_msgSend_type(v10, v20, v21);
      objc_msgSend_setType_(self, v23, v22);
      v26 = objc_msgSend_location(v10, v24, v25);

      if (v26)
      {
        v29 = objc_msgSend_location(self, v27, v28);
        v32 = objc_msgSend_location(v10, v30, v31);
        objc_msgSend_copyFromReadProxy_(v29, v33, (uint64_t)v32);
      }
      v34 = objc_msgSend_timestamp(v10, v27, v28);

      if (v34)
      {
        v37 = objc_msgSend_timestamp(self, v35, v36);
        v40 = objc_msgSend_timestamp(v10, v38, v39);
        objc_msgSend_copyFromReadProxy_(v37, v41, (uint64_t)v40);
      }
    }
  }
}

- (void)setType:(unsigned __int8)a3
{
  unsigned __int8 v16 = a3;
  v4 = objc_msgSend_backingStore(self, a2, a3);
  uint64_t v6 = v4;
  if (v4)
  {
    v7 = objc_msgSend_writerForProxy_(v4, v5, (uint64_t)self);
    id v10 = objc_msgSend_binding(v6, v8, v9);
    uint64_t v11 = v10[24];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v7, v14, (uint64_t)&v16, "C", v11, &v15);
  }
}

- (id)location
{
  uint64_t v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    id v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[25], 1);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)assignLocationFromProxy:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_backingStore(self, v5, v6);
  uint64_t v9 = v7;
  if (v7)
  {
    v12 = objc_msgSend_writerForProxy_(v7, v8, (uint64_t)self);
    if (v4) {
      objc_msgSend_structInstance(v4, v10, v11);
    }
    else {
      memset(v19, 0, sizeof(v19));
    }
    uint64_t v13 = objc_msgSend_binding(v9, v10, v11);
    uint64_t v14 = v13[25];
    objc_msgSend_structInstance(self, v15, v16);
    objc_msgSend_assignStruct_toReference_inStruct_(v12, v17, (uint64_t)v19, v14, &v18);
  }
}

- (id)timestamp
{
  uint64_t v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    id v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[8], 1);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)assignTimestampFromProxy:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_backingStore(self, v5, v6);
  uint64_t v9 = v7;
  if (v7)
  {
    v12 = objc_msgSend_writerForProxy_(v7, v8, (uint64_t)self);
    if (v4) {
      objc_msgSend_structInstance(v4, v10, v11);
    }
    else {
      memset(v19, 0, sizeof(v19));
    }
    uint64_t v13 = objc_msgSend_binding(v9, v10, v11);
    uint64_t v14 = v13[8];
    objc_msgSend_structInstance(self, v15, v16);
    objc_msgSend_assignStruct_toReference_inStruct_(v12, v17, (uint64_t)v19, v14, &v18);
  }
}

- (void)copyFromReference:(id)a3
{
  id v26 = a3;
  uint64_t v6 = objc_msgSend_type(v26, v4, v5);
  objc_msgSend_setType_(self, v7, v6);
  id v10 = objc_msgSend_mergeableValueID(v26, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend_location(self, v11, v12);
    uint64_t v16 = objc_msgSend_mergeableValueID(v26, v14, v15);
    objc_msgSend_copyFromMergeableValueID_(v13, v17, (uint64_t)v16);
  }
  uint64_t v18 = objc_msgSend_timestamp(v26, v11, v12);

  if (v18)
  {
    uint64_t v21 = objc_msgSend_timestamp(self, v19, v20);
    v24 = objc_msgSend_timestamp(v26, v22, v23);
    objc_msgSend_copyFromTimestamp_(v21, v25, (uint64_t)v24);
  }
}

@end