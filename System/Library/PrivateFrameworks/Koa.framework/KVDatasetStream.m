@interface KVDatasetStream
- (CCSetDonation)donation;
- (KVDatasetStream)init;
- (KVDatasetStream)initWithDonation:(id)a3;
- (id)_cascadeItemFromItem:(id)a3 error:(id *)a4;
- (id)description;
- (void)cancel;
- (void)finish:(id)a3;
@end

@implementation KVDatasetStream

- (void).cxx_destruct
{
}

- (CCSetDonation)donation
{
  return self->_donation;
}

- (id)_cascadeItemFromItem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v47 = 0;
  v10 = objc_msgSend_toCascadeItem_(v5, v6, (uint64_t)&v47, v7, v8, v9);
  id v11 = v47;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v14 = NSString;
    uint64_t v20 = objc_msgSend_itemType(v5, v15, v16, v17, v18, v19);
    v26 = KVItemTypeDescription(v20, v21, v22, v23, v24, v25);
    v32 = objc_msgSend_itemId(v5, v27, v28, v29, v30, v31);
    v37 = objc_msgSend_stringWithFormat_(v14, v33, @"KVItem (%@) with itemId: \"%@\" cannot be converted to Cascade item instance", v34, v35, v36, v26, v32);
    objc_msgSend_setObject_forKey_(v13, v38, (uint64_t)v37, *MEMORY[0x1E4F28568], v39, v40);

    if (v11) {
      objc_msgSend_setObject_forKey_(v13, v41, (uint64_t)v11, *MEMORY[0x1E4F28A50], v42, v43);
    }
    v44 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v41, @"com.apple.koa.donate", 1, (uint64_t)v13, v43);
    v45 = v44;
    if (a4 && v44) {
      *a4 = v44;
    }
  }
  return v10;
}

- (void)cancel
{
}

- (void)finish:(id)a3
{
  v4 = (void (**)(id, void))a3;
  donation = self->_donation;
  id v14 = 0;
  char v10 = objc_msgSend_finish_(donation, v6, (uint64_t)&v14, v7, v8, v9);
  id v11 = v14;
  id v12 = v11;
  if (v10)
  {
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else if (v4)
  {
    id v13 = sub_1BC3DC60C(v11);
    ((void (**)(id, void *))v4)[2](v4, v13);
  }
}

- (id)description
{
  return (id)objc_msgSend_description(self->_donation, a2, v2, v3, v4, v5);
}

- (KVDatasetStream)initWithDonation:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)KVDatasetStream;
  v6 = [(KVDatasetStream *)&v25 init];
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v6, v8, v7, v9, v10, v11)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (uint64_t v12 = objc_opt_class(), objc_msgSend_isMemberOfClass_(v6, v13, v12, v14, v15, v16))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_storeStrong((id *)&v6->_donation, a3);
LABEL_7:
    uint64_t v17 = v6;
    goto LABEL_11;
  }
  uint64_t v18 = (void *)qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = v18;
    v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    uint64_t v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 136315650;
    v27 = "-[KVDatasetStream initWithDonation:]";
    __int16 v28 = 2112;
    uint64_t v29 = v22;
    __int16 v30 = 2112;
    uint64_t v31 = v24;
    _os_log_error_impl(&dword_1BC3B6000, v20, OS_LOG_TYPE_ERROR, "%s Unexpected donation: %@ for class: %@", buf, 0x20u);
  }
  uint64_t v17 = 0;
LABEL_11:

  return v17;
}

- (KVDatasetStream)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end