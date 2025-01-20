@interface AVPlayerCaptionLayer
+ (id)captionLayerWithPlayer:(id)a3;
- (AVPlayer)player;
- (AVPlayerCaptionLayer)init;
- (BOOL)_showInterstitialInstead;
- (BOOL)isOverscanSubtitleSupportEnabled;
- (NSEdgeInsets)captionContentInsets;
- (id)_closedCaptionLayer;
- (id)_interstitialLayer;
- (id)_subtitleLayer;
- (void)_setShowInterstitialInstead:(BOOL)a3;
- (void)_startObservingPlayer:(id)a3;
- (void)_stopObservingPlayer:(id)a3;
- (void)dealloc;
- (void)layoutSublayers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBounds:(CGRect)a3;
- (void)setCaptionContentInsets:(NSEdgeInsets)a3;
- (void)setOverscanSubtitleSupportEnabled:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation AVPlayerCaptionLayer

+ (id)captionLayerWithPlayer:(id)a3
{
  v4 = objc_alloc_init(AVPlayerCaptionLayer);
  [(AVPlayerCaptionLayer *)v4 setPlayer:a3];
  return v4;
}

- (AVPlayerCaptionLayer)init
{
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerCaptionLayer;
  v2 = [(AVPlayerCaptionLayer *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F31B10]);
    *((void *)v2 + 4) = v3;
    [v2 addSublayer:v3];
    [*((id *)v2 + 4) setEdgeAntialiasingMask:0];
    v4 = objc_alloc_init(AVPlayerLayerIntermediateLayer);
    *((void *)v2 + 5) = v4;
    [v2 addSublayer:v4];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F28250] + 16);
    *(_OWORD *)(v2 + 104) = *MEMORY[0x1E4F28250];
    *(_OWORD *)(v2 + 120) = v5;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((void *)v2 + 6) = dispatch_queue_create("AVPlayerCaptionLayerQueue", v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((void *)v2 + 7) = dispatch_queue_create("com.apple.avfoundation.playercaptionlayer.configuration", v7);
    *((void *)v2 + 12) = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  return (AVPlayerCaptionLayer *)v2;
}

- (void)layoutSublayers
{
  [(AVPlayerCaptionLayer *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3052000000;
  v15[3] = __Block_byref_object_copy__29;
  v15[4] = __Block_byref_object_dispose__29;
  v15[5] = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AVPlayerCaptionLayer_layoutSublayers__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = v15;
  dispatch_sync(serialQueue, block);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__AVPlayerCaptionLayer_layoutSublayers__block_invoke_2;
  v13[3] = &unk_1E57B6610;
  v13[6] = v4;
  v13[7] = v6;
  v13[8] = v8;
  v13[9] = v10;
  v13[4] = self;
  v13[5] = v15;
  AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v13);
  [[(AVPlayerCaptionLayer *)self player] _updateClosedCaptionLayerBounds:self->_closedCaptionLayer videoRelativeToViewport:0 captionsAvoidanceMargins:&self->_legibleContentInsets];
  v12.receiver = self;
  v12.super_class = (Class)AVPlayerCaptionLayer;
  [(AVPlayerCaptionLayer *)&v12 layoutSublayers];
  _Block_object_dispose(v15, 8);
}

id __39__AVPlayerCaptionLayer_layoutSublayers__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 72);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __39__AVPlayerCaptionLayer_layoutSublayers__block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setViewport:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  double MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
  objc_msgSend(v2, "setPosition:", MidX, CGRectGetMidY(*(CGRect *)(a1 + 48)));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(AVPlayerCaptionLayer *)self bounds];
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerCaptionLayer;
    -[AVPlayerCaptionLayer setBounds:](&v8, sel_setBounds_, x, y, width, height);
    [(AVPlayerCaptionLayer *)self setNeedsLayout];
  }
}

