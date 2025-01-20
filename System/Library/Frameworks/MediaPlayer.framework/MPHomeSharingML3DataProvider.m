@interface MPHomeSharingML3DataProvider
+ (BOOL)isScanningForLibraries;
+ (id)homeSharingGroupID;
+ (void)_determineHomeSharingGroupIDWithCompletionHandler:(id)a3;
+ (void)beginScanningForLibraries;
+ (void)endScanningForLibraries;
- (BOOL)hasGeniusMixes;
- (BOOL)isSupportedSharingVersion;
- (BOOL)requiresAuthentication;
- (BOOL)writable;
- (HSHomeSharingLibrary)homeSharingLibrary;
- (MPHomeSharingML3DataProvider)initWithHomeSharingLibrary:(id)a3;
- (id)URLForItemDataRequest:(id)a3;
- (id)_tokenDataForAccountID:(unint64_t)a3;
- (id)adjustedValueForMPProperty:(id)a3 ofEntity:(id)a4 withDefaultValue:(id)a5;
- (id)artworkDataSource;
- (id)errorResolverForItem:(id)a3;
- (id)itemResultSetForQueryCriteria:(id)a3;
- (id)name;
- (id)protectedContentSupportStorageURL;
- (id)uniqueIdentifier;
- (unsigned)databaseID;
- (void)_fetchTokensForAuthorizedDSIDs;
- (void)_fillContainerForQueryCriteria:(id)a3 completionBlock:(id)a4;
- (void)_homeSharingGroupIDDidChangeNotification:(id)a3;
- (void)_homeSharingLibraryDidBecomeUnavailable:(id)a3;
- (void)_homeSharingLibraryDidUpdateRevisionNumber:(id)a3;
- (void)connectWithAuthenticationData:(id)a3 completionBlock:(id)a4 progressHandler:(id)a5;
- (void)dealloc;
- (void)disconnect;
- (void)loadQueryCriteria:(id)a3 countOfCollectionsWithCompletionBlock:(id)a4;
- (void)loadQueryCriteria:(id)a3 countOfItemsWithCompletionBlock:(id)a4;
- (void)loadQueryCriteria:(id)a3 hasCollectionsWithCompletionBlock:(id)a4;
- (void)loadQueryCriteria:(id)a3 hasItemsWithCompletionBlock:(id)a4;
- (void)setRentalPlaybackStartDateForItemID:(unint64_t)a3;
- (void)setTokenData:(id)a3 forAuthorizedDSID:(unint64_t)a4;
- (void)setValue:(id)a3 forProperty:(id)a4 ofItemWithIdentifier:(int64_t)a5 completionBlock:(id)a6;
@end

@implementation MPHomeSharingML3DataProvider

uint64_t __82__MPHomeSharingML3DataProvider__determineHomeSharingGroupIDWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 48))
    {
      v3 = [*(id *)(a1 + 32) groupID];
      int v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Determined group ID: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    else
    {
      int v5 = 138543362;
      v6 = @"Unable to determine groupID";
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Determined group ID: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __57__MPHomeSharingML3DataProvider_beginScanningForLibraries__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (__isBrowsing == 1)
  {
    v1 = [*(id *)(a1 + 32) homeSharingGroupID];
    v2 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      v9 = v1;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Group ID: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v3 = [v1 length];
    v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        int v8 = 138543362;
        v9 = v1;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Searching for libraries in home sharing group: %{public}@", (uint8_t *)&v8, 0xCu);
      }

      uint64_t v6 = [MEMORY[0x1E4F6A350] homeSharingBrowserWithGroupID:v1];
      uint64_t v7 = (void *)__browser;
      __browser = v6;

      [(id)__browser setDelegate:__browserDelegate];
      [(id)__browser start];
      objc_opt_class();
    }
    else
    {
      if (v5)
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] No group ID, skipping scan.", (uint8_t *)&v8, 2u);
      }

      __isBrowsing = 0;
    }
  }
}

+ (void)beginScanningForLibraries
{
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"SharingDisabled"];

  if ((v4 & 1) == 0)
  {
    if (!__browserDelegate)
    {
      BOOL v5 = objc_alloc_init(MPHSBrowserDelegate);
      uint64_t v6 = (void *)__browserDelegate;
      __browserDelegate = (uint64_t)v5;
    }
    if ((__isBrowsing & 1) == 0)
    {
      uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Beginning scan.", buf, 2u);
      }

      __isBrowsing = 1;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __57__MPHomeSharingML3DataProvider_beginScanningForLibraries__block_invoke;
      v8[3] = &__block_descriptor_40_e5_v8__0l;
      v8[4] = a1;
      [a1 _determineHomeSharingGroupIDWithCompletionHandler:v8];
    }
  }
}

