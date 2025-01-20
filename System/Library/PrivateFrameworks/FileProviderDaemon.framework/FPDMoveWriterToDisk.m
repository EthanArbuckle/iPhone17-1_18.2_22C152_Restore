@interface FPDMoveWriterToDisk
- (FPDMoveWriterToDisk)initWithWriter:(id)a3;
- (void)_performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 bounceNumber:(id)a8 completion:(id)a9;
- (void)_performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 bounceNumber:(id)a8 completion:(id)a9;
- (void)_resolveLocator:(id)a3 completion:(id)a4;
- (void)_respectLastUsageDatePolicyForDestinationURL:(id)a3 withSource:(id)a4;
- (void)_touchModificationDateForURL:(id)a3;
- (void)dealloc;
- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8;
- (void)performCreateFolder:(id)a3 inside:(id)a4 as:(id)a5 completion:(id)a6;
- (void)performMoveOfFolder:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 atomically:(BOOL)a8 completion:(id)a9;
- (void)performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8;
@end

@implementation FPDMoveWriterToDisk

- (FPDMoveWriterToDisk)initWithWriter:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FPDMoveWriterToDisk;
  v5 = [(FPDMoveWriterToDisk *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_writer, v4);
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    fileManager = v6->_fileManager;
    v6->_fileManager = (NSFileManager *)v7;

    v9 = [v4 info];
    v10 = [v9 targetFolder];
    uint64_t v11 = [v10 startAccessingLocator];
    stopAccessingToken = v6->_stopAccessingToken;
    v6->_stopAccessingToken = (FPActionLocatorAccess *)v11;
  }
  return v6;
}

- (void)dealloc
{
  [(FPActionLocatorAccess *)self->_stopAccessingToken stopAccessing];
  v3.receiver = self;
  v3.super_class = (Class)FPDMoveWriterToDisk;
  [(FPDMoveWriterToDisk *)&v3 dealloc];
}

- (void)_respectLastUsageDatePolicyForDestinationURL:(id)a3 withSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  v9 = [WeakRetained info];
  uint64_t v10 = [v9 lastUsedDatePolicy];

  if (v10 == 2)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    goto LABEL_8;
  }
  if (v10 != 1) {
    goto LABEL_9;
  }
  uint64_t v11 = FPFileMetadataCopyLastUsedDateAtURL();
  id v12 = 0;
  if (!v12)
  {
LABEL_8:
    FPSetLastUsedDateAtURL();

    goto LABEL_9;
  }
  v13 = v12;
  objc_super v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[FPDMoveWriterToDisk _respectLastUsageDatePolicyForDestinationURL:withSource:]();
  }

LABEL_9:
}

- (void)_touchModificationDateForURL:(id)a3
{
  id v3 = a3;
  [v3 fileSystemRepresentation];
  id v4 = v3;
  if ((fpfs_open() & 0x80000000) != 0)
  {
    v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FPDMoveWriterToDisk _touchModificationDateForURL:](v4);
    }
  }
}

