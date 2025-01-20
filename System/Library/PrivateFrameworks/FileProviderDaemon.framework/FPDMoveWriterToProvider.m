@interface FPDMoveWriterToProvider
- (FPDMoveWriterToProvider)initWithWriter:(id)a3;
- (id)_remoteProxy;
- (id)_targetSession;
- (void)_createFolder:(id)a3 under:(id)a4 completion:(id)a5;
- (void)_createTargetItemWithProxy:(id)a3 target:(id)a4 contents:(id)a5 targetName:(id)a6 lastUsedDate:(id)a7 completionHandler:(id)a8;
- (void)_importURL:(id)a3 source:(id)a4 target:(id)a5 as:(id)a6 lastUsedDate:(id)a7 initialImportFinished:(id)a8 progressAvailable:(id)a9 completion:(id)a10;
- (void)_postImportStepForItem:(id)a3 sourceURL:(id)a4 targetURL:(id)a5 tempFolder:(id)a6 wasCopyRequested:(BOOL)a7 error:(id)a8 completion:(id)a9;
- (void)dealloc;
- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8;
- (void)performCreateFolder:(id)a3 inside:(id)a4 as:(id)a5 completion:(id)a6;
- (void)performMoveOfFolder:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 atomically:(BOOL)a8 completion:(id)a9;
- (void)performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8;
@end

@implementation FPDMoveWriterToProvider

- (FPDMoveWriterToProvider)initWithWriter:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FPDMoveWriterToProvider;
  v5 = [(FPDMoveWriterToProvider *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_writer, v4);
    v7 = [v4 info];
    v8 = [v7 targetFolder];
    uint64_t v9 = [v8 startAccessingLocator];
    stopAccessingToken = v6->_stopAccessingToken;
    v6->_stopAccessingToken = (FPActionLocatorAccess *)v9;
  }
  return v6;
}

- (void)dealloc
{
  [(FPActionLocatorAccess *)self->_stopAccessingToken stopAccessing];
  v3.receiver = self;
  v3.super_class = (Class)FPDMoveWriterToProvider;
  [(FPDMoveWriterToProvider *)&v3 dealloc];
}

- (id)_targetSession
{
  p_writer = &self->_writer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  id v4 = [WeakRetained info];
  v5 = [v4 targetFolder];
  v6 = [v5 asFPItem];
  v7 = [v6 itemID];

  id v8 = objc_loadWeakRetained((id *)p_writer);
  uint64_t v9 = [v8 operation];
  v10 = [v9 manager];

  v11 = [v7 providerID];
  objc_super v12 = [v10 providerWithIdentifier:v11 reason:0];
  v13 = [v7 domainIdentifier];
  v14 = [v12 domainForIdentifier:v13 reason:0];

  v15 = [v14 session];

  return v15;
}

- (id)_remoteProxy
{
  v2 = [(FPDMoveWriterToProvider *)self _targetSession];
  objc_super v3 = (void *)[v2 newFileProviderProxyWithTimeout:0 pid:180.0];

  return v3;
}

- (void)_createTargetItemWithProxy:(id)a3 target:(id)a4 contents:(id)a5 targetName:(id)a6 lastUsedDate:(id)a7 completionHandler:(id)a8
{
  id v41 = a3;
  id v40 = a5;
  id v38 = a8;
  self = (FPDMoveWriterToProvider *)((char *)self + 8);
  id v36 = a7;
  id v14 = a6;
  id v15 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  v17 = [WeakRetained operation];
  v18 = [v17 manager];
  v19 = [v15 asFPItem];
  v20 = [v19 itemID];
  v35 = [v18 domainFromItemID:v20 reason:0];

  id v21 = objc_alloc(MEMORY[0x1E4F25D20]);
  v22 = [v15 asFPItem];
  v23 = [v22 providerDomainID];
  v24 = [v15 asFPItem];

  v25 = [v24 itemIdentifier];
  v26 = (void *)[v21 initWithProviderDomainID:v23 itemIdentifier:@"__" parentItemIdentifier:v25 filename:v14 isDirectory:0];

  [v26 setLastUsedDate:v36];
  id v37 = objc_loadWeakRetained((id *)&self->super.isa);
  v27 = [v37 operation];
  v28 = [v27 request];
  v29 = [v35 session];
  v30 = [v28 nsfpRequestForSession:v29];
  id v31 = objc_loadWeakRetained((id *)&self->super.isa);
  v32 = [v31 info];
  uint64_t v33 = [v32 shouldBounce];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __112__FPDMoveWriterToProvider__createTargetItemWithProxy_target_contents_targetName_lastUsedDate_completionHandler___block_invoke;
  v42[3] = &unk_1E6A763C8;
  id v43 = v38;
  id v39 = v38;
  id v34 = (id)[v41 createItemBasedOnTemplate:v26 fields:14 contents:v40 options:0x10000 request:v30 bounce:v33 completionHandler:v42];
}

