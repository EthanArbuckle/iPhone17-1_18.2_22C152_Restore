@interface WFGetFolderContentsAction
+ (id)contentsOfDirectory:(id)a3 includingSubfolders:(BOOL)a4 error:(id *)a5;
- (id)contentDestinationWithError:(id *)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetFolderContentsAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFGetFolderContentsAction *)self parameterValueForKey:@"Recursive" ofClass:objc_opt_class()];
  char v6 = [v5 BOOLValue];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__WFGetFolderContentsAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_264E5CBF0;
  v8[4] = self;
  char v9 = v6;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__WFGetFolderContentsAction_runAsynchronouslyWithInput___block_invoke_2;
  v7[3] = &unk_264E5E8E8;
  v7[4] = self;
  [v4 enumerateFileRepresentations:v8 forType:0 completionHandler:v7];
}

void __56__WFGetFolderContentsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v30[2] = *MEMORY[0x263EF8340];
  v5 = a3;
  char v6 = [a2 fileURL];
  if (objc_msgSend(v6, "wf_fileIsDirectory"))
  {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 40);
    id v27 = 0;
    v8 = +[WFGetFolderContentsAction contentsOfDirectory:v6 includingSubfolders:v7 error:&v27];
    id v9 = v27;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * v14);
          v16 = objc_msgSend(*(id *)(a1 + 32), "output", (void)v23);
          [v16 addFileWithOriginAttribution:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v12);
    }

    v5[2](v5, v9);
  }
  else
  {
    WFLocalizedString(@"File Is Not a Folder");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(@"Please pass a folder to the Get Folder Contents action, instead of a regular file.");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(a1 + 32);
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F870B8];
    uint64_t v20 = *MEMORY[0x263F08320];
    v29[0] = *MEMORY[0x263F08338];
    v29[1] = v20;
    v30[0] = v9;
    v30[1] = v10;
    v21 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    v22 = [v18 errorWithDomain:v19 code:5 userInfo:v21];
    [v17 finishRunningWithError:v22];
  }
}

uint64_t __56__WFGetFolderContentsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

+ (id)contentsOfDirectory:(id)a3 includingSubfolders:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (v6) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 5;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__48118;
  long long v25 = __Block_byref_object_dispose__48119;
  id v26 = 0;
  id v9 = objc_opt_new();
  id v10 = objc_opt_new();
  uint64_t v11 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__WFGetFolderContentsAction_contentsOfDirectory_includingSubfolders_error___block_invoke;
  v15[3] = &unk_264E5CBC8;
  v17 = &v21;
  uint64_t v18 = v8;
  BOOL v19 = v6;
  id v12 = v9;
  id v16 = v12;
  [v10 coordinateReadingItemAtURL:v7 options:0x20000 error:&obj byAccessor:v15];
  objc_storeStrong(v11, obj);

  uint64_t v13 = (void *)v22[5];
  if (v13) {
    *a5 = v13;
  }

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __75__WFGetFolderContentsAction_contentsOfDirectory_includingSubfolders_error___block_invoke(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = *MEMORY[0x263EFF6A8];
  v24[0] = *MEMORY[0x263EFF6A8];
  BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __75__WFGetFolderContentsAction_contentsOfDirectory_includingSubfolders_error___block_invoke_2;
  v22[3] = &unk_264E5CBA0;
  uint64_t v7 = *(void *)(a1 + 48);
  v22[4] = *(void *)(a1 + 40);
  uint64_t v8 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:v6 options:v7 errorHandler:v22];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v17 = 0;
        [v14 getResourceValue:&v17 forKey:v5 error:0];
        id v15 = v17;
        if (![v15 BOOLValue] || !*(unsigned char *)(a1 + 56))
        {
          id v16 = [MEMORY[0x263F33870] fileWithURL:v14 options:0];
          if (v16) {
            [*(id *)(a1 + 32) addObject:v16];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v11);
  }
}

uint64_t __75__WFGetFolderContentsAction_contentsOfDirectory_includingSubfolders_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
  return 0;
}

@end