uint64_t __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke(uint64_t a1)
{
  v6.tv_sec = 0;
  *(void *)&v6.tv_usec = 0;
  if (gettimeofday(&v6, 0) < 0)
  {
    v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke_cold_1(v5);
    }
  }
  else
  {
    int v2 = fpfs_fset_metadata();
    uint64_t result = 0;
    if ((v2 & 0x80000000) == 0) {
      return result;
    }
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke_cold_2(a1);
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke_4()
{
  return 0;
}

- (void)_performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 bounceNumber:(id)a8 completion:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  BOOL v28 = a6 == 2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  v27 = [WeakRetained coordinator];
  id v19 = objc_loadWeakRetained((id *)&self->_writer);
  v20 = [v19 operation];
  v21 = [v20 request];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke;
  v31[3] = &unk_1E6A746C0;
  v31[4] = self;
  id v32 = v15;
  id v33 = v16;
  id v34 = v17;
  id v35 = v14;
  id v36 = v18;
  unint64_t v37 = a6;
  unint64_t v38 = a7;
  id v22 = v14;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v18;
  [v27 resolveItemOrURL:v22 recursively:v28 request:v21 andCoordinateWithHandler:v31];
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v10 = [WeakRetained coordinator];
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    v13 = [v12 operation];
    id v14 = [v13 request];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2;
    v17[3] = &unk_1E6A74698;
    id v24 = v8;
    id v25 = *(id *)(a1 + 72);
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    id v15 = v7;
    uint64_t v16 = *(void *)(a1 + 32);
    id v20 = v15;
    uint64_t v21 = v16;
    id v22 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 40);
    long long v26 = *(_OWORD *)(a1 + 80);
    [v10 resolveItemOrURL:v11 recursively:0 coordinateIfExport:0 request:v14 handler:v17];
  }
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_3;
    v40[3] = &unk_1E6A74588;
    id v41 = *(id *)(a1 + 80);
    id v10 = v9;
    id v42 = v10;
    id v43 = *(id *)(a1 + 88);
    uint64_t v11 = (void *)MEMORY[0x1D9471EC0](v40);
    id v12 = *(id *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    if (v13)
    {
      uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v13, "longValue"), objc_msgSend(*(id *)(a1 + 48), "fp_isFolder"));

      id v12 = (id)v14;
    }
    long long v26 = v12;
    id v15 = objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v12, objc_msgSend(*(id *)(a1 + 48), "fp_isFolder"));
    id v25 = *(void **)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 8));
    id v17 = [WeakRetained queue];
    uint64_t v18 = [*(id *)(a1 + 64) size];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_4;
    v27[3] = &unk_1E6A74670;
    id v28 = *(id *)(a1 + 72);
    int8x16_t v24 = *(int8x16_t *)(a1 + 48);
    id v19 = (id)v24.i64[0];
    int8x16_t v29 = vextq_s8(v24, v24, 8uLL);
    id v30 = v7;
    id v31 = *(id *)(a1 + 40);
    id v35 = *(id *)(a1 + 80);
    id v36 = v10;
    id v32 = *(id *)(a1 + 64);
    id v33 = *(id *)(a1 + 32);
    long long v39 = *(_OWORD *)(a1 + 96);
    id v37 = *(id *)(a1 + 88);
    id v38 = v11;
    id v34 = v15;
    id v20 = v11;
    id v21 = v15;
    id v22 = objc_msgSend(v25, "fp_copyToURL:queue:precomputedItemSize:replacePlaceholder:completion:", v21, v17, v18, 0, v27);

    id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 8));
    [v23 setProgress:v22 forRoot:*(void *)(a1 + 64)];
  }
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_3(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1[4];
  timeval v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5);
  (*(void (**)(void))(a1[5] + 16))();
  (*(void (**)(void))(a1[6] + 16))();
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([*(id *)(a1 + 32) isProviderItem])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    id v7 = [WeakRetained operation];
    id v8 = [v7 manager];
    id v9 = [*(id *)(a1 + 32) asFPItem];
    id v10 = [v9 itemID];
    uint64_t v11 = [v8 domainFromItemID:v10 reason:0];

    if (!v5)
    {
LABEL_3:
      [*(id *)(a1 + 40) _respectLastUsageDatePolicyForDestinationURL:*(void *)(a1 + 88) withSource:*(void *)(a1 + 48)];
      [*(id *)(a1 + 40) _touchModificationDateForURL:*(void *)(a1 + 56)];
      id v12 = dispatch_group_create();
      v13 = v12;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)v64 = __Block_byref_object_copy__2;
      *(void *)&v64[8] = __Block_byref_object_dispose__2;
      *(void *)&v64[16] = 0;
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x3032000000;
      v57[3] = __Block_byref_object_copy__2;
      v57[4] = __Block_byref_object_dispose__2;
      id v58 = 0;
      if (v11)
      {
        dispatch_group_enter(v12);
        uint64_t v14 = [v11 defaultBackend];
        uint64_t v15 = *(void *)(a1 + 88);
        uint64_t v16 = +[FPDRequest requestForSelf];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_12;
        v52[3] = &unk_1E6A74600;
        v52[4] = *(void *)(a1 + 40);
        id v53 = *(id *)(a1 + 88);
        v54 = v13;
        v55 = buf;
        v56 = v57;
        [v14 itemForURL:v15 request:v16 completionHandler:v52];
      }
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      uint64_t v18 = [v17 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_15;
      block[3] = &unk_1E6A74628;
      v50 = v57;
      v51 = buf;
      id v49 = *(id *)(a1 + 120);
      id v48 = *(id *)(a1 + 88);
      dispatch_group_notify(v13, v18, block);

      [*(id *)(a1 + 88) fileSystemRepresentation];
      fpfs_open();

      _Block_object_dispose(v57, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (!v5) {
      goto LABEL_3;
    }
  }
  if (objc_msgSend(v5, "fp_isPOSIXErrorCode:", 17) && !a2
    || objc_msgSend(v5, "fp_isPOSIXErrorCode:", 66))
  {
    id v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = *(void *)(a1 + 48);
      uint64_t v45 = *(void *)(a1 + 56);
      id v46 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      id v36 = [v46 info];
      int v37 = [v36 shouldBounce];
      int v38 = [*(id *)(a1 + 32) isProviderItem];
      uint64_t v39 = *(void *)(a1 + 64);
      v40 = objc_msgSend(v5, "fp_prettyDescription");
      *(_DWORD *)buf = 138413570;
      *(void *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v64 = v37;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v38;
      *(_WORD *)&v64[10] = 2114;
      *(void *)&v64[12] = v39;
      *(_WORD *)&v64[20] = 2112;
      *(void *)&v64[22] = v40;
      _os_log_error_impl(&dword_1D744C000, v19, OS_LOG_TYPE_ERROR, "[ERROR] move-writer: collision when copying item at %@ to %@ (shouldBounce: %{BOOL}d, moveToProvider: %{BOOL}d, bounceNumber: %{public}@): %@", buf, 0x36u);
    }
    id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    id v21 = [v20 info];
    int v22 = [v21 shouldBounce];

    if (v22)
    {
      id v23 = NSNumber;
      uint64_t v24 = [*(id *)(a1 + 64) longValue];
      if (v24 <= 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v24;
      }
      long long v26 = [v23 numberWithLong:v25 + 1];
      (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
      (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
      [*(id *)(a1 + 40) _performCopyOfItem:*(void *)(a1 + 72) to:*(void *)(a1 + 32) as:*(void *)(a1 + 80) sourceMaterializeOption:*(void *)(a1 + 128) targetMaterializeOption:*(void *)(a1 + 136) bounceNumber:v26 completion:*(void *)(a1 + 112)];
    }
    else if ([*(id *)(a1 + 32) isProviderItem])
    {
      v27 = [v11 defaultBackend];
      uint64_t v28 = *(void *)(a1 + 88);
      int8x16_t v29 = +[FPDRequest requestForSelf];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_9;
      v60[3] = &unk_1E6A745B0;
      id v62 = *(id *)(a1 + 120);
      id v61 = v5;
      [v27 itemForURL:v28 request:v29 completionHandler:v60];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 120) + 16))();
    }
  }
  else
  {
    id v30 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v31 = *(void *)(a1 + 88);
    id v59 = 0;
    char v32 = [v30 removeItemAtURL:v31 error:&v59];
    id v33 = v59;

    if ((v32 & 1) == 0)
    {
      id v34 = fp_current_or_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_4_cold_1((id *)(a1 + 88));
      }
    }
    id v35 = fp_current_or_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v41 = [*(id *)(a1 + 48) path];
      id v42 = [*(id *)(a1 + 88) path];
      id v43 = objc_msgSend(v5, "fp_prettyDescription");
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 2112;
      *(void *)v64 = v43;
      _os_log_error_impl(&dword_1D744C000, v35, OS_LOG_TYPE_ERROR, "[ERROR] couldn't copy item at %@ to %@: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 120) + 16))();
  }
