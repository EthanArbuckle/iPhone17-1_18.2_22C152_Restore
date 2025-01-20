@interface FPUnarchiveOperation
- (BOOL)getHasUnarchivedMultipleItems:(BOOL *)a3 firstUnarchivedItemURL:(id *)a4 forArchiveFolderURL:(id)a5 error:(id *)a6;
- (FPUnarchiveOperation)initWithItem:(id)a3 destinationFolder:(id)a4;
- (id)_newParentProgressWithCompletedUnitCount:(int64_t)a3;
- (id)findUniqueUnarchivedName:(id)a3 isFolder:(BOOL)a4 parent:(id)a5;
- (id)passphraseRequestBlock;
- (id)unarchiveCompletionBlock;
- (void)_importUnarchivedContentAtURL:(id)a3 archiveName:(id)a4 completionHandler:(id)a5;
- (void)_unarchiveAndHandleIncorrectPassphraseURL:(id)a3 archiveName:(id)a4 service:(id)a5 passphrase:(id)a6 completionHandler:(id)a7;
- (void)_unarchiveURL:(id)a3 archiveName:(id)a4 service:(id)a5 passphrase:(id)a6 completionHandler:(id)a7;
- (void)_unarchiveURLInDSEnumeratedDomain:(id)a3 service:(id)a4 passphrase:(id)a5 completionHandler:(id)a6;
- (void)_unarchiveURLInFPEnumeratedDomain:(id)a3 archiveName:(id)a4 service:(id)a5 passphrase:(id)a6 completionHandler:(id)a7;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)service:(id)a3 didReceiveArchivedItemsDescriptors:(id)a4 placeholderName:(id)a5 placeholderTypeIdentifier:(id)a6;
- (void)setPassphraseRequestBlock:(id)a3;
- (void)setUnarchiveCompletionBlock:(id)a3;
@end

@implementation FPUnarchiveOperation

- (FPUnarchiveOperation)initWithItem:(id)a3 destinationFolder:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"FPArchiveOperation.m", 662, @"no item to unarchive: %@", 0 object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"FPArchiveOperation.m", 663, @"Invalid parameter not satisfying: %@", @"destinationFolder" object file lineNumber description];

LABEL_3:
  v11 = [v10 providerDomainID];
  v17.receiver = self;
  v17.super_class = (Class)FPUnarchiveOperation;
  v12 = [(FPActionOperation *)&v17 initWithProvider:v11 action:0];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_item, a3);
    objc_storeStrong((id *)&v12->_destinationFolder, a4);
    id v13 = [(FPUnarchiveOperation *)v12 _newParentProgressWithCompletedUnitCount:0];
    [(FPActionOperation *)v12 setProgress:v13];
  }
  return v12;
}

- (id)_newParentProgressWithCompletedUnitCount:(int64_t)a3
{
  v4 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  objc_msgSend(v4, "fp_setFileOperationKind:", *MEMORY[0x1E4F28850]);
  [v4 setCompletedUnitCount:a3];
  return v4;
}

- (BOOL)getHasUnarchivedMultipleItems:(BOOL *)a3 firstUnarchivedItemURL:(id *)a4 forArchiveFolderURL:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5;
  v30 = __Block_byref_object_dispose__5;
  id v31 = 0;
  if (v9)
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __103__FPUnarchiveOperation_getHasUnarchivedMultipleItems_firstUnarchivedItemURL_forArchiveFolderURL_error___block_invoke;
    v25[3] = &unk_1E5AF2760;
    v25[4] = &v26;
    v11 = [v10 enumeratorAtURL:v9 includingPropertiesForKeys:0 options:1 errorHandler:v25];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v32 count:16];
    if (v13)
    {
      id v14 = 0;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          if (v14)
          {
            BOOL v17 = 1;
            goto LABEL_19;
          }
          id v14 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v32 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v17 = 0;
    }
    else
    {
      BOOL v17 = 0;
      id v14 = 0;
    }
