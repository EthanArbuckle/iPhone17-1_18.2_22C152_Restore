@interface IKAppPlayerBridge
+ (id)makeFeatureJSObjectForFeature:(id)a3;
- (BOOL)interactiveOverlayDismissable;
- (BOOL)muted;
- (BOOL)showsResumeMenu;
- (IKAppContext)appContext;
- (IKAppMediaItemBridge)currentMediaItem;
- (IKAppMediaItemBridge)nextMediaItem;
- (IKAppMediaItemBridge)previousMediaItem;
- (IKAppPlayer)appPlayer;
- (IKAppPlayerBridge)initWithAppContext:(id)a3 jsPlayer:(id)a4;
- (IKAppPlayerBridge)initWithDOMNode:(id)a3 featureName:(id)a4;
- (IKAppPlaylistBridge)playlist;
- (IKDOMDocument)interactiveOverlayDocument;
- (IKDOMDocument)overlayDocument;
- (IKJSPlayer)jsPlayer;
- (NSArray)currentMediaItemAccessLogs;
- (NSArray)currentMediaItemErrorLogs;
- (NSDate)currentMediaItemDate;
- (NSDictionary)contextMenuData;
- (NSDictionary)userInfo;
- (NSNumber)currentMediaItemDuration;
- (NSString)featureName;
- (double)scanRate;
- (int64_t)state;
- (void)_evaluateDelegateBlockSync:(id)a3;
- (void)changeToMediaAtIndex:(unint64_t)a3;
- (void)cleanup;
- (void)dispatchEvent:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)next;
- (void)pause;
- (void)play;
- (void)present;
- (void)previous;
- (void)scan:(double)a3;
- (void)setAppPlayer:(id)a3;
- (void)setContextMenuData:(id)a3;
- (void)setElapsedTime:(double)a3;
- (void)setInteractiveOverlayDismissable:(BOOL)a3;
- (void)setInteractiveOverlayDocument:(id)a3;
- (void)setJsPlayer:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOverlayDocument:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setShowsResumeMenu:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)startObservingEvent:(id)a3 extraInfo:(id)a4;
- (void)stop;
- (void)stopObservingEvent:(id)a3;
@end

@implementation IKAppPlayerBridge

- (void)setAppPlayer:(id)a3
{
  p_appPlayer = &self->_appPlayer;
  id v5 = a3;
  objc_storeWeak((id *)p_appPlayer, v5);
  [(_IKPlaceholderAppPlayer *)self->_placeholderAppPlayer transferValuesToAppPlayer:v5];
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  v4 = [IKJSPlayer alloc];
  id v5 = [v3 appContext];
  v6 = [(IKJSPlayer *)v4 initWithAppContext:v5 bridge:v3];

  [v3 setJsPlayer:v6];
  return v6;
}

- (IKAppPlayerBridge)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a4;
  v7 = [a3 appContext];
  v8 = [(IKAppPlayerBridge *)self initWithAppContext:v7 jsPlayer:0];

  if (v8)
  {
    uint64_t v9 = [v6 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v9;

    v11 = objc_alloc_init(_IKPlaceholderAppPlayer);
    placeholderAppPlayer = v8->_placeholderAppPlayer;
    v8->_placeholderAppPlayer = v11;

    objc_storeWeak((id *)&v8->_appPlayer, 0);
  }

  return v8;
}