LABEL_27:
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    id v6 = [MEMORY[0x1E4F28C58] fileProviderErrorForCollisionWithItem:a2];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v6);
  }
  else
  {
    if (!a3) {
      a3 = *(void *)(a1 + 32);
    }
    id v4 = *(void (**)(uint64_t, void, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    v4(v5, 0, a3);
  }
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v8 = [WeakRetained queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13;
  v11[3] = &unk_1E6A745D8;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_2();
    }
  }
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = fp_current_or_default_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] move-writer: couldn't have item for URL %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = *(id *)(a1 + 56);
  objc_sync_enter(v7);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 48));
  objc_sync_exit(v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_15(void *a1)
{
  int v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_15_cold_1();
  }

  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v3 = a1[5];
    if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
      objc_msgSend(MEMORY[0x1E4F25CB8], "locatorForItem:");
    }
    else {
    id v4 = [MEMORY[0x1E4F25CB8] locatorForURL:a1[4]];
    }
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
  }
}

uint64_t __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_17(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40E0CF8](a2);
}

- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  id v19 = [WeakRetained info];
  int v20 = [v19 shouldBounce];

  if (v20)
  {
    id v23 = 0;
    uint64_t v21 = objc_msgSend(v16, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v23, 0, objc_msgSend(v14, "isFolder"));
    id v22 = v23;

    id v16 = (id)v21;
  }
  else
  {
    id v22 = 0;
  }
  [(FPDMoveWriterToDisk *)self _performCopyOfItem:v14 to:v15 as:v16 sourceMaterializeOption:a6 targetMaterializeOption:a7 bounceNumber:v22 completion:v17];
}