uint64_t __112__FPDMoveWriterToProvider__createTargetItemWithProxy_target_contents_targetName_lastUsedDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_importURL:(id)a3 source:(id)a4 target:(id)a5 as:(id)a6 lastUsedDate:(id)a7 initialImportFinished:(id)a8 progressAvailable:(id)a9 completion:(id)a10
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  id v75 = a4;
  id v77 = a5;
  id v66 = a6;
  id v67 = a7;
  id v68 = a8;
  id v65 = a9;
  id v69 = a10;
  v70 = [(FPDMoveWriterToProvider *)self _remoteProxy];
  p_writer = &self->_writer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  v18 = [WeakRetained operation];
  v74 = [v18 manager];

  v71 = [v74 domainForActionOperationLocator:v75];
  v76 = [v74 domainForActionOperationLocator:v77];
  v19 = [v71 nsDomain];
  v20 = [v19 personaIdentifier];
  id v21 = [v76 nsDomain];
  v22 = [v21 personaIdentifier];

  v23 = [MEMORY[0x1E4FB36F8] sharedManager];
  v73 = [v23 currentPersona];

  id v105 = 0;
  v24 = [v73 userPersonaUniqueString];
  v25 = [v76 nsDomain];
  v26 = [v25 personaIdentifier];
  if (v24 == v26)
  {

LABEL_13:
    id v36 = 0;
    goto LABEL_14;
  }
  v27 = [v76 nsDomain];
  v28 = [v27 personaIdentifier];
  char v29 = [v24 isEqualToString:v28];

  if ((v29 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v104 = 0;
  v30 = (void *)[v73 copyCurrentPersonaContextWithError:&v104];
  id v31 = v104;
  id v32 = v105;
  id v105 = v30;

  if (v31)
  {
    uint64_t v33 = fp_current_or_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[FPItemOperationLocator(Daemon) annotateWithPersonaSandboxIfNeeded:]((uint64_t)v31, v33);
    }
  }
  id v34 = [v76 nsDomain];
  v35 = [v34 personaIdentifier];
  id v36 = [v73 generateAndRestorePersonaContextWithPersonaUniqueString:v35];

  if (v36)
  {
    id v37 = fp_current_or_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v63 = [v76 nsDomain];
      v64 = [v63 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      v107 = v64;
      __int16 v108 = 2112;
      v109 = v36;
      _os_log_error_impl(&dword_1D744C000, v37, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  if ([v77 requiresCrossDeviceCopy])
  {
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_3;
    v88[3] = &unk_1E6A764E0;
    v88[4] = self;
    id v38 = v72;
    id v89 = v38;
    id v90 = v75;
    id v39 = v70;
    id v91 = v39;
    id v40 = v69;
    id v92 = v40;
    id v93 = v65;
    id v41 = (void *)MEMORY[0x1D9471EC0](v88);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_8;
    v78[3] = &unk_1E6A76580;
    id v85 = v68;
    id v42 = v38;
    id v79 = v42;
    v80 = self;
    id v86 = v40;
    id v81 = v39;
    id v82 = v77;
    id v83 = v66;
    id v84 = v67;
    id v43 = v41;
    id v87 = v43;
    v44 = (void *)MEMORY[0x1D9471EC0](v78);
    int v45 = objc_msgSend(v42, "fp_isPackage");
    v46 = (void *)MEMORY[0x1E4F1CB10];
    if (v45)
    {
      v47 = [v42 lastPathComponent];
      objc_msgSend(v46, "fp_createEmptyTempPackageWithName:completion:", v47, v44);
    }
    else
    {
      v47 = [v42 lastPathComponent];
      objc_msgSend(v46, "fp_createEmptyTempFileWithName:completion:", v47, v44);
    }
  }
  else
  {
    if ([v75 requiresCrossDeviceCopy])
    {
      BOOL v48 = 1;
    }
    else
    {
      id v49 = objc_loadWeakRetained((id *)&self->_writer);
      v50 = [v49 info];
      char v51 = [v50 byCopy];
      if (v20 == v22) {
        char v52 = v51;
      }
      else {
        char v52 = 1;
      }
      if (v52)
      {
        BOOL v48 = 1;
      }
      else
      {
        getpid();
        id v53 = [v72 path];
        [v53 fileSystemRepresentation];
        BOOL v48 = fpfs_lp_sandbox_check() == 1;
      }
    }
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke;
    v94[3] = &unk_1E6A76418;
    id v101 = v68;
    id v54 = v72;
    id v95 = v54;
    v96 = self;
    id v102 = v69;
    id v97 = v70;
    id v98 = v77;
    id v55 = v66;
    id v99 = v55;
    id v100 = v67;
    BOOL v103 = v48;
    v56 = (void *)MEMORY[0x1D9471EC0](v94);
    int v57 = [v75 requiresCrossDeviceCopy];
    if (v20 == v22) {
      int v58 = v57;
    }
    else {
      int v58 = 1;
    }
    id v59 = objc_loadWeakRetained((id *)p_writer);
    v60 = [v59 queue];
    if (v58) {
      uint64_t v61 = [v75 size];
    }
    else {
      uint64_t v61 = 0;
    }
    v62 = objc_msgSend(v54, "fp_copyToTempFolderWithFilename:queue:precomputedItemSize:completion:", v55, v60, v61, v56);

    if (v58) {
      (*((void (**)(id, void *))v65 + 2))(v65, v62);
    }
  }
  _FPRestorePersona();
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  if (v7)
  {
    id v32 = v9;
    v10 = [MEMORY[0x1E4F25D78] wrapperWithURL:v7 extensionClass:"com.apple.fileprovider.read-write" error:&v32];
    id v11 = v32;

    if (v10)
    {
      objc_super v12 = *(void **)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = *(void *)(a1 + 64);
      uint64_t v16 = *(void *)(a1 + 72);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2;
      v24[3] = &unk_1E6A763F0;
      v24[4] = v12;
      id v25 = *(id *)(a1 + 32);
      id v26 = v8;
      char v28 = *(unsigned char *)(a1 + 96);
      id v27 = *(id *)(a1 + 88);
      [v12 _createTargetItemWithProxy:v13 target:v14 contents:v10 targetName:v15 lastUsedDate:v16 completionHandler:v24];

      v17 = v25;
    }
    else
    {
      id v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_cold_2();
      }

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      v23 = [WeakRetained queue];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_10;
      v29[3] = &unk_1E6A74AA8;
      id v31 = *(id *)(a1 + 88);
      id v11 = v11;
      id v30 = v11;
      dispatch_async(v23, v29);

      v17 = v31;
    }
  }
  else
  {
    v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_cold_1();
    }

    id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    v20 = [v19 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_6;
    block[3] = &unk_1E6A74AA8;
    id v35 = *(id *)(a1 + 88);
    id v11 = v9;
    id v34 = v11;
    dispatch_async(v20, block);

    v10 = v35;
  }
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

{
  return [*(id *)(a1 + 32) _postImportStepForItem:0 sourceURL:*(void *)(a1 + 40) targetURL:*(void *)(a1 + 48) tempFolder:*(void *)(a1 + 56) wasCopyRequested:1 error:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _postImportStepForItem:a2 sourceURL:*(void *)(a1 + 40) targetURL:0 tempFolder:*(void *)(a1 + 48) wasCopyRequested:*(unsigned __int8 *)(a1 + 64) error:a3 completion:*(void *)(a1 + 56)];
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a2 url];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v11 = [WeakRetained coordinator];
  [v11 startAccessingURLForAtomDuration:v9];

  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v13 = [v12 coordinator];
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v16 = [v15 operation];
  v17 = [v16 request];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_4;
  v21[3] = &unk_1E6A764B8;
  v21[4] = *(void *)(a1 + 32);
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v24 = v7;
  id v25 = *(id *)(a1 + 40);
  id v26 = v9;
  id v27 = v8;
  id v28 = *(id *)(a1 + 64);
  id v29 = *(id *)(a1 + 72);
  id v18 = v8;
  id v19 = v9;
  id v20 = v7;
  [v13 coordinateForCopyingFromURL:v14 toURL:v19 request:v17 handler:v21];
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  id v9 = (id *)(*(void *)(a1 + 32) + 8);
  id v10 = a3;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  uint64_t v13 = [WeakRetained queue];
  uint64_t v14 = [*(id *)(a1 + 40) size];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_5;
  v21[3] = &unk_1E6A76490;
  id v28 = v8;
  id v22 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 32);
  id v23 = v15;
  uint64_t v24 = v16;
  id v25 = *(id *)(a1 + 64);
  id v26 = *(id *)(a1 + 72);
  id v27 = *(id *)(a1 + 80);
  id v29 = *(id *)(a1 + 88);
  id v17 = v8;
  id v18 = objc_msgSend(v11, "fp_copyToURL:queue:precomputedItemSize:replacePlaceholder:completion:", v10, v13, v14, 1, v21);

  (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 96) + 16))(*(void *)(a1 + 96), v18, v19, v20);
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = [*(id *)(a1 + 40) itemID];
    id v7 = [*(id *)(a1 + 40) itemVersion];
    id v8 = objc_opt_new();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_6;
    v22[3] = &unk_1E6A76440;
    id v9 = *(void **)(a1 + 56);
    v22[4] = *(void *)(a1 + 48);
    id v10 = &v23;
    id v23 = v9;
    id v11 = &v24;
    id v24 = *(id *)(a1 + 64);
    id v12 = &v25;
    id v25 = *(id *)(a1 + 72);
    uint64_t v13 = &v26;
    id v26 = v4;
    id v27 = *(id *)(a1 + 88);
    id v14 = (id)[v5 deleteItemWithID:v6 baseVersion:v7 options:0 request:v8 completionHandler:v22];
  }
  else
  {
    id v15 = *(void **)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 64);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_7;
    v17[3] = &unk_1E6A76468;
    v17[4] = *(void *)(a1 + 48);
    id v10 = &v18;
    id v18 = v15;
    id v11 = &v19;
    id v19 = *(id *)(a1 + 64);
    id v12 = &v20;
    id v20 = *(id *)(a1 + 72);
    uint64_t v13 = &v21;
    id v21 = *(id *)(a1 + 88);
    [v5 itemForURL:v16 completionHandler:v17];
  }
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _postImportStepForItem:a2 sourceURL:*(void *)(a1 + 40) targetURL:*(void *)(a1 + 48) tempFolder:*(void *)(a1 + 56) wasCopyRequested:1 error:a3 completion:*(void *)(a1 + 64)];
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  if (v7)
  {
    id v36 = v9;
    id v10 = [MEMORY[0x1E4F25D78] wrapperWithURL:v7 extensionClass:"com.apple.fileprovider.read-write" error:&v36];
    id v11 = v36;

    if (v10)
    {
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 64);
      uint64_t v15 = *(void *)(a1 + 72);
      id v26 = *(void **)(a1 + 40);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_20;
      v27[3] = &unk_1E6A76558;
      uint64_t v16 = (id *)v28;
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      v28[0] = v17;
      v28[1] = v18;
      id v31 = *(id *)(a1 + 88);
      id v29 = *(id *)(a1 + 48);
      id v32 = *(id *)(a1 + 96);
      id v30 = v8;
      [v26 _createTargetItemWithProxy:v12 target:v13 contents:v10 targetName:v14 lastUsedDate:v15 completionHandler:v27];

      id v19 = v31;
    }
    else
    {
      id v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_cold_2();
      }

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      id v25 = [WeakRetained queue];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_19;
      v33[3] = &unk_1E6A74AA8;
      uint64_t v16 = &v35;
      id v35 = *(id *)(a1 + 88);
      id v34 = v11;
      dispatch_async(v25, v33);

      id v19 = v34;
    }
  }
  else
  {
    id v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_8_cold_1();
    }

    id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    id v22 = [v21 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_18;
    block[3] = &unk_1E6A74AA8;
    id v39 = *(id *)(a1 + 88);
    id v11 = v9;
    id v38 = v11;
    dispatch_async(v22, block);

    id v10 = v39;
  }
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 48);
    id v8 = [v5 itemID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_22;
    v16[3] = &unk_1E6A76530;
    id v9 = &v17;
    id v17 = v5;
    id v10 = (id *)v18;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v18[0] = v11;
    v18[1] = v12;
    id v20 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 72);
    id v19 = *(id *)(a1 + 56);
    [v7 URLForItemID:v8 creatingPlaceholderIfMissing:0 ignoreAlternateContentsURL:0 completionHandler:v16];
  }
  else
  {
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_20_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    uint64_t v15 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_21;
    block[3] = &unk_1E6A74AA8;
    id v9 = &v24;
    id v24 = *(id *)(a1 + 64);
    id v10 = &v23;
    id v23 = v6;
    dispatch_async(v15, block);
  }
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_22(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
    id v9 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_24;
    block[3] = &unk_1E6A76508;
    id v10 = &v23;
    id v23 = *(id *)(a1 + 72);
    id v11 = &v19;
    id v19 = v6;
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 56);
    id v22 = v7;
    id v12 = v7;
    dispatch_async(v9, block);

    id v13 = v20;
  }
  else
  {
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_22_cold_1();
    }

    id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
    uint64_t v15 = [v13 queue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_23;
    v24[3] = &unk_1E6A74AA8;
    id v10 = &v26;
    id v16 = *(id *)(a1 + 64);
    id v11 = &v25;
    id v25 = v7;
    id v26 = v16;
    id v17 = v7;
    dispatch_async(v15, v24);
  }
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_24(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)_postImportStepForItem:(id)a3 sourceURL:(id)a4 targetURL:(id)a5 tempFolder:(id)a6 wasCopyRequested:(BOOL)a7 error:(id)a8 completion:(id)a9
{
  id v14 = a3;
  id v45 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = objc_opt_new();
  if (v17)
  {
    id v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[FPDMoveWriterToProvider _postImportStepForItem:sourceURL:targetURL:tempFolder:wasCopyRequested:error:completion:]();
    }
  }
  id v21 = v15;
  if (v16) {
    [v19 removeItemAtURL:v16 error:0];
  }
  v46 = v19;
  id v42 = v16;
  p_writer = &self->_writer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  id v24 = [WeakRetained info];
  int v25 = [v24 byCopy];

  if (v25 && !a7)
  {
    id v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"FPDMoveWriterToProvider.m" lineNumber:289 description:@"byCopy set but wasCopyRequested NO"];
  }
  id v26 = v21;
  id v43 = v14;
  if (!v14 || v17)
  {
    id v34 = objc_loadWeakRetained((id *)&self->_writer);
    id v35 = [v34 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_2;
    block[3] = &unk_1E6A74AA8;
    id v27 = &v49;
    id v49 = v18;
    id v29 = &v48;
    id v48 = v17;
    id v36 = v18;
    dispatch_async(v35, block);

    id v30 = v45;
    id v37 = v42;
  }
  else
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke;
    v50[3] = &unk_1E6A765D0;
    id v27 = &v51;
    id v28 = v14;
    id v51 = v28;
    id v29 = &v52;
    id v30 = v45;
    id v52 = v45;
    BOOL v56 = a7;
    id v53 = v46;
    id v54 = self;
    id v55 = v18;
    id v31 = v18;
    uint64_t v32 = MEMORY[0x1D9471EC0](v50);
    uint64_t v33 = (void *)v32;
    if (v21)
    {
      (*(void (**)(uint64_t, id, void))(v32 + 16))(v32, v21, 0);
    }
    else
    {
      id v38 = objc_loadWeakRetained((id *)p_writer);
      id v39 = [v38 coordinator];
      [v39 resolveItem:v28 completion:v33];

      id v26 = 0;
      id v30 = v45;
    }
    id v37 = v42;

    id v34 = v53;
  }
}