+ (void)_determineHomeSharingGroupIDWithCompletionHandler:(id)a3
{
  uint64_t v3 = (void (**)(void))a3;
  char v4 = [MEMORY[0x1E4F6A338] defaultStore];
  BOOL v5 = [v4 groupID];
  if ([v5 length])
  {

    goto LABEL_7;
  }
  uint64_t v6 = [MEMORY[0x1E4FB8618] sharedMonitor];
  int v7 = [v6 isRemoteServerLikelyReachable];

  if (!v7)
  {
LABEL_7:
    if (v3) {
      v3[2](v3);
    }
    goto LABEL_9;
  }
  int v8 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] No group ID known, trying to determine it from user defaults account / password.", buf, 2u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__MPHomeSharingML3DataProvider__determineHomeSharingGroupIDWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E57F4F80;
  id v10 = v4;
  v11 = v3;
  [v10 determineGroupIDWithCompletionHandler:v9];

LABEL_9:
}

+ (id)homeSharingGroupID
{
  v2 = [MEMORY[0x1E4F6A338] defaultStore];
  uint64_t v3 = [v2 groupID];

  return v3;
}

void __82__MPHomeSharingML3DataProvider__determineHomeSharingGroupIDWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MPHomeSharingML3DataProvider__determineHomeSharingGroupIDWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E57F4F58;
  char v6 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDataSource, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_containerFillQueue, 0);
  objc_storeStrong((id *)&self->_blocksForLoadingContainerPIDs, 0);
  objc_storeStrong((id *)&self->_loadedContainerPIDs, 0);
  objc_storeStrong((id *)&self->_tokenDataForDSIDs, 0);

  objc_storeStrong((id *)&self->_homeSharingLibrary, 0);
}

- (HSHomeSharingLibrary)homeSharingLibrary
{
  return self->_homeSharingLibrary;
}

- (id)artworkDataSource
{
  return self->_artworkDataSource;
}

- (void)_fillContainerForQueryCriteria:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  containerFillQueue = self->_containerFillQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke;
  block[3] = &unk_1E57F8408;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(containerFillQueue, block);
}

void __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke(id *a1)
{
  v2 = [a1[4] predicateForProperty:@"playlistPersistentID"];
  if (!v2 || [a1[4] groupingType] == 6) {
    goto LABEL_5;
  }
  uint64_t v3 = [v2 value];
  if ([*((id *)a1[5] + 18) containsObject:v3])
  {

LABEL_5:
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_2_144;
    block[3] = &unk_1E57FA198;
    id v21 = a1[6];
    dispatch_async(v4, block);

    uint64_t v3 = v21;
    goto LABEL_6;
  }
  id v5 = [*((id *)a1[5] + 19) objectForKey:v3];
  uint64_t v6 = [a1[6] copy];
  id v7 = (void *)v6;
  if (v5)
  {
    int v8 = (void *)MEMORY[0x19971E0F0](v6);
    [v5 addObject:v8];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v10 = (void *)MEMORY[0x19971E0F0](v7);
    id v5 = objc_msgSend(v9, "initWithObjects:", v10, 0);

    [*((id *)a1[5] + 19) setObject:v5 forKey:v3];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_2;
    v31[3] = &unk_1E57F9F98;
    v31[4] = a1[5];
    id v11 = v3;
    id v32 = v11;
    id v12 = (void *)MEMORY[0x19971E0F0](v31);
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    char v30 = 0;
    dispatch_time_t v13 = dispatch_time(0, 2000000000);
    id v14 = *((void *)a1[5] + 20);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_4;
    v26[3] = &unk_1E57F4FB0;
    v28 = v29;
    id v15 = v12;
    id v27 = v15;
    dispatch_after(v13, v14, v26);
    v16 = [a1[5] library];
    uint64_t v17 = *((void *)a1[5] + 16);
    uint64_t v18 = [v11 longLongValue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_5;
    v22[3] = &unk_1E57F5000;
    v22[4] = a1[5];
    id v23 = v11;
    v25 = v29;
    id v19 = v15;
    id v24 = v19;
    [v16 fillContainerForHomeSharingLibrary:v17 containerID:v18 completionHandler:v22];

    _Block_object_dispose(v29, 8);
  }

LABEL_6:
}

uint64_t __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 144) addObject:*(void *)(a1 + 40)];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        int v8 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_3;
        block[3] = &unk_1E57FA198;
        void block[4] = v7;
        dispatch_async(v8, block);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 152) removeObjectForKey:*(void *)(a1 + 40)];
}

