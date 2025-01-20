@interface MSSubscribeMMCSProtocol
- (MSSubscribeMMCSProtocol)initWithPersonID:(id)a3;
- (MSSubscribeStorageProtocolDelegate)delegate;
- (void)_getItemDone:(unint64_t)a3 path:(id)a4 error:(id)a5;
- (void)_requestCompleted;
- (void)_tellDelegateProtocolDidFinishRetrievingAssetParams:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)retrieveAssets:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MSSubscribeMMCSProtocol

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSSubscribeStorageProtocolDelegate *)a3;
}

- (MSSubscribeStorageProtocolDelegate)delegate
{
  return self->_delegate;
}

- (void)_requestCompleted
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(MSMMCSProtocol *)self personID];
    int v10 = 138543618;
    v11 = v7;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Finished retrieving assets.", (uint8_t *)&v10, 0x16u);
  }
  unint64_t itemCount = self->_itemCount;
  if (itemCount)
  {
    for (unint64_t i = 0; i < itemCount; ++i)
    {
      v5 = self->_authTokens[i];
      if (v5)
      {
        free(v5);
        unint64_t itemCount = self->_itemCount;
      }
    }
  }
  itemIDToAssetDict = self->_itemIDToAssetDict;
  self->_itemIDToAssetDict = 0;

  free(self->_itemIDs);
  self->_itemIDs = 0;
  free(self->_signatures);
  self->_signatures = 0;
  free(self->_authTokens);
  self->_authTokens = 0;
  self->_unint64_t itemCount = 0;
  [(MSSubscribeStorageProtocolDelegate *)self->_delegate subscribeStorageProtocolDidFinishRetrievingAllAssets:self];
}

- (void)_getItemDone:(unint64_t)a3 path:(id)a4 error:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  int v10 = [NSNumber numberWithUnsignedLongLong:a3];
  v11 = [(NSMutableDictionary *)self->_itemIDToAssetDict objectForKey:v10];
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      v16 = objc_opt_class();
      id v17 = v16;
      v18 = [(MSMMCSProtocol *)self personID];
      v19 = [v9 MSVerboseDescription];
      int v32 = 138544386;
      v33 = v16;
      __int16 v34 = 2112;
      v35 = v18;
      __int16 v36 = 2114;
      unint64_t v37 = (unint64_t)v11;
      __int16 v38 = 2112;
      id v39 = v8;
      __int16 v40 = 2114;
      v41 = v19;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Retrieved file for asset %{public}@ at path %@, error %{public}@", (uint8_t *)&v32, 0x34u);
    }
    [v11 setPath:v8];
    [v11 setError:v9];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      v20 = objc_opt_class();
      id v21 = v20;
      v22 = [(MSMMCSProtocol *)self personID];
      v23 = [v9 MSVerboseDescription];
      int v32 = 138544130;
      v33 = v20;
      __int16 v34 = 2112;
      v35 = v22;
      __int16 v36 = 2114;
      unint64_t v37 = (unint64_t)v11;
      __int16 v38 = 2114;
      id v39 = v23;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Retreived asset %{public}@ with error %{public}@", (uint8_t *)&v32, 0x2Au);

      if (v8) {
        goto LABEL_6;
      }
    }
    else if (v8)
    {
LABEL_6:
      [(MSSubscribeStorageProtocolDelegate *)self->_delegate subscribeStorageProtocol:self didFinishRetrievingAsset:v11 error:0];
      __int16 v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v12 removeItemAtPath:v8 error:0];

LABEL_17:
      [(NSMutableDictionary *)self->_itemIDToAssetDict removeObjectForKey:v10];
      goto LABEL_18;
    }
    if (!v9)
    {
      delegate = self->_delegate;
      v29 = (void *)MEMORY[0x1E4F28C58];
      v30 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_SUBSCRIBER_CANNOT_GET_ASSET");
      v31 = [v29 MSErrorWithDomain:@"MSSubscriberErrorDomain" code:0 description:v30];
      [(MSSubscribeStorageProtocolDelegate *)delegate subscribeStorageProtocol:self didFinishRetrievingAsset:v11 error:v31];

      id v9 = 0;
      goto LABEL_17;
    }
    v24 = [v9 domain];
    if ([v24 isEqualToString:*MEMORY[0x1E4F73818]])
    {
      uint64_t v25 = [v9 code];

      if (v25 != 14)
      {
LABEL_15:
        [(MSSubscribeStorageProtocolDelegate *)self->_delegate subscribeStorageProtocol:self didFinishRetrievingAsset:v11 error:v9];
        goto LABEL_17;
      }
      v26 = (void *)MEMORY[0x1E4F28C58];
      v24 = (void *)MSCFCopyLocalizedString(@"ERROR_SUBSCRIBER_BAD_TOKEN");
      uint64_t v27 = [v26 MSErrorWithDomain:@"MSSubscribeStorageProtocolErrorDomain" code:0 description:v24];

      id v9 = (id)v27;
    }

    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = objc_opt_class();
    id v14 = v13;
    v15 = [(MSMMCSProtocol *)self personID];
    int v32 = 138543874;
    v33 = v13;
    __int16 v34 = 2112;
    v35 = v15;
    __int16 v36 = 2048;
    unint64_t v37 = a3;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Cannot find asset for item ID %lld", (uint8_t *)&v32, 0x20u);
  }