void __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v6)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_cold_2(a1 + 32, v6);
    }
    id v9 = v7;
    id v7 = 0;
    goto LABEL_5;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v30 = 0;
  objc_msgSend(v5, "fp_associateThumbnailFromDocumentAtURL:error:", v11, &v30);
  id v10 = v30;
  if (v10)
  {
    id v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v23 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
      id v24 = objc_msgSend(v10, "fp_prettyDescription");
      *(_DWORD *)buf = 138412802;
      id v32 = v5;
      __int16 v33 = 2112;
      id v34 = v23;
      __int16 v35 = 2112;
      id v36 = v24;
      _os_log_error_impl(&dword_1D744C000, v12, OS_LOG_TYPE_ERROR, "[ERROR] couldn't generate thumbnail for %@ from %@; %@",
        buf,
        0x20u);
    }
  }
  if (!*(unsigned char *)(a1 + 72))
  {
    uint64_t v21 = *(void *)(a1 + 40);
    id v20 = *(void **)(a1 + 48);
    id v29 = v10;
    char v22 = [v20 removeItemAtURL:v21 error:&v29];
    id v9 = v29;

    if (v22) {
      goto LABEL_6;
    }
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_cold_1();
    }
LABEL_5:

LABEL_6:
    id v10 = v9;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 8));
  id v14 = [WeakRetained coordinator];
  [v14 stopAccessingURL:v5];

  id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 8));
  id v16 = [v15 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_35;
  block[3] = &unk_1E6A765A8;
  id v17 = *(id *)(a1 + 64);
  id v27 = v6;
  id v28 = v17;
  id v26 = v7;
  id v18 = v6;
  id v19 = v7;
  dispatch_async(v16, block);
}