uint64_t __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 160);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_6;
  block[3] = &unk_1E57F4FD8;
  char v15 = a2;
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v9;
  long long v14 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_2_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_6(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 72))
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v7 = v3;
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "Could not populate container %{public}@: %{public}@", buf, 0x16u);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_143;
    block[3] = &unk_1E57F9EA8;
    void block[4] = *(void *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_143(uint64_t a1)
{
  return +[MPMediaLibrary reloadLibraryDataProvider:*(void *)(a1 + 32)];
}

uint64_t __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_tokenDataForAccountID:(unint64_t)a3
{
  if (a3)
  {
    tokenDataForDSIDs = self->_tokenDataForDSIDs;
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    id v5 = [(NSMutableDictionary *)tokenDataForDSIDs objectForKey:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_fetchTokensForAuthorizedDSIDs
{
  uint64_t v3 = [(HSHomeSharingLibrary *)self->_homeSharingLibrary homeSharingGroupID];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F6A348] request];
    homeSharingLibrary = self->_homeSharingLibrary;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__MPHomeSharingML3DataProvider__fetchTokensForAuthorizedDSIDs__block_invoke;
    v6[3] = &unk_1E57F56B0;
    v6[4] = self;
    [(HSHomeSharingLibrary *)homeSharingLibrary sendRequest:v4 withResponseHandler:v6];
  }
}

void __62__MPHomeSharingML3DataProvider__fetchTokensForAuthorizedDSIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 128) deviceGUID];
  if ([v4 length])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = [v3 authorizedDSIDs];
    uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F6A368], "requestWithDSID:deviceGUID:", objc_msgSend(v9, "unsignedLongLongValue"), v4);
          uint64_t v11 = *(void *)(a1 + 32);
          id v12 = *(void **)(v11 + 128);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __62__MPHomeSharingML3DataProvider__fetchTokensForAuthorizedDSIDs__block_invoke_2;
          v14[3] = &unk_1E57F54F0;
          v14[4] = v11;
          v14[5] = v9;
          [v12 sendRequest:v10 withResponseHandler:v14];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
}

void __62__MPHomeSharingML3DataProvider__fetchTokensForAuthorizedDSIDs__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 tokenData];
  if ([v3 length]) {
    objc_msgSend(*(id *)(a1 + 32), "setTokenData:forAuthorizedDSID:", v3, objc_msgSend(*(id *)(a1 + 40), "unsignedLongLongValue"));
  }
}

- (void)setTokenData:(id)a3 forAuthorizedDSID:(unint64_t)a4
{
  id v6 = a3;
  if (!self->_tokenDataForDSIDs)
  {
    uint64_t v7 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    tokenDataForDSIDs = self->_tokenDataForDSIDs;
    self->_tokenDataForDSIDs = v7;
  }
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v6, "length"));
  uint64_t v10 = (void *)[v9 mutableBytes];
  id v13 = v6;
  memcpy(v10, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
  uint64_t v11 = self->_tokenDataForDSIDs;
  id v12 = [NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)v11 setObject:v9 forKey:v12];
}

- (BOOL)isSupportedSharingVersion
{
  return [(HSHomeSharingLibrary *)self->_homeSharingLibrary version] > 0x30005;
}

- (void)_homeSharingLibraryDidBecomeUnavailable:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 userInfo];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F6A330]];

  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Home Sharing Library became unavailable: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  +[MPHomeSharingML3DataProvider endScanningForLibraries];
  +[MPHomeSharingML3DataProvider beginScanningForLibraries];
}

- (void)_homeSharingLibraryDidUpdateRevisionNumber:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) library];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 128);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke_2;
  v5[3] = &unk_1E57FA170;
  v5[4] = v3;
  [v2 checkForChangesInHomeSharingLibrary:v4 completionHandler:v5];
}

