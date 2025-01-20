@interface GKRawTurnsDataSource
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5;
- (void)setItems:(id)a3;
@end

@implementation GKRawTurnsDataSource

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v6 = a5;
  v7 = (void *)MEMORY[0x1E4F63818];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__GKRawTurnsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
  v9[3] = &unk_1E5F63D90;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  [v7 loadTurnBasedMatchSummariesIncludingCompatibleBundleID:1 withCompletionHandler:v9];
}

void __75__GKRawTurnsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__GKRawTurnsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2;
  v8[3] = &unk_1E5F63350;
  id v6 = *(void **)(a1 + 32);
  v8[4] = *(void *)(a1 + 40);
  id v9 = v5;
  id v7 = v5;
  [v6 addUpdate:v8 error:a3];
}

uint64_t __75__GKRawTurnsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setItems:*(void *)(a1 + 40)];
}

- (void)setItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) setState:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  v9.receiver = self;
  v9.super_class = (Class)GKRawTurnsDataSource;
  [(GKBasicCollectionViewDataSource *)&v9 setItems:v4];
}

@end