void __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_35(void *a1)
{
  uint64_t v2 = a1[6];
  id v3 = [MEMORY[0x1E4F25CB8] locatorForItem:a1[4]];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, a1[5]);
}

uint64_t __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  id v17 = [WeakRetained coordinator];
  id v18 = objc_loadWeakRetained((id *)&self->_writer);
  id v19 = [v18 operation];
  id v20 = [v19 request];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke;
  v25[3] = &unk_1E6A76620;
  v25[4] = self;
  id v26 = v12;
  id v28 = v14;
  id v29 = v15;
  id v27 = v13;
  id v21 = v14;
  id v22 = v13;
  id v23 = v15;
  id v24 = v12;
  [v17 resolveItemOrURL:v24 recursively:1 coordinateIfExport:1 request:v20 handler:v25];
}

void __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v11 = [WeakRetained queue];
  dispatch_assert_queue_V2(v11);

  if (!v8)
  {
    id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v14 = [v13 info];
    uint64_t v15 = [v14 lastUsedDatePolicy];

    if (v15 == 1)
    {
      if (![*(id *)(a1 + 40) isProviderItem])
      {
        uint64_t v16 = [MEMORY[0x1E4F1C9C8] distantPast];
        goto LABEL_12;
      }
      id v17 = [*(id *)(a1 + 40) asFPItem];
      id v18 = [v17 lastUsedDate];
    }
    else
    {
      if (v15 == 2)
      {
        uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
LABEL_12:
        id v18 = (void *)v16;
        goto LABEL_13;
      }
      id v18 = 0;
    }
LABEL_13:
    id v20 = *(void **)(a1 + 32);
    id v19 = *(void **)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 56);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_39;
    v23[3] = &unk_1E6A765F8;
    v23[4] = v20;
    id v24 = v19;
    [v20 _importURL:v7 source:v24 target:v21 as:v22 lastUsedDate:v18 initialImportFinished:v9 progressAvailable:v23 completion:*(void *)(a1 + 64)];

    goto LABEL_14;
  }
  id v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_cold_1(a1, v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_14:
}

