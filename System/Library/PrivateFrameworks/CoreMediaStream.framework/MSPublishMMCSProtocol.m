@interface MSPublishMMCSProtocol
- (MSPublishMMCSProtocol)initWithPersonID:(id)a3;
- (MSPublishStorageProtocolDelegate)delegate;
- (id)_getUTIFromItem:(unint64_t)a3;
- (int)_getFileDescriptorFromItem:(unint64_t)a3;
- (void)_putItemDone:(unint64_t)a3 putReceipt:(id)a4 error:(id)a5;
- (void)_putItemsFailure;
- (void)_requestCompleted;
- (void)computeHashForAsset:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)publishAssets:(id)a3 URL:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MSPublishMMCSProtocol

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSPublishStorageProtocolDelegate *)a3;
}

- (MSPublishStorageProtocolDelegate)delegate
{
  return self->_delegate;
}

- (void)_putItemsFailure
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_opt_class();
    id v17 = v16;
    v18 = [(MSMMCSProtocol *)self personID];
    *(_DWORD *)buf = 138543618;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v18;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ _putItemsFailure", buf, 0x16u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_itemIDToAssetDict;
  uint64_t v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = [(NSMutableDictionary *)self->_itemIDToAssetDict objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * v6)];
        delegate = self->_delegate;
        v9 = (void *)MEMORY[0x1E4F28C58];
        v10 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUBLISH_STORAGE_CANNOT_QUEUE");
        v11 = [v9 MSErrorWithDomain:@"MSPublishStorageProtocolErrorDomain" code:0 description:v10];
        [(MSPublishStorageProtocolDelegate *)delegate publishStorageProtocol:self didFinishUploadingAsset:v7 error:v11];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  itemIDs = self->_itemIDs;
  if (itemIDs)
  {
    free(itemIDs);
    self->_itemIDs = 0;
  }
  signatures = self->_signatures;
  if (signatures)
  {
    free(signatures);
    self->_signatures = 0;
  }
  authTokens = self->_authTokens;
  if (authTokens)
  {
    free(authTokens);
    self->_authTokens = 0;
  }
  itemFlags = self->_itemFlags;
  if (itemFlags)
  {
    free(itemFlags);
    self->_itemFlags = 0;
  }
  [(NSMutableDictionary *)self->_itemIDToAssetDict removeAllObjects];
}

- (void)_requestCompleted
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v11 = objc_opt_class();
    id v12 = v11;
    v13 = [(MSMMCSProtocol *)self personID];
    int v14 = 138543618;
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ _requestCompleted", (uint8_t *)&v14, 0x16u);
  }
  if (self->_itemsInFlight)
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:self->_itemIDs[v3]];
      uint64_t v5 = [(NSMutableDictionary *)self->_itemIDToAssetDict objectForKey:v4];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
        [(MSPublishStorageProtocolDelegate *)self->_delegate publishStorageProtocol:self didFinishUsingFD:0xFFFFFFFFLL forAsset:v5];
      }
      [(NSMutableDictionary *)self->_itemIDToAssetDict removeObjectForKey:v4];
      uint64_t v6 = self->_authTokens[v3];
      if (v6)
      {
        free(v6);
        self->_authTokens[v3] = 0;
      }

      ++v3;
    }
    while (v3 < self->_itemsInFlight);
  }
  itemIDs = self->_itemIDs;
  if (itemIDs)
  {
    free(itemIDs);
    self->_itemIDs = 0;
  }
  signatures = self->_signatures;
  if (signatures)
  {
    free(signatures);
    self->_signatures = 0;
  }
  authTokens = self->_authTokens;
  if (authTokens)
  {
    free(authTokens);
    self->_authTokens = 0;
  }
  itemFlags = self->_itemFlags;
  if (itemFlags)
  {
    free(itemFlags);
    self->_itemFlags = 0;
  }
  [(NSMutableDictionary *)self->_itemIDToAssetDict removeAllObjects];
  [(MSPublishStorageProtocolDelegate *)self->_delegate publishStorageProtocolDidFinishPublishingAllAssets:self];
}

- (void)_putItemDone:(unint64_t)a3 putReceipt:(id)a4 error:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 domain];
  if ([v10 isEqualToString:*MEMORY[0x1E4F73818]])
  {
    uint64_t v11 = [v9 code];

    if (v11 != 28) {
      goto LABEL_5;
    }
    id v12 = (void *)MEMORY[0x1E4F28C58];
    v10 = (void *)MSCFCopyLocalizedString(@"ERROR_PUBLISH_STORAGE_NEED_RESUBMISSION");
    uint64_t v13 = [v12 MSErrorWithDomain:@"MSPublishStorageProtocolErrorDomain" code:2 description:v10 underlyingError:v9];

    id v9 = (id)v13;
  }

