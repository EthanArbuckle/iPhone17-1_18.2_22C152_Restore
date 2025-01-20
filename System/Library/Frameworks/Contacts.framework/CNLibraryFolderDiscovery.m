@interface CNLibraryFolderDiscovery
+ (NSArray)localImageFolders;
+ (id)discoverFoldersWithPathComponents:(id)a3;
@end

@implementation CNLibraryFolderDiscovery

+ (NSArray)localImageFolders
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CNLibraryFolderDiscovery_localImageFolders__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localImageFolders_cn_once_token_0 != -1) {
    dispatch_once(&localImageFolders_cn_once_token_0, block);
  }
  v2 = (void *)localImageFolders_cn_once_object_0;

  return (NSArray *)v2;
}

uint64_t __45__CNLibraryFolderDiscovery_localImageFolders__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) discoverFoldersWithPathComponents:&unk_1EE089830];
  uint64_t v2 = localImageFolders_cn_once_object_0;
  localImageFolders_cn_once_object_0 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)discoverFoldersWithPathComponents:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x192FD3A40]();
  v5 = NSSearchPathForDirectoriesInDomains(NSAllLibrariesDirectory, 0xFFFFuLL, 1);
  v6 = objc_msgSend(v5, "_cn_distinctObjects");

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CNLibraryFolderDiscovery_discoverFoldersWithPathComponents___block_invoke;
  v11[3] = &unk_1E56B93B0;
  id v7 = v3;
  id v12 = v7;
  v8 = objc_msgSend(v6, "_cn_map:", v11);
  v9 = objc_msgSend(v8, "_cn_filter:", &__block_literal_global_149);

  return v9;
}

id __62__CNLibraryFolderDiscovery_discoverFoldersWithPathComponents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  v6 = v3;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v14;
    v6 = v3;
    do
    {
      uint64_t v9 = 0;
      v10 = v6;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v6 = objc_msgSend(v10, "stringByAppendingPathComponent:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);

        ++v9;
        v10 = v6;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];

  return v11;
}

uint64_t __62__CNLibraryFolderDiscovery_discoverFoldersWithPathComponents___block_invoke_2(uint64_t a1, void *a2)
{
  char v9 = 0;
  uint64_t v2 = (void *)MEMORY[0x1E4F5A3D8];
  id v3 = a2;
  id v4 = [v2 currentEnvironment];
  uint64_t v5 = [v4 fileManager];
  unsigned int v6 = [v5 fileExistsAtURL:v3 isDirectory:&v9];

  if (v9) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

@end