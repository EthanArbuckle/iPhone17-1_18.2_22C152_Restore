@interface TDSimpleArtworkElementProduction
- (id)associatedFileModificationDateWithDocument:(id)a3;
- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4;
@end

@implementation TDSimpleArtworkElementProduction

- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  v6 = (void *)[(TDSimpleArtworkElementProduction *)self renditions];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12 = (void *)[v11 asset];
        [v11 setAsset:0];
        if (!objc_msgSend((id)objc_msgSend(v12, "renditions"), "count"))
        {
          if (v4)
          {
            v13 = (void *)[v12 fileURLWithDocument:a3];
            if ([v13 checkResourceIsReachableAndReturnError:0])
            {
              [a3 assetManagementDelegate];
              if (objc_opt_respondsToSelector()) {
                objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "willDeleteAsset:atURL:", v12, v13);
              }
              objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", v13, 0);
              [a3 assetManagementDelegate];
              if (objc_opt_respondsToSelector()) {
                objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "didDeleteAssetAtURL:", v13);
              }
            }
          }
          [a3 deleteObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  objc_msgSend(a3, "deleteObjects:", objc_msgSend(v6, "allObjects"));
}

- (id)associatedFileModificationDateWithDocument:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263EFF910] distantPast];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = (void *)[(TDSimpleArtworkElementProduction *)self renditions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          v5 = objc_msgSend(v5, "laterDate:", objc_msgSend(v11, "associatedFileModificationDateWithDocument:", a3));
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

@end