@interface DOCItemBookmark
+ (BOOL)isAnyFPItemAFault:(id)a3;
+ (BOOL)isAnyItemBookmarkAFault:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_contentTypeForURL:(id)a3;
+ (id)_wrapperForURL:(id)a3 error:(id *)a4;
+ (id)documentsURLsForItemBookmarks:(id)a3;
+ (void)_fetchDocumentURLFromBookmarkableString:(id)a3 completion:(id)a4;
- (BOOL)needsToBeImported;
- (DOCItemBookmark)initWithBookmarkableString:(id)a3 fileProviderItem:(id)a4;
- (DOCItemBookmark)initWithCoder:(id)a3;
- (DOCItemBookmark)initWithURL:(id)a3 fileProviderItem:(id)a4;
- (FPItem)fileProviderItem;
- (NSString)bookmarkableString;
- (NSURL)fileURL;
- (UTType)contentType;
- (id)coordinatedFileURL;
- (id)description;
- (void)convertAndCopyURLToInbox:(id)a3 ofType:(id)a4 conversionRules:(id)a5 completion:(id)a6;
- (void)copyURLToInbox:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForMode:(unint64_t)a3 usingBookmark:(BOOL)a4 completionBlock:(id)a5;
- (void)prepareForMode:(unint64_t)a3 usingBookmark:(BOOL)a4 shouldConvert:(BOOL)a5 conversionRules:(id)a6 completionBlock:(id)a7;
- (void)setBookmarkableString:(id)a3;
- (void)setContentType:(id)a3;
- (void)setFileProviderItem:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setNeedsToBeImported:(BOOL)a3;
@end

@implementation DOCItemBookmark

- (DOCItemBookmark)initWithBookmarkableString:(id)a3 fileProviderItem:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DOCItemBookmark;
  v8 = [(DOCItemBookmark *)&v14 init];
  if (v8)
  {
    v9 = (NSObject **)MEMORY[0x263F3AC28];
    v10 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_21361D000, v10, OS_LOG_TYPE_INFO, "DOCItemBookmark: initWithBookmarkableString: %@", buf, 0xCu);
    }
    [(DOCItemBookmark *)v8 setBookmarkableString:v6];
    [(DOCItemBookmark *)v8 setFileProviderItem:v7];
    v11 = [v7 contentType];
    [(DOCItemBookmark *)v8 setContentType:v11];

    v8->_needsToBeImported = 0;
    v12 = v8;
  }

  return v8;
}

- (DOCItemBookmark)initWithURL:(id)a3 fileProviderItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)DOCItemBookmark;
  v8 = [(DOCItemBookmark *)&v34 init];
  if (v8)
  {
    v9 = (NSObject **)MEMORY[0x263F3AC28];
    v10 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21361D000, v10, OS_LOG_TYPE_INFO, "DOCItemBookmark: initWithURL", buf, 2u);
    }
    int v11 = [v6 startAccessingSecurityScopedResource];
    *(void *)buf = 0;
    v29 = buf;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__2;
    v32 = __Block_byref_object_dispose__2;
    id v33 = 0;
    id v12 = objc_alloc_init(MEMORY[0x263F08830]);
    v26[4] = buf;
    id v27 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __48__DOCItemBookmark_initWithURL_fileProviderItem___block_invoke;
    v26[3] = &unk_2641B21F0;
    [v12 coordinateReadingItemAtURL:v6 options:0 error:&v27 byAccessor:v26];
    id v13 = v27;
    if (v13)
    {
      objc_super v14 = *v9;
      if (!*v9)
      {
        DOCInitLogging();
        objc_super v14 = *v9;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[DOCItemBookmark initWithURL:fileProviderItem:]();
      }
    }
    else
    {
      v15 = (void *)*((void *)v29 + 5);
      if (v15)
      {
        id v16 = v15;

        id v6 = v16;
      }
    }

    _Block_object_dispose(buf, 8);
    id v25 = v13;
    uint64_t v17 = +[DOCItemBookmark _wrapperForURL:v6 error:&v25];
    id v18 = v25;

    wrapper = v8->_wrapper;
    v8->_wrapper = (FPSandboxingURLWrapper *)v17;

    if (v11) {
      [v6 stopAccessingSecurityScopedResource];
    }
    if (v8->_wrapper) {
      goto LABEL_19;
    }
    v20 = *v9;
    if (!*v9)
    {
      DOCInitLogging();
      v20 = *v9;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[DOCItemBookmark initWithURL:fileProviderItem:]();
      if (v7) {
        goto LABEL_20;
      }
    }
    else
    {
LABEL_19:
      if (v7)
      {
LABEL_20:
        [(DOCItemBookmark *)v8 setFileProviderItem:v7];
        uint64_t v21 = [v7 contentType];
LABEL_23:
        v22 = (void *)v21;
        [(DOCItemBookmark *)v8 setContentType:v21];

        v8->_needsToBeImported = 0;
        v23 = v8;

        goto LABEL_24;
      }
    }
    uint64_t v21 = +[DOCItemBookmark _contentTypeForURL:v6];
    goto LABEL_23;
  }