void __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke_3;
  v7[3] = &unk_1E57F9F98;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v3;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Failure to update shared library: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 144) removeAllObjects];
    +[MPMediaLibrary reloadLibraryDataProvider:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = 0;

    uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 128) uniqueIdentifier];
    id v8 = HSLibraryCacheDirectoryForIdentifier();
    id v10 = [v8 stringByAppendingPathComponent:@"Tokens"];

    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v9 removeItemAtPath:v10 error:0];

    [*(id *)(a1 + 40) _fetchTokensForAuthorizedDSIDs];
  }
}

- (void)_homeSharingGroupIDDidChangeNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[MPHomeSharingML3DataProvider homeSharingGroupID];
  uint64_t v5 = [(MPHomeSharingML3DataProvider *)self homeSharingLibrary];
  id v6 = [v5 homeSharingGroupID];
  char v7 = [v4 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = +[MPHomeSharingML3DataProvider homeSharingGroupID];
      int v13 = 138543362;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Home sharing group ID changed to: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    +[MPMediaLibrary removeLibraryDataProvider:self removalReason:0];
    id v10 = +[MPMediaLibrary defaultMediaLibrary];
    uint64_t v11 = [v10 libraryDataProvider];
    int v12 = [v11 isEqual:self];

    if (v12) {
      +[MPMediaLibrary setDefaultMediaLibrary:0];
    }
    if (+[MPHomeSharingML3DataProvider isScanningForLibraries])
    {
      +[MPHomeSharingML3DataProvider endScanningForLibraries];
      +[MPHomeSharingML3DataProvider beginScanningForLibraries];
    }
  }
}

- (id)protectedContentSupportStorageURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = [(HSHomeSharingLibrary *)self->_homeSharingLibrary uniqueIdentifier];
  uint64_t v4 = HSLibraryCacheDirectoryForIdentifier();
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"Tokens"];
  id v6 = [v2 fileURLWithPath:v5];

  return v6;
}

- (void)setRentalPlaybackStartDateForItemID:(unint64_t)a3
{
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "Updating rental playback start date", v11, 2u);
  }

  id v6 = (void *)MEMORY[0x1E4F79B50];
  char v7 = [(MPMediaLibraryDataProviderML3 *)self library];
  id v8 = (void *)[v6 newWithPersistentID:a3 inLibrary:v7];

  uint64_t v9 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  [v8 setValue:v10 forProperty:*MEMORY[0x1E4F79810]];
}