void __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_39(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setProgress:v4 forRoot:*(void *)(a1 + 40)];
}

- (void)performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if ([v14 isProviderItem])
  {
    id v18 = [v14 asFPItem];
    id v19 = [v18 strippedCopy];

    id v20 = [v15 asFPItem];
    uint64_t v21 = [v20 itemIdentifier];
    [v19 setParentItemIdentifier:v21];

    uint64_t v22 = [v14 asFPItem];
    id v23 = [v22 filename];
    char v24 = [v23 isEqualToString:v16];

    if (v24)
    {
      uint64_t v25 = 4;
    }
    else
    {
      [v19 setFilename:v16];
      uint64_t v25 = 6;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
    id v34 = [WeakRetained info];
    uint64_t v35 = [v34 lastUsedDatePolicy];

    if (v35 == 2)
    {
      id v36 = [MEMORY[0x1E4F1C9C8] date];
      [v19 setLastUsedDate:v36];

      v25 |= 8uLL;
    }
    uint64_t v43 = v25;
    uint64_t v37 = [(FPDMoveWriterToProvider *)self _remoteProxy];
    id v38 = [v37 synchronousRemoteObjectProxy];
    id v39 = v19;
    id v40 = objc_loadWeakRetained((id *)&self->_writer);
    id v41 = [v40 info];
    unsigned int v42 = [v41 shouldBounce];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke;
    v48[3] = &unk_1E6A76468;
    v48[4] = self;
    id v49 = v14;
    id v50 = v15;
    id v51 = v16;
    id v52 = v17;
    id v32 = v17;
    id v29 = v15;
    id v30 = v14;
    [v38 singleItemChange:v39 changedFields:v43 bounce:v42 completionHandler:v48];

    id v31 = v39;
  }
  else
  {
    id v26 = objc_loadWeakRetained((id *)&self->_writer);
    id v27 = [v26 coordinator];
    id v28 = [v14 asURL];
    [v27 startAccessingURLForAtomDuration:v28];

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_43;
    v44[3] = &unk_1E6A76670;
    id v45 = v14;
    id v46 = v15;
    id v47 = v17;
    id v29 = v17;
    id v30 = v15;
    id v31 = v14;
    [(FPDMoveWriterToProvider *)self performCopyOfItem:v31 to:v30 as:v16 sourceMaterializeOption:a6 targetMaterializeOption:a7 completion:v44];

    id v32 = v45;
  }
}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v8 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2;
  block[3] = &unk_1E6A76648;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v18 = v5;
  id v19 = v9;
  uint64_t v17 = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, block);
}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_cold_2(a1, v2);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 64) + 8));
    id v5 = [WeakRetained operation];
    id v6 = [v5 manager];
    id v7 = [*(id *)(a1 + 72) itemID];
    id v8 = [v6 domainFromItemID:v7 reason:0];

    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_cold_1((uint64_t *)(a1 + 72), v9);
    }

    id v10 = [*(id *)(a1 + 72) itemID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_42;
    v11[3] = &unk_1E6A757B0;
    id v12 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 80);
    [v8 forceIngestionForItemID:v10 completionHandler:v11];
  }
}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (objc_msgSend(v5, "fp_isFeatureUnsupportedError"))
  {

    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (void (**)(uint64_t, id, void))(v7 + 16);
    id v9 = v6;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (void (**)(uint64_t, id, void))(v7 + 16);
    if (v5)
    {
      (*(void (**)(void, void, id))(v7 + 16))(*(void *)(a1 + 40), 0, v5);
      goto LABEL_9;
    }
    id v9 = v11;
  }
  id v10 = v9;
  id v11 = v9;
  if (!v9) {
    id v10 = *(id *)(a1 + 32);
  }
  id v5 = [MEMORY[0x1E4F25CB8] locatorForItem:v10];
  (*v8)(v7, v5, 0);
