@interface DEUpdater
+ (BOOL)putManifest:(id)a3 src:(id)a4 contents:(id)a5 summary:(id)a6 overrides:(id)a7;
+ (BOOL)putManifest:(id)a3 src:(id)a4 contents:(id)a5 summary:(id)a6 overrides:(id)a7 dirDownloadType:(unint64_t)a8;
+ (id)summarize:(id)a3 filter:(id)a4;
@end

@implementation DEUpdater

+ (BOOL)putManifest:(id)a3 src:(id)a4 contents:(id)a5 summary:(id)a6 overrides:(id)a7
{
  return +[DEUpdater putManifest:a3 src:a4 contents:a5 summary:a6 overrides:a7 dirDownloadType:3];
}

+ (BOOL)putManifest:(id)a3 src:(id)a4 contents:(id)a5 summary:(id)a6 overrides:(id)a7 dirDownloadType:(unint64_t)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v12 = a4;
  id v13 = a5;
  id v29 = a6;
  id v14 = a7;
  if (v12)
  {
    if (!v13) {
      id v13 = (id)objc_opt_new();
    }
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__2819;
    v39 = __Block_byref_object_dispose__2820;
    id v40 = (id)objc_opt_new();
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __72__DEUpdater_putManifest_src_contents_summary_overrides_dirDownloadType___block_invoke;
    v34[3] = &unk_1E651E100;
    v34[4] = &v35;
    v27 = (void *)MEMORY[0x1C8797450](v34);
    if ([v13 apply:v27 to:v12])
    {
      if (v14)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v41 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v31;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v31 != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              v20 = [v15 objectForKey:v19];
              v21 = [(id)v36[5] objectForKey:v19];
              if (!v21)
              {
                +[DELog error:@"Failed to find \"%@\" in src dir \"%@\" in order to apply override", v19, v12];
                BOOL v24 = 0;
                goto LABEL_19;
              }
              objc_msgSend(v21, "setDownloadType:", objc_msgSend(v20, "downloadType"));
              [(id)v36[5] setObject:v21 forKey:v19];
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v41 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
      }
      id v15 = +[DEUpdater summarize:v12 filter:v29];
      v20 = [v12 URLByAppendingPathComponent:@"manifest.pb" isDirectory:0];
      v22 = [DEManifest alloc];
      v23 = [(DEManifest *)v22 initWithName:v28 contents:v36[5] summary:v15 dirDownloadType:a8];
      BOOL v24 = [(DEManifest *)v23 writeToURL:v20];

LABEL_19:
    }
    else
    {
      +[DELog error:@"Failed to putManifest to \"%@\"", v12];
      BOOL v24 = 0;
    }

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

BOOL __72__DEUpdater_putManifest_src_contents_summary_overrides_dirDownloadType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[DEVersionWriter versionFile:a3];
  if (v6)
  {
    v7 = objc_opt_new();
    [v7 setVersion:v6];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v7 forKey:v5];
  }
  return v6 != 0;
}

+ (id)summarize:(id)a3 filter:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__2819;
    uint64_t v37 = __Block_byref_object_dispose__2820;
    id v38 = (id)objc_opt_new();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __30__DEUpdater_summarize_filter___block_invoke;
    v32[3] = &unk_1E651E100;
    v32[4] = &v33;
    v23 = (void *)MEMORY[0x1C8797450](v32);
    if ([v7 apply:v23 to:v5])
    {
      v9 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = (id)v34[5];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v10);
            }
            [v9 addObject:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v11);
      }

      v22 = [v9 sortedArrayUsingSelector:sel_compare_];
      id v14 = objc_opt_new();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v22;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = [(id)v34[5] objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * j)];
            v20 = [v19 version];
            [v14 writeData:v20];
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v39 count:16];
        }
        while (v16);
      }

      [v14 close];
      v8 = [v14 version];
    }
    else
    {
      +[DELog error:@"Failed to summarize \"%@\"", v5];
      v8 = 0;
    }

    _Block_object_dispose(&v33, 8);
  }

  return v8;
}

BOOL __30__DEUpdater_summarize_filter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[DEVersionWriter versionFile:a3];
  if (v6)
  {
    v7 = objc_opt_new();
    [v7 setVersion:v6];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v7 forKey:v5];
  }
  return v6 != 0;
}

@end