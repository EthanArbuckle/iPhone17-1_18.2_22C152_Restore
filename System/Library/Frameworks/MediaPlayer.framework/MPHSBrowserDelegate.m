@interface MPHSBrowserDelegate
- (void)browser:(id)a3 didAddLibrary:(id)a4;
- (void)browser:(id)a3 didRemoveLibrary:(id)a4;
@end

@implementation MPHSBrowserDelegate

- (void)browser:(id)a3 didRemoveLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__MPHSBrowserDelegate_browser_didRemoveLibrary___block_invoke;
  v9[3] = &unk_1E57F9F98;
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __48__MPHSBrowserDelegate_browser_didRemoveLibrary___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = +[MPMediaLibrary mediaLibraries];
  v3 = [v2 valueForKey:@"libraryDataProvider"];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [v8 homeSharingLibrary];
          int v10 = [v9 isEqual:*(void *)(a1 + 32)];

          if (v10)
          {
            id v11 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v12 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              uint64_t v18 = v12;
              __int16 v19 = 2114;
              v20 = v8;
              _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Browser: %{public}@ Removed %{public}@", buf, 0x16u);
            }

            +[MPMediaLibrary removeLibraryDataProvider:v8 removalReason:1];
            goto LABEL_14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)browser:(id)a3 didAddLibrary:(id)a4
{
  id v4 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MPHSBrowserDelegate_browser_didAddLibrary___block_invoke;
  block[3] = &unk_1E57F9EA8;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __45__MPHSBrowserDelegate_browser_didAddLibrary___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) name];
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Found library %{public}@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [[MPHomeSharingML3DataProvider alloc] initWithHomeSharingLibrary:*(void *)(a1 + 32)];
  +[MPMediaLibrary addLibraryDataProvider:v4];
  id v5 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Added %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

@end