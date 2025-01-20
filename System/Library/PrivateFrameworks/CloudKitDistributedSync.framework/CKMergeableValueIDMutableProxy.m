@interface CKMergeableValueIDMutableProxy
- (void)copyFromMergeableValueID:(id)a3;
- (void)copyFromReadProxy:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierBytes:(void *)a3 length:(unint64_t)a4;
- (void)setZoneName:(id)a3;
- (void)setZoneNameBytes:(void *)a3 length:(unint64_t)a4;
- (void)setZoneOwnerName:(id)a3;
- (void)setZoneOwnerNameBytes:(void *)a3 length:(unint64_t)a4;
@end

@implementation CKMergeableValueIDMutableProxy

- (void)copyFromReadProxy:(id)a3
{
  id v35 = a3;
  v7 = objc_msgSend_backingStore(self, v5, v6);
  if (v7)
  {
    id v10 = v35;
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
        v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
        v33 = NSStringFromClass(v19);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v34, (uint64_t)a2, self, @"CKAtomSerialization.mm", 864, @"Proxy needs to be of type %@", v33);
      }
      v22 = objc_msgSend_identifier(v10, v20, v21);
      objc_msgSend_setIdentifier_(self, v23, (uint64_t)v22);

      v26 = objc_msgSend_zoneName(v10, v24, v25);
      objc_msgSend_setZoneName_(self, v27, (uint64_t)v26);

      v30 = objc_msgSend_zoneOwnerName(v10, v28, v29);
      objc_msgSend_setZoneOwnerName_(self, v31, (uint64_t)v30);
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
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CKAtomSerialization.mm", 875, @"Non-zero-length NSData has empty bytes");
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
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[21]);

    v14 = objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);
  }
}

- (void)setZoneName:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = v4;
  if (v4)
  {
    uint64_t v8 = objc_msgSend_length(v4, v5, v6);
    uint64_t v9 = (char *)v18 - ((MEMORY[0x1F4188790]() + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = objc_msgSend_length(v7, v10, v11);
    uint64_t v15 = objc_msgSend_length(v7, v13, v14);
    objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(v7, v16, (uint64_t)v9, v12, 0, 4, 0, 0, v15, 0);
    objc_msgSend_setZoneNameBytes_length_(self, v17, (uint64_t)v9, v8);
  }
  else
  {
    objc_msgSend_setZoneNameBytes_length_(self, v5, 0, 0);
  }
}

- (void)setZoneNameBytes:(void *)a3 length:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  uint64_t v10 = v7;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    objc_msgSend_binding(v7, v8, v9);
    uint64_t v11 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[22]);

    uint64_t v14 = objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);
  }
}

- (void)setZoneOwnerName:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = v4;
  if (v4)
  {
    uint64_t v8 = objc_msgSend_length(v4, v5, v6);
    uint64_t v9 = (char *)v18 - ((MEMORY[0x1F4188790]() + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = objc_msgSend_length(v7, v10, v11);
    uint64_t v15 = objc_msgSend_length(v7, v13, v14);
    objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(v7, v16, (uint64_t)v9, v12, 0, 4, 0, 0, v15, 0);
    objc_msgSend_setZoneOwnerNameBytes_length_(self, v17, (uint64_t)v9, v8);
  }
  else
  {
    objc_msgSend_setZoneOwnerNameBytes_length_(self, v5, 0, 0);
  }
}

- (void)setZoneOwnerNameBytes:(void *)a3 length:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  uint64_t v10 = v7;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    objc_msgSend_binding(v7, v8, v9);
    uint64_t v11 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[23]);

    uint64_t v14 = objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);
  }
}

- (void)copyFromMergeableValueID:(id)a3
{
  id v16 = a3;
  uint64_t v6 = objc_msgSend_identifier(v16, v4, v5);
  objc_msgSend_setIdentifier_(self, v7, (uint64_t)v6);

  uint64_t v10 = objc_msgSend_zoneName(v16, v8, v9);
  objc_msgSend_setZoneName_(self, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_zoneOwner(v16, v12, v13);
  objc_msgSend_setZoneOwnerName_(self, v15, (uint64_t)v14);
}

@end