LABEL_19:

    v19 = (void *)v27[5];
    BOOL v18 = v19 == 0;
    if (v19)
    {
      if (!a6) {
        goto LABEL_29;
      }
    }
    else
    {
      if (a3) {
        *a3 = v17;
      }
      if (a4) {
        *a4 = v14;
      }
      if (!a6) {
        goto LABEL_29;
      }
      v19 = (void *)v27[5];
    }
    *a6 = v19;
LABEL_29:

    goto LABEL_30;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
    BOOL v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_30:
  _Block_object_dispose(&v26, 8);

  return v18;
}

uint64_t __103__FPUnarchiveOperation_getHasUnarchivedMultipleItems_firstUnarchivedItemURL_forArchiveFolderURL_error___block_invoke(uint64_t a1, int a2, id obj)
{
  return 0;
}

- (void)_importUnarchivedContentAtURL:(id)a3 archiveName:(id)a4 completionHandler:(id)a5
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v36 = a4;
  id v9 = (void (**)(id, void, id))a5;
  v37 = +[FPItemManager defaultManager];
  v38 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v8 startAccessingSecurityScopedResource];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __84__FPUnarchiveOperation__importUnarchivedContentAtURL_archiveName_completionHandler___block_invoke;
  v57[3] = &unk_1E5AF25D0;
  char v59 = v10;
  id v11 = v8;
  id v58 = v11;
  id v12 = (void (**)(void))MEMORY[0x1A6248B00](v57);
  char v56 = 0;
  id v54 = 0;
  id v55 = 0;
  BOOL v13 = [(FPUnarchiveOperation *)self getHasUnarchivedMultipleItems:&v56 firstUnarchivedItemURL:&v55 forArchiveFolderURL:v11 error:&v54];
  id v14 = v55;
  id v15 = v54;
  v35 = v14;
  if (v13)
  {
    if (v56)
    {
      id v34 = v11;
      goto LABEL_6;
    }
    id v34 = v14;
    if (v34)
    {
LABEL_6:
      if (v56)
      {
        v16 = fp_current_or_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[FPUnarchiveOperation _importUnarchivedContentAtURL:archiveName:completionHandler:]();
        }

        BOOL v17 = [[FPArchiveTemporaryFolder alloc] initWithURL:v34];
        id v53 = v15;
        id v18 = [(FPArchiveTemporaryFolder *)v17 temporaryFolderURLGetError:&v53];
        id v19 = v53;

        if (!v18)
        {
          v12[2](v12);
          v9[2](v9, 0, v19);
          id v18 = 0;
LABEL_22:

          id v15 = v19;
          goto LABEL_23;
        }
        v20 = [v36 stringByDeletingPathExtension];
        long long v21 = [v18 URLByAppendingPathComponent:v20 isDirectory:1];

        id v52 = v19;
        char v22 = [v38 moveItemAtURL:v11 toURL:v21 error:&v52];
        id v15 = v52;

        if ((v22 & 1) == 0)
        {
          id v51 = 0;
          char v29 = [v38 removeItemAtURL:v18 error:&v51];
          id v30 = v51;
          if ((v29 & 1) == 0)
          {
            id v31 = fp_current_or_default_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              -[FPUnarchiveOperation _importUnarchivedContentAtURL:archiveName:completionHandler:]();
            }
          }
          v12[2](v12);
          v9[2](v9, 0, v15);

          id v19 = v15;
          goto LABEL_22;
        }
        v12[2](v12);

        id v34 = v21;
      }
      else
      {
        id v18 = 0;
        BOOL v17 = 0;
      }
      long long v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[FPUnarchiveOperation _importUnarchivedContentAtURL:archiveName:completionHandler:]((uint64_t)self, v34);
      }

      long long v24 = [FPMoveOperation alloc];
      v60[0] = v34;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
      uint64_t v26 = [(FPMoveOperation *)v24 initWithURLs:v25 destinationFolder:self->_destinationFolder];

      id location = 0;
      objc_initWeak(&location, v26);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __84__FPUnarchiveOperation__importUnarchivedContentAtURL_archiveName_completionHandler___block_invoke_168;
      v39[3] = &unk_1E5AF2788;
      char v49 = v56;
      id v40 = v38;
      id v41 = v11;
      v46 = v12;
      v42 = self;
      id v18 = v18;
      id v43 = v18;
      v48[1] = (id)a2;
      BOOL v17 = v17;
      v44 = v17;
      v47 = v9;
      objc_copyWeak(v48, &location);
      id v19 = v15;
      id v45 = v19;
      [(FPActionOperation *)v26 setActionCompletionBlock:v39];
      [(FPMoveOperation *)v26 setShouldBounceOnCollision:1];
      [(FPActionOperation *)v26 setHaveStitching:0];
      v27 = [(FPActionOperation *)self progress];
      uint64_t v28 = [(FPActionOperation *)v26 progress];
      [v27 addChild:v28 withPendingUnitCount:10];

      [v37 scheduleAction:v26];
      objc_destroyWeak(v48);

      objc_destroyWeak(&location);
      goto LABEL_22;
    }
    v32 = fp_current_or_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LOWORD(location) = 0;
      _os_log_impl(&dword_1A33AE000, v32, OS_LOG_TYPE_INFO, "[INFO] unarchive operation produced no output", (uint8_t *)&location, 2u);
    }

    v9[2](v9, 0, 0);
  }
  else
  {
    v12[2](v12);
    v9[2](v9, 0, v15);
  }