LABEL_24:

  return v8;
}

void __48__DOCItemBookmark_initWithURL_fileProviderItem___block_invoke(uint64_t a1, void *a2)
{
}

+ (id)_contentTypeForURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 pathExtension];
  if ([v4 length])
  {
    id v5 = [MEMORY[0x263F1D928] typeWithFilenameExtension:v4];
  }
  else
  {
    char v11 = 0;
    id v6 = [MEMORY[0x263F08850] defaultManager];
    id v7 = [v3 path];
    [v6 fileExistsAtPath:v7 isDirectory:&v11];

    v8 = (id *)MEMORY[0x263F1DB30];
    if (v11) {
      v8 = (id *)MEMORY[0x263F1DA60];
    }
    id v5 = *v8;
  }
  v9 = v5;

  return v9;
}

+ (id)_wrapperForURL:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263F054E0] wrapperWithURL:a3 readonly:0 error:a4];
}

+ (void)_fetchDocumentURLFromBookmarkableString:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  FPDocumentURLFromBookmarkableString();
}

uint64_t __70__DOCItemBookmark__fetchDocumentURLFromBookmarkableString_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareForMode:(unint64_t)a3 usingBookmark:(BOOL)a4 completionBlock:(id)a5
{
}

- (void)prepareForMode:(unint64_t)a3 usingBookmark:(BOOL)a4 shouldConvert:(BOOL)a5 conversionRules:(id)a6 completionBlock:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  v65[1] = *MEMORY[0x263EF8340];
  id v13 = a6;
  id v14 = a7;
  v15 = [(DOCItemBookmark *)self fileURL];

  if (v15)
  {
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    v62 = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke;
    v63 = &unk_2641B1080;
    id v64 = v14;
    DOCRunInMainThread();
  }
  if (!v9)
  {
    uint64_t v20 = self->_wrapper != 0;
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Trying to prepare a DOCItem in mode %lu without using bookmark and with a nil _wrapper", a3);
    LOBYTE(v20) = DOCAssertWithIntenalBuildAlert(v20, 0, @"[INTERNAL BUILD] Elusive Bug Alert", @"Trying to prepare a DOCItemBookmark with usingBookmark==NO and with a nil _wrapper.\n\n Please file a radar to DocumentManager | iOS and attach a sysdiagnose.\n\n We will now abort the action.", v21, 0);

    if ((v20 & 1) == 0)
    {
      uint64_t v46 = MEMORY[0x263EF8330];
      uint64_t v47 = 3221225472;
      v48 = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_5;
      v49 = &unk_2641B1080;
      id v50 = v14;
      DOCRunInMainThread();
      v19 = v50;
      goto LABEL_27;
    }
    v22 = [(FPSandboxingURLWrapper *)self->_wrapper url];
    [(DOCItemBookmark *)self setFileURL:v22];

    if (a3 && ![(DOCItemBookmark *)self needsToBeImported])
    {
      id v42 = v14;
      DOCRunInMainThread();
      v19 = v42;
      goto LABEL_27;
    }
    v23 = [(DOCItemBookmark *)self fileURL];

    if (!v23)
    {
      v40 = [MEMORY[0x263F08690] currentHandler];
      [v40 handleFailureInMethod:a2 object:self file:@"DOCItemBookmark.m" lineNumber:172 description:@"Trying to prepare a DOCItemBookmark in mode ImportCopy with a nil urls"];
    }
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_6;
    v44[3] = &unk_2641B2240;
    v44[4] = self;
    v24 = (void (**)(id, void))v14;
    id v45 = v24;
    id v25 = (void *)MEMORY[0x21668E400](v44);
    v26 = [(DOCItemBookmark *)self fileURL];
    id v27 = v26;
    if (v8)
    {
      v41 = v25;
      int v28 = [v26 startAccessingSecurityScopedResource];

      v29 = [(DOCItemBookmark *)self fileURL];
      uint64_t v30 = *MEMORY[0x263EFF608];
      v65[0] = *MEMORY[0x263EFF608];
      v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:1];
      id v43 = 0;
      id v27 = [v29 promisedItemResourceValuesForKeys:v31 error:&v43];
      id v32 = v43;

      if (v28)
      {
        id v33 = [(DOCItemBookmark *)self fileURL];
        [v33 stopAccessingSecurityScopedResource];
      }
      objc_super v34 = [v27 valueForKey:v30];
      v35 = [v34 identifier];

      if (v32 || !v35)
      {
        v24[2](v24, 0);

LABEL_26:
        v19 = v45;
        goto LABEL_27;
      }
      v36 = [MEMORY[0x263F1D928] typeWithIdentifier:v35];
      v37 = [v13 allKeys];
      int v38 = [v37 containsObject:v36];

      v39 = [(DOCItemBookmark *)self fileURL];
      id v25 = v41;
      if (v38) {
        [(DOCItemBookmark *)self copyURLToInbox:v39 completion:v41];
      }
      else {
        [(DOCItemBookmark *)self convertAndCopyURLToInbox:v39 ofType:v36 conversionRules:v13 completion:v41];
      }
    }
    else
    {
      [(DOCItemBookmark *)self copyURLToInbox:v26 completion:v25];
    }

    goto LABEL_26;
  }
  uint64_t v16 = self->_bookmarkableString != 0;
  uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Trying to prepare a DOCItem in mode %lu with a nil bookmarkableString", a3);
  LOBYTE(v16) = DOCAssertWithIntenalBuildAlert(v16, 0, @"[INTERNAL BUILD] Elusive Bug Alert", @"Trying to prepare a DOCItemBookmark with usingBookmark==YES and with a nil bookmarkableString.\n\n Please file a radar to DocumentManager | iOS and attach a sysdiagnose.\n\n We will now abort the action.", v17, 0);

  if (v16)
  {
    bookmarkableString = self->_bookmarkableString;
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_3;
    v51[3] = &unk_2641B2268;
    v51[4] = self;
    id v52 = v14;
    unint64_t v53 = a3;
    SEL v54 = a2;
    +[DOCItemBookmark _fetchDocumentURLFromBookmarkableString:bookmarkableString completion:v51];
    v19 = v52;
  }
  else
  {
    uint64_t v55 = MEMORY[0x263EF8330];
    uint64_t v56 = 3221225472;
    v57 = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_2;
    v58 = &unk_2641B1080;
    id v59 = v14;
    DOCRunInMainThread();
    v19 = v59;
  }
