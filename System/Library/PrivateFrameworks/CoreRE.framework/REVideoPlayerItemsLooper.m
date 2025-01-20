@interface REVideoPlayerItemsLooper
- (AVQueuePlayer)player;
- (NSArray)loopedAssets;
- (REVideoPlayerItemsLooper)initWithPlayer:(id)a3 assets:(id)a4;
- (void)dealloc;
- (void)enqueueAssetItems;
- (void)observeLastAndEnqueueAssetItems;
- (void)playerItemAtEnd:(id)a3;
- (void)setLoopedAssets:(id)a3;
- (void)setPlayer:(id)a3;
@end

@implementation REVideoPlayerItemsLooper

- (REVideoPlayerItemsLooper)initWithPlayer:(id)a3 assets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(REVideoPlayerItemsLooper *)self init];
  v9 = v8;
  if (v8)
  {
    [(REVideoPlayerItemsLooper *)v8 setPlayer:v6];
    [(REVideoPlayerItemsLooper *)v9 setLoopedAssets:v7];
    [(REVideoPlayerItemsLooper *)v9 enqueueAssetItems];
    [(REVideoPlayerItemsLooper *)v9 observeLastAndEnqueueAssetItems];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)REVideoPlayerItemsLooper;
  [(REVideoPlayerItemsLooper *)&v4 dealloc];
}

- (void)enqueueAssetItems
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(REVideoPlayerItemsLooper *)self loopedAssets];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        v8 = [(REVideoPlayerItemsLooper *)self player];
        v9 = [MEMORY[0x263EFA800] playerItemWithAsset:v7];
        [v8 insertItem:v9 afterItem:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)observeLastAndEnqueueAssetItems
{
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  v3 = [(REVideoPlayerItemsLooper *)self player];
  uint64_t v4 = [v3 items];
  uint64_t v5 = [v4 lastObject];
  [v6 addObserver:self selector:sel_playerItemAtEnd_ name:*MEMORY[0x263EFA050] object:v5];

  [(REVideoPlayerItemsLooper *)self enqueueAssetItems];
  id v7 = [(REVideoPlayerItemsLooper *)self player];
  [v7 play];
}

- (void)playerItemAtEnd:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  [v4 removeObserver:self];

  [(REVideoPlayerItemsLooper *)self observeLastAndEnqueueAssetItems];
}

- (AVQueuePlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (NSArray)loopedAssets
{
  return self->_loopedAssets;
}

- (void)setLoopedAssets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loopedAssets, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end