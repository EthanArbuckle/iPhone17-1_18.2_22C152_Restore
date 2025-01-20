@interface KVFullDatasetStream
- (BOOL)registerCascadeItem:(id)a3 error:(id *)a4;
- (BOOL)registerItem:(id)a3 error:(id *)a4;
- (unsigned)errorCode;
@end

@implementation KVFullDatasetStream

- (BOOL)registerItem:(id)a3 error:(id *)a4
{
  v11 = objc_msgSend__cascadeItemFromItem_error_(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  if (v11) {
    char v12 = objc_msgSend_registerCascadeItem_error_(self, v8, (uint64_t)v11, (uint64_t)a4, v9, v10);
  }
  else {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)registerCascadeItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v12 = objc_msgSend_donation(self, v7, v8, v9, v10, v11);
  id v21 = 0;
  char v16 = objc_msgSend_registerItem_error_(v12, v13, (uint64_t)v6, (uint64_t)&v21, v14, v15);

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

- (unsigned)errorCode
{
  id v6 = objc_msgSend_donation(self, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_errorCode(v6, v7, v8, v9, v10, v11);
  if ((unint64_t)(v12 - 1) >= 0xB) {
    unsigned __int16 v13 = 0;
  }
  else {
    unsigned __int16 v13 = v12 + 6;
  }

  return v13;
}

@end