@interface KVProfileWriterFactory
- (id)profileWriterForFormat:(unsigned __int8)a3 outputStream:(id)a4 error:(id *)a5;
@end

@implementation KVProfileWriterFactory

- (id)profileWriterForFormat:(unsigned __int8)a3 outputStream:(id)a4 error:(id *)a5
{
  unsigned int v6 = a3;
  v36[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  if (v6 - 1 >= 3)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v20 = NSString;
    v21 = sub_1BC3C2E48(v6, v7, v8, v9, v10, v11);
    v26 = objc_msgSend_stringWithFormat_(v20, v22, @"Unsupported profile format: %@", v23, v24, v25, v21, v35);
    v36[0] = v26;
    v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v27, (uint64_t)v36, (uint64_t)&v35, 1, v28);
    v32 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v30, @"com.apple.koa.profile", 3, (uint64_t)v29, v31);
    v33 = v32;
    if (a5 && v32) {
      *a5 = v32;
    }

    v18 = 0;
  }
  else
  {
    id v13 = objc_alloc(*off_1E62AD6E8[(v6 - 1)]);
    v18 = objc_msgSend_initWithOutputStream_(v13, v14, (uint64_t)v12, v15, v16, v17);
  }

  return v18;
}

@end