LABEL_18:
}

- (void)retrieveAssets:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 count];
  self->_unint64_t itemCount = v5;
  if (!v5) {
    goto LABEL_38;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v49 = objc_opt_class();
    id v50 = v49;
    v51 = [(MSMMCSProtocol *)self personID];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v49;
    __int16 v68 = 2112;
    v69 = v51;
    __int16 v70 = 2114;
    id v71 = v4;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Begin retrieving assets %{public}@", buf, 0x20u);
  }
  v6 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_itemCount];
  itemIDToAssetDict = self->_itemIDToAssetDict;
  self->_itemIDToAssetDict = v6;

  self->_itemIDs = (unint64_t *)malloc_type_calloc(self->_itemCount, 8uLL, 0x100004000313F17uLL);
  self->_signatures = (const char **)malloc_type_calloc(self->_itemCount, 8uLL, 0x10040436913F5uLL);
  self->_authTokens = (char **)malloc_type_calloc(self->_itemCount, 8uLL, 0xC0040B8AA526DuLL);
  id v8 = MSPlatform();
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = MSPlatform();
    v11 = [(MSMMCSProtocol *)self personID];
    __int16 v12 = [v10 contentURLForPersonID:v11];

    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        v13 = objc_opt_class();
        id v14 = v13;
        v15 = [(MSMMCSProtocol *)self personID];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v13;
        __int16 v68 = 2112;
        v69 = v15;
        __int16 v70 = 2114;
        id v71 = v12;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Using contentURL %{public}@ from MSPlatform for download", buf, 0x20u);
      }
      goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to get contentURL from MSPlatform. Using URL from asset metadata for download", buf, 2u);
    }
  }
  v16 = [v4 objectAtIndex:0];
  __int16 v12 = [v16 MMCSURL];

  if (!self->_itemCount) {
    goto LABEL_41;
  }