LABEL_23:
}

uint64_t __84__FPUnarchiveOperation__importUnarchivedContentAtURL_archiveName_completionHandler___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) stopAccessingSecurityScopedResource];
  }
  return result;
}

void __84__FPUnarchiveOperation__importUnarchivedContentAtURL_archiveName_completionHandler___block_invoke_168(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 112))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (!v4)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:*(void *)(a1 + 104) object:*(void *)(a1 + 48) file:@"FPArchiveOperation.m" lineNumber:843 description:@"nil temporaryFolderURL"];

      uint64_t v4 = *(void *)(a1 + 56);
    }
    v6 = *(void **)(a1 + 32);
    id v18 = 0;
    char v7 = [v6 removeItemAtURL:v4 error:&v18];
    id v8 = v18;
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    char v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v19 = 0;
    char v12 = [v10 removeItemAtURL:v11 error:&v19];
    id v8 = v19;
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    if (v12)
    {
LABEL_5:

      uint64_t v9 = *(void *)(a1 + 88);
      if (v3)
      {
        (*(void (**)(void, void, void))(v9 + 16))(*(void *)(a1 + 88), 0, *(void *)(a1 + 72));
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
        id v15 = [WeakRetained transferResults];
        v16 = [v15 allValues];
        BOOL v17 = [v16 firstObject];
        (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v17, *(void *)(a1 + 72));
      }
      goto LABEL_13;
    }
  }
  if (v3) {
    id v13 = v3;
  }
  else {
    id v13 = v8;
  }
  [*(id *)(a1 + 48) completedWithResult:0 error:v13];

LABEL_13:
}

- (void)_unarchiveURLInFPEnumeratedDomain:(id)a3 archiveName:(id)a4 service:(id)a5 passphrase:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  BOOL v17 = fp_current_or_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[FPUnarchiveOperation _unarchiveURLInFPEnumeratedDomain:archiveName:service:passphrase:completionHandler:]((uint64_t)self, v12);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke;
  v22[3] = &unk_1E5AF27B0;
  id v23 = v13;
  id v24 = v14;
  v22[4] = self;
  id v18 = v13;
  id v19 = v14;
  v20 = [v16 unarchiveItemAtURL:v12 passphrase:v15 destinationFolderURL:v12 completionHandler:v22];

  if (v20)
  {
    long long v21 = [(FPActionOperation *)self progress];
    [v21 addChild:v20 withPendingUnitCount:80];
  }
}

