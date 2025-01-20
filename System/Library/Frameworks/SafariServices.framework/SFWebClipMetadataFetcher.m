@interface SFWebClipMetadataFetcher
@end

@implementation SFWebClipMetadataFetcher

void __51___SFWebClipMetadataFetcher__startFetchingMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v4 = objc_opt_class();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51___SFWebClipMetadataFetcher__startFetchingMetadata__block_invoke_2;
  v5[3] = &unk_1E5C74128;
  v5[4] = *(void *)(a1 + 32);
  [v4 parseRawMetadataDictionary:v3 consumer:v5];
}

void __51___SFWebClipMetadataFetcher__startFetchingMetadata__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a3);
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeAllObjects", (void)v13);
}

@end