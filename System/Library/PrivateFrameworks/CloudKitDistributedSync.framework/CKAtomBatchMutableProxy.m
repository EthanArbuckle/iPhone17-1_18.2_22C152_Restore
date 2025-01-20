@interface CKAtomBatchMutableProxy
- (id)atoms;
- (void)copyFromReadProxy:(id)a3;
@end

@implementation CKAtomBatchMutableProxy

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
        v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v21, v22);
        v26 = NSStringFromClass(v20);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v27, (uint64_t)a2, self, @"CKAtomSerialization.mm", 1132, @"Proxy needs to be of type %@", v26);
      }
      v23 = objc_msgSend_atoms(v11, v21, v22);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = sub_1DD304B8C;
      v28[3] = &unk_1E6CBAC50;
      v28[4] = self;
      objc_msgSend_enumerate_(v23, v24, (uint64_t)v28);
    }
  }
}

- (id)atoms
{
  v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    uint64_t v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_structListProxyForListReference_mutable_(v7, v11, v10[16], 1);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end