- (void)_resolveLocator:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  int v8 = [v7 isExternalURL];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  id v9 = [WeakRetained coordinator];
  if (v8)
  {
    uint64_t v10 = [v7 asURL];
    [v9 startAccessingURLForAtomDuration:v10];

    id WeakRetained = [v7 asURL];

    v6[2](v6, WeakRetained, 0);
  }
  else
  {
    uint64_t v11 = [v7 asFPItem];

    [v9 resolveItem:v11 completion:v6];
    id v6 = (void (**)(id, id, void))v9;
  }
}

- (void)_performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 bounceNumber:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  uint64_t v21 = objc_opt_new();
  [WeakRetained setProgress:v21 forRoot:v15];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke;
  v27[3] = &unk_1E6A74760;
  void v27[4] = self;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  id v31 = v15;
  id v32 = v19;
  unint64_t v33 = a6;
  unint64_t v34 = a7;
  id v22 = v15;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  id v26 = v19;
  [(FPDMoveWriterToDisk *)self _resolveLocator:v22 completion:v27];
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_cold_1(v5);
    }

    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_23;
    v12[3] = &unk_1E6A74738;
    id v19 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(a1 + 40);
    id v15 = v9;
    uint64_t v16 = v10;
    id v17 = v11;
    id v18 = *(id *)(a1 + 64);
    long long v20 = *(_OWORD *)(a1 + 80);
    [v7 _resolveLocator:v8 completion:v12];
  }
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_23_cold_1();
  }

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = v8;
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 48), "fp_isFolder");
    if (v9)
    {
      objc_msgSend(v10, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v9, "longValue"), v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      unint64_t v13 = [v9 unsignedLongValue];
      if (v13 >= objc_msgSend(NSString, "fp_maximumBounceLevel"))
      {
        id v12 = v12;

        id v9 = 0;
        id v10 = v12;
      }
    }
    else
    {
      id v12 = v10;
    }
    v51 = [v5 URLByAppendingPathComponent:v12];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 8));
    id v15 = [WeakRetained coordinator];
    [v15 startAccessingURLForAtomDuration:v5];

    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_25;
    v62[3] = &unk_1E6A746E8;
    uint64_t v16 = *(void **)(a1 + 64);
    v62[4] = *(void *)(a1 + 56);
    id v63 = v16;
    id v64 = *(id *)(a1 + 72);
    id v50 = v10;
    id v65 = v50;
    long long v67 = *(_OWORD *)(a1 + 88);
    id v66 = *(id *)(a1 + 80);
    id v17 = (void (**)(void, void, void, void, void))MEMORY[0x1D9471EC0](v62);
    id v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v33 = [*(id *)(a1 + 48) path];
      [v51 path];
      unint64_t v34 = v53 = v17;
      [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
      id v49 = v12;
      v36 = id v35 = v9;
      int v37 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 96)];
      *(_DWORD *)buf = 138413058;
      v69 = v33;
      __int16 v70 = 2112;
      v71 = v34;
      __int16 v72 = 2112;
      v73 = v36;
      __int16 v74 = 2112;
      v75 = v37;
      _os_log_debug_impl(&dword_1D744C000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: checking target existence before coordination to move on disk %@ to %@.                        sourceMaterializeOption %@ targetMaterializeOption %@", buf, 0x2Au);

      id v9 = v35;
      id v12 = v49;

      id v17 = v53;
    }

    id v61 = 0;
    id v52 = v5;
    id v19 = objc_msgSend(v5, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", v12, v11, 0, &v61, 1);
    id v20 = v61;
    uint64_t v21 = v20;
    if (v19)
    {
      if (v20) {
        id v22 = v20;
      }
      else {
        id v22 = &unk_1F2EDBBF8;
      }
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v22, "longValue") + 1);

      uint64_t v23 = *(void *)(a1 + 48);
      id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:516 userInfo:0];
      ((void (**)(void, uint64_t, void *, void *, void *))v17)[2](v17, v23, v19, v21, v24);
      id v25 = v51;
    }
    else
    {
      id v48 = v12;
      id v26 = v9;
      v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        int v38 = [*(id *)(a1 + 48) path];
        [v51 path];
        v40 = uint64_t v39 = v17;
        id v41 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
        id v42 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 96)];
        *(_DWORD *)buf = 138413058;
        v69 = v38;
        __int16 v70 = 2112;
        v71 = v40;
        __int16 v72 = 2112;
        v73 = v41;
        __int16 v74 = 2112;
        v75 = v42;
        _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: starting coordination to move on disk %@ to %@.                        sourceMaterializeOption %@ targetMaterializeOption %@", buf, 0x2Au);

        id v17 = v39;
      }

      id v47 = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 8));
      id v28 = [v47 coordinator];
      uint64_t v44 = *(void *)(a1 + 88);
      uint64_t v45 = *(void *)(a1 + 96);
      uint64_t v43 = *(void *)(a1 + 48);
      id v46 = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 8));
      id v29 = [v46 operation];
      id v30 = [v29 request];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_29;
      v54[3] = &unk_1E6A74710;
      id v31 = *(id *)(a1 + 80);
      uint64_t v32 = *(void *)(a1 + 56);
      id v59 = v31;
      v54[4] = v32;
      v60 = v17;
      id v9 = v26;
      id v55 = v26;
      id v25 = v51;
      id v56 = v51;
      id v57 = *(id *)(a1 + 48);
      id v58 = *(id *)(a1 + 64);
      [v28 coordinateForMovingFromURL:v43 toURL:v56 toTargetFolderURL:v52 targetMaterializeOption:v45 sourceMaterializeOption:v44 request:v30 handler:v54];

      id v24 = v59;
      id v19 = 0;
      id v12 = v48;
    }

    id v5 = v52;
  }
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_25(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v24 = [WeakRetained info];
    int v25 = [v24 shouldBounce];
    int v26 = [*(id *)(a1 + 40) isProviderItem];
    v27 = objc_msgSend(v12, "fp_prettyDescription");
    *(_DWORD *)buf = 138413570;
    id v34 = v9;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 1024;
    int v38 = v25;
    __int16 v39 = 2112;
    id v40 = v11;
    __int16 v41 = 1024;
    int v42 = v26;
    __int16 v43 = 2112;
    uint64_t v44 = v27;
    _os_log_error_impl(&dword_1D744C000, v13, OS_LOG_TYPE_ERROR, "[ERROR] move-writer: collision when moving item at %@ to %@ (shouldBounce: %{BOOL}d, nextBounceNumber: %@, moveToProvider: %{BOOL}d): %@", buf, 0x36u);
  }
  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v15 = [v14 info];
  int v16 = [v15 shouldBounce];

  if (v16)
  {
    [*(id *)(a1 + 32) _performMoveOfItem:*(void *)(a1 + 48) to:*(void *)(a1 + 40) as:*(void *)(a1 + 56) sourceMaterializeOption:*(void *)(a1 + 72) targetMaterializeOption:*(void *)(a1 + 80) bounceNumber:v11 completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 40) isProviderItem])
  {
    id v28 = [*(id *)(a1 + 40) asFPItem];
    id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v18 = [v17 operation];
    id v19 = [v18 manager];
    id v20 = [v28 itemID];
    uint64_t v21 = [v19 domainFromItemID:v20 reason:0];

    id v22 = [v21 defaultBackend];
    uint64_t v23 = +[FPDRequest requestForSelf];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_26;
    v30[3] = &unk_1E6A745B0;
    id v32 = *(id *)(a1 + 64);
    id v31 = v12;
    [v22 itemForURL:v10 request:v23 completionHandler:v30];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_26(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    id v6 = [MEMORY[0x1E4F28C58] fileProviderErrorForCollisionWithItem:a2];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v6);
  }
  else
  {
    if (!a3) {
      a3 = *(void *)(a1 + 32);
    }
    id v4 = *(void (**)(uint64_t, void, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    v4(v5, 0, a3);
  }
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_29(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v26 = [v9 path];
    v27 = [v10 path];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2112;
    id v62 = v11;
    _os_log_debug_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: finished coordinateForMovingFromURL source %@ dest %@ destFolder %@", buf, 0x20u);
  }
  if (!v12)
  {
    id v14 = *(void **)(*(void *)(a1 + 32) + 16);
    id v60 = 0;
    [v14 moveItemAtURL:v9 toURL:v10 error:&v60];
    id v15 = v60;
    int v16 = v15;
    if (!v15)
    {
      [*(id *)(a1 + 32) _respectLastUsageDatePolicyForDestinationURL:*(void *)(a1 + 48) withSource:v9];
      id v24 = v9;
      if (!v9) {
        id v24 = *(void **)(a1 + 56);
      }
      uint64_t v45 = [v24 URLByDeletingLastPathComponent];
      if (v11)
      {
        uint64_t v44 = v11;
      }
      else
      {
        uint64_t v44 = [*(id *)(a1 + 48) URLByDeletingLastPathComponent];
      }
      [*(id *)(a1 + 32) _touchModificationDateForURL:v45];
      [*(id *)(a1 + 32) _touchModificationDateForURL:v44];
      group = dispatch_group_create();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v62 = __Block_byref_object_copy__2;
      id v63 = __Block_byref_object_dispose__2;
      id v64 = 0;
      v58[0] = 0;
      v58[1] = v58;
      v58[2] = 0x3032000000;
      v58[3] = __Block_byref_object_copy__2;
      v58[4] = __Block_byref_object_dispose__2;
      id v59 = 0;
      if ([*(id *)(a1 + 64) isProviderItem])
      {
        int v42 = [*(id *)(a1 + 64) asFPItem];
        dispatch_group_enter(group);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        id v29 = [WeakRetained operation];
        id v30 = [v29 manager];
        id v31 = [v42 itemID];
        __int16 v43 = [v30 domainFromItemID:v31 reason:0];

        id v32 = fp_current_or_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_29_cold_1();
        }

        unint64_t v33 = [v43 defaultBackend];
        uint64_t v41 = *(void *)(a1 + 48);
        id v34 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        __int16 v35 = [v34 operation];
        id v36 = [v35 request];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_30;
        v53[3] = &unk_1E6A74600;
        v53[4] = *(void *)(a1 + 32);
        id v54 = *(id *)(a1 + 48);
        id v55 = group;
        id v56 = buf;
        id v57 = v58;
        [v33 itemForURL:v41 request:v36 completionHandler:v53];

        [v43 forceIngestionAtURL:*(void *)(a1 + 48)];
      }
      id v37 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      int v38 = [v37 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_31;
      block[3] = &unk_1E6A74628;
      v51 = v58;
      id v52 = buf;
      id v50 = *(id *)(a1 + 72);
      id v49 = *(id *)(a1 + 48);
      dispatch_group_notify(group, v38, block);

      _Block_object_dispose(v58, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_26;
    }
    id v17 = [v15 domain];
    if ([v17 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      BOOL v18 = [v16 code] == 516;

      if (v18)
      {
        uint64_t v19 = *(void *)(a1 + 80);
        id v20 = NSNumber;
        uint64_t v21 = [*(id *)(a1 + 40) longValue];
        if (v21 <= 1) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = v21;
        }
        uint64_t v23 = [v20 numberWithLong:v22 + 1];
        (*(void (**)(uint64_t, id, id, void *, void *))(v19 + 16))(v19, v9, v10, v23, v16);

LABEL_26:
        goto LABEL_27;
      }
    }
    else
    {
    }
    int v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      dispatch_group_t groupa = [v9 path];
      __int16 v39 = [v10 path];
      objc_msgSend(v16, "fp_prettyDescription");
      id v40 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = groupa;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2112;
      id v62 = v40;
      _os_log_error_impl(&dword_1D744C000, v25, OS_LOG_TYPE_ERROR, "[ERROR] move-writer: couldn't move item at %@ to %@: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_26;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_27:
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v8 = [WeakRetained queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2;
  v11[3] = &unk_1E6A745D8;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_2();
    }
  }
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = fp_current_or_default_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] move-writer: couldn't have item for URL %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = *(id *)(a1 + 56);
  objc_sync_enter(v7);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 48));
  objc_sync_exit(v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_31(void *a1)
{
  int v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_31_cold_1();
  }

  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v3 = a1[5];
    if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
      objc_msgSend(MEMORY[0x1E4F25CB8], "locatorForItem:");
    }
    else {
    id v4 = [MEMORY[0x1E4F25CB8] locatorForURL:a1[4]];
    }
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
  }
}