- (void)dealloc
{
  if (self->_playerBeingObserved) {
    -[AVPlayerCaptionLayer _stopObservingPlayer:](self, "_stopObservingPlayer:");
  }

  [(AVPlayer *)self->_player _removePlayerCaptionLayer:self];
  serialQueue = self->_serialQueue;
  if (serialQueue) {
    dispatch_release(serialQueue);
  }
  configurationQueue = self->_configurationQueue;
  if (configurationQueue) {
    dispatch_release(configurationQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerCaptionLayer;
  [(AVPlayerCaptionLayer *)&v5 dealloc];
}

- (void)setPlayer:(id)a3
{
  player = self->_player;
  if (player != a3)
  {
    [(AVPlayer *)player _removePlayerCaptionLayer:self];
    serialQueue = self->_serialQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __34__AVPlayerCaptionLayer_setPlayer___block_invoke;
    v8[3] = &unk_1E57B2098;
    v8[4] = self;
    v8[5] = a3;
    dispatch_sync(serialQueue, v8);
    uint64_t v7 = self->_player;
    if (v7) {
      [(AVPlayer *)v7 _addPlayerCaptionLayer:self];
    }
  }
}

void __34__AVPlayerCaptionLayer_setPlayer___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);

  *(void *)(*(void *)(a1 + 32) + 64) = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 64);
  objc_super v5 = *(NSObject **)(v3 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AVPlayerCaptionLayer_setPlayer___block_invoke_2;
  block[3] = &unk_1E57B2138;
  block[4] = v3;
  block[5] = v2;
  void block[6] = v4;
  dispatch_async(v5, block);
}

uint64_t __34__AVPlayerCaptionLayer_setPlayer___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopObservingPlayer:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _startObservingPlayer:v3];
}

- (AVPlayer)player
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  CGRect v9 = __Block_byref_object_copy__29;
  CGRect v10 = __Block_byref_object_dispose__29;
  uint64_t v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerCaptionLayer_player__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  uint64_t v3 = (AVPlayer *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__AVPlayerCaptionLayer_player__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 64);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_startObservingPlayer:(id)a3
{
  if (self->_player)
  {
    if (!self->_playerBeingObserved)
    {
      self->_playerBeingObserved = (AVPlayer *)a3;
      id v5 = +[AVKVODispatcher sharedKVODispatcher];
      uint64_t v6 = (void *)[MEMORY[0x1E4F1CA80] set];
      [v6 addObject:objc_msgSend(v5, "startObservingObject:weakObserver:forTwoPartKeyPath:options:context:", a3, self, AVTwoPartKeyPathMake(@"currentItem", @"nonForcedSubtitleDisplayEnabled"), 5, AVPlayerLayerPlayerItemSubtitleDisplayEnabledObserverContext)];
      objc_msgSend(v6, "addObject:", objc_msgSend(v5, "startObservingObject:weakObserver:forKeyPath:options:context:", a3, self, @"isDisplayingClosedCaptions", 5, AVPlayerLayerDisplayingClosedCaptionsChangedObserverContext));

      self->_KVOInvokers = (NSSet *)[v6 copy];
    }
  }
}

- (void)_stopObservingPlayer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    playerBeingObserved = self->_playerBeingObserved;
    if (playerBeingObserved)
    {

      self->_playerBeingObserved = 0;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      KVOInvokers = self->_KVOInvokers;
      uint64_t v6 = [(NSSet *)KVOInvokers countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(KVOInvokers);
            }
            [*(id *)(*((void *)&v10 + 1) + 8 * i) cancelCallbacks];
          }
          uint64_t v7 = [(NSSet *)KVOInvokers countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }

      self->_KVOInvokers = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
  }
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  if (([a4 isEqualToString:@"separatedOptions"] & 1) != 0
    || [a4 isEqualToString:@"styleOptions"])
  {
    configurationQueue = self->_configurationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__AVPlayerCaptionLayer_setValue_forKeyPath___block_invoke;
    v9[3] = &unk_1E57B2138;
    v9[4] = self;
    v9[5] = a3;
    v9[6] = a4;
    AVSerializeOnQueueAsyncIfNecessary(configurationQueue, v9);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerCaptionLayer;
    [(AVPlayerCaptionLayer *)&v8 setValue:a3 forKeyPath:a4];
  }
}

