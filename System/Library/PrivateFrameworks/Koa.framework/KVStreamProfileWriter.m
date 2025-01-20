@interface KVStreamProfileWriter
- (BOOL)addItem:(id)a3 error:(id *)a4;
- (BOOL)finishDataset:(id *)a3;
- (BOOL)finishProfile:(id *)a3;
- (BOOL)startDataset:(id)a3 error:(id *)a4;
- (BOOL)startProfile:(id)a3 error:(id *)a4;
- (KVStreamProfileWriter)initWithOutputStream:(id)a3;
@end

@implementation KVStreamProfileWriter

- (void).cxx_destruct
{
}

- (BOOL)finishProfile:(id *)a3
{
  return 1;
}

- (BOOL)finishDataset:(id *)a3
{
  return 1;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12 = objc_msgSend_buffer(v6, v7, v8, v9, v10, v11);
  v13 = sub_1BC3C2EB0(v12);

  if (!objc_msgSend_length(v13, v14, v15, v16, v17, v18))
  {
    v47 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    v48 = objc_msgSend_stringWithFormat_(NSString, v19, @"Invalid item %@", v21, v22, v23, v6);
    v59[0] = v48;
    v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v49, (uint64_t)v59, (uint64_t)&v58, 1, v50);
    v54 = objc_msgSend_errorWithDomain_code_userInfo_(v47, v52, @"com.apple.koa.profile", 7, (uint64_t)v51, v53);
    v55 = v54;
    if (a4 && v54) {
      *a4 = v54;
    }

    goto LABEL_9;
  }
  uint64_t v24 = objc_msgSend_length(v13, v19, v20, v21, v22, v23);
  stream = self->_stream;
  id v26 = v13;
  uint64_t v32 = objc_msgSend_bytes(v26, v27, v28, v29, v30, v31);
  uint64_t v38 = objc_msgSend_length(v26, v33, v34, v35, v36, v37);
  if (v24 != objc_msgSend_write_maxLength_(stream, v39, v32, v38, v40, v41))
  {
    v56 = objc_msgSend_stringWithFormat_(NSString, v42, @"profile item: %@ buffer: %@", v43, v44, v45, v6, v26);
    sub_1BC3D855C(a4, v56, self->_stream, 2u);

LABEL_9:
    BOOL v46 = 0;
    goto LABEL_10;
  }
  BOOL v46 = 1;
LABEL_10:

  return v46;
}

- (BOOL)startDataset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12 = objc_msgSend_buffer(v6, v7, v8, v9, v10, v11);
  v13 = sub_1BC3C2EB0(v12);

  uint64_t v19 = objc_msgSend_length(v13, v14, v15, v16, v17, v18);
  stream = self->_stream;
  id v21 = v13;
  uint64_t v27 = objc_msgSend_bytes(v21, v22, v23, v24, v25, v26);
  uint64_t v33 = objc_msgSend_length(v21, v28, v29, v30, v31, v32);
  uint64_t v41 = objc_msgSend_write_maxLength_(stream, v34, v27, v33, v35, v36);
  if (v19 != v41)
  {
    v42 = objc_msgSend_stringWithFormat_(NSString, v37, @"profile datasetInfo: %@ buffer: %@", v38, v39, v40, v6, v21);
    sub_1BC3D855C(a4, v42, self->_stream, 2u);
  }
  return v19 == v41;
}

- (BOOL)startProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v38 = 0;
  char v39 = 0;
  long long v40 = xmmword_1BC3E47D0;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v43 = 0;
  uint64_t v44 = 1;
  __int16 v45 = 256;
  uint64_t v46 = 0;
  v7 = sub_1BC3D8388((unint64_t)&v38, v6, 0, 1);
  uint64_t v13 = objc_msgSend_length(v7, v8, v9, v10, v11, v12);
  stream = self->_stream;
  id v15 = v7;
  uint64_t v21 = objc_msgSend_bytes(v15, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_length(v15, v22, v23, v24, v25, v26);
  uint64_t v35 = objc_msgSend_write_maxLength_(stream, v28, v21, v27, v29, v30);
  if (v13 != v35)
  {
    uint64_t v36 = objc_msgSend_stringWithFormat_(NSString, v31, @"profile header: %@ with info: %@", v32, v33, v34, v15, v6);
    sub_1BC3D855C(a4, v36, self->_stream, 2u);
  }
  sub_1BC3B9370(&v38);

  return v13 == v35;
}

- (KVStreamProfileWriter)initWithOutputStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVStreamProfileWriter;
  id v6 = [(KVStreamProfileWriter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stream, a3);
  }

  return v7;
}

@end