LABEL_5:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v17 = objc_opt_class();
    id v18 = v17;
    v19 = [(MSMMCSProtocol *)self personID];
    long long v20 = [v9 MSVerboseDescription];
    int v21 = 138543874;
    long long v22 = v17;
    __int16 v23 = 2112;
    v24 = v19;
    __int16 v25 = 2114;
    v26 = v20;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ _putItemDone. Error: %{public}@", (uint8_t *)&v21, 0x20u);
  }
  itemIDToAssetDict = self->_itemIDToAssetDict;
  v15 = [NSNumber numberWithUnsignedLongLong:a3];
  __int16 v16 = [(NSMutableDictionary *)itemIDToAssetDict objectForKey:v15];

  if (v16)
  {
    if (!v9) {
      [v16 setMMCSReceipt:v8];
    }
    [(MSPublishStorageProtocolDelegate *)self->_delegate publishStorageProtocol:self didFinishUploadingAsset:v16 error:v9];
  }
}

- (void)publishAssets:(id)a3 URL:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  int64_t v7 = [v6 count];
  self->_itemIDs = (unint64_t *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  self->_signatures = (const char **)malloc_type_malloc(8 * v7, 0x10040436913F5uLL);
  self->_authTokens = (char **)malloc_type_malloc(8 * v7, 0xC0040B8AA526DuLL);
  self->_itemFlags = (unsigned int *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
  self->_itemsInFlight = v7;
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      id v9 = [v6 objectAtIndex:i];
      [v9 metadata];
      uint64_t v11 = v10 = v6;
      id v12 = [v11 objectForKey:@"MSAssetMetadataItemID"];
      uint64_t v13 = [v9 MMCSAccessHeader];
      [(NSMutableDictionary *)self->_itemIDToAssetDict setObject:v9 forKey:v12];
      self->_itemIDs[i] = [v12 unsignedLongLongValue];
      id v14 = [v9 fileHash];
      self->_signatures[i] = (const char *)[v14 bytes];

      id v15 = v13;
      __int16 v16 = (const char *)[v15 cStringUsingEncoding:4];
      size_t v17 = strlen(v16);
      self->_authTokens[i] = (char *)malloc_type_malloc(v17 + 1, 0x573C2E15uLL);
      strcpy(self->_authTokens[i], v16);
      self->_itemFlags[i] = 1;

      id v6 = v10;
    }
  }
  uint64_t v29 = 0;
  [(MSMMCSProtocol *)self engine];
  [(MSMMCSProtocol *)self personID];
  MSPMMCSConnectionProperties();
  itemFlags = self->_itemFlags;
  authTokens = self->_authTokens;
  id v18 = 0;
  if (!MMCSPutItems())
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    long long v20 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUBLISH_STORAGE_CANNOT_PUBLISH");
    id v18 = objc_msgSend(v19, "MSErrorWithDomain:code:description:", @"MSPublishStorageProtocolErrorDomain", 1, v20, authTokens, itemFlags, &v29);
  }
  if (v18)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v21 = objc_opt_class();
      id v22 = v21;
      __int16 v23 = [(MSMMCSProtocol *)self personID];
      v24 = [v18 MSVerboseDescription];
      *(_DWORD *)buf = 138544130;
      v31 = v21;
      __int16 v32 = 2112;
      v33 = v23;
      __int16 v34 = 2114;
      id v35 = v6;
      __int16 v36 = 2114;
      v37 = v24;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed to publish assets: %{public}@\nError: %{public}@", buf, 0x2Au);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__MSPublishMMCSProtocol_publishAssets_URL___block_invoke;
    block[3] = &unk_1E6C3DA38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __43__MSPublishMMCSProtocol_publishAssets_URL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _putItemsFailure];
}

- (id)_getUTIFromItem:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  itemIDToAssetDict = self->_itemIDToAssetDict;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  int64_t v7 = [(NSMutableDictionary *)itemIDToAssetDict objectForKey:v6];

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [(MSMMCSProtocol *)self personID];
      uint64_t v11 = [v7 MMCSItemType];
      int v17 = 138544130;
      id v18 = v8;
      __int16 v19 = 2112;
      long long v20 = v10;
      __int16 v21 = 2048;
      unint64_t v22 = a3;
      __int16 v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ retrieved MMCSItemType for itemID %llu. ItemType: %{public}@", (uint8_t *)&v17, 0x2Au);
    }
    id v12 = [v7 MMCSItemType];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_opt_class();
      id v15 = v14;
      __int16 v16 = [(MSMMCSProtocol *)self personID];
      int v17 = 138543874;
      id v18 = v14;
      __int16 v19 = 2112;
      long long v20 = v16;
      __int16 v21 = 2048;
      unint64_t v22 = a3;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ attempted to get UTI for unknown itemID %llu", (uint8_t *)&v17, 0x20u);
    }
    id v12 = 0;
  }

  return v12;
}