LABEL_27:
}

uint64_t __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (NSObject **)MEMORY[0x263F3AC28];
    BOOL v8 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      BOOL v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_3_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_15;
    id v27 = &unk_2641B1080;
    id v28 = *(id *)(a1 + 40);
    DOCRunInMainThread();
    v15 = v28;
  }
  else
  {
    [*(id *)(a1 + 32) setFileURL:v5];
    if (*(void *)(a1 + 48) && ![*(id *)(a1 + 32) needsToBeImported])
    {
      id v21 = *(id *)(a1 + 40);
      DOCRunInMainThread();
      v15 = v21;
    }
    else
    {
      uint64_t v16 = [*(id *)(a1 + 32) fileURL];

      if (!v16)
      {
        uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
        [v20 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"DOCItemBookmark.m" lineNumber:147 description:@"Trying to prepare a DOCItemBookmark in mode ImportCopy with a nil urls"];
      }
      uint64_t v17 = *(void **)(a1 + 32);
      id v18 = [v17 fileURL];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_2_23;
      v22[3] = &unk_2641B2240;
      v19 = *(void **)(a1 + 40);
      v22[4] = *(void *)(a1 + 32);
      id v23 = v19;
      [v17 copyURLToInbox:v18 completion:v22];

      v15 = v23;
    }
  }
}