- (id)errorResolverForItem:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 mediaItem];
  if (![v4 isRental])
  {
    int v13 = [v4 valueForProperty:@"storeAccountID"];
    uint64_t v14 = [v13 unsignedLongLongValue];

    uint64_t v15 = [(MPHomeSharingML3DataProvider *)self _tokenDataForAccountID:v14];
    long long v16 = v15;
    if (!v14 || ![v15 length])
    {
      id v21 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v30 = 138543874;
        uint64_t v31 = (uint64_t)v4;
        __int16 v32 = 2048;
        uint64_t v33 = v14;
        __int16 v34 = 2048;
        uint64_t v35 = [v16 length];
        _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_ERROR, "Cannot create error resolver for media item: %{public}@ (accountID: %llu, tokenData: %llu bytes)", (uint8_t *)&v30, 0x20u);
      }
      uint64_t v11 = 0;
      goto LABEL_24;
    }
    long long v17 = [v4 valueForProperty:@"storeDownloaderAccountID"];
    uint64_t v18 = [v17 unsignedLongLongValue];

    id v19 = [v4 valueForProperty:@"storeFamilyAccountID"];
    uint64_t v20 = [v19 unsignedLongLongValue];

    id v21 = [(MPHomeSharingML3DataProvider *)self _tokenDataForAccountID:v18];
    v22 = [v4 mediaLibrary];
    id v23 = [v22 protectedContentSupportStorageURL];

    if (v18 && v20)
    {
      uint64_t v24 = [v21 length];
      v25 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
      v26 = v25;
      if (!v24)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int v30 = 138544386;
          uint64_t v31 = (uint64_t)v4;
          __int16 v32 = 2048;
          uint64_t v33 = v14;
          __int16 v34 = 2048;
          uint64_t v35 = [v16 length];
          __int16 v36 = 2048;
          uint64_t v37 = v18;
          __int16 v38 = 2048;
          uint64_t v39 = [v21 length];
          _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_ERROR, "Cannot create error resolver for media item: %{public}@ (accountID: %llu, accountTokenData: %llu bytes, downloaderAccountID: %llu, downloaderTokenData: %llu bytes)", (uint8_t *)&v30, 0x34u);
        }

        uint64_t v11 = 0;
        goto LABEL_23;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138544386;
        uint64_t v31 = (uint64_t)v4;
        __int16 v32 = 2048;
        uint64_t v33 = v14;
        __int16 v34 = 2048;
        uint64_t v35 = [v16 length];
        __int16 v36 = 2048;
        uint64_t v37 = v18;
        __int16 v38 = 2048;
        uint64_t v39 = [v21 length];
        _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Creating error resolver for media item: %{public}@ (accountID: %llu, accountTokenData: %llu bytes, downloaderAccountID: %llu, downloaderTokenData: %llu bytes)", (uint8_t *)&v30, 0x34u);
      }

      id v27 = [[MPHomeSharingErrorResolver alloc] initWithKeybagURL:v23 accountID:v14 accountTokenData:v16 downloaderAccountID:v18 downloaderAccountTokenData:v21 familyAccountID:v20];
    }
    else
    {
      v28 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 134218240;
        uint64_t v31 = v14;
        __int16 v32 = 2048;
        uint64_t v33 = [v16 length];
        _os_log_impl(&dword_1952E8000, v28, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Creating error resolver for account ID: %llu, token data length: %lu", (uint8_t *)&v30, 0x16u);
      }

      id v27 = [[MPHomeSharingErrorResolver alloc] initWithKeybagURL:v23 accountID:v14 accountTokenData:v16];
    }
    uint64_t v11 = (MPHomeSharingRentalErrorResolver *)v27;
    [(MPHomeSharingErrorResolver *)v27 setDataProvider:self];
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  uint64_t v5 = [v4 valueForProperty:@"homeSharingID"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  char v7 = [v4 valueForProperty:@"storeAccountID"];
  uint64_t v8 = [v7 unsignedLongLongValue];

  uint64_t v9 = [v4 valueForProperty:@"storeRentalID"];
  uint64_t v10 = [v9 unsignedLongLongValue];

  uint64_t v11 = 0;
  if (v6 && v8 && v10)
  {
    int v12 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 134218496;
      uint64_t v31 = v6;
      __int16 v32 = 2048;
      uint64_t v33 = v8;
      __int16 v34 = 2048;
      uint64_t v35 = v10;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Creating error resolver for item ID: %llu, account ID: %llu, rental ID: %llu", (uint8_t *)&v30, 0x20u);
    }

    uint64_t v11 = -[MPHomeSharingRentalErrorResolver initWithItemID:homeSharingID:rentalID:accountID:]([MPHomeSharingRentalErrorResolver alloc], "initWithItemID:homeSharingID:rentalID:accountID:", [v4 persistentID], v6, v10, v8);
    [(MPHomeSharingRentalErrorResolver *)v11 setDataProvider:self];
  }
LABEL_25:

  return v11;
}

- (id)adjustedValueForMPProperty:(id)a3 ofEntity:(id)a4 withDefaultValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"filePath"])
  {
    uint64_t v11 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    uint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];

    int v13 = [v9 valueForProperty:*MEMORY[0x1E4F796A0]];
    LODWORD(v11) = [v13 longLongValue];

    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F6A378], "requestWithDatabaseID:itemID:format:", -[HSHomeSharingLibrary databaseID](self->_homeSharingLibrary, "databaseID"), v11, v12);
    uint64_t v15 = [(HSHomeSharingLibrary *)self->_homeSharingLibrary urlForRequest:v14];
    long long v16 = [v15 absoluteString];
    long long v17 = (void *)[v16 mutableCopy];

    objc_msgSend(v17, "replaceCharactersInRange:withString:", 0, 4, @"home-sharing");
    id v10 = (id)v12;
    goto LABEL_9;
  }
  if ([v8 isEqualToString:@"verifiedIntegrity"])
  {
    uint64_t v18 = [NSNumber numberWithBool:1];
LABEL_8:
    long long v17 = (void *)v18;
    goto LABEL_9;
  }
  if (![v8 isEqualToString:@"albumRepresentativeItemArtworkToken"]
    || [v10 length])
  {
    v20.receiver = self;
    v20.super_class = (Class)MPHomeSharingML3DataProvider;
    uint64_t v18 = [(MPMediaLibraryDataProviderML3 *)&v20 adjustedValueForMPProperty:v8 ofEntity:v9 withDefaultValue:v10];
    goto LABEL_8;
  }
  long long v17 = 0;
LABEL_9:

  return v17;
}