- (IKAppPlayerBridge)initWithAppContext:(id)a3 jsPlayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)IKAppPlayerBridge;
  v8 = [(IKAppPlayerBridge *)&v28 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_appContext, v6);
    objc_storeWeak((id *)&v9->_jsPlayer, v7);
    v9->_interactiveOverlayDismissable = 1;
    v9->_showsResumeMenu = 1;
    v10 = objc_alloc_init(_IKPlaceholderAppPlayer);
    [(_IKPlaceholderAppPlayer *)v10 setInteractiveOverlayDismissable:v9->_interactiveOverlayDismissable];
    [(_IKPlaceholderAppPlayer *)v10 setShowsResumeMenu:v9->_showsResumeMenu];
    objc_storeStrong((id *)&v9->_placeholderAppPlayer, v10);
    if (v7)
    {
      if (initWithAppContext_jsPlayer__onceToken != -1) {
        dispatch_once(&initWithAppContext_jsPlayer__onceToken, &__block_literal_global_562);
      }
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__8;
      v26 = __Block_byref_object_dispose__8;
      id v27 = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&v9->_appContext);
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __49__IKAppPlayerBridge_initWithAppContext_jsPlayer___block_invoke_564;
      v17 = &unk_1E6DE4678;
      v21 = &v22;
      id v18 = v6;
      v12 = v9;
      v19 = v12;
      v20 = v10;
      [WeakRetained evaluateDelegateBlockSync:&v14];

      objc_msgSend((id)_globalAppPlayers, "addObject:", v23[5], v14, v15, v16, v17);
      objc_storeWeak(v12 + 6, (id)v23[5]);

      _Block_object_dispose(&v22, 8);
    }
  }
  return v9;
}

uint64_t __49__IKAppPlayerBridge_initWithAppContext_jsPlayer___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
  uint64_t v1 = _globalAppPlayers;
  _globalAppPlayers = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __49__IKAppPlayerBridge_initWithAppContext_jsPlayer___block_invoke_564(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = [v2 objectForPlayer:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  return [v6 transferValuesToAppPlayer:v7];
}

- (void)cleanup
{
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:&__block_literal_global_568];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPlayer);
  if (WeakRetained)
  {
  }
  else if (!self->_placeholderAppPlayer)
  {
    return;
  }
  id v4 = objc_loadWeakRetained((id *)&self->_appPlayer);
  id v5 = self->_placeholderAppPlayer;
  id v6 = objc_loadWeakRetained((id *)&self->_appPlayer);

  if (v6)
  {
    uint64_t v7 = (void *)_globalAppPlayers;
    id v8 = objc_loadWeakRetained((id *)&self->_appPlayer);
    [v7 removeObject:v8];
  }
  objc_storeWeak((id *)&self->_appPlayer, 0);
  placeholderAppPlayer = self->_placeholderAppPlayer;
  self->_placeholderAppPlayer = 0;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__IKAppPlayerBridge_cleanup__block_invoke_2;
  v10[3] = &__block_descriptor_48_e5_v8__0l;
  v10[4] = v4;
  v10[5] = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __28__IKAppPlayerBridge_cleanup__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 appPlayer];
  [v3 cleanup];
}

void __28__IKAppPlayerBridge_cleanup__block_invoke_2(uint64_t a1)
{
  v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
  id v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)play
{
}

void __25__IKAppPlayerBridge_play__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 appPlayer];
  [v3 play];
}

- (void)present
{
}

void __28__IKAppPlayerBridge_present__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 appPlayer];
  [v3 present];
}

- (void)pause
{
}

void __26__IKAppPlayerBridge_pause__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 appPlayer];
  [v3 pause];
}

- (void)stop
{
}

void __25__IKAppPlayerBridge_stop__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 appPlayer];
  [v3 stop];
}

- (void)next
{
}

void __25__IKAppPlayerBridge_next__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 appPlayer];
  [v3 next];
}

- (void)previous
{
}

void __29__IKAppPlayerBridge_previous__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 appPlayer];
  [v3 previous];
}

- (void)changeToMediaAtIndex:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__IKAppPlayerBridge_changeToMediaAtIndex___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  v3[4] = a3;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v3];
}

void __42__IKAppPlayerBridge_changeToMediaAtIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appPlayer];
  [v4 changeToMediaAtIndex:*(void *)(a1 + 32)];
}

- (void)scan:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__IKAppPlayerBridge_scan___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  *(double *)&v3[4] = a3;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v3];
}

void __26__IKAppPlayerBridge_scan___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appPlayer];
  [v4 scan:*(double *)(a1 + 32)];
}

- (void)setPlaylist:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_playlist, a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__IKAppPlayerBridge_setPlaylist___block_invoke;
  v7[3] = &unk_1E6DE4700;
  id v8 = v5;
  id v6 = v5;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v7];
}

