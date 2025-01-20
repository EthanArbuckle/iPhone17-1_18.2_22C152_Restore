@interface CKDistributedTimestampMutableProxy
- (id)distributedSiteIdentifier;
- (void)assignDistributedSiteIdentifierFromProxy:(id)a3;
- (void)copyFromReadProxy:(id)a3;
- (void)copyFromTimestamp:(id)a3;
- (void)setClock:(unint64_t)a3;
- (void)setModifier:(unsigned __int8)a3;
- (void)setSiteIdentifier:(id)a3;
- (void)setSiteIdentifierBytes:(void *)a3 length:(unint64_t)a4;
- (void)setUnordered:(BOOL)a3;
@end

@implementation CKDistributedTimestampMutableProxy

- (void)copyFromReadProxy:(id)a3
{
  id v47 = a3;
  v7 = objc_msgSend_backingStore(self, v5, v6);
  if (v7)
  {
    id v10 = v47;
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
        v44 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
        v45 = NSStringFromClass(v19);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v46, (uint64_t)a2, self, @"CKAtomSerialization.mm", 773, @"Proxy needs to be of type %@", v45);
      }
      v22 = objc_msgSend_distributedSiteIdentifier(v10, v20, v21);

      if (v22)
      {
        v25 = objc_msgSend_distributedSiteIdentifier(self, v23, v24);
        v28 = objc_msgSend_distributedSiteIdentifier(v10, v26, v27);
        objc_msgSend_copyFromReadProxy_(v25, v29, (uint64_t)v28);
      }
      v30 = objc_msgSend_siteIdentifier(v10, v23, v24);
      objc_msgSend_setSiteIdentifier_(self, v31, (uint64_t)v30);

      uint64_t v34 = objc_msgSend_clock(v10, v32, v33);
      objc_msgSend_setClock_(self, v35, v34);
      uint64_t v38 = objc_msgSend_modifier(v10, v36, v37);
      objc_msgSend_setModifier_(self, v39, v38);
      uint64_t v42 = objc_msgSend_unordered(v10, v40, v41);
      objc_msgSend_setUnordered_(self, v43, v42);
    }
  }
}

- (id)distributedSiteIdentifier
{
  uint64_t v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    id v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[5], 1);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)assignDistributedSiteIdentifierFromProxy:(id)a3
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
    uint64_t v14 = v13[5];
    objc_msgSend_structInstance(self, v15, v16);
    objc_msgSend_assignStruct_toReference_inStruct_(v12, v17, (uint64_t)v19, v14, &v18);
  }
}

- (void)setSiteIdentifier:(id)a3
{
  char v16 = 0;
  id v5 = a3;
  uint64_t v8 = objc_msgSend_bytes(v5, v6, v7);
  uint64_t v11 = (char *)v8;
  if (v5 && !v8)
  {
    if (objc_msgSend_length(v5, v9, v10))
    {
      uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CKAtomSerialization.mm", 806, @"Non-zero-length NSData has empty bytes");
    }
    uint64_t v11 = &v16;
  }
  uint64_t v12 = objc_msgSend_length(v5, v9, v10);
  objc_msgSend_setSiteIdentifierBytes_length_(self, v13, (uint64_t)v11, v12);
}

- (void)setSiteIdentifierBytes:(void *)a3 length:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  uint64_t v10 = v7;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    objc_msgSend_binding(v7, v8, v9);
    uint64_t v11 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[17]);

    uint64_t v14 = objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);
  }
}

- (void)setModifier:(unsigned __int8)a3
{
  unsigned __int8 v16 = a3;
  id v4 = objc_msgSend_backingStore(self, a2, a3);
  uint64_t v6 = v4;
  if (v4)
  {
    uint64_t v7 = objc_msgSend_writerForProxy_(v4, v5, (uint64_t)self);
    uint64_t v10 = objc_msgSend_binding(v6, v8, v9);
    uint64_t v11 = v10[18];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v7, v14, (uint64_t)&v16, "C", v11, &v15);
  }
}

- (void)setClock:(unint64_t)a3
{
  id v5 = objc_msgSend_backingStore(self, a2, a3);
  uint64_t v7 = v5;
  if (v5)
  {
    unint64_t v17 = a3;
    uint64_t v8 = objc_msgSend_writerForProxy_(v5, v6, (uint64_t)self);
    uint64_t v11 = objc_msgSend_binding(v7, v9, v10);
    uint64_t v12 = v11[6];
    objc_msgSend_structInstance(self, v13, v14);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v8, v15, (uint64_t)&v17, "Q", v12, &v16);
  }
}

- (void)setUnordered:(BOOL)a3
{
  id v5 = objc_msgSend_backingStore(self, a2, a3);
  uint64_t v7 = v5;
  if (v5)
  {
    BOOL v17 = a3;
    uint64_t v8 = objc_msgSend_writerForProxy_(v5, v6, (uint64_t)self);
    uint64_t v11 = objc_msgSend_binding(v7, v9, v10);
    uint64_t v12 = v11[19];
    objc_msgSend_structInstance(self, v13, v14);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v8, v15, (uint64_t)&v17, "C", v12, &v16);
  }
}

- (void)copyFromTimestamp:(id)a3
{
  id v22 = a3;
  uint64_t v6 = objc_msgSend_distributedSiteIdentifier(self, v4, v5);
  uint64_t v9 = objc_msgSend_siteIdentifierObject(v22, v7, v8);
  objc_msgSend_copyFromSiteIdentifier_(v6, v10, (uint64_t)v9);

  uint64_t v13 = objc_msgSend_siteIdentifierObject(v22, v11, v12);
  uint64_t v16 = objc_msgSend_identifier(v13, v14, v15);
  objc_msgSend_setSiteIdentifier_(self, v17, (uint64_t)v16);

  uint64_t v20 = objc_msgSend_clockValue(v22, v18, v19);
  objc_msgSend_setClock_(self, v21, v20);
}

@end