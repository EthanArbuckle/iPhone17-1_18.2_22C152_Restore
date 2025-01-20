@interface CKDistributedSiteIdentifierMutableProxy
- (void)copyFromReadProxy:(id)a3;
- (void)copyFromSiteIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierBytes:(void *)a3 length:(unint64_t)a4;
- (void)setModifier:(id)a3;
- (void)setModifierBytes:(void *)a3 length:(unint64_t)a4;
@end

@implementation CKDistributedSiteIdentifierMutableProxy

- (void)copyFromReadProxy:(id)a3
{
  id v31 = a3;
  v7 = objc_msgSend_backingStore(self, v5, v6);
  if (v7)
  {
    id v10 = v31;
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
        v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
        v29 = NSStringFromClass(v19);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v30, (uint64_t)a2, self, @"CKAtomSerialization.mm", 714, @"Proxy needs to be of type %@", v29);
      }
      v22 = objc_msgSend_identifier(v10, v20, v21);
      objc_msgSend_setIdentifier_(self, v23, (uint64_t)v22);

      v26 = objc_msgSend_modifier(v10, v24, v25);
      objc_msgSend_setModifier_(self, v27, (uint64_t)v26);
    }
  }
}

- (void)setIdentifier:(id)a3
{
  char v16 = 0;
  id v5 = a3;
  uint64_t v8 = objc_msgSend_bytes(v5, v6, v7);
  v11 = (char *)v8;
  if (v5 && !v8)
  {
    if (objc_msgSend_length(v5, v9, v10))
    {
      v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CKAtomSerialization.mm", 724, @"Non-zero-length NSData has empty bytes");
    }
    v11 = &v16;
  }
  uint64_t v12 = objc_msgSend_length(v5, v9, v10);
  objc_msgSend_setIdentifierBytes_length_(self, v13, (uint64_t)v11, v12);
}

- (void)setIdentifierBytes:(void *)a3 length:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  uint64_t v10 = v7;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    objc_msgSend_binding(v7, v8, v9);
    v11 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[2]);

    v14 = objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);
  }
}

- (void)setModifier:(id)a3
{
  char v16 = 0;
  id v5 = a3;
  uint64_t v8 = objc_msgSend_bytes(v5, v6, v7);
  v11 = (char *)v8;
  if (v5 && !v8)
  {
    if (objc_msgSend_length(v5, v9, v10))
    {
      v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CKAtomSerialization.mm", 744, @"Non-zero-length NSData has empty bytes");
    }
    v11 = &v16;
  }
  uint64_t v12 = objc_msgSend_length(v5, v9, v10);
  objc_msgSend_setModifierBytes_length_(self, v13, (uint64_t)v11, v12);
}

- (void)setModifierBytes:(void *)a3 length:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  uint64_t v10 = v7;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    objc_msgSend_binding(v7, v8, v9);
    v11 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[3]);

    v14 = objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);
  }
}

- (void)copyFromSiteIdentifier:(id)a3
{
  id v12 = a3;
  uint64_t v6 = objc_msgSend_identifier(v12, v4, v5);
  objc_msgSend_setIdentifier_(self, v7, (uint64_t)v6);

  uint64_t v10 = objc_msgSend_modifier(v12, v8, v9);
  objc_msgSend_setModifier_(self, v11, (uint64_t)v10);
}

@end