void __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = fp_current_or_default_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke_cold_2(a1, (uint64_t)v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v8) {
      __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke_cold_1(a1, (uint64_t)v5);
    }

    [*(id *)(a1 + 32) _importUnarchivedContentAtURL:v5 archiveName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

- (void)_unarchiveURLInDSEnumeratedDomain:(id)a3 service:(id)a4 passphrase:(id)a5 completionHandler:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 URLByDeletingLastPathComponent];
  if (v12)
  {
    v21[0] = v12;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  }
  else
  {
    id v15 = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95__FPUnarchiveOperation__unarchiveURLInDSEnumeratedDomain_service_passphrase_completionHandler___block_invoke;
  v19[3] = &unk_1E5AF1A60;
  id v20 = v13;
  id v16 = v13;
  BOOL v17 = [v11 unarchiveItemAtURL:v10 toURL:v14 options:0 acceptedFormats:1 passphrases:v15 completionHandler:v19];
  if (v12) {

  }
  if (v17)
  {
    id v18 = [(FPActionOperation *)self progress];
    [v18 addChild:v17 withPendingUnitCount:80];
  }
}

void __95__FPUnarchiveOperation__unarchiveURLInDSEnumeratedDomain_service_passphrase_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = +[FPItemManager defaultManager];
    [v5 fetchItemForURL:v6 completionHandler:*(void *)(a1 + 32)];
  }
}

- (void)_unarchiveURL:(id)a3 archiveName:(id)a4 service:(id)a5 passphrase:(id)a6 completionHandler:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([(FPProviderDomain *)self->_providerDomain isUsingFPFS])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
LABEL_6:
    [(FPUnarchiveOperation *)self _unarchiveURLInDSEnumeratedDomain:v18 service:v13 passphrase:v14 completionHandler:v15];
    goto LABEL_9;
  }
  id v16 = [(FPProviderDomain *)self->_providerDomain providerID];
  if ([v16 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
  {
    char v17 = objc_opt_respondsToSelector();

    if (v17) {
      goto LABEL_6;
    }
  }
  else
  {
  }
LABEL_8:
  [(FPUnarchiveOperation *)self _unarchiveURLInFPEnumeratedDomain:v18 archiveName:v12 service:v13 passphrase:v14 completionHandler:v15];
LABEL_9:
}

- (void)_unarchiveAndHandleIncorrectPassphraseURL:(id)a3 archiveName:(id)a4 service:(id)a5 passphrase:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke;
  v23[3] = &unk_1E5AF2800;
  v23[4] = self;
  id v24 = v16;
  id v28 = v17;
  SEL v29 = a2;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v16;
  id v22 = v17;
  [(FPUnarchiveOperation *)self _unarchiveURL:v20 archiveName:v19 service:v18 passphrase:v21 completionHandler:v23];
}

void __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v7 = (id *)getDSArchiveServiceErrorDomainSymbolLoc_ptr;
  uint64_t v38 = getDSArchiveServiceErrorDomainSymbolLoc_ptr;
  if (!getDSArchiveServiceErrorDomainSymbolLoc_ptr)
  {
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __getDSArchiveServiceErrorDomainSymbolLoc_block_invoke;
    uint64_t v33 = &unk_1E5AF1950;
    id v34 = &v35;
    BOOL v8 = (void *)DesktopServicesPrivLibrary();
    v36[3] = (uint64_t)dlsym(v8, "DSArchiveServiceErrorDomain");
    getDSArchiveServiceErrorDomainSymbolLoc_ptr = *(void *)(v34[1] + 24);
    char v7 = (id *)v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (!v7) {
    __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_1();
  }
  id v9 = *v7;
  id v10 = [v6 domain];
  if (![v10 isEqualToString:v9])
  {

    goto LABEL_11;
  }
  uint64_t v11 = [v6 code];

  if (v11 != -1000)
  {
LABEL_11:
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_17;
  }
  id v12 = [*(id *)(a1 + 32) passphraseRequestBlock];
  if (v12)
  {
    id v13 = [*(id *)(a1 + 32) stitcher];
    [v13 finishWithItem:0 error:v6];

    [*(id *)(a1 + 32) resetStitcher];
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = fp_current_or_default_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v16) {
        __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_3(a1 + 32, v15, v17, v18, v19, v20, v21, v22);
      }
    }
    else if (v16)
    {
      __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_2(a1 + 32, v15, v17, v18, v19, v20, v21, v22);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_174;
    v24[3] = &unk_1E5AF27D8;
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 80);
    v24[4] = v23;
    id v25 = *(id *)(a1 + 48);
    id v26 = *(id *)(a1 + 56);
    id v27 = *(id *)(a1 + 64);
    id v28 = *(id *)(a1 + 72);
    ((void (**)(void, id, void *))v12)[2](v12, v6, v24);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }

LABEL_17:
}

void __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_174(uint64_t a1, void *a2, void *a3)
{
  unint64_t v7 = a2;
  unint64_t v5 = a3;
  if (v7 | v5)
  {
    if (v7)
    {
      [*(id *)(a1 + 32) _unarchiveAndHandleIncorrectPassphraseURL:*(void *)(a1 + 40) archiveName:*(void *)(a1 + 48) service:*(void *)(a1 + 56) passphrase:v7 completionHandler:*(void *)(a1 + 64)];
      goto LABEL_6;
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"FPArchiveOperation.m" lineNumber:962 description:@"either the passphrase or the error should be set"];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_6:
}

- (void)actionMain
{
  id v3 = +[FPItemManager defaultManager];
  uint64_t v4 = self->_item;
  unint64_t v5 = [(FPItem *)v4 providerDomainID];
  id v6 = +[FPProviderDomain providerDomainWithID:v5 cachePolicy:1 error:0];
  providerDomain = self->_providerDomain;
  self->_providerDomain = v6;

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__FPUnarchiveOperation_actionMain__block_invoke;
  v9[3] = &unk_1E5AF2878;
  v9[4] = self;
  id v10 = v4;
  BOOL v8 = v4;
  [v3 fetchURLForItem:v8 completionHandler:v9];
}

void __34__FPUnarchiveOperation_actionMain__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  unint64_t v7 = v6;
  if (a3)
  {
    [*(id *)(a1 + 32) completedWithResult:0 error:a3];
  }
  else
  {
    if ([v6 startAccessingSecurityScopedResource]) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 456), a2);
    }
    BOOL v8 = [MEMORY[0x1E4F28C98] readingIntentWithURL:v7 options:0x20000];
    id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v9 setMaxConcurrentOperationCount:1];
    id v10 = objc_opt_new();
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 488), v10);
    v19[0] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __34__FPUnarchiveOperation_actionMain__block_invoke_2;
    v15[3] = &unk_1E5AF2850;
    id v12 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v10;
    id v17 = v8;
    id v18 = v12;
    id v13 = v8;
    id v14 = v10;
    [v14 coordinateAccessWithIntents:v11 queue:v9 byAccessor:v15];
  }
}

void __34__FPUnarchiveOperation_actionMain__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 completedWithResult:0 error:a2];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) retainAccess];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 496);
    *(void *)(v5 + 496) = v4;

    unint64_t v7 = [*(id *)(a1 + 48) URL];
    getDSArchiveServiceClass();
    BOOL v8 = objc_opt_new();
    [v8 setUnarchivingDelegate:*(void *)(a1 + 32)];
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 56) filename];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __34__FPUnarchiveOperation_actionMain__block_invoke_3;
    v11[3] = &unk_1E5AF2828;
    v11[4] = *(void *)(a1 + 32);
    [v9 _unarchiveAndHandleIncorrectPassphraseURL:v7 archiveName:v10 service:v8 passphrase:0 completionHandler:v11];
  }
}