LABEL_11:
  v55 = v12;
  uint64_t v17 = 0;
  unint64_t v18 = 0;
  do
  {
    v19 = [v4 objectAtIndex:v18];
    id v20 = [v19 fileHash];
    id v21 = (const char *)[v20 bytes];

    v22 = [v19 fileHash];
    uint64_t v23 = [v22 length];

    if (v23 && v23 == MEMORY[0x1E019DFF0](v21) && MEMORY[0x1E019E030](v21))
    {
      self->_signatures[v17] = v21;
      v24 = [v19 MMCSAccessHeader];
      id v25 = v24;
      if (v24 && [v24 length])
      {
        id v26 = [v19 MMCSAccessHeader];
        uint64_t v27 = (const char *)[v26 cStringUsingEncoding:4];

        size_t v28 = strlen(v27);
        self->_authTokens[v17] = (char *)malloc_type_malloc(v28 + 1, 0x2B8B17DBuLL);
        strcpy(self->_authTokens[v17], v27);
      }
      v29 = +[MSMMCSProtocol computeItemIDForAsset:v19];
      self->_itemIDs[v17] = [v29 unsignedLongLongValue];
      [(NSMutableDictionary *)self->_itemIDToAssetDict setObject:v19 forKey:v29];
      ++v17;
    }
    else
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      v31 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_SUBSCRIBER_ASSET_BAD_SIGNATURE");
      int v32 = [v30 MSErrorWithDomain:@"MSSubscriberErrorDomain" code:2 description:v31];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__MSSubscribeMMCSProtocol_retrieveAssets___block_invoke;
      block[3] = &unk_1E6C3D998;
      block[4] = self;
      id v64 = v19;
      id v65 = v32;
      id v25 = v32;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    ++v18;
  }
  while (v18 < self->_itemCount);
  __int16 v12 = v55;
  if (v17)
  {
    *(void *)buf = 0;
    [(MSMMCSProtocol *)self engine];
    [(MSMMCSProtocol *)self personID];
    MSPMMCSConnectionProperties();
    authTokens = self->_authTokens;
    v53 = buf;
    int v33 = MMCSGetItems();
    __int16 v34 = *(void **)buf;
    if (!v33)
    {
      id v54 = v4;
      if (!*(void *)buf)
      {
        v35 = (void *)MEMORY[0x1E4F28C58];
        __int16 v36 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_SUBSCRIBER_CANNOT_RETRIEVE");
        __int16 v34 = objc_msgSend(v35, "MSErrorWithDomain:code:description:", @"MSSubscriberErrorDomain", 5, v36, authTokens, buf);
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      unint64_t v37 = self->_itemIDToAssetDict;
      uint64_t v38 = [(NSMutableDictionary *)v37 countByEnumeratingWithState:&v59 objects:v66 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v60;
        v41 = MEMORY[0x1E4F14428];
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v60 != v40) {
              objc_enumerationMutation(v37);
            }
            v43 = -[NSMutableDictionary objectForKey:](self->_itemIDToAssetDict, "objectForKey:", *(void *)(*((void *)&v59 + 1) + 8 * i), authTokens, v53);
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __42__MSSubscribeMMCSProtocol_retrieveAssets___block_invoke_20;
            v56[3] = &unk_1E6C3D998;
            v56[4] = self;
            id v57 = v43;
            id v58 = v34;
            id v44 = v43;
            dispatch_async(v41, v56);
          }
          uint64_t v39 = [(NSMutableDictionary *)v37 countByEnumeratingWithState:&v59 objects:v66 count:16];
        }
        while (v39);
      }

      v45 = self->_itemIDToAssetDict;
      self->_itemIDToAssetDict = 0;

      free(self->_itemIDs);
      self->_itemIDs = 0;
      free(self->_signatures);
      self->_signatures = 0;
      free(self->_authTokens);
      self->_authTokens = 0;
      id v4 = v54;
      __int16 v12 = v55;
    }
  }
  else
  {
LABEL_41:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v46 = objc_opt_class();
      id v47 = v46;
      v48 = [(MSMMCSProtocol *)self personID];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v46;
      __int16 v68 = 2112;
      v69 = v48;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Nothing to retrieve.", buf, 0x16u);
    }
  }

LABEL_38:
}

void __42__MSSubscribeMMCSProtocol_retrieveAssets___block_invoke(void *a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v5[0] = @"asset";
  v5[1] = @"error";
  uint64_t v3 = a1[6];
  v6[0] = v1;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 _tellDelegateProtocolDidFinishRetrievingAssetParams:v4];
}

void __42__MSSubscribeMMCSProtocol_retrieveAssets___block_invoke_20(void *a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v5[0] = @"asset";
  v5[1] = @"error";
  uint64_t v3 = a1[6];
  v6[0] = v1;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 _tellDelegateProtocolDidFinishRetrievingAssetParams:v4];
}

- (void)_tellDelegateProtocolDidFinishRetrievingAssetParams:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 objectForKey:@"asset"];
  v6 = [v4 objectForKey:@"error"];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_opt_class();
    id v8 = v7;
    char v9 = [(MSMMCSProtocol *)self personID];
    int v10 = [v5 fileHash];
    v11 = [v6 MSVerboseDescription];
    int v12 = 138544130;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed to get asset with hash %{public}@\nError: %{public}@", (uint8_t *)&v12, 0x2Au);
  }
  [(MSSubscribeStorageProtocolDelegate *)self->_delegate subscribeStorageProtocol:self didFinishRetrievingAsset:v5 error:v6];
}

- (void)dealloc
{
  [(MSSubscribeMMCSProtocol *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)MSSubscribeMMCSProtocol;
  [(MSMMCSProtocol *)&v3 dealloc];
}

- (void)deactivate
{
  v4.receiver = self;
  v4.super_class = (Class)MSSubscribeMMCSProtocol;
  [(MSMMCSProtocol *)&v4 deactivate];
  itemIDToAssetDict = self->_itemIDToAssetDict;
  self->_itemIDToAssetDict = 0;
}

- (MSSubscribeMMCSProtocol)initWithPersonID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = MSPathSubscribeMMCSLibraryForPersonID(v4);
  v8.receiver = self;
  v8.super_class = (Class)MSSubscribeMMCSProtocol;
  v6 = [(MSMMCSProtocol *)&v8 initWithPersonID:v4 path:v5];

  return v6;
}

@end