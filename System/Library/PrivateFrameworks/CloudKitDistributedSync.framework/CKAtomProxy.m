@interface CKAtomProxy
- (id)location;
- (id)references;
- (id)timestamp;
- (id)value;
- (unint64_t)atomType;
- (unint64_t)size;
- (unint64_t)valueSize;
- (unint64_t)version;
- (unsigned)atomBehavior;
- (void)copyValueBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5;
@end

@implementation CKAtomProxy

- (unint64_t)size
{
  v4 = objc_msgSend_backingStore(self, a2, v2);
  v6 = v4;
  if (v4)
  {
    v7 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    uint64_t v48 = 0;
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_valueSizeForField_(v7, v11, v10[10]);
    v46[3] += v12;

    v15 = objc_msgSend_location(self, v13, v14);
    uint64_t v18 = objc_msgSend_size(v15, v16, v17);
    v46[3] += v18;

    v21 = objc_msgSend_timestamp(self, v19, v20);
    uint64_t v24 = objc_msgSend_size(v21, v22, v23);
    v46[3] += v24;

    v27 = objc_msgSend_references(self, v25, v26);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = sub_1DD301A4C;
    v44[3] = &unk_1E6CBABB0;
    v44[4] = &v45;
    objc_msgSend_enumerate_(v27, v28, (uint64_t)v44);

    objc_msgSend_binding(v6, v29, v30);
    v31 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = objc_msgSend_valueSizeForField_(v7, v32, v31[27]);
    v46[3] += v33;

    objc_msgSend_binding(v6, v34, v35);
    v36 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_msgSend_valueSizeForField_(v7, v37, v36[13]);
    v46[3] += v38;

    uint64_t v41 = objc_msgSend_valueSize(self, v39, v40);
    unint64_t v42 = v46[3] + v41;
    v46[3] = v42;
    _Block_object_dispose(&v45, 8);
  }
  else
  {
    unint64_t v42 = 0;
  }

  return v42;
}

- (unint64_t)version
{
  v4 = objc_msgSend_backingStore(self, a2, v2);
  v6 = v4;
  if (v4)
  {
    unint64_t v18 = 0;
    v7 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v10 = objc_msgSend_binding(v6, v8, v9);
    uint64_t v11 = v10[10];
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

- (id)location
{
  v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[26], 0);
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
    uint64_t v12 = objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[11], 0);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)references
{
  v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_structListProxyForListReference_mutable_(v7, v11, v10[12], 0);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (unsigned)atomBehavior
{
  v4 = objc_msgSend_backingStore(self, a2, v2);
  v6 = v4;
  if (v4)
  {
    unsigned __int8 v18 = 0;
    v7 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v10 = objc_msgSend_binding(v6, v8, v9);
    uint64_t v11 = v10[27];
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

- (unint64_t)atomType
{
  v4 = objc_msgSend_backingStore(self, a2, v2);
  v6 = v4;
  if (v4)
  {
    unint64_t v18 = 0;
    v7 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v10 = objc_msgSend_binding(v6, v8, v9);
    uint64_t v11 = v10[13];
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

- (unint64_t)valueSize
{
  char v4 = 0;
  uint64_t v3 = 0;
  objc_msgSend_copyValueBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4) {
    return 0;
  }
  else {
    return v3 + 8;
  }
}

- (id)value
{
  char v4 = objc_msgSend_backingStore(self, a2, v2);
  v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_dataForToken_(self, v9, v8[14]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyValueBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  uint64_t v9 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  if (v9)
  {
    uint64_t v14 = v9;
    uint64_t v12 = objc_msgSend_binding(v9, v10, v11);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[14]);

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

@end