- (void)performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  uint64_t v19 = [WeakRetained info];
  int v20 = [v19 shouldBounce];

  if (v20)
  {
    id v23 = 0;
    uint64_t v21 = objc_msgSend(v16, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v23, 0, objc_msgSend(v14, "isFolder"));
    id v22 = v23;

    id v16 = (id)v21;
  }
  else
  {
    id v22 = 0;
  }
  [(FPDMoveWriterToDisk *)self _performMoveOfItem:v14 to:v15 as:v16 sourceMaterializeOption:a6 targetMaterializeOption:a7 bounceNumber:v22 completion:v17];
}

- (void)performMoveOfFolder:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 atomically:(BOOL)a8 completion:(id)a9
{
  if (a8) {
    [(FPDMoveWriterToDisk *)self performMoveOfItem:a3 to:a4 as:a5 sourceMaterializeOption:a6 targetMaterializeOption:a7 completion:a9];
  }
  else {
    -[FPDMoveWriterToDisk performCreateFolder:inside:as:completion:](self, "performCreateFolder:inside:as:completion:", a3, a4, a5, a9, a7);
  }
}

- (void)performCreateFolder:(id)a3 inside:(id)a4 as:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke;
  v18[3] = &unk_1E6A747D8;
  id v21 = v11;
  id v22 = v13;
  v18[4] = self;
  id v19 = v12;
  id v20 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  id v17 = v13;
  [(FPDMoveWriterToDisk *)self _resolveLocator:v14 completion:v18];
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v7 = [WeakRetained coordinator];
    [v7 startAccessingURLForAtomDuration:v5];

    int v8 = 0;
    unint64_t v9 = 0;
    id v10 = 0;
    uint64_t v11 = *MEMORY[0x1E4F281F8];
    while (1)
    {
      id v12 = *(id *)(a1 + 40);
      if (v9)
      {
        if (v9 == 1) {
          unint64_t v13 = 2;
        }
        else {
          unint64_t v13 = v9;
        }
        uint64_t v14 = objc_msgSend(*(id *)(a1 + 40), "fp_bouncedNameWithIndex:isDir:", v13, 1);

        id v12 = (id)v14;
      }
      else
      {
        unint64_t v13 = 0;
      }

      id v15 = [v5 URLByAppendingPathComponent:v12 isDirectory:1];

      id v16 = *(void **)(*(void *)(a1 + 32) + 16);
      v52[0] = 0;
      char v17 = [v16 createDirectoryAtURL:v15 withIntermediateDirectories:0 attributes:0 error:v52];
      id v18 = v52[0];
      int v8 = v18;
      if (v17)
      {

        uint64_t v24 = *(void *)(a1 + 48);
        if (v24)
        {
          int v25 = *(void **)(a1 + 32);
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2;
          v50[3] = &unk_1E6A74788;
          id v51 = v15;
          [v25 _resolveLocator:v24 completion:v50];
        }
        if ([*(id *)(a1 + 56) isProviderItem])
        {
          id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
          v27 = [v26 operation];
          id v28 = [v27 manager];
          id v29 = [v28 domainForURL:v15 reason:0];

          id v30 = [v29 defaultBackend];
          id v31 = +[FPDRequest requestForSelf];
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_34;
          v47[3] = &unk_1E6A73A50;
          v47[4] = *(void *)(a1 + 32);
          id v48 = v15;
          id v49 = *(id *)(a1 + 64);
          [v30 itemForURL:v48 request:v31 completionHandler:v47];
        }
        else
        {
          uint64_t v43 = *(void *)(a1 + 64);
          id v29 = [MEMORY[0x1E4F25CB8] locatorForURL:v15];
          (*(void (**)(uint64_t, void *, void))(v43 + 16))(v43, v29, 0);
        }

        [v15 fileSystemRepresentation];
        fpfs_open();
        goto LABEL_32;
      }
      id v19 = [v18 domain];
      if (([v19 isEqualToString:v11] & 1) == 0) {
        break;
      }
      uint64_t v20 = [v8 code];

      if (v20 != 516) {
        goto LABEL_21;
      }
      id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      id v22 = [v21 info];
      int v23 = [v22 shouldBounce];

      if (v23)
      {
        unint64_t v9 = v13 + 1;
        id v10 = v15;
        if (v13 < 0xFF) {
          continue;
        }
      }
      goto LABEL_22;
    }