- (void)setValue:(id)a3 forProperty:(id)a4 ofItemWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v11 isEqualToString:@"bookmarkTime"])
  {
    int v13 = NSString;
    [v10 doubleValue];
    objc_msgSend(v13, "stringWithFormat:", @"%u", (v14 * 1000.0));
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    long long v16 = @"daap.songbookmark";
    goto LABEL_10;
  }
  if ([v11 isEqualToString:@"rating"])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%u", 20 * objc_msgSend(v10, "unsignedIntValue"));
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    long long v16 = @"daap.songuserrating";
    goto LABEL_10;
  }
  if ([v11 isEqualToString:@"playCount"])
  {
    long long v16 = @"daap.songuserplaycount";
LABEL_9:
    uint64_t v15 = @"1";
    goto LABEL_10;
  }
  if ([v11 isEqualToString:@"skipCount"])
  {
    long long v16 = @"daap.songuserskipcount";
    goto LABEL_9;
  }
  if ([v11 isEqualToString:@"likedState"])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%u", objc_msgSend(v10, "unsignedIntValue"));
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    long long v16 = @"com.apple.itunes.liked-state";
LABEL_10:
    if (([v11 isEqualToString:@"playCount"] & 1) != 0
      || [v11 isEqualToString:@"skipCount"])
    {
      long long v17 = (void *)MEMORY[0x1E4F79B50];
      uint64_t v18 = [(MPMediaLibraryDataProviderML3 *)self library];
      id v19 = (void *)[v17 newWithPersistentID:a5 inLibrary:v18];

      objc_super v20 = [v19 valueForProperty:*MEMORY[0x1E4F796A0]];
      unsigned int v21 = [v20 longLongValue];
      v22 = (id *)0x1E4F6A370;
    }
    else
    {
      id v23 = (void *)MEMORY[0x1E4F79B50];
      uint64_t v24 = [(MPMediaLibraryDataProviderML3 *)self library];
      id v19 = (void *)[v23 newWithPersistentID:a5 inLibrary:v24];

      objc_super v20 = [v19 valueForProperty:*MEMORY[0x1E4F796A0]];
      v22 = (id *)0x1E4F6A380;
      unsigned int v21 = v20;
    }

    v25 = objc_msgSend(*v22, "requestWithDatabaseID:itemID:", -[HSHomeSharingLibrary databaseID](self->_homeSharingLibrary, "databaseID"), v21);

    [v25 setValue:v15 forArgument:v16];
    v26 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [(HSHomeSharingLibrary *)self->_homeSharingLibrary urlForRequest:v25];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v27;
      _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Sending request '%{public}@'", buf, 0xCu);
    }
    homeSharingLibrary = self->_homeSharingLibrary;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __90__MPHomeSharingML3DataProvider_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke;
    v30[3] = &unk_1E57F4F08;
    uint64_t v31 = v16;
    __int16 v32 = v15;
    id v33 = v12;
    v29 = v15;
    [(HSHomeSharingLibrary *)homeSharingLibrary sendRequest:v25 withResponseHandler:v30];

    goto LABEL_17;
  }
  if (v12) {
    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 1, 0);
  }
LABEL_17:
}

void __90__MPHomeSharingML3DataProvider_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = [v3 responseCode];
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Setting property '%{public}@' to '%{public}@' returned status code %lu", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, 1, 0);
  }
}

- (BOOL)hasGeniusMixes
{
  return 0;
}

- (id)itemResultSetForQueryCriteria:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__33929;
  id v19 = __Block_byref_object_dispose__33930;
  id v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__MPHomeSharingML3DataProvider_itemResultSetForQueryCriteria___block_invoke;
  v10[3] = &unk_1E57F82D8;
  uint64_t v14 = &v15;
  id v6 = v4;
  id v11 = v6;
  __int16 v12 = self;
  uint64_t v7 = v5;
  uint64_t v13 = v7;
  [(MPHomeSharingML3DataProvider *)self _fillContainerForQueryCriteria:v6 completionBlock:v10];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v8;
}

intptr_t __62__MPHomeSharingML3DataProvider_itemResultSetForQueryCriteria___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)MPHomeSharingML3DataProvider;
  uint64_t v3 = objc_msgSendSuper2(&v7, sel_itemResultSetForQueryCriteria_, v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)loadQueryCriteria:(id)a3 countOfCollectionsWithCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__MPHomeSharingML3DataProvider_loadQueryCriteria_countOfCollectionsWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E57F8408;
  __int16 v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [(MPHomeSharingML3DataProvider *)self _fillContainerForQueryCriteria:v9 completionBlock:v10];
}