LABEL_9:
}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_43(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6
    && (([*(id *)(a1 + 32) requiresCrossDeviceCopy] & 1) != 0
     || [*(id *)(a1 + 40) requiresCrossDeviceCopy]))
  {
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = [*(id *)(a1 + 32) asURL];
    id v12 = 0;
    char v9 = [v7 removeItemAtURL:v8 error:&v12];
    id v10 = v12;

    if ((v9 & 1) == 0)
    {
      id v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_43_cold_1(v10);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_createFolder:(id)a3 under:(id)a4 completion:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v28 = a5;
  id v9 = objc_alloc(MEMORY[0x1E4F25D20]);
  id v10 = [v8 asFPItem];
  id v11 = [v10 providerDomainID];
  id v12 = [v8 asFPItem];
  id v13 = [v12 itemIdentifier];
  id v27 = (void *)[v9 initWithProviderDomainID:v11 itemIdentifier:@"__" parentItemIdentifier:v13 filename:v25 isDirectory:1];

  id v30 = [(FPDMoveWriterToProvider *)self _remoteProxy];
  char v24 = [v30 synchronousRemoteObjectProxy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  id v14 = [WeakRetained operation];
  id v15 = [v14 request];
  id v16 = [(FPDMoveWriterToProvider *)self _targetSession];
  uint64_t v17 = [v15 nsfpRequestForSession:v16];
  id v18 = objc_loadWeakRetained((id *)&self->_writer);
  id v19 = [v18 info];
  uint64_t v20 = [v19 shouldBounce];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke;
  v31[3] = &unk_1E6A766C0;
  v31[4] = self;
  id v32 = v25;
  id v33 = v8;
  id v34 = v28;
  id v29 = v28;
  id v23 = v8;
  id v21 = v25;
  id v22 = (id)[v24 createItemBasedOnTemplate:v27 fields:6 contents:0 options:0x10000 request:v17 bounce:v20 completionHandler:v31];
}

void __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a2;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v11 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke_2;
  block[3] = &unk_1E6A76698;
  id v16 = v9;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v19 = v8;
  id v20 = v12;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, block);
}