uint64_t __44__AVPlayerCaptionLayer_setValue_forKeyPath___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 32) setCaptionRendererOutputOptions:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48)];
  v4[0] = *MEMORY[0x1E4F33EE8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2) {
    uint64_t v2 = [MEMORY[0x1E4F1CA98] null];
  }
  v4[1] = *MEMORY[0x1E4F33ED8];
  v5[0] = v2;
  v5[1] = *(void *)(a1 + 48);
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "player"), "_setOptions:onClosedCaptionLayer:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v5, v4, 2), *(void *)(*(void *)(a1 + 32) + 40));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVPlayerLayerPlayerItemSubtitleDisplayEnabledObserverContext == a6)
  {
    uint64_t v8 = [a5 objectForKey:*MEMORY[0x1E4F284C8]];
    if (v8)
    {
      CGRect v9 = (void *)v8;
      if (v8 != [MEMORY[0x1E4F1CA98] null])
      {
        char v10 = [v9 BOOLValue];
        configurationQueue = self->_configurationQueue;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v19[3] = &unk_1E57B20C0;
        v19[4] = self;
        v19[5] = a4;
        char v20 = v10;
        long long v12 = v19;
LABEL_10:
        AVSerializeOnQueueAsyncIfNecessary(configurationQueue, v12);
      }
    }
  }
  else
  {
    if ((void *)AVPlayerLayerDisplayingClosedCaptionsChangedObserverContext != a6)
    {
      v16.receiver = self;
      v16.super_class = (Class)AVPlayerCaptionLayer;
      -[AVPlayerCaptionLayer observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
      return;
    }
    uint64_t v13 = [a5 objectForKey:*MEMORY[0x1E4F284C8]];
    if (v13)
    {
      v14 = (void *)v13;
      if (v13 != [MEMORY[0x1E4F1CA98] null])
      {
        char v15 = [v14 BOOLValue];
        configurationQueue = self->_configurationQueue;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v17[3] = &unk_1E57B20C0;
        v17[4] = self;
        v17[5] = a4;
        char v18 = v15;
        long long v12 = v17;
        goto LABEL_10;
      }
    }
  }
}

uint64_t __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(result + 40) == *(void *)(v1 + 88))
  {
    uint64_t v2 = *(void **)(v1 + 32);
    if (v2) {
      return [v2 updateNonForcedSubtitleDisplayEnabled:*(unsigned __int8 *)(result + 48)];
    }
  }
  return result;
}

void __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) == *(void *)(v1 + 88))
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    v2[3] = &unk_1E57B20E8;
    v2[4] = v1;
    char v3 = *(unsigned char *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }
}

uint64_t __71__AVPlayerCaptionLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 40)) {
    return [*(id *)(*(void *)(result + 32) + 40) setHidden:*(unsigned char *)(result + 40) == 0];
  }
  return result;
}

- (void)setCaptionContentInsets:(NSEdgeInsets)a3
{
  *(CGFloat *)&long long v11 = a3.top;
  *((void *)&v11 + 1) = *(void *)&a3.left;
  *(CGFloat *)&long long v12 = a3.bottom;
  *((void *)&v12 + 1) = *(void *)&a3.right;
  long long v4 = v12;
  *(_OWORD *)&self->_legibleContentInsets.top = v11;
  *(_OWORD *)&self->_legibleContentInsets.bottom = v4;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  FigGeometryDimensionMake();
  FigGeometryDimensionMake();
  FigGeometryDimensionMake();
  FigGeometryDimensionMake();
  FigGeometryMarginsMake();
  subtitleLayer = self->_subtitleLayer;
  if (subtitleLayer)
  {
    v6[0] = v7;
    v6[1] = v8;
    v6[2] = v9;
    v6[3] = v10;
    [(FigSubtitleCALayer *)subtitleLayer setCaptionsAvoidanceMargins:v6];
  }
  [[(AVPlayerCaptionLayer *)self player] _updateClosedCaptionLayerBounds:self->_closedCaptionLayer videoRelativeToViewport:0 captionsAvoidanceMargins:&v11];
}