LABEL_21:
LABEL_22:
    id v32 = fp_current_or_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_cold_1((uint64_t)v15, v8);
    }

    unint64_t v33 = [v8 domain];
    if ([v33 isEqualToString:v11])
    {
      uint64_t v34 = [v8 code];

      if (v34 == 516 && [*(id *)(a1 + 56) isProviderItem])
      {
        id v35 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        id v36 = [v35 operation];
        id v37 = [v36 manager];
        int v38 = [*(id *)(a1 + 56) asFPItem];
        __int16 v39 = [v38 itemID];
        id v40 = [v37 domainFromItemID:v39 reason:0];

        uint64_t v41 = [v40 defaultBackend];
        int v42 = +[FPDRequest requestForSelf];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_39;
        v44[3] = &unk_1E6A745B0;
        id v46 = *(id *)(a1 + 64);
        id v45 = v8;
        [v41 itemForURL:v15 request:v42 completionHandler:v44];

        goto LABEL_32;
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_32:
  }
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 path];
  [v3 fileSystemRepresentation];
  id v5 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 32);
  id v6 = [v5 path];
  [v6 fileSystemRepresentation];
  int v7 = fpfs_copy_xattrs();

  if (v7)
  {
    int v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_cold_1(v4, v8);
    }
  }
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  int v8 = [WeakRetained queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_35;
  v12[3] = &unk_1E6A747B0;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_35(void *a1)
{
  if (a1[4])
  {
    int v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_2();
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    uint64_t v3 = a1[6];
    id v4 = fp_current_or_default_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5) {
        __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_1();
      }

      uint64_t v6 = a1[7];
      uint64_t v7 = [MEMORY[0x1E4F25CB8] locatorForItem:a1[6]];
    }
    else
    {
      if (v5) {
        __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_35_cold_1((uint64_t)a1, v4);
      }

      uint64_t v6 = a1[7];
      uint64_t v7 = [MEMORY[0x1E4F25CB8] locatorForURL:a1[5]];
    }
    int v8 = (void *)v7;
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, v7, 0);
  }
}

