@interface CKAtomMutableProxy
- (id)location;
- (id)references;
- (id)timestamp;
- (void)assignTimestampFromProxy:(id)a3;
- (void)copyFromReadProxy:(id)a3;
- (void)setAtomBehavior:(unsigned __int8)a3;
- (void)setAtomType:(unint64_t)a3;
- (void)setValue:(id)a3;
- (void)setValueBytes:(void *)a3 length:(unint64_t)a4;
- (void)setVersion:(unint64_t)a3;
@end

@implementation CKAtomMutableProxy

- (void)copyFromReadProxy:(id)a3
{
  id v5 = a3;
  v8 = objc_msgSend_backingStore(self, v6, v7);
  if (v8)
  {
    id v11 = v5;
    if (v11)
    {
      v12 = objc_msgSend_binding(v8, v9, v10);
      v15 = objc_msgSend_binding(v8, v13, v14);
      uint64_t v16 = objc_opt_class();
      uint64_t v18 = objc_msgSend_structTokenForClass_(v15, v17, v16);
      objc_msgSend_proxyClassForStructToken_(v12, v19, v18);
      v20 = (objc_class *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v57 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v21, v22);
        v58 = NSStringFromClass(v20);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v57, v59, (uint64_t)a2, self, @"CKAtomSerialization.mm", 1015, @"Proxy needs to be of type %@", v58);
      }
      uint64_t v23 = objc_msgSend_version(v11, v21, v22);
      objc_msgSend_setVersion_(self, v24, v23);
      v27 = objc_msgSend_location(v11, v25, v26);

      if (v27)
      {
        v30 = objc_msgSend_location(self, v28, v29);
        v33 = objc_msgSend_location(v11, v31, v32);
        objc_msgSend_copyFromReadProxy_(v30, v34, (uint64_t)v33);
      }
      v35 = objc_msgSend_timestamp(v11, v28, v29);

      if (v35)
      {
        v38 = objc_msgSend_timestamp(self, v36, v37);
        v41 = objc_msgSend_timestamp(v11, v39, v40);
        objc_msgSend_copyFromReadProxy_(v38, v42, (uint64_t)v41);
      }
      v43 = objc_msgSend_references(v11, v36, v37);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = sub_1DD304144;
      v60[3] = &unk_1E6CBAC00;
      v60[4] = self;
      objc_msgSend_enumerate_(v43, v44, (uint64_t)v60);

      uint64_t v47 = objc_msgSend_atomBehavior(v11, v45, v46);
      objc_msgSend_setAtomBehavior_(self, v48, v47);
      uint64_t v51 = objc_msgSend_atomType(v11, v49, v50);
      objc_msgSend_setAtomType_(self, v52, v51);
      v55 = objc_msgSend_value(v11, v53, v54);
      objc_msgSend_setValue_(self, v56, (uint64_t)v55);
    }
  }
}

- (void)setVersion:(unint64_t)a3
{
  id v5 = objc_msgSend_backingStore(self, a2, a3);
  uint64_t v7 = v5;
  if (v5)
  {
    unint64_t v17 = a3;
    v8 = objc_msgSend_writerForProxy_(v5, v6, (uint64_t)self);
    id v11 = objc_msgSend_binding(v7, v9, v10);
    uint64_t v12 = v11[10];
    objc_msgSend_structInstance(self, v13, v14);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v8, v15, (uint64_t)&v17, "Q", v12, &v16);
  }
}

- (id)location
{
  v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    uint64_t v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[26], 1);
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
    uint64_t v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    uint64_t v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[11], 1);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)assignTimestampFromProxy:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_backingStore(self, v5, v6);
  uint64_t v9 = v7;
  if (v7)
  {
    uint64_t v12 = objc_msgSend_writerForProxy_(v7, v8, (uint64_t)self);
    if (v4) {
      objc_msgSend_structInstance(v4, v10, v11);
    }
    else {
      memset(v19, 0, sizeof(v19));
    }
    v13 = objc_msgSend_binding(v9, v10, v11);
    uint64_t v14 = v13[11];
    objc_msgSend_structInstance(self, v15, v16);
    objc_msgSend_assignStruct_toReference_inStruct_(v12, v17, (uint64_t)v19, v14, &v18);
  }
}

- (id)references
{
  uint64_t v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    uint64_t v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_structListProxyForListReference_mutable_(v7, v11, v10[12], 1);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)setAtomBehavior:(unsigned __int8)a3
{
  unsigned __int8 v16 = a3;
  id v4 = objc_msgSend_backingStore(self, a2, a3);
  uint64_t v6 = v4;
  if (v4)
  {
    uint64_t v7 = objc_msgSend_writerForProxy_(v4, v5, (uint64_t)self);
    uint64_t v10 = objc_msgSend_binding(v6, v8, v9);
    uint64_t v11 = v10[27];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v7, v14, (uint64_t)&v16, "C", v11, &v15);
  }
}

- (void)setAtomType:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend_backingStore(self, a2, a3);
  uint64_t v7 = v5;
  if (v5)
  {
    unint64_t v17 = a3;
    v8 = objc_msgSend_writerForProxy_(v5, v6, (uint64_t)self);
    uint64_t v11 = objc_msgSend_binding(v7, v9, v10);
    uint64_t v12 = v11[13];
    objc_msgSend_structInstance(self, v13, v14);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v8, v15, (uint64_t)&v17, "Q", v12, &v16);
  }
}

- (void)setValue:(id)a3
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
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CKAtomSerialization.mm", 1103, @"Non-zero-length NSData has empty bytes");
    }
    uint64_t v11 = &v16;
  }
  uint64_t v12 = objc_msgSend_length(v5, v9, v10);
  objc_msgSend_setValueBytes_length_(self, v13, (uint64_t)v11, v12);
}

- (void)setValueBytes:(void *)a3 length:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  uint64_t v10 = v7;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    objc_msgSend_binding(v7, v8, v9);
    uint64_t v11 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[14]);

    uint64_t v14 = objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);
  }
}

@end