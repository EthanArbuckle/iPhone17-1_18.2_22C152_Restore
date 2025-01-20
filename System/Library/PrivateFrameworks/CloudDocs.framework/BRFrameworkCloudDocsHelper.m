@interface BRFrameworkCloudDocsHelper
- (id)_queryFastPathsForPrimaryPersona:(id)a3;
- (id)queryPathsForPersona:(id)a3 withError:(id *)a4;
@end

@implementation BRFrameworkCloudDocsHelper

- (id)queryPathsForPersona:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!BRIsFPFSEnabled(v6, v7)
    || ([(BRFrameworkCloudDocsHelper *)self _queryFastPathsForPrimaryPersona:v6],
        (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = +[BRDaemonConnection defaultConnection];
    v10 = (void *)[v9 newSyncProxy];

    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    id v24 = 0;
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__BRFrameworkCloudDocsHelper_queryPathsForPersona_withError___block_invoke;
    v12[3] = &unk_1E59AD7A8;
    v12[4] = &v19;
    v12[5] = &v13;
    [v10 queryPathsForPersona:v6 reply:v12];
    if (a4) {
      *a4 = (id) v14[5];
    }
    id v8 = (id)v20[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }

  return v8;
}

- (id)_queryFastPathsForPrimaryPersona:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4FB36F8] sharedManager];
  v5 = [v4 currentPersona];

  if (([v3 isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || ([v5 isDataSeparatedPersona] & 1) == 0
    && ([v5 userPersonaUniqueString],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:v3],
        v6,
        v7))
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
    v9 = objc_msgSend(v8, "br_realpathURL");

    if (v9)
    {
      v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_lmdURL");
      v11 = objc_msgSend(v10, "br_realpathURL");

      char v14 = 0;
      v12 = 0;
      if (objc_msgSend(MEMORY[0x1E4F1CB10], "br_isURL:syncRootOwnedByICloudDrive:withError:", v11, &v14, 0))
      {
        if (v11 && v14)
        {
          v12 = objc_opt_new();
          [v12 setObject:v9 forKeyedSubscript:@"home"];
          [v12 setObject:v11 forKeyedSubscript:@"Mobile Documents"];
        }
        else
        {
          uint64_t v15 = @"home";
          v16[0] = v9;
          v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
        }
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __61__BRFrameworkCloudDocsHelper_queryPathsForPersona_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

@end