void __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = (id *)(a1 + 4);
  if (a1[4])
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke_2_cold_1((uint64_t)a1, v2);
    }
  }
  uint64_t v4 = a1[8];
  id v5 = [MEMORY[0x1E4F25CB8] locatorForItem:a1[7]];
  (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, a1[4]);
}

- (void)performCreateFolder:(id)a3 inside:(id)a4 as:(id)a5 completion:(id)a6
{
}

- (void)performMoveOfFolder:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 atomically:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v20 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  if (([v15 isProviderItem] & 1) == 0)
  {
    id v18 = [NSString stringWithFormat:@"[ASSERT] ‼️ unexpected url"];
    id v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[FPDProcessMonitor _addPIDToObserve:]((uint64_t)v18, v19);
    }

    __assert_rtn("-[FPDMoveWriterToProvider performMoveOfFolder:to:as:sourceMaterializeOption:targetMaterializeOption:atomically:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriterToProvider.m", 485, (const char *)[v18 UTF8String]);
  }
  if (v9) {
    [(FPDMoveWriterToProvider *)self performMoveOfItem:v20 to:v15 as:v16 sourceMaterializeOption:a6 targetMaterializeOption:a7 completion:v17];
  }
  else {
    [(FPDMoveWriterToProvider *)self _createFolder:v16 under:v15 completion:v17];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopAccessingToken, 0);
  objc_destroyWeak((id *)&self->_writer);
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  objc_msgSend((id)OUTLINED_FUNCTION_7(v1), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_6(), "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v3, v4, "[DEBUG] couldn't copy import file for url %@: %@", v5, v6, v7, v8, v9);
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  objc_msgSend((id)OUTLINED_FUNCTION_7(v1), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_6(), "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v3, v4, "[DEBUG] couldn't issue sandbox ext for %@: %@", v5, v6, v7, v8, v9);
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_15();
  objc_msgSend((id)OUTLINED_FUNCTION_7(v1), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_6(), "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v3, v4, "[DEBUG] couldn't create import file for url %@: %@", v5, v6, v7, v8, v9);
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_20_cold_1()
{
  OUTLINED_FUNCTION_15();
  objc_msgSend((id)OUTLINED_FUNCTION_7(v1), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_6(), "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v3, v4, "[DEBUG] couldn't import empty file for %@: %@", v5, v6, v7, v8, v9);
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_22_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(v2 + 32);
  objc_msgSend(*(id *)(v2 + 40), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_6(), "fp_prettyDescription");
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  __int16 v9 = 2112;
  id v10 = v4;
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] couldn't get URL for item %@ while importing %@: %@", (uint8_t *)&v5, 0x20u);
}

- (void)_postImportStepForItem:sourceURL:targetURL:tempFolder:wasCopyRequested:error:completion:.cold.1()
{
  OUTLINED_FUNCTION_15();
  objc_msgSend(v1, "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_6(), "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] couldn't import url %@: %@", v5, v6, v7, v8, v9);
}

void __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  objc_msgSend(*v1, "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_6(), "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] Failed to remove original file %@ after move; %@",
    v5,
    v6,
    v7,
    v8,
    v9);
}

void __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] couldn't resolve URL for item %@ after copy; %@",
    v5,
    v6,
    v7,
    v8,
    v9);
}

void __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] couldn't resolve %@: %@", v5, v6, v7, v8, v9);
}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: forcing ingestion of %@", (uint8_t *)&v3, 0xCu);
}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_cold_2(uint64_t a1, id *a2)
{
  uint64_t v2 = objc_msgSend(*a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x2Au);
}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_43_cold_1(void *a1)
{
  uint64_t v6 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);
}

void __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke_2_cold_1(uint64_t a1, id *a2)
{
  os_log_t v2 = objc_msgSend(*a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x20u);
}

@end