void __33__IKAppPlayerBridge_setPlaylist___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a3[1];
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 appPlaylist];
  [v4 setPlaylist:v7];

  id v9 = [v6 appPlayer];

  id v8 = [*(id *)(a1 + 32) appPlaylist];
  [v9 setPlaylist:v8];
}

- (void)setElapsedTime:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__IKAppPlayerBridge_setElapsedTime___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  *(double *)&v3[4] = a3;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v3];
}

void __36__IKAppPlayerBridge_setElapsedTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appPlayer];
  [v4 setElapsedTime:*(double *)(a1 + 32)];
}

- (void)setOverlayDocument:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_overlayDocument, a3);
  if (v5)
  {
    id v6 = [IKAppDocument alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
    id v8 = objc_loadWeakRetained((id *)&self->_jsPlayer);
    id v9 = [(IKAppDocument *)v6 initWithAppContext:WeakRetained document:v5 owner:v8];
  }
  else
  {
    id v9 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__IKAppPlayerBridge_setOverlayDocument___block_invoke;
  v11[3] = &unk_1E6DE4700;
  v12 = v9;
  v10 = v9;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v11];
}

void __40__IKAppPlayerBridge_setOverlayDocument___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a3[1];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  [v4 setOverlayDocument:v5];
  id v7 = [v6 appPlayer];

  [v7 setOverlayDocument:*(void *)(a1 + 32)];
}

- (void)setInteractiveOverlayDismissable:(BOOL)a3
{
  self->_interactiveOverlayDismissable = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__IKAppPlayerBridge_setInteractiveOverlayDismissable___block_invoke;
  v3[3] = &__block_descriptor_33_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  BOOL v4 = a3;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v3];
}

void __54__IKAppPlayerBridge_setInteractiveOverlayDismissable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = (void *)a3[1];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 32);
  id v6 = a3;
  [v4 setInteractiveOverlayDismissable:v5];
  id v7 = [v6 appPlayer];

  [v7 setInteractiveOverlayDismissable:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setInteractiveOverlayDocument:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_interactiveOverlayDocument, a3);
  if (v5)
  {
    id v6 = [IKAppDocument alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
    id v8 = objc_loadWeakRetained((id *)&self->_jsPlayer);
    id v9 = [(IKAppDocument *)v6 initWithAppContext:WeakRetained document:v5 owner:v8];
  }
  else
  {
    id v9 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__IKAppPlayerBridge_setInteractiveOverlayDocument___block_invoke;
  v11[3] = &unk_1E6DE4700;
  v12 = v9;
  v10 = v9;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v11];
}

void __51__IKAppPlayerBridge_setInteractiveOverlayDocument___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = (void *)a3[1];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  [v4 setInteractiveOverlayDocument:v5];
  id v7 = [v6 appPlayer];

  [v7 setInteractiveOverlayDocument:*(void *)(a1 + 32)];
}

- (int64_t)state
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__IKAppPlayerBridge_state__block_invoke;
  v4[3] = &unk_1E6DE4748;
  v4[4] = &v5;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __26__IKAppPlayerBridge_state__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appPlayer];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 state];
}

- (NSDate)currentMediaItemDate
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__8;
  id v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__IKAppPlayerBridge_currentMediaItemDate__block_invoke;
  v4[3] = &unk_1E6DE4748;
  v4[4] = &v5;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

void __41__IKAppPlayerBridge_currentMediaItemDate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appPlayer];
  uint64_t v4 = [v7 currentMediaItemDate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (NSNumber)currentMediaItemDuration
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__8;
  id v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__IKAppPlayerBridge_currentMediaItemDuration__block_invoke;
  v4[3] = &unk_1E6DE4748;
  v4[4] = &v5;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __45__IKAppPlayerBridge_currentMediaItemDuration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appPlayer];
  uint64_t v4 = [v7 currentMediaItemDuration];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (IKAppMediaItemBridge)currentMediaItem
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__8;
  id v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__IKAppPlayerBridge_currentMediaItem__block_invoke;
  v4[3] = &unk_1E6DE4748;
  v4[4] = &v5;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = [(id)v6[5] bridge];
  _Block_object_dispose(&v5, 8);

  return (IKAppMediaItemBridge *)v2;
}