uint64_t __34__FPUnarchiveOperation_actionMain__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:a2 error:a3];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  itemURL = self->_itemURL;
  if (itemURL) {
    [(NSURL *)itemURL stopAccessingSecurityScopedResource];
  }
  if (self->_coordinationAccessToken)
  {
    coordinator = self->_coordinator;
    if (!coordinator)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"FPArchiveOperation.m" lineNumber:1044 description:@"nil coordinator with a non-nil coordination access token"];

      coordinator = self->_coordinator;
    }
    -[NSFileCoordinator releaseAccess:](coordinator, "releaseAccess:");
    id coordinationAccessToken = self->_coordinationAccessToken;
    self->_id coordinationAccessToken = 0;
  }
  id v12 = self->_coordinator;
  self->_coordinator = 0;

  id v13 = v7;
  if (v8)
  {
    id v14 = objc_msgSend(v8, "fp_annotatedErrorWithItem:variant:", self->_item, @"Unarchive");
  }
  else
  {
    id v8 = [(FPActionOperation *)self stitcher];
    [v8 associateItem:v13 withPlaceholderID:self->_placeholderID];
    id v14 = 0;
  }

  id v15 = [(FPActionOperation *)self stitcher];
  [v15 finishWithItem:v13 error:v14];

  uint64_t v16 = [(FPUnarchiveOperation *)self unarchiveCompletionBlock];
  id v17 = (void *)v16;
  if (v16)
  {
    (*(void (**)(uint64_t, id, void *))(v16 + 16))(v16, v13, v14);
    [(FPUnarchiveOperation *)self setUnarchiveCompletionBlock:0];
  }

  v19.receiver = self;
  v19.super_class = (Class)FPUnarchiveOperation;
  [(FPActionOperation *)&v19 finishWithResult:v13 error:v14];
}

- (id)findUniqueUnarchivedName:(id)a3 isFolder:(BOOL)a4 parent:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v13 = 0;
  id v8 = objc_msgSend(a5, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", v7, v6, 0, &v13, 1);
  id v9 = v13;
  id v10 = v9;
  if (v8)
  {
    if (!v9) {
      id v10 = &unk_1EF6C38D8;
    }
    uint64_t v11 = objc_msgSend(v7, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v10, "longValue") + 1, v6);
  }
  else
  {
    uint64_t v11 = v7;
  }

  return v11;
}

- (void)service:(id)a3 didReceiveArchivedItemsDescriptors:(id)a4 placeholderName:(id)a5 placeholderTypeIdentifier:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v11 count] && !objc_msgSend(v11, "count"))
  {
    id v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2 object:self file:@"FPArchiveOperation.m" lineNumber:1093 description:@"archived items info array was empty"];
  }
  id v14 = [(FPActionOperation *)self stitcher];
  [v14 start];

  if (v12 && v13)
  {
    id v15 = objc_msgSend(MEMORY[0x1E4F442D8], "fp_cachedTypeWithIdentifier:", v13);
    uint64_t v16 = [(FPActionOperation *)self stitcher];
    id v17 = [(FPItem *)self->_destinationFolder itemIdentifier];
    id v18 = [(FPItem *)self->_destinationFolder providerDomainID];
    objc_super v19 = [v16 createPlaceholderWithName:v12 contentType:v15 contentAccessDate:0 underParent:v17 inProviderDomainID:v18];
    uint64_t v20 = v13;
    placeholderID = self->_placeholderID;
    self->_placeholderID = v19;
  }
  else
  {
    id v56 = v13;
    id v57 = v12;
    v61 = self;
    id v58 = v11;
    id v59 = v10;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = v11;
    uint64_t v22 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v64 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = *(void *)v66;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v66 != v25) {
            objc_enumerationMutation(obj);
          }
          id v27 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          id v28 = [v27 filePath];
          uint64_t v29 = [v28 pathComponents];
          uint64_t v30 = [v29 count];
          if ([v29 count] == 2)
          {
            uint64_t v31 = [v29 lastObject];
            char v32 = [v31 isEqualToString:@"/"];
          }
          else
          {
            char v32 = 0;
          }
          if (v30 == 1 || (v32 & 1) != 0)
          {
            id v33 = v27;

            if (v24)
            {
              v64 = v33;
              uint64_t v24 = 2;
              goto LABEL_25;
            }
            uint64_t v24 = 1;
            v64 = v33;
          }
          else
          {
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
    else
    {
      v64 = 0;
      uint64_t v24 = 0;
    }
LABEL_25:

    uint64_t v34 = [(FPItem *)v61->_destinationFolder fileURL];
    uint64_t v35 = (void *)v34;
    if (v24 == 1)
    {
      id v36 = (void *)v34;
      uint64_t v37 = v64;
      uint64_t v38 = [v64 filePath];
      uint64_t v39 = [v38 lastPathComponent];

      if (!v39)
      {
        id v40 = [MEMORY[0x1E4F28B00] currentHandler];
        [v40 handleFailureInMethod:a2, v61, @"FPArchiveOperation.m", 1133, @"missing name in descriptor: %@", v64 object file lineNumber description];
      }
      id v41 = [v64 typeIdentifier];
      v42 = objc_msgSend(MEMORY[0x1E4F442D8], "fp_cachedTypeWithIdentifier:", v41);
      id v43 = [(FPUnarchiveOperation *)v61 findUniqueUnarchivedName:v39 isFolder:v42 == (void *)*MEMORY[0x1E4F443C8] parent:v36];
      [(FPActionOperation *)v61 stitcher];
      v44 = id obja = (id)v39;
      id v45 = [(FPItem *)v61->_destinationFolder itemIdentifier];
      v46 = [(FPItem *)v61->_destinationFolder providerDomainID];
      uint64_t v47 = [v44 createPlaceholderWithName:v43 contentType:v42 contentAccessDate:0 underParent:v45 inProviderDomainID:v46];
      v48 = v61->_placeholderID;
      v61->_placeholderID = (FPItemID *)v47;
      uint64_t v35 = v36;
      char v49 = obja;
    }
    else
    {
      v50 = [(FPItem *)v61->_item displayName];
      char v49 = [(FPUnarchiveOperation *)v61 findUniqueUnarchivedName:v50 isFolder:1 parent:v35];

      id v41 = [(FPActionOperation *)v61 stitcher];
      v42 = [(FPItem *)v61->_destinationFolder itemIdentifier];
      id v43 = [(FPItem *)v61->_destinationFolder providerDomainID];
      uint64_t v51 = [v41 createPlaceholderWithName:v49 isFolder:1 contentAccessDate:0 underParent:v42 inProviderDomainID:v43];
      v44 = v61->_placeholderID;
      v61->_placeholderID = (FPItemID *)v51;
      uint64_t v37 = v64;
    }

    id v11 = v58;
    id v10 = v59;
    self = v61;
    uint64_t v20 = v56;
    id v12 = v57;
  }
  id v52 = +[FPProgressManager defaultManager];
  id v53 = [(FPActionOperation *)self progress];
  [v52 registerCopyProgress:v53 forItemID:self->_placeholderID];

  id v54 = [(FPActionOperation *)self stitcher];
  [v54 flush];
}