uint64_t __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_2_23(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setFileURL:a2];
  id v3 = *(id *)(a1 + 40);
  DOCRunInMainThread();
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_3_24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) fileURL];
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) fileURL];
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);
}

uint64_t __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_6(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setFileURL:a2];
  id v3 = *(id *)(a1 + 40);
  DOCRunInMainThread();
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) fileURL];
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) fileURL];
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);
}

- (void)convertAndCopyURLToInbox:(id)a3 ofType:(id)a4 conversionRules:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = dispatch_get_global_queue(21, 0);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke;
  v18[3] = &unk_2641B22E0;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  id v17 = v9;
  dispatch_async(v13, v18);
}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) startAccessingSecurityScopedResource])
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    id v50 = __Block_byref_object_copy__2;
    v51 = __Block_byref_object_dispose__2;
    id v52 = 0;
    id v2 = *(void **)(a1 + 48);
    id v3 = *(void **)(a1 + 40);
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_2;
    v44[3] = &unk_2641B2290;
    id v45 = v2;
    uint64_t v46 = &v47;
    [v3 enumerateKeysAndObjectsUsingBlock:v44];
    if (v48[5])
    {
      id v4 = [*(id *)(a1 + 32) lastPathComponent];
      id v5 = [v4 stringByDeletingPathExtension];
      id v6 = [(id)v48[5] preferredFilenameExtension];
      id v7 = [v5 stringByAppendingPathExtension:v6];

      BOOL v8 = objc_msgSend(NSURL, "ui_incomingDirectory:", 1);
      id v9 = [v8 URLByAppendingPathComponent:v7];
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x2020000000;
      char v43 = 0;
      id v10 = objc_alloc_init(MEMORY[0x263F08830]);
      uint64_t v11 = *(void *)(a1 + 32);
      id v39 = 0;
      uint64_t v32 = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      objc_super v34 = __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_35;
      v35 = &unk_2641B22B8;
      v37 = &v40;
      id v12 = v9;
      id v36 = v12;
      int v38 = &v47;
      [v10 coordinateReadingItemAtURL:v11 options:1 error:&v39 byAccessor:&v32];
      id v13 = v39;
      objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource", v32, v33, v34, v35);
      if (*((unsigned char *)v41 + 24))
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        objc_msgSend(v12, "ui_scheduleForCleanup");
      }
      else
      {
        uint64_t v24 = (NSObject **)MEMORY[0x263F3AC28];
        uint64_t v25 = *MEMORY[0x263F3AC28];
        if (!*MEMORY[0x263F3AC28])
        {
          DOCInitLogging();
          uint64_t v25 = *v24;
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_2((uint64_t)v13, v25, v26, v27, v28, v29, v30, v31);
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }

      _Block_object_dispose(&v40, 8);
    }
    else
    {
      id v16 = (NSObject **)MEMORY[0x263F3AC28];
      id v17 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        id v17 = *v16;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_1(a1 + 48, v17, v18, v19, v20, v21, v22, v23);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    id v14 = (NSObject **)MEMORY[0x263F3AC28];
    id v15 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_3(v15);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_35(void *a1, CFURLRef url)
{
  CGImageSourceRef v3 = CGImageSourceCreateWithURL(url, 0);
  if (v3)
  {
    id v4 = v3;
    CFURLRef v5 = (const __CFURL *)a1[4];
    id v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) identifier];
    char v7 = 1;
    id v8 = CGImageDestinationCreateWithURL(v5, v6, 1uLL, 0);

    CGImageDestinationAddImageFromSource(v8, v4, 0, 0);
    CGImageDestinationFinalize(v8);
    CFRelease(v8);
    CFRelease(v4);
  }
  else
  {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v7;
}

