@interface AMPAppleCardArtwork
+ (id)cardIcon;
+ (id)cardIconString;
@end

@implementation AMPAppleCardArtwork

+ (id)cardIcon
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (cardIcon_onceToken != -1) {
    dispatch_once(&cardIcon_onceToken, &__block_literal_global_1);
  }
  v2 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (v4)
  {
    LODWORD(v28) = 138543362;
    *(void *)((char *)&v28 + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&v28 + 4);
    LODWORD(v23) = 12;
    v22 = &v28;
    v7 = (void *)_os_log_send_and_compose_impl();

    if (v7)
    {
      objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v28, v23);
      v8 = (long long *)objc_claimAutoreleasedReturnValue();
      free(v7);
      v22 = v8;
      SSFileLog();
    }
  }
  else
  {
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v9 = (void *)getPKVirtualCardClass_softClass;
  uint64_t v27 = getPKVirtualCardClass_softClass;
  if (!getPKVirtualCardClass_softClass)
  {
    *(void *)&long long v28 = MEMORY[0x263EF8330];
    *((void *)&v28 + 1) = 3221225472;
    v29 = __getPKVirtualCardClass_block_invoke;
    v30 = &unk_264E7C700;
    v31 = &v24;
    __getPKVirtualCardClass_block_invoke((uint64_t)&v28);
    v9 = (void *)v25[3];
  }
  v10 = v9;
  _Block_object_dispose(&v24, 8);
  id v11 = objc_alloc_init(v10);
  v12 = v11;
  if (v11)
  {
    v13 = [v11 cardIcon];
    goto LABEL_30;
  }
  v14 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v14)
  {
    v14 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v15 = objc_msgSend(v14, "shouldLog", v22);
  if ([v14 shouldLogToDisk]) {
    int v16 = v15 | 2;
  }
  else {
    int v16 = v15;
  }
  v17 = [v14 OSLogObject];
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    v16 &= 2u;
  }
  if (!v16) {
    goto LABEL_28;
  }
  v18 = objc_opt_class();
  LODWORD(v28) = 138543362;
  *(void *)((char *)&v28 + 4) = v18;
  id v19 = v18;
  LODWORD(v23) = 12;
  v20 = (void *)_os_log_send_and_compose_impl();

  if (v20)
  {
    v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v28, v23, v24);
    free(v20);
    SSFileLog();
LABEL_28:
  }
  v13 = 0;
LABEL_30:

  return v13;
}

void __31__AMPAppleCardArtwork_cardIcon__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!PassKitUIFoundationLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __PassKitUIFoundationLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264E7C840;
    uint64_t v3 = 0;
    PassKitUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    v0 = (void *)v1[0];
    if (PassKitUIFoundationLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

+ (id)cardIconString
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v2 = [a1 cardIcon];
  uint64_t v3 = UIImagePNGRepresentation(v2);
  uint64_t v4 = v3;
  if (v3)
  {
    v5 = [v3 base64EncodedStringWithOptions:1];
    id v6 = [NSString stringWithFormat:@"data:image/png;base64,%@", v5];

    goto LABEL_15;
  }
  v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v7)
  {
    v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_13;
  }
  LODWORD(v15) = 138543362;
  *(void *)((char *)&v15 + 4) = objc_opt_class();
  id v11 = *(id *)((char *)&v15 + 4);
  LODWORD(v14) = 12;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v15, v14, v15);
    free(v12);
    SSFileLog();
LABEL_13:
  }
  id v6 = 0;
LABEL_15:

  return v6;
}

@end