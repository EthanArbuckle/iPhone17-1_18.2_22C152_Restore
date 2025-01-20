@interface IKAppPlaylistBridge
- (IKAppContext)appContext;
- (IKAppPlaylist)appPlaylist;
- (IKAppPlaylistBridge)initWithAppContext:(id)a3 jsPlaylist:(id)a4;
- (IKJSPlaylist)jsPlaylist;
- (id)item:(int64_t)a3;
- (id)replaceItemsAt:(int64_t)a3 count:(unint64_t)a4 with:(id)a5;
- (int64_t)endAction;
- (int64_t)repeatMode;
- (unint64_t)length;
- (void)_evaluateDelegateBlockSync:(id)a3;
- (void)cleanup;
- (void)setEndAction:(int64_t)a3;
- (void)setRepeatMode:(int64_t)a3;
@end

@implementation IKAppPlaylistBridge

- (IKAppPlaylistBridge)initWithAppContext:(id)a3 jsPlaylist:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IKAppPlaylistBridge;
  v8 = [(IKAppPlaylistBridge *)&v21 init];
  if (v8)
  {
    if (initWithAppContext_jsPlaylist__onceToken != -1) {
      dispatch_once(&initWithAppContext_jsPlaylist__onceToken, &__block_literal_global_8);
    }
    objc_storeWeak((id *)&v8->_appContext, v6);
    objc_storeWeak((id *)&v8->_jsPlaylist, v7);
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__10;
    v19 = __Block_byref_object_dispose__10;
    id v20 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__IKAppPlaylistBridge_initWithAppContext_jsPlaylist___block_invoke_1;
    v11[3] = &unk_1E6DE4C88;
    v14 = &v15;
    id v12 = v6;
    v9 = v8;
    v13 = v9;
    [v12 evaluateDelegateBlockSync:v11];
    [(id)_globalPlaylists addObject:v16[5]];
    objc_storeWeak(v9 + 1, (id)v16[5]);

    _Block_object_dispose(&v15, 8);
  }

  return v8;
}

uint64_t __53__IKAppPlaylistBridge_initWithAppContext_jsPlaylist___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
  uint64_t v1 = _globalPlaylists;
  _globalPlaylists = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __53__IKAppPlaylistBridge_initWithAppContext_jsPlaylist___block_invoke_1(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [v5 objectForPlaylist:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)cleanup
{
  p_appPlaylist = &self->_appPlaylist;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPlaylist);
  v4 = (void *)_globalPlaylists;
  id v5 = objc_loadWeakRetained((id *)p_appPlaylist);
  [v4 removeObject:v5];

  objc_storeWeak((id *)p_appPlaylist, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__IKAppPlaylistBridge_cleanup__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __30__IKAppPlaylistBridge_cleanup__block_invoke(uint64_t a1)
{
}

- (id)item:(int64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__IKAppPlaylistBridge_item___block_invoke;
  v5[3] = &unk_1E6DE4CB0;
  v5[4] = &v6;
  v5[5] = a3;
  [(IKAppPlaylistBridge *)self _evaluateDelegateBlockSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__IKAppPlaylistBridge_item___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = [a3 appPlaylist];
  v4 = [v8 objectAtIndex:*(void *)(a1 + 40)];
  uint64_t v5 = [v4 bridge];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)replaceItemsAt:(int64_t)a3 count:(unint64_t)a4 with:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [v8 count];
  v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3, a4);
  id v11 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3, v9);
  id v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  objc_super v21 = __49__IKAppPlaylistBridge_replaceItemsAt_count_with___block_invoke;
  v22 = &unk_1E6DE4CD8;
  id v23 = v8;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v8;
  [(IKAppPlaylistBridge *)self _evaluateDelegateBlockSync:&v19];
  uint64_t v17 = objc_msgSend(v13, "copy", v19, v20, v21, v22);

  return v17;
}

void __49__IKAppPlaylistBridge_replaceItemsAt_count_with___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v27 + 1) + 8 * v10) appMediaItem];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  id v12 = [v4 appPlaylist];
  id v13 = [v12 objectsAtIndexes:*(void *)(a1 + 40)];

  id v14 = [v4 appPlaylist];
  [v14 removeObjectsAtIndexes:*(void *)(a1 + 40)];

  id v15 = [v4 appPlaylist];
  [v15 insertObjects:v5 atIndexes:*(void *)(a1 + 48)];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v13;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_super v21 = *(void **)(a1 + 56);
        v22 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "bridge", (void)v23);
        [v21 addObject:v22];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }
}

- (unint64_t)length
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__IKAppPlaylistBridge_length__block_invoke;
  v4[3] = &unk_1E6DE4D00;
  v4[4] = &v5;
  [(IKAppPlaylistBridge *)self _evaluateDelegateBlockSync:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__IKAppPlaylistBridge_length__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appPlaylist];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 count];
}

- (void)setEndAction:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__IKAppPlaylistBridge_setEndAction___block_invoke;
  v3[3] = &__block_descriptor_40_e46_v24__0__IKAppContext_8__IKAppPlaylistBridge_16l;
  v3[4] = a3;
  [(IKAppPlaylistBridge *)self _evaluateDelegateBlockSync:v3];
}

void __36__IKAppPlaylistBridge_setEndAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appPlaylist];
  [v4 setEndAction:*(void *)(a1 + 32)];
}

- (int64_t)endAction
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__IKAppPlaylistBridge_endAction__block_invoke;
  v4[3] = &unk_1E6DE4D00;
  v4[4] = &v5;
  [(IKAppPlaylistBridge *)self _evaluateDelegateBlockSync:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__IKAppPlaylistBridge_endAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appPlaylist];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 endAction];
}

- (void)setRepeatMode:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__IKAppPlaylistBridge_setRepeatMode___block_invoke;
  v3[3] = &__block_descriptor_40_e46_v24__0__IKAppContext_8__IKAppPlaylistBridge_16l;
  v3[4] = a3;
  [(IKAppPlaylistBridge *)self _evaluateDelegateBlockSync:v3];
}

void __37__IKAppPlaylistBridge_setRepeatMode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appPlaylist];
  [v4 setRepeatMode:*(void *)(a1 + 32)];
}

- (int64_t)repeatMode
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__IKAppPlaylistBridge_repeatMode__block_invoke;
  v4[3] = &unk_1E6DE4D00;
  v4[4] = &v5;
  [(IKAppPlaylistBridge *)self _evaluateDelegateBlockSync:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__IKAppPlaylistBridge_repeatMode__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appPlaylist];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 repeatMode];
}

- (void)_evaluateDelegateBlockSync:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(IKAppPlaylistBridge *)self appContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__IKAppPlaylistBridge__evaluateDelegateBlockSync___block_invoke;
  v7[3] = &unk_1E6DE47E8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 evaluateDelegateBlockSync:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__IKAppPlaylistBridge__evaluateDelegateBlockSync___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, WeakRetained);
    }
  }
}

- (IKAppPlaylist)appPlaylist
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPlaylist);
  return (IKAppPlaylist *)WeakRetained;
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (IKJSPlaylist)jsPlaylist
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_jsPlaylist);
  return (IKJSPlaylist *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_jsPlaylist);
  objc_destroyWeak((id *)&self->_appContext);
  objc_destroyWeak((id *)&self->_appPlaylist);
}

@end