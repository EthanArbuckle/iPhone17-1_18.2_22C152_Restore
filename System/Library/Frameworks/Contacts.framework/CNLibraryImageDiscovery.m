@interface CNLibraryImageDiscovery
+ (id)extensions;
+ (id)imageDataForEmailAddresses:(id)a3;
@end

@implementation CNLibraryImageDiscovery

+ (id)imageDataForEmailAddresses:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[CNLibraryFolderDiscovery discoverFoldersWithPathComponents:&unk_1EE0897E8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v46;
    id v34 = v5;
    id v35 = v4;
    uint64_t v28 = *(void *)v46;
    id v29 = a1;
    do
    {
      uint64_t v8 = 0;
      uint64_t v27 = v6;
      do
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v31 = v8;
        v9 = *(void **)(*((void *)&v45 + 1) + 8 * v8);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v10 = v4;
        uint64_t v32 = [v10 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v32)
        {
          uint64_t v11 = *(void *)v42;
          v36 = v10;
          uint64_t v30 = *(void *)v42;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v42 != v11) {
                objc_enumerationMutation(v10);
              }
              uint64_t v33 = v12;
              uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * v12);
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              v14 = objc_msgSend(a1, "extensions", v27);
              uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v38;
                while (2)
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v38 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                    v20 = [v9 URLByAppendingPathComponent:v13];
                    v21 = [v20 URLByAppendingPathExtension:v19];

                    if (v21)
                    {
                      v22 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
                      v23 = [v22 fileManager];
                      v24 = [v23 dataWithContentsOfURL:v21];

                      if ([v24 isSuccess])
                      {
                        v25 = [v24 value];

                        id v5 = v34;
                        id v4 = v35;
                        goto LABEL_28;
                      }
                    }
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v12 = v33 + 1;
              id v5 = v34;
              id v4 = v35;
              a1 = v29;
              uint64_t v11 = v30;
              id v10 = v36;
            }
            while (v33 + 1 != v32);
            uint64_t v32 = [v36 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v32);
        }

        uint64_t v8 = v31 + 1;
        uint64_t v7 = v28;
      }
      while (v31 + 1 != v27);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v45 objects:v51 count:16];
      uint64_t v7 = v28;
      v25 = 0;
    }
    while (v6);
  }
  else
  {
    v25 = 0;
  }
LABEL_28:

  return v25;
}

+ (id)extensions
{
  if (extensions_cn_once_token_0 != -1) {
    dispatch_once(&extensions_cn_once_token_0, &__block_literal_global_146);
  }
  v2 = (void *)extensions_cn_once_object_0;

  return v2;
}

uint64_t __37__CNLibraryImageDiscovery_extensions__block_invoke()
{
  uint64_t v0 = [&unk_1EE089800 copy];
  uint64_t v1 = extensions_cn_once_object_0;
  extensions_cn_once_object_0 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end