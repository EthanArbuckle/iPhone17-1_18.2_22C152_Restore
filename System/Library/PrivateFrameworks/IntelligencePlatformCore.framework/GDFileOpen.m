@interface GDFileOpen
+ (BOOL)setFileLimitWithError:(id *)a3;
+ (int)openWithPath:(id)a3 flags:(int)a4 protection:(int)a5 mode:(int)a6 errorCode:(int *)a7;
@end

@implementation GDFileOpen

+ (BOOL)setFileLimitWithError:(id *)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v26.rlim_cur = 0;
  v26.rlim_max = 0;
  if (getrlimit(8, &v26))
  {
    if (!a3) {
      return 0;
    }
    v4 = (void *)MEMORY[0x1C87B9E80]();
    id v5 = [NSString alloc];
    uint64_t v6 = *__error();
    v7 = __error();
    v8 = strerror(*v7);
    v11 = objc_msgSend_initWithFormat_(v5, v9, @"Unable to get rlimit [%i] %s", v10, v6, v8);
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28 = v11;
    v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)&v28, (uint64_t)&v27, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v15, @"com.apple.IntelligencePlatform.IntelligencePlatformCompute", 2, v14);
LABEL_4:
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  if (v26.rlim_cur <= 0x4FF)
  {
    v26.rlim_cur = 1280;
    if (setrlimit(8, &v26))
    {
      if (!a3) {
        return 0;
      }
      v4 = (void *)MEMORY[0x1C87B9E80]();
      id v17 = [NSString alloc];
      uint64_t v18 = *__error();
      v19 = __error();
      v20 = strerror(*v19);
      v11 = objc_msgSend_initWithFormat_(v17, v21, @"Unable to set rlimit [%i] %s", v22, v18, v20);
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30[0] = v11;
      v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v30, (uint64_t)&v29, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, @"com.apple.IntelligencePlatform.IntelligencePlatformCompute", 1, v14);
      goto LABEL_4;
    }
  }
  return 1;
}

+ (int)openWithPath:(id)a3 flags:(int)a4 protection:(int)a5 mode:(int)a6 errorCode:(int *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v11 = a3;
  v15 = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14);
  int v16 = open_dprotected_np(v15, a4, a5, 0, v8);
  int v17 = v16;
  if (a7 && v16 < 0) {
    *a7 = *__error();
  }
  return v17;
}

@end