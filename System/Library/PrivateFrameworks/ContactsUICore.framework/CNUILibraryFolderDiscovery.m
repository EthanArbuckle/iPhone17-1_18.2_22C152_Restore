@interface CNUILibraryFolderDiscovery
+ (id)discoverFoldersWithPathComponents:(id)a3 fileManager:(id)a4;
+ (id)localImageFolders;
@end

@implementation CNUILibraryFolderDiscovery

+ (id)localImageFolders
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CNUILibraryFolderDiscovery_localImageFolders__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localImageFolders_cn_once_token_1 != -1) {
    dispatch_once(&localImageFolders_cn_once_token_1, block);
  }
  v2 = (void *)localImageFolders_cn_once_object_1;
  return v2;
}

void __47__CNUILibraryFolderDiscovery_localImageFolders__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x263F08850] defaultManager];
  v2 = [v1 discoverFoldersWithPathComponents:&unk_26BFD9D30 fileManager:v5];
  uint64_t v3 = [v2 copy];
  v4 = (void *)localImageFolders_cn_once_object_1;
  localImageFolders_cn_once_object_1 = v3;
}

+ (id)discoverFoldersWithPathComponents:(id)a3 fileManager:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v33 = a4;
  v28 = (void *)MEMORY[0x210538660]();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ABImageDebug", @"com.apple.AddressBook", 0);
  id v5 = NSSearchPathForDirectoriesInDomains(NSAllLibrariesDirectory, 0xFFFFuLL, 1);
  v27 = &v25;
  uint64_t v25 = [v5 count];
  v30 = (char *)&v25 - ((8 * v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = 8 * v25;
  bzero(v30, 8 * v25);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v31 = v5;
  uint64_t v35 = [v31 countByEnumeratingWithState:&v41 objects:v46 count:16];
  uint64_t v6 = 0;
  if (v35)
  {
    uint64_t v32 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v31);
        }
        id v8 = *(id *)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v9 = v34;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
        v11 = v8;
        if (v10)
        {
          uint64_t v12 = v10;
          uint64_t v13 = *(void *)v38;
          v11 = v8;
          do
          {
            uint64_t v14 = 0;
            v15 = v11;
            do
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v9);
              }
              v11 = [v15 stringByAppendingPathComponent:*(void *)(*((void *)&v37 + 1) + 8 * v14)];

              ++v14;
              v15 = v11;
            }
            while (v12 != v14);
            uint64_t v12 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v12);
        }

        char v36 = 0;
        if ([v33 fileExistsAtPath:v11 isDirectory:&v36]) {
          BOOL v16 = v36 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          uint64_t v17 = [NSURL fileURLWithPath:v11 isDirectory:1];
          v18 = *(void **)&v30[8 * v6];
          *(void *)&v30[8 * v6] = v17;

          if (AppBooleanValue) {
            NSLog(&cfstr_RilFoundImageL.isa, v8);
          }
          ++v6;
        }
      }
      uint64_t v35 = [v31 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v35);
  }

  id v19 = objc_alloc(MEMORY[0x263EFF8C0]);
  v20 = v30;
  v21 = (void *)[v19 initWithObjects:v30 count:v6];
  uint64_t v22 = v26;
  if (v25)
  {
    v23 = v20 - 8;
    do
    {

      v22 -= 8;
    }
    while (v22);
  }

  return v21;
}

@end