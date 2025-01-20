@interface CKPluginPlaybackManager
- (BOOL)isPlayingBack;
- (CKPluginPlaybackManager)initWithPluginItems:(id)a3;
- (CKPluginPlaybackManagerDelegate)delegate;
- (NSMutableArray)_pluginItems;
- (void)_cleanup;
- (void)_setPlayingBack:(BOOL)a3;
- (void)_setPluginItems:(id)a3;
- (void)addPluginItem:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startPlayback;
- (void)stopPlayback;
@end

@implementation CKPluginPlaybackManager

- (CKPluginPlaybackManager)initWithPluginItems:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKPluginPlaybackManager;
  v5 = [(CKPluginPlaybackManager *)&v8 init];
  if (v5)
  {
    v6 = (void *)[v4 mutableCopy];
    [(CKPluginPlaybackManager *)v5 _setPluginItems:v6];

    [(CKPluginPlaybackManager *)v5 _setPlayingBack:0];
    v5->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)_cleanup
{
  v3 = [(CKPluginPlaybackManager *)self delegate];
  [v3 pluginPlaybackManagerDidStopPlayback:self];

  [(CKPluginPlaybackManager *)self _setPluginItems:0];
}

- (void)startPlayback
{
  if (self->_currentIndex == 0x7FFFFFFFFFFFFFFFLL) {
    self->_unint64_t currentIndex = 0;
  }
  v3 = [(CKPluginPlaybackManager *)self _pluginItems];
  unint64_t currentIndex = self->_currentIndex;
  if (currentIndex < [v3 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__CKPluginPlaybackManager_startPlayback__block_invoke;
    aBlock[3] = &unk_1E5620C40;
    aBlock[4] = self;
    v5 = (void (**)(void))_Block_copy(aBlock);
    v6 = [v3 objectAtIndex:self->_currentIndex];
    v7 = [v6 message];
    objc_super v8 = [v7 guid];
    v9 = +[CKSnapshotUtilities snapshotForGUID:v8];

    if (v9)
    {
      v5[2](v5);
    }
    else
    {
      [(CKPluginPlaybackManager *)self _setPlayingBack:1];
      v10 = [v6 IMChatItem];
      v11 = [v10 dataSource];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __40__CKPluginPlaybackManager_startPlayback__block_invoke_2;
      v12[3] = &unk_1E5622750;
      id v13 = v6;
      v14 = v5;
      [v11 playbackWithCompletionBlock:v12];
    }
  }
}

uint64_t __40__CKPluginPlaybackManager_startPlayback__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = v2[1] + 1;
  id v4 = [v2 _pluginItems];
  unint64_t v5 = [v4 count];

  v6 = *(void **)(a1 + 32);
  if (v3 >= v5)
  {
    [v6 _cleanup];
    v9 = *(void **)(a1 + 32);
    return [v9 _setPlayingBack:0];
  }
  else
  {
    ++v6[1];
    v7 = *(void **)(a1 + 32);
    return [v7 startPlayback];
  }
}

uint64_t __40__CKPluginPlaybackManager_startPlayback__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    unint64_t v3 = [*(id *)(a1 + 32) IMChatItem];
    id v4 = [v3 dataSource];
    [v4 markAsPlayed];
  }
  unint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

- (void)addPluginItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v15 = self;
  unint64_t v5 = [(CKPluginPlaybackManager *)self _pluginItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = [*(id *)(*((void *)&v16 + 1) + 8 * v9) IMChatItem];
      v11 = [v10 guid];
      v12 = [v4 IMChatItem];
      id v13 = [v12 guid];
      char v14 = [v11 isEqualToString:v13];

      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    unint64_t v5 = [(CKPluginPlaybackManager *)v15 _pluginItems];
    [v5 addObject:v4];
  }
}

- (void)stopPlayback
{
  [(CKPluginPlaybackManager *)self _setPlayingBack:0];
  if (self->_currentIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = [(CKPluginPlaybackManager *)self _pluginItems];
    unint64_t currentIndex = self->_currentIndex;
    id v8 = v3;
    if (currentIndex < [v3 count])
    {
      unint64_t v5 = [v8 objectAtIndex:self->_currentIndex];
      uint64_t v6 = [v5 IMChatItem];
      uint64_t v7 = [v6 dataSource];
      [v7 stopPlayback];
    }
    [(CKPluginPlaybackManager *)self _cleanup];
  }
}

- (void)dealloc
{
  [(CKPluginPlaybackManager *)self setDelegate:0];
  [(CKPluginPlaybackManager *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CKPluginPlaybackManager;
  [(CKPluginPlaybackManager *)&v3 dealloc];
}

- (CKPluginPlaybackManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKPluginPlaybackManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPlayingBack
{
  return self->_isPlayingBack;
}

- (void)_setPlayingBack:(BOOL)a3
{
  self->_isPlayingBack = a3;
}

- (NSMutableArray)_pluginItems
{
  return self->__pluginItems;
}

- (void)_setPluginItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pluginItems, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end