- (NSEdgeInsets)captionContentInsets
{
  double top = self->_legibleContentInsets.top;
  double left = self->_legibleContentInsets.left;
  double bottom = self->_legibleContentInsets.bottom;
  double right = self->_legibleContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setOverscanSubtitleSupportEnabled:(BOOL)a3
{
}

- (BOOL)isOverscanSubtitleSupportEnabled
{
  return [(FigSubtitleCALayer *)self->_subtitleLayer isOverscanSubtitleSupportEnabled];
}

- (id)_closedCaptionLayer
{
  return self->_closedCaptionLayer;
}

- (id)_subtitleLayer
{
  return self->_subtitleLayer;
}

- (id)_interstitialLayer
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__29;
  char v18 = __Block_byref_object_dispose__29;
  uint64_t v19 = 0;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerCaptionLayer__interstitialLayer__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(serialQueue, block);
  if (!v15[5])
  {
    long long v4 = objc_alloc_init(AVPlayerCaptionLayer);
    [(AVPlayerCaptionLayer *)self bounds];
    -[AVPlayerCaptionLayer setFrame:](v4, "setFrame:");
    [(AVPlayerCaptionLayer *)v4 setHidden:1];
    id v5 = self->_serialQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__AVPlayerCaptionLayer__interstitialLayer__block_invoke_2;
    v8[3] = &unk_1E57B2188;
    v8[4] = self;
    v8[5] = v4;
    void v8[6] = &v14;
    v8[7] = &v10;
    dispatch_sync(v5, v8);
    [(AVPlayerCaptionLayer *)self addSublayer:v4];
    if (*((unsigned char *)v11 + 24)) {
      [(AVPlayerCaptionLayer *)self _setShowInterstitialInstead:1];
    }
  }
  id v6 = (id)v15[5];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

id __42__AVPlayerCaptionLayer__interstitialLayer__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 72);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __42__AVPlayerCaptionLayer__interstitialLayer__block_invoke_2(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 72) = result;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 80))
  {
    *(unsigned char *)(v3 + 80) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)_showInterstitialInstead
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerCaptionLayer__showInterstitialInstead__block_invoke;
  void v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayerCaptionLayer__showInterstitialInstead__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)_setShowInterstitialInstead:(BOOL)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3052000000;
  char v13 = __Block_byref_object_copy__29;
  serialQueue = self->_serialQueue;
  uint64_t v14 = __Block_byref_object_dispose__29;
  uint64_t v15 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVPlayerCaptionLayer__setShowInterstitialInstead___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(serialQueue, block);
  if (v11[5])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__AVPlayerCaptionLayer__setShowInterstitialInstead___block_invoke_2;
    v6[3] = &unk_1E57B3A18;
    BOOL v7 = a3;
    _OWORD v6[4] = self;
    v6[5] = &v10;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v6);
  }
  _Block_object_dispose(&v10, 8);
}

id __52__AVPlayerCaptionLayer__setShowInterstitialInstead___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = *(unsigned char *)(a1 + 48);
  id result = *(id *)(*(void *)(a1 + 32) + 72);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __52__AVPlayerCaptionLayer__setShowInterstitialInstead___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"videoRect"];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(*(void *)(a1 + 32) + 32) setHidden:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 40) setHidden:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setHidden:*(unsigned char *)(a1 + 48) == 0];
  [*(id *)(a1 + 32) setNeedsLayout];
  [MEMORY[0x1E4F39CF8] commit];
  [*(id *)(a1 + 32) didChangeValueForKey:@"videoRect"];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

@end