id __88__MPHomeSharingML3DataProvider_loadQueryCriteria_countOfCollectionsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MPHomeSharingML3DataProvider;
  return objc_msgSendSuper2(&v4, sel_loadQueryCriteria_countOfCollectionsWithCompletionBlock_, v1, v2);
}

- (void)loadQueryCriteria:(id)a3 countOfItemsWithCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__MPHomeSharingML3DataProvider_loadQueryCriteria_countOfItemsWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E57F8408;
  __int16 v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [(MPHomeSharingML3DataProvider *)self _fillContainerForQueryCriteria:v9 completionBlock:v10];
}

id __82__MPHomeSharingML3DataProvider_loadQueryCriteria_countOfItemsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MPHomeSharingML3DataProvider;
  return objc_msgSendSuper2(&v4, sel_loadQueryCriteria_countOfItemsWithCompletionBlock_, v1, v2);
}

- (void)loadQueryCriteria:(id)a3 hasCollectionsWithCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__MPHomeSharingML3DataProvider_loadQueryCriteria_hasCollectionsWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E57F8408;
  __int16 v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [(MPHomeSharingML3DataProvider *)self _fillContainerForQueryCriteria:v9 completionBlock:v10];
}

id __84__MPHomeSharingML3DataProvider_loadQueryCriteria_hasCollectionsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MPHomeSharingML3DataProvider;
  return objc_msgSendSuper2(&v4, sel_loadQueryCriteria_hasCollectionsWithCompletionBlock_, v1, v2);
}

- (void)loadQueryCriteria:(id)a3 hasItemsWithCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__MPHomeSharingML3DataProvider_loadQueryCriteria_hasItemsWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E57F8408;
  __int16 v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [(MPHomeSharingML3DataProvider *)self _fillContainerForQueryCriteria:v9 completionBlock:v10];
}

id __78__MPHomeSharingML3DataProvider_loadQueryCriteria_hasItemsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MPHomeSharingML3DataProvider;
  return objc_msgSendSuper2(&v4, sel_loadQueryCriteria_hasItemsWithCompletionBlock_, v1, v2);
}

- (void)disconnect
{
}

- (void)connectWithAuthenticationData:(id)a3 completionBlock:(id)a4 progressHandler:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = a5;
  if ([(MPHomeSharingML3DataProvider *)self isSupportedSharingVersion])
  {
    if ([(HSHomeSharingLibrary *)self->_homeSharingLibrary connectionState] == 2)
    {
      if (v7) {
        v7[2](v7, 1, 0);
      }
    }
    else
    {
      homeSharingLibrary = self->_homeSharingLibrary;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke;
      v11[3] = &unk_1E57F4EC8;
      v11[4] = self;
      __int16 v12 = v7;
      id v13 = v8;
      [(HSHomeSharingLibrary *)homeSharingLibrary connectWithCompletionHandler:v11];
    }
  }
  else if (v7)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hs_homeSharingErrorWithCode:userInfo:", 1002, 0);
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v9);
  }
}

void __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 128) uniqueIdentifier];
    id v7 = HSLibraryCacheDirectoryForIdentifier();

    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];

    id v9 = [v7 stringByAppendingPathComponent:@"Library.itdb"];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 128);
    __int16 v12 = (void *)MEMORY[0x1E4F79AF8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke_2;
    v16[3] = &unk_1E57F9C10;
    v16[4] = v10;
    id v17 = v9;
    id v18 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = v9;
    [v12 buildDatabaseFromHomeSharingLibrary:v11 atPath:v14 completionHandler:v16 progressHandler:v13];
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v5);
    }
  }
}

void __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke_2(uint64_t a1, char a2)
{
  objc_super v4 = *(NSObject **)(*(void *)(a1 + 32) + 168);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke_3;
  v7[3] = &unk_1E57F7218;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 48);
  char v11 = a2;
  dispatch_async(v4, v7);
}