void __37__IKAppPlayerBridge_currentMediaItem__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appPlayer];
  uint64_t v4 = [v7 currentMediaItem];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (IKAppMediaItemBridge)nextMediaItem
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__8;
  id v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__IKAppPlayerBridge_nextMediaItem__block_invoke;
  v4[3] = &unk_1E6DE4748;
  v4[4] = &v5;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = [(id)v6[5] bridge];
  _Block_object_dispose(&v5, 8);

  return (IKAppMediaItemBridge *)v2;
}

void __34__IKAppPlayerBridge_nextMediaItem__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appPlayer];
  uint64_t v4 = [v7 nextMediaItem];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (IKAppMediaItemBridge)previousMediaItem
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__8;
  id v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__IKAppPlayerBridge_previousMediaItem__block_invoke;
  v4[3] = &unk_1E6DE4748;
  v4[4] = &v5;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = [(id)v6[5] bridge];
  _Block_object_dispose(&v5, 8);

  return (IKAppMediaItemBridge *)v2;
}

void __38__IKAppPlayerBridge_previousMediaItem__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appPlayer];
  uint64_t v4 = [v7 previousMediaItem];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (double)scanRate
{
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__IKAppPlayerBridge_scanRate__block_invoke;
  v4[3] = &unk_1E6DE4748;
  v4[4] = &v5;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__IKAppPlayerBridge_scanRate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 appPlayer];
  [v5 scanRate];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

- (NSArray)currentMediaItemAccessLogs
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__8;
  id v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__IKAppPlayerBridge_currentMediaItemAccessLogs__block_invoke;
  v4[3] = &unk_1E6DE4748;
  v4[4] = &v5;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __47__IKAppPlayerBridge_currentMediaItemAccessLogs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appPlayer];
  uint64_t v4 = [v7 currentMediaItemAccessLogs];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (NSArray)currentMediaItemErrorLogs
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__8;
  id v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__IKAppPlayerBridge_currentMediaItemErrorLogs__block_invoke;
  v4[3] = &unk_1E6DE4748;
  v4[4] = &v5;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __46__IKAppPlayerBridge_currentMediaItemErrorLogs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appPlayer];
  uint64_t v4 = [v7 currentMediaItemErrorLogs];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setShowsResumeMenu:(BOOL)a3
{
  self->_showsResumeMenu = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__IKAppPlayerBridge_setShowsResumeMenu___block_invoke;
  v3[3] = &__block_descriptor_33_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  BOOL v4 = a3;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v3];
}

void __40__IKAppPlayerBridge_setShowsResumeMenu___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = (void *)a3[1];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 32);
  id v6 = a3;
  [v4 setShowsResumeMenu:v5];
  id v7 = [v6 appPlayer];

  [v7 setShowsResumeMenu:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__IKAppPlayerBridge_setMuted___block_invoke;
  v3[3] = &__block_descriptor_33_e44_v24__0__IKAppContext_8__IKAppPlayerBridge_16l;
  BOOL v4 = a3;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v3];
}

void __30__IKAppPlayerBridge_setMuted___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = (void *)a3[1];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 32);
  id v6 = a3;
  [v4 setMuted:v5];
  id v7 = [v6 appPlayer];

  [v7 setMuted:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setContextMenuData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSDictionary *)[v4 copy];
  contextMenuData = self->_contextMenuData;
  self->_contextMenuData = v5;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__IKAppPlayerBridge_setContextMenuData___block_invoke;
  v8[3] = &unk_1E6DE4700;
  id v9 = v4;
  id v7 = v4;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v8];
}

void __40__IKAppPlayerBridge_setContextMenuData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a3[1];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  [v4 setContextMenuData:v5];
  id v7 = [v6 appPlayer];

  [v7 setContextMenuData:*(void *)(a1 + 32)];
}

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSDictionary *)[v4 copy];
  userInfo = self->_userInfo;
  self->_userInfo = v5;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__IKAppPlayerBridge_setUserInfo___block_invoke;
  v8[3] = &unk_1E6DE4700;
  id v9 = v4;
  id v7 = v4;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v8];
}