- (int)_getFileDescriptorFromItem:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  itemIDToAssetDict = self->_itemIDToAssetDict;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  int64_t v7 = [(NSMutableDictionary *)itemIDToAssetDict objectForKey:v6];

  if (v7)
  {
    int v8 = [(MSPublishStorageProtocolDelegate *)self->_delegate publishStorageProtocol:self didRequestFDForAsset:v7];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      uint64_t v11 = [(MSMMCSProtocol *)self personID];
      int v16 = 138544130;
      int v17 = v9;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      __int16 v22 = 1024;
      int v23 = v8;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ retrieving file descriptor for item %llu, returned %d.", (uint8_t *)&v16, 0x26u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = v13;
      id v15 = [(MSMMCSProtocol *)self personID];
      int v16 = 138543874;
      int v17 = v13;
      __int16 v18 = 2112;
      __int16 v19 = v15;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ attempted to get file descriptor for unknown itemID %llu", (uint8_t *)&v16, 0x20u);
    }
    int v8 = -1;
  }

  return v8;
}

- (void)computeHashForAsset:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[MSMMCSProtocol computeItemIDForAsset:v4];
  [v5 unsignedLongLongValue];
  [(NSMutableDictionary *)self->_itemIDToAssetDict setObject:v4 forKey:v5];
  [(MSMMCSProtocol *)self engine];
  if (MMCSRegisterFile())
  {
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:MEMORY[0x1E019DFF0](0)];
    free(0);
    [v4 setFileHash:v6];
    [v4 setProtocolFileSize:0];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v14 = objc_opt_class();
    id v15 = v14;
    int v16 = [(MSMMCSProtocol *)self personID];
    int v17 = [0 MSVerboseDescription];
    *(_DWORD *)buf = 138544130;
    unint64_t v21 = v14;
    __int16 v22 = 2112;
    int v23 = v16;
    __int16 v24 = 2114;
    id v25 = v4;
    __int16 v26 = 2114;
    id v27 = v17;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Could not compute signature for asset. Ignoring. %{public}@\nError: %{public}@", buf, 0x2Au);
  }
  [(NSMutableDictionary *)self->_itemIDToAssetDict removeObjectForKey:v5];
  if (objc_opt_respondsToSelector()) {
    [(MSPublishStorageProtocolDelegate *)self->_delegate publishStorageProtocol:self didFinishUsingFD:0xFFFFFFFFLL forAsset:v4];
  }
  int64_t v7 = [v4 metadata];
  int v8 = [v7 objectForKey:@"MSAssetMetadataSHA1HashKey"];

  if (!v8)
  {
    uint64_t v9 = [(MSPublishStorageProtocolDelegate *)self->_delegate publishStorageProtocol:self didRequestFDForAsset:v4];
    if ((v9 & 0x80000000) != 0)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      __int16 v18 = objc_opt_class();
      id v11 = v18;
      __int16 v19 = [(MSMMCSProtocol *)self personID];
      *(_DWORD *)buf = 138543874;
      unint64_t v21 = v18;
      __int16 v22 = 2112;
      int v23 = v19;
      __int16 v24 = 2114;
      id v25 = v4;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Could not compute hash for asset. Ignoring. %{public}@", buf, 0x20u);
    }
    else
    {
      uint64_t v10 = v9;
      MSSHA1HashForFileDescriptor(v9);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        id v12 = [v4 metadata];
        uint64_t v13 = (void *)[v12 mutableCopy];

        [v13 setObject:v11 forKey:@"MSAssetMetadataSHA1HashKey"];
        [v4 setMetadata:v13];
      }
      [(MSPublishStorageProtocolDelegate *)self->_delegate publishStorageProtocol:self didFinishUsingFD:v10 forAsset:v4];
    }
  }
LABEL_14:
}

- (void)dealloc
{
  [(MSPublishMMCSProtocol *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)MSPublishMMCSProtocol;
  [(MSMMCSProtocol *)&v3 dealloc];
}

- (void)deactivate
{
  v4.receiver = self;
  v4.super_class = (Class)MSPublishMMCSProtocol;
  [(MSMMCSProtocol *)&v4 deactivate];
  itemIDToAssetDict = self->_itemIDToAssetDict;
  self->_itemIDToAssetDict = 0;
}

- (MSPublishMMCSProtocol)initWithPersonID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MSPathPublishMMCSLibraryForPersonID(v4);
  v10.receiver = self;
  v10.super_class = (Class)MSPublishMMCSProtocol;
  id v6 = [(MSMMCSProtocol *)&v10 initWithPersonID:v4 path:v5];

  if (v6)
  {
    int64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemIDToAssetDict = v6->_itemIDToAssetDict;
    v6->_itemIDToAssetDict = v7;
  }
  return v6;
}

@end