void __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F79AF8]) initWithPath:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setLibrary:v2];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 56), 0);
  }
  +[MPMediaLibrary reloadLibraryDataProvider:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) _fetchTokensForAuthorizedDSIDs];
  objc_super v4 = +[MPHomeSharingRentalTracker sharedInstance];
  id v5 = [*(id *)(*(void *)(a1 + 40) + 128) uniqueIdentifier];
  [v4 removeAllRentalsForDatabaseID:v5];

  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = MEMORY[0x199719CC0]();
  id v8 = [v6 contentsOfDirectoryAtPath:v7 error:0];
  if ((unint64_t)[v8 count] >= 6)
  {
    v26 = v8;
    id v27 = v2;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      __int16 v12 = 0;
      uint64_t v29 = *(void *)v31;
      uint64_t v13 = *MEMORY[0x1E4F28310];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v16 = v7;
          id v17 = objc_msgSend(v7, "stringByAppendingPathComponent:", v15, v26, v27);
          id v18 = v6;
          id v19 = [v6 attributesOfItemAtPath:v17 error:0];

          id v20 = [v19 objectForKey:v13];
          if (!v12 || [v11 compare:v20] == 1)
          {
            id v21 = v15;

            id v22 = v20;
            char v11 = v22;
            __int16 v12 = v21;
          }

          uint64_t v6 = v18;
          id v7 = v16;
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v10);
    }
    else
    {
      char v11 = 0;
      __int16 v12 = 0;
    }

    id v23 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [v7 stringByAppendingPathComponent:v12];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v24;
      _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Removing oldest cached library: %{public}@", buf, 0xCu);
    }
    v25 = [v7 stringByAppendingPathComponent:v12];
    [v6 removeItemAtPath:v25 error:0];

    id v8 = v26;
    uint64_t v2 = v27;
  }
}

- (BOOL)writable
{
  return 0;
}

- (BOOL)requiresAuthentication
{
  return [(HSHomeSharingLibrary *)self->_homeSharingLibrary requiresPassword];
}

- (id)uniqueIdentifier
{
  return (id)[(HSHomeSharingLibrary *)self->_homeSharingLibrary uniqueIdentifier];
}

- (id)name
{
  return (id)[(HSHomeSharingLibrary *)self->_homeSharingLibrary name];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F6A318] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F6A328] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F6A320] object:0];

  v4.receiver = self;
  v4.super_class = (Class)MPHomeSharingML3DataProvider;
  [(MPMediaLibraryDataProviderML3 *)&v4 dealloc];
}

- (MPHomeSharingML3DataProvider)initWithHomeSharingLibrary:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPHomeSharingML3DataProvider;
  uint64_t v6 = [(MPMediaLibraryDataProviderML3 *)&v20 initWithLibrary:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_homeSharingLibrary, a3);
    id v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    loadedContainerPIDs = v7->_loadedContainerPIDs;
    v7->_loadedContainerPIDs = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    blocksForLoadingContainerPIDs = v7->_blocksForLoadingContainerPIDs;
    v7->_blocksForLoadingContainerPIDs = v10;

    __int16 v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__homeSharingGroupIDDidChangeNotification_ name:*MEMORY[0x1E4F6A318] object:0];
    [v12 addObserver:v7 selector:sel__homeSharingLibraryDidUpdateRevisionNumber_ name:*MEMORY[0x1E4F6A328] object:0];
    [v12 addObserver:v7 selector:sel__homeSharingLibraryDidBecomeUnavailable_ name:*MEMORY[0x1E4F6A320] object:0];
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mobileipod.containerfill", 0);
    containerFillQueue = v7->_containerFillQueue;
    v7->_containerFillQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.MediaPlayer.MPHomeSharingML3DataProvider/serialQueue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v15;

    id v17 = objc_alloc_init(MPHomeSharingArtworkDataSource);
    [(MPHomeSharingArtworkDataSource *)v17 setLibrary:v7->_homeSharingLibrary];
    artworkDataSource = v7->_artworkDataSource;
    v7->_artworkDataSource = (MPArtworkDataSource *)v17;
  }
  return v7;
}

- (id)URLForItemDataRequest:(id)a3
{
  return (id)[(HSHomeSharingLibrary *)self->_homeSharingLibrary urlForRequest:a3];
}

- (unsigned)databaseID
{
  return [(HSHomeSharingLibrary *)self->_homeSharingLibrary databaseID];
}

+ (void)endScanningForLibraries
{
  if (__isBrowsing == 1)
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Ending scan.", v4, 2u);
    }

    [(id)__browser stop];
    uint64_t v3 = (void *)__browser;
    __browser = 0;

    __isBrowsing = 0;
  }
}

+ (BOOL)isScanningForLibraries
{
  return __isBrowsing;
}

@end