void __33__IKAppPlayerBridge_setUserInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a3[1];
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)[v5 copy];
  [v4 setUserInfo:v7];

  id v9 = [v6 appPlayer];

  uint64_t v8 = (void *)[*(id *)(a1 + 32) copy];
  [v9 setUserInfo:v8];
}

- (void)startObservingEvent:(id)a3 extraInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__IKAppPlayerBridge_startObservingEvent_extraInfo___block_invoke;
  v10[3] = &unk_1E6DE4770;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v10];
}

void __51__IKAppPlayerBridge_startObservingEvent_extraInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a3[1];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  [v4 startObservingEvent:v5 extraInfo:v6];
  id v8 = [v7 appPlayer];

  [v8 startObservingEvent:*(void *)(a1 + 32) extraInfo:*(void *)(a1 + 40)];
}

- (void)stopObservingEvent:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__IKAppPlayerBridge_stopObservingEvent___block_invoke;
  v6[3] = &unk_1E6DE4700;
  id v7 = v4;
  id v5 = v4;
  [(IKAppPlayerBridge *)self _evaluateDelegateBlockSync:v6];
}

void __40__IKAppPlayerBridge_stopObservingEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a3[1];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = a3;
  [v4 stopObservingEvent:v5];
  id v7 = [v6 appPlayer];

  [v7 stopObservingEvent:*(void *)(a1 + 32)];
}

- (void)dispatchEvent:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  id v11 = [(IKAppPlayerBridge *)self appContext];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__IKAppPlayerBridge_dispatchEvent_userInfo_completion___block_invoke;
  v18[3] = &unk_1E6DE4798;
  v21 = v22;
  v18[4] = self;
  id v12 = v8;
  id v19 = v12;
  id v13 = v9;
  id v20 = v13;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__IKAppPlayerBridge_dispatchEvent_userInfo_completion___block_invoke_2;
  v15[3] = &unk_1E6DE47C0;
  id v14 = v10;
  id v16 = v14;
  v17 = v22;
  [v11 evaluate:v18 completionBlock:v15];

  _Block_object_dispose(v22, 8);
}

void __55__IKAppPlayerBridge_dispatchEvent_userInfo_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) jsPlayer];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 dispatchEvent:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48)];
}

uint64_t __55__IKAppPlayerBridge_dispatchEvent_userInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_evaluateDelegateBlockSync:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(IKAppPlayerBridge *)self appContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__IKAppPlayerBridge__evaluateDelegateBlockSync___block_invoke;
  v7[3] = &unk_1E6DE47E8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 evaluateDelegateBlockSync:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__IKAppPlayerBridge__evaluateDelegateBlockSync___block_invoke(uint64_t a1, void *a2)
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

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppPlaylistBridge)playlist
{
  return self->_playlist;
}

- (IKAppPlayer)appPlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPlayer);
  return (IKAppPlayer *)WeakRetained;
}

- (IKJSPlayer)jsPlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_jsPlayer);
  return (IKJSPlayer *)WeakRetained;
}

- (void)setJsPlayer:(id)a3
{
}

- (IKDOMDocument)overlayDocument
{
  return self->_overlayDocument;
}

- (IKDOMDocument)interactiveOverlayDocument
{
  return self->_interactiveOverlayDocument;
}

- (BOOL)interactiveOverlayDismissable
{
  return self->_interactiveOverlayDismissable;
}

- (BOOL)muted
{
  return self->_muted;
}

- (NSDictionary)contextMenuData
{
  return self->_contextMenuData;
}

- (BOOL)showsResumeMenu
{
  return self->_showsResumeMenu;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_contextMenuData, 0);
  objc_storeStrong((id *)&self->_interactiveOverlayDocument, 0);
  objc_storeStrong((id *)&self->_overlayDocument, 0);
  objc_destroyWeak((id *)&self->_jsPlayer);
  objc_destroyWeak((id *)&self->_appPlayer);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_placeholderAppPlayer, 0);
}

@end