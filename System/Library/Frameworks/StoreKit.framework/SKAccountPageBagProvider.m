@interface SKAccountPageBagProvider
+ (id)sharedBag;
@end

@implementation SKAccountPageBagProvider

+ (id)sharedBag
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SKAccountPageBagProvider_sharedBag__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBag_onceToken != -1) {
    dispatch_once(&sharedBag_onceToken, block);
  }
  v2 = (void *)sharedBag__shared;

  return v2;
}

void __37__SKAccountPageBagProvider_sharedBag__block_invoke()
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v0 = (void *)getISLoadURLBagOperationClass_softClass;
  uint64_t v23 = getISLoadURLBagOperationClass_softClass;
  if (!getISLoadURLBagOperationClass_softClass)
  {
    *(void *)v24 = MEMORY[0x1E4F143A8];
    *(void *)&v24[8] = 3221225472;
    *(void *)&v24[16] = __getISLoadURLBagOperationClass_block_invoke;
    v25 = &unk_1E5FA9A30;
    v26 = &v20;
    __getISLoadURLBagOperationClass_block_invoke((uint64_t)v24);
    v0 = (void *)v21[3];
  }
  v1 = v0;
  _Block_object_dispose(&v20, 8);
  id v2 = objc_alloc_init(v1);
  [v2 start];
  char v3 = [v2 success];
  v4 = [v2 error];
  if (v4) {
    char v5 = 0;
  }
  else {
    char v5 = v3;
  }
  if ((v5 & 1) == 0)
  {
    v6 = [MEMORY[0x1E4FA81D8] sharediTunesStoreConfig];
    if (!v6)
    {
      v6 = [MEMORY[0x1E4FA81D8] sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      v10 = objc_opt_class();
      *(_DWORD *)v24 = 138543618;
      *(void *)&v24[4] = v10;
      *(_WORD *)&v24[12] = 2114;
      *(void *)&v24[14] = v4;
      id v11 = v10;
      LODWORD(v19) = 22;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_18:

        goto LABEL_19;
      }
      v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v24, v19, v20);
      free(v12);
      SSFileLog();
    }

    goto LABEL_18;
  }
LABEL_19:
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v13 = (void *)getISAMSBagShimClass_softClass;
  uint64_t v23 = getISAMSBagShimClass_softClass;
  if (!getISAMSBagShimClass_softClass)
  {
    *(void *)v24 = MEMORY[0x1E4F143A8];
    *(void *)&v24[8] = 3221225472;
    *(void *)&v24[16] = __getISAMSBagShimClass_block_invoke;
    v25 = &unk_1E5FA9A30;
    v26 = &v20;
    __getISAMSBagShimClass_block_invoke((uint64_t)v24);
    v13 = (void *)v21[3];
  }
  v14 = v13;
  _Block_object_dispose(&v20, 8);
  id v15 = [v14 alloc];
  v16 = [v2 URLBag];
  uint64_t v17 = [v15 initWithURLBag:v16];
  v18 = (void *)sharedBag__shared;
  sharedBag__shared = v17;
}

@end