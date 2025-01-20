@interface BRFrameworkContainerHelper
+ (id)sharedHelper;
- (id)fetchAllContainersByIDWithError:(id *)a3;
- (id)fetchContainerForMangledID:(id)a3 personaID:(id)a4;
- (id)itemIDForURL:(id)a3 error:(id *)a4;
- (unsigned)br_capabilityToMoveFromURL:(id)a3 toNewParent:(id)a4 error:(id *)a5;
- (void)_resolveItemIdentifierAtURL:(id)a3 withHandler:(id)a4;
@end

@implementation BRFrameworkContainerHelper

+ (id)sharedHelper
{
  if (sharedHelper_onceToken != -1) {
    dispatch_once(&sharedHelper_onceToken, &__block_literal_global_612);
  }
  v2 = (void *)sharedHelper_instance;

  return v2;
}

uint64_t __42__BRFrameworkContainerHelper_sharedHelper__block_invoke()
{
  sharedHelper_instance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (id)fetchAllContainersByIDWithError:(id *)a3
{
  v4 = +[BRDaemonConnection secondaryConnection];
  v5 = (void *)[v4 newSyncProxy];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__BRFrameworkContainerHelper_fetchAllContainersByIDWithError___block_invoke;
  v10[3] = &unk_1E59ADFC8;
  id v6 = v5;
  id v11 = v6;
  [v6 getContainersByID:v10];
  if (a3)
  {
    *a3 = [v6 error];
  }
  v7 = [v6 error];
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = [v6 result];
  }

  return v8;
}

uint64_t __62__BRFrameworkContainerHelper_fetchAllContainersByIDWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

- (id)fetchContainerForMangledID:(id)a3 personaID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = a4;
    v7 = +[BRDaemonConnection secondaryConnection];
    v8 = (void *)[v7 newSyncProxy];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__BRFrameworkContainerHelper_fetchContainerForMangledID_personaID___block_invoke;
    v19[3] = &unk_1E59AF510;
    id v9 = v8;
    id v20 = v9;
    [v9 getContainerForMangledID:v5 personaID:v6 reply:v19];

    v10 = [v9 result];
    uint64_t v11 = [v9 error];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [v9 error];
      char v14 = objc_msgSend(v13, "br_isCloudDocsErrorCode:", 2);

      if ((v14 & 1) == 0)
      {
        v15 = brc_bread_crumbs((uint64_t)"-[BRFrameworkContainerHelper fetchContainerForMangledID:personaID:]", 3033);
        v16 = brc_default_log(0);
        if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
        {
          v18 = [v9 error];
          *(_DWORD *)buf = 138412802;
          id v22 = v5;
          __int16 v23 = 2112;
          v24 = v18;
          __int16 v25 = 2112;
          v26 = v15;
          _os_log_error_impl(&dword_19ED3F000, v16, (os_log_type_t)0x90u, "[ERROR] Failed getting container for MangledID: %@, error: %@%@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __67__BRFrameworkContainerHelper_fetchContainerForMangledID_personaID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

- (void)_resolveItemIdentifierAtURL:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  __int16 v25 = __Block_byref_object_dispose__9;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v8 = (void *)MEMORY[0x1E4F25DE8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__BRFrameworkContainerHelper__resolveItemIdentifierAtURL_withHandler___block_invoke;
  v10[3] = &unk_1E59ADCE0;
  v12 = &v15;
  v13 = &v27;
  char v14 = &v21;
  id v9 = v7;
  uint64_t v11 = v9;
  [v8 getIdentifierForUserVisibleFileAtURL:v5 completionHandler:v10];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v6[2](v6, v28[5], v22[5], v16[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

void __70__BRFrameworkContainerHelper__resolveItemIdentifierAtURL_withHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  id v15 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unsigned)br_capabilityToMoveFromURL:(id)a3 toNewParent:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__9;
  v41 = __Block_byref_object_dispose__9;
  id v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  __int16 v36 = 1;
  if (BRIsFPFSEnabled(v9, v10))
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke;
    v29[3] = &unk_1E59AF560;
    v31 = &v33;
    id v30 = v8;
    id v32 = &v37;
    [(BRFrameworkContainerHelper *)self _resolveItemIdentifierAtURL:v9 withHandler:v29];
    id v11 = v30;
  }
  else
  {
    uint64_t v12 = +[BRDaemonConnection secondaryConnection];
    v13 = (void *)[v12 newLegacySyncProxy];

    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke_3;
    uint64_t v27 = &unk_1E59AF588;
    id v11 = v13;
    id v28 = v11;
    [v11 capabilityWhenTryingToReparentItemAtURL:v8 toNewParent:v9 reply:&v24];
    id v14 = objc_msgSend(v11, "result", v24, v25, v26, v27);
    __int16 v15 = [v14 longValue];
    *((_WORD *)v34 + 12) = v15;

    uint64_t v16 = [v11 error];
    uint64_t v17 = (void *)v38[5];
    v38[5] = v16;
  }
  id v18 = (id)v38[5];
  if (v18)
  {
    v19 = brc_bread_crumbs((uint64_t)"-[BRFrameworkContainerHelper br_capabilityToMoveFromURL:toNewParent:error:]", 3084);
    id v20 = brc_default_log(0);
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      uint64_t v23 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v44 = "-[BRFrameworkContainerHelper br_capabilityToMoveFromURL:toNewParent:error:]";
      __int16 v45 = 2080;
      if (!a5) {
        uint64_t v23 = "(ignored by caller)";
      }
      v46 = v23;
      __int16 v47 = 2112;
      id v48 = v18;
      __int16 v49 = 2112;
      v50 = v19;
      _os_log_error_impl(&dword_19ED3F000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a5) {
    *a5 = v18;
  }

  unsigned __int16 v21 = *((_WORD *)v34 + 12);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v21;
}

void __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a4)
  {
    *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 8;
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = a3;
    id v8 = a2;
    id v9 = objc_msgSend(v6, "_br_itemServiceSyncProxy");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke_2;
    v10[3] = &unk_1E59AF538;
    int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    [v9 capabilityWhenTryingToReparentToNewParent:v8 domain:v7 reply:v10];
  }
}

void __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke_2(uint64_t a1, __int16 a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithUnsignedShort:a2];
  [v4 setObjResult:v7 error:v6];
}

- (id)itemIDForURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "_br_getAttributeValue:withSecondaryConnection:withError:", @"BRURLUbiquitousItemIdentifierKey", 0, a4);
}

@end