uint64_t __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_36(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40E0CF8](a2);
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_39(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    id v6 = [MEMORY[0x1E4F28C58] fileProviderErrorForCollisionWithItem:a2];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v6);
  }
  else
  {
    if (!a3) {
      a3 = *(void *)(a1 + 32);
    }
    id v4 = *(void (**)(uint64_t, void, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    v4(v5, 0, a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopAccessingToken, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_destroyWeak((id *)&self->_writer);
}

- (void)_respectLastUsageDatePolicyForDestinationURL:withSource:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] failed to preserve last used date: %@", v1, 0xCu);
}

- (void)_touchModificationDateForURL:(void *)a1 .cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_shortDescription");
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] Can't bump mtime on %@: %s", v5, v6, v7, v8, v9);
}

void __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke_cold_1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a1, v3, "[DEBUG] gettimeofday failed to get time of %s", v4);
}

void __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke_cold_2(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v3, v4, "[DEBUG] fpfs_fset_metadata failed to bump mtime %@: %s", v5, v6, v7, v8, v9);
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_4_cold_1(id *a1)
{
  v1 = [*a1 path];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v2, v3, "[ERROR] couldn't remove the empty file/partial copy at %@: %@", v4, v5, v6, v7, v8);
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_1()
{
  OUTLINED_FUNCTION_15();
  v1 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0), "fp_shortDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v2, v3, "[DEBUG] move-writer: resolved item for URL %@: %@", v4, v5, v6, v7, v8);
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_2()
{
  OUTLINED_FUNCTION_15();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v1), "fp_shortDescription");
  uint64_t v3 = objc_msgSend(*v0, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v4, v5, "[ERROR] move-writer: resolving item at URL %@ failed: %@", v6, v7, v8, v9, v10);
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_15_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  int v3 = 138412290;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v1, v2, "[DEBUG] move-writer: Finished copy with dest item %@", (uint8_t *)&v3);
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v2, v3, "[DEBUG] move-writer: finishing resolving source locator: %@, err %@", v4, v5, v6, v7, v8);
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = [v0 path];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v2, v3, "[DEBUG] move-writer: finishing resolving destination locator: %@ err %@", v4, v5, v6, v7, v8);
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_29_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] move-writer: starting ingestion of dest item %@", v2);
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  int v3 = 138412290;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v1, v2, "[DEBUG] move-writer: Finished move with dest item %@", (uint8_t *)&v3);
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint8_t v8 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v2, v3, "[ERROR] couldn't create directory at %@: %@", v4, v5, v6, v7, 2u);
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(*a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] failed to copy xattrs ofr directory %@", v4, 0xCu);
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_35_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(a1), "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a2, v4, "[DEBUG] move-writer: couldn't resolve item for URL %@, but no error; assuming delayed ingestion",
    v5);
}

@end