- (id)passphraseRequestBlock
{
  return self->_passphraseRequestBlock;
}

- (void)setPassphraseRequestBlock:(id)a3
{
}

- (id)unarchiveCompletionBlock
{
  return self->_unarchiveCompletionBlock;
}

- (void)setUnarchiveCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unarchiveCompletionBlock, 0);
  objc_storeStrong(&self->_passphraseRequestBlock, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_storeStrong(&self->_coordinationAccessToken, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_destinationFolder, 0);
  objc_storeStrong((id *)&self->_placeholderID, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (void)_importUnarchivedContentAtURL:(uint64_t)a1 archiveName:(void *)a2 completionHandler:.cold.1(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "fp_shortDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] %@: Importing unarchived content from %@", v5, v6, v7, v8, v9);
}

- (void)_importUnarchivedContentAtURL:archiveName:completionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_5();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] failed to remove temporary folder at URL %@: %@", v1, 0x16u);
}

- (void)_importUnarchivedContentAtURL:archiveName:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@: Archive contains multiple top-level item, wrapping them in a folder named after the archive", v2, v3, v4, v5, v6);
}

- (void)_unarchiveURLInFPEnumeratedDomain:(uint64_t)a1 archiveName:(void *)a2 service:passphrase:completionHandler:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v8 = objc_msgSend(a2, "fp_shortDescription");
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v2, v3, "[DEBUG] %@: Unarchiving %@ using old SPI", v4, v5, v6, v7, 2u);
}

void __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_4(a1, a2), "fp_shortDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] %@: Unarchiving produced output in %@", v5, v6, v7, v8, v9);
}

void __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_4(a1, a2), "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] %@: Unarchiving failed with error %@", v5, v6, v7, v8, v9);
}

void __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getDSArchiveServiceErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPArchiveOperation.m", 26, @"%s", dlerror());

  __break(1u);
}

void __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end