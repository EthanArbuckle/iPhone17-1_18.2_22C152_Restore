@interface AVTCoreDataPersistentStoreLocalConfiguration
@end

@implementation AVTCoreDataPersistentStoreLocalConfiguration

void __63___AVTCoreDataPersistentStoreLocalConfiguration_setupIfNeeded___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (v7)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    v5 = (void *)a1[4];
    v6 = [v7 description];
    [v5 logErrorAddingPersistentStore:v6];
  }
}

void __66___AVTCoreDataPersistentStoreLocalConfiguration_copyStorageAside___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08850]);
  v3 = objc_opt_class();
  v4 = [*(id *)(a1 + 32) storeLocation];
  v5 = [v3 sideDatabaseFolderForStoreLocation:v4];

  v6 = [v5 path];
  int v7 = [v2 fileExistsAtPath:v6];

  if (!v7
    || (uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8),
        id obj = *(id *)(v8 + 40),
        char v9 = [v2 removeItemAtURL:v5 error:&obj],
        objc_storeStrong((id *)(v8 + 40), obj),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9) != 0))
  {
    v10 = [*(id *)(a1 + 32) folderLocation];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(id *)(v11 + 40);
    char v12 = [v2 copyItemAtURL:v10 toURL:v5 error:&v13];
    objc_storeStrong((id *)(v11 + 40), v13);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
  }
}

void __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(NSObject **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke_2;
  v12[3] = &unk_2647C41F0;
  id v13 = v5;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v6;
  uint64_t v15 = v9;
  id v16 = v8;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 48) logger];
    objc_msgSend(v2, "logUpdatingBackupExclusionStatus:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));

    v3 = [*(id *)(a1 + 48) folderLocation];
    id v37 = 0;
    uint64_t v4 = *MEMORY[0x263EFF6B0];
    id v36 = 0;
    int v5 = [v3 getResourceValue:&v37 forKey:v4 error:&v36];
    id v6 = v37;
    id v7 = v36;
    if (v5)
    {
      if (![v6 BOOLValue])
      {
LABEL_12:
        int v13 = [*(id *)(a1 + 32) BOOLValue];
        id v14 = (uint64_t *)MEMORY[0x263EFFB40];
        if (!v13) {
          id v14 = (uint64_t *)MEMORY[0x263EFFB38];
        }
        uint64_t v15 = *v14;
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke_3;
        v30[3] = &unk_2647C41C8;
        id v16 = v3;
        uint64_t v34 = v15;
        uint64_t v17 = *(void *)(a1 + 48);
        id v31 = v16;
        uint64_t v32 = v17;
        id v18 = v7;
        id v33 = v18;
        v19 = (uint64_t (**)(void, void, void))MEMORY[0x22A660070](v30);
        uint64_t v20 = *MEMORY[0x263EFFAD8];
        id v29 = 0;
        int v21 = ((uint64_t (**)(void, uint64_t, id *))v19)[2](v19, v20, &v29);
        id v22 = v29;
        uint64_t v23 = *MEMORY[0x263EFFAE0];
        id v28 = 0;
        unsigned int v24 = ((uint64_t (**)(void, uint64_t, id *))v19)[2](v19, v23, &v28);
        id v25 = v28;
        uint64_t v26 = *(void *)(a1 + 56);
        if (v26)
        {
          if (v21) {
            id v27 = v25;
          }
          else {
            id v27 = v22;
          }
          (*(void (**)(uint64_t, void, id))(v26 + 16))(v26, v21 & v24, v27);
        }

        return;
      }
      id v35 = v7;
      char v8 = [v3 setResourceValue:MEMORY[0x263EFFA80] forKey:v4 error:&v35];
      id v9 = v35;

      if (v8)
      {
        id v7 = v9;
        goto LABEL_12;
      }
      id v11 = [*(id *)(a1 + 48) logger];
      char v12 = [v9 description];
      [v11 logErrorMigratingBackupInclusionStatus:v12];
      id v7 = v9;
    }
    else
    {
      id v11 = [*(id *)(a1 + 48) logger];
      char v12 = [v7 description];
      [v11 logErrorMigratingBackupInclusionStatus:v12];
    }

    goto LABEL_12;
  }
  id v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);

  v10();
}

BOOL __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke_3(uint64_t a1, const __CFString *a2, void *a3)
{
  CFErrorRef error = 0;
  int v5 = CFURLSetResourcePropertyForKey(*(CFURLRef *)(a1 + 32), a2, *(CFTypeRef *)(a1 + 56), &error);
  if (!v5)
  {
    if (a3 && error) {
      *a3 = error;
    }
    CFErrorRef error = 0;
    id v6 = [*(id *)(a1 + 40) logger];
    id v7 = [*(id *)(a1 + 48) description];
    [v6 logErrorUpdatingBackupInclusionStatus:v7];
  }
  return v5 != 0;
}

@end