@interface CKDistributedTimestampProxy
- (BOOL)unordered;
- (id)distributedSiteIdentifier;
- (id)siteIdentifier;
- (id)timestamp;
- (unint64_t)clock;
- (unint64_t)siteIdentifierSize;
- (unint64_t)size;
- (unsigned)modifier;
- (void)copySiteIdentifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5;
@end

@implementation CKDistributedTimestampProxy

- (unint64_t)size
{
  v4 = objc_msgSend_backingStore(self, a2, v2);
  v6 = v4;
  if (v4)
  {
    v7 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v10 = objc_msgSend_distributedSiteIdentifier(self, v8, v9);
    uint64_t v13 = objc_msgSend_size(v10, v11, v12);

    uint64_t v16 = objc_msgSend_siteIdentifierSize(self, v14, v15);
    objc_msgSend_binding(v6, v17, v18);
    v19 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_valueSizeForField_(v7, v20, v19[18]);

    objc_msgSend_binding(v6, v22, v23);
    v24 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = objc_msgSend_valueSizeForField_(v7, v25, v24[6]);

    objc_msgSend_binding(v6, v27, v28);
    v29 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    unint64_t v31 = v16 + v13 + v21 + v26 + objc_msgSend_valueSizeForField_(v7, v30, v29[19]);
  }
  else
  {
    unint64_t v31 = 0;
  }

  return v31;
}

- (id)distributedSiteIdentifier
{
  v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[5], 0);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (unint64_t)siteIdentifierSize
{
  char v4 = 0;
  uint64_t v3 = 0;
  objc_msgSend_copySiteIdentifierBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4) {
    return 0;
  }
  else {
    return v3 + 8;
  }
}

- (id)siteIdentifier
{
  char v4 = objc_msgSend_backingStore(self, a2, v2);
  v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_dataForToken_(self, v9, v8[17]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copySiteIdentifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  uint64_t v9 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  if (v9)
  {
    v14 = v9;
    uint64_t v12 = objc_msgSend_binding(v9, v10, v11);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[17]);

    uint64_t v9 = v14;
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    if (a5) {
      *a5 = 1;
    }
  }
}

- (unsigned)modifier
{
  char v4 = objc_msgSend_backingStore(self, a2, v2);
  uint64_t v6 = v4;
  if (v4)
  {
    unsigned __int8 v18 = 0;
    v7 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v10 = objc_msgSend_binding(v6, v8, v9);
    uint64_t v11 = v10[18];
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

- (unint64_t)clock
{
  char v4 = objc_msgSend_backingStore(self, a2, v2);
  uint64_t v6 = v4;
  if (v4)
  {
    unint64_t v18 = 0;
    v7 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v10 = objc_msgSend_binding(v6, v8, v9);
    uint64_t v11 = v10[6];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_copyData_forField_inStruct_(v7, v14, (uint64_t)&v18, v11, &v17);

    unint64_t v15 = v18;
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)unordered
{
  char v4 = objc_msgSend_backingStore(self, a2, v2);
  uint64_t v6 = v4;
  if (v4)
  {
    char v18 = 0;
    v7 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v10 = objc_msgSend_binding(v6, v8, v9);
    uint64_t v11 = v10[19];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_copyData_forField_inStruct_(v7, v14, (uint64_t)&v18, v11, &v17);

    BOOL v15 = v18 != 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)timestamp
{
  uint64_t v6 = objc_msgSend_distributedSiteIdentifier(self, a2, v2);
  if (v6)
  {
    v7 = objc_msgSend_distributedSiteIdentifier(self, v4, v5);
    uint64_t v10 = objc_msgSend_siteIdentifier(v7, v8, v9);
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F19F80]);
    v7 = objc_msgSend_siteIdentifier(self, v12, v13);
    uint64_t v10 = objc_msgSend_initWithIdentifier_(v11, v14, (uint64_t)v7);
  }
  BOOL v15 = (void *)v10;

  id v16 = objc_alloc(MEMORY[0x1E4F19F88]);
  uint64_t v19 = objc_msgSend_clock(self, v17, v18);
  uint64_t v21 = objc_msgSend_initWithSiteIdentifierObject_clockValue_(v16, v20, (uint64_t)v15, v19);

  return v21;
}

@end