- (void)copyURLToInbox:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = dispatch_get_global_queue(21, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke;
  v10[3] = &unk_2641B12A0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) startAccessingSecurityScopedResource])
  {
    id v2 = objc_alloc_init(MEMORY[0x263F08850]);
    id v3 = objc_alloc_init(MEMORY[0x263F08830]);
    id v4 = objc_msgSend(NSURL, "ui_incomingDirectory:", 1);
    id v5 = [*(id *)(a1 + 32) lastPathComponent];
    id v6 = [v4 URLByAppendingPathComponent:v5];

    uint64_t v31 = 0;
    v32[0] = &v31;
    v32[1] = 0x3032000000;
    v32[2] = __Block_byref_object_copy__2;
    v32[3] = __Block_byref_object_dispose__2;
    id v33 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v7 = *(void *)(a1 + 32);
    id obj = 0;
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke_2;
    uint64_t v22 = &unk_2641B2308;
    id v8 = v2;
    id v23 = v8;
    uint64_t v24 = &v27;
    uint64_t v25 = &v31;
    [v3 coordinateReadingItemAtURL:v7 options:1 writingItemAtURL:v6 options:8 error:&obj byAccessor:&v19];
    objc_storeStrong(&v33, obj);
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource", v19, v20, v21, v22);
    if (*((unsigned char *)v28 + 24))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      objc_msgSend(v6, "ui_scheduleForCleanup");
    }
    else
    {
      id v11 = (NSObject **)MEMORY[0x263F3AC28];
      id v12 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        id v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke_cold_1((uint64_t)v32, v12, v13, v14, v15, v16, v17, v18);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    id v9 = (NSObject **)MEMORY[0x263F3AC28];
    id v10 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_3(v10);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) removeItemAtURL:v6 error:0];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v7 copyItemAtURL:v5 toURL:v6 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  [v6 setResourceValue:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263EFF718] error:0];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v14 = 0;
    char v10 = [MEMORY[0x263F160C0] associateThumbnailsForDocumentAtURL:v5 withImmutableDocument:0 atURL:v6 error:&v14];
    id v11 = v14;
    if ((v10 & 1) == 0)
    {
      id v12 = (NSObject **)MEMORY[0x263F3AC28];
      uint64_t v13 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        uint64_t v13 = *v12;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_error_impl(&dword_21361D000, v13, OS_LOG_TYPE_ERROR, "Failed to associate thumbnails for picked URL %@ with the Inbox copy %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (id)coordinatedFileURL
{
  wrapper = self->_wrapper;
  if (!wrapper)
  {
    char v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"DOCItemBookmark.m" lineNumber:323 description:@"Trying to prepare a coordinatedFileURL with a nil wrapper"];

    wrapper = self->_wrapper;
  }
  id v4 = [(FPSandboxingURLWrapper *)wrapper url];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__2;
  id v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  [v4 startAccessingSecurityScopedResource];
  id v5 = objc_alloc_init(MEMORY[0x263F08830]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__DOCItemBookmark_coordinatedFileURL__block_invoke;
  v11[3] = &unk_2641B21F0;
  v11[4] = &v13;
  id v12 = 0;
  [v5 coordinateReadingItemAtURL:v4 options:0 error:&v12 byAccessor:v11];
  id v6 = v12;
  [v4 stopAccessingSecurityScopedResource];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __37__DOCItemBookmark_coordinatedFileURL__block_invoke(uint64_t a1, void *a2)
{
}

+ (id)documentsURLsForItemBookmarks:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "fileURL", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCItemBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DOCItemBookmark;
  id v5 = [(DOCItemBookmark *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contentType"];
    contentType = v5->_contentType;
    v5->_contentType = (UTType *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrapper"];
    wrapper = v5->_wrapper;
    v5->_wrapper = (FPSandboxingURLWrapper *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fileProviderItem"];
    fileProviderItem = v5->_fileProviderItem;
    v5->_fileProviderItem = (FPItem *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bookmarkableString"];
    bookmarkableString = v5->_bookmarkableString;
    v5->_bookmarkableString = (NSString *)v12;

    -[DOCItemBookmark setNeedsToBeImported:](v5, "setNeedsToBeImported:", [v4 decodeBoolForKey:@"_needsToBeImported"]);
    long long v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (self->_contentType)
  {
    id v4 = [(DOCItemBookmark *)self contentType];
    [v8 encodeObject:v4 forKey:@"_contentType"];
  }
  wrapper = self->_wrapper;
  if (wrapper) {
    [v8 encodeObject:wrapper forKey:@"_wrapper"];
  }
  fileProviderItem = self->_fileProviderItem;
  if (fileProviderItem) {
    [v8 encodeObject:fileProviderItem forKey:@"_fileProviderItem"];
  }
  bookmarkableString = self->_bookmarkableString;
  if (bookmarkableString) {
    [v8 encodeObject:bookmarkableString forKey:@"_bookmarkableString"];
  }
  objc_msgSend(v8, "encodeBool:forKey:", -[DOCItemBookmark needsToBeImported](self, "needsToBeImported"), @"_needsToBeImported");
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)DOCItemBookmark;
  id v4 = [(DOCItemBookmark *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ FPItem=%@", v4, self->_fileProviderItem];

  return v5;
}

- (BOOL)needsToBeImported
{
  return self->_needsToBeImported;
}

- (void)setNeedsToBeImported:(BOOL)a3
{
  self->_needsToBeImported = a3;
}

+ (BOOL)isAnyItemBookmarkAFault:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_super v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "fileProviderItem", (void)v10);
        if ([v7 isCloudItem])
        {
          char v8 = [v7 isDownloaded];

          if ((v8 & 1) == 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
LABEL_12:

  return v4;
}

+ (BOOL)isAnyFPItemAFault:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_super v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isCloudItem", (void)v9)
          && ![v7 isDownloaded])
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)bookmarkableString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBookmarkableString:(id)a3
{
}

- (FPItem)fileProviderItem
{
  return (FPItem *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFileProviderItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderItem, 0);
  objc_storeStrong((id *)&self->_bookmarkableString, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_wrapper, 0);
}

- (void)initWithURL:fileProviderItem:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_21361D000, v0, v1, "Failed to create FPSandboxingURLWrapper with URL: %@. %@");
}

- (void)initWithURL:fileProviderItem:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_21361D000, v0, v1, "Failed to coordinate on bookmark item with URL: %@. %@");
}

void __94__DOCItemBookmark_prepareForMode_usingBookmark_shouldConvert_conversionRules_completionBlock___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__DOCItemBookmark_convertAndCopyURLToInbox_ofType_conversionRules_completion___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21361D000, log, OS_LOG_TYPE_ERROR, "can't acces security scoped url", v1, 2u);
}

void __45__DOCItemBookmark_copyURLToInbox_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end