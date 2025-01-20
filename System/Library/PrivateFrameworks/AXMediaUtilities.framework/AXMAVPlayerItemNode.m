@interface AXMAVPlayerItemNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AVPlayerItem)targetPlayerItem;
- (AXMVisionAnalysisOptions)analysisOptions;
- (BOOL)isTriggeringLegibilityEvents;
- (id)axmDescription;
- (void)_mainQueue_endAutoTriggerOfLegibilityEvents;
- (void)autoTriggerLegibilityEventsWithAVPlayerItem:(id)a3;
- (void)endAutoTriggerOfLegibilityEvents;
- (void)legibleOutput:(id)a3 didOutputAttributedStrings:(id)a4 nativeSampleBuffers:(id)a5 forItemTime:(id *)a6;
- (void)nodeInitialize;
- (void)setAnalysisOptions:(id)a3;
- (void)setShouldProcessRemotely:(BOOL)a3;
- (void)setTargetPlayerItem:(id)a3;
@end

@implementation AXMAVPlayerItemNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return @"AVPlayerItem";
}

- (void)setShouldProcessRemotely:(BOOL)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    [v3 raise:v4 format:@"AXMAVPlayerItemNode does not support remote triggering"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMAVPlayerItemNode;
    -[AXMSourceNode setShouldProcessRemotely:](&v5, sel_setShouldProcessRemotely_);
  }
}

- (void)nodeInitialize
{
  v6.receiver = self;
  v6.super_class = (Class)AXMAVPlayerItemNode;
  [(AXMSourceNode *)&v6 nodeInitialize];
  v3 = (OS_dispatch_queue *)dispatch_queue_create("AXMAVPlayerItemNode-avkit-queue", 0);
  avkit_queue = self->_avkit_queue;
  self->_avkit_queue = v3;

  objc_super v5 = +[AXMVisionAnalysisOptions defaultOptions];
  [(AXMAVPlayerItemNode *)self setAnalysisOptions:v5];
}

- (void)autoTriggerLegibilityEventsWithAVPlayerItem:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__AXMAVPlayerItemNode_autoTriggerLegibilityEventsWithAVPlayerItem___block_invoke;
  v6[3] = &unk_1E6116F08;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __67__AXMAVPlayerItemNode_autoTriggerLegibilityEventsWithAVPlayerItem___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v1 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    v3 = AXMediaLogCaptionDescriptions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *v1;
      int v13 = 138412290;
      uint64_t v14 = v4;
      _os_log_impl(&dword_1B57D5000, v3, OS_LOG_TYPE_DEFAULT, "Will begin processing legibility events with player item: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_super v6 = *(void **)(a1 + 40);
    id v5 = (id *)(a1 + 40);
    id v7 = [v6 targetPlayerItem];

    if (v7)
    {
      v8 = [*v5 targetPlayerItem];
      v9 = (void *)*v1;

      v10 = AXMediaLogCaptionDescriptions();
      v11 = (_AXMPlayerItemLegibleOutput *)v10;
      if (v8 == v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *v1;
          int v13 = 138412290;
          uint64_t v14 = v12;
          _os_log_impl(&dword_1B57D5000, &v11->super.super.super, OS_LOG_TYPE_DEFAULT, "Asked to auto-trigger events with item: '%@', but same targetPalyerItem was already set!", (uint8_t *)&v13, 0xCu);
        }
        goto LABEL_10;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __67__AXMAVPlayerItemNode_autoTriggerLegibilityEventsWithAVPlayerItem___block_invoke_cold_1(v1, v5, &v11->super.super.super);
      }

      objc_msgSend(*v5, "_mainQueue_endAutoTriggerOfLegibilityEvents");
    }
    v11 = objc_alloc_init(_AXMPlayerItemLegibleOutput);
    [(AVPlayerItemLegibleOutput *)v11 setDelegate:*v5 queue:*((void *)*v5 + 7)];
    [(id)*v1 addOutput:v11];
    [*v5 setTargetPlayerItem:*v1];
LABEL_10:
  }
}

- (void)_mainQueue_endAutoTriggerOfLegibilityEvents
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(AXMAVPlayerItemNode *)self targetPlayerItem];
  uint64_t v4 = AXMediaLogCaptionDescriptions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v3;
    _os_log_impl(&dword_1B57D5000, v4, OS_LOG_TYPE_DEFAULT, "Will stop processing legibility events for player item: %@", buf, 0xCu);
  }

  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  objc_super v6 = [v3 outputs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v5 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v3, "removeOutput:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  [(AXMAVPlayerItemNode *)self setTargetPlayerItem:0];
  self->_triggeringLegibilityEvents = 0;
}

- (void)endAutoTriggerOfLegibilityEvents
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AXMAVPlayerItemNode_endAutoTriggerOfLegibilityEvents__block_invoke;
  block[3] = &unk_1E6117090;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__AXMAVPlayerItemNode_endAutoTriggerOfLegibilityEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_endAutoTriggerOfLegibilityEvents");
}

- (id)axmDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AXMAVPlayerItemNode;
  uint64_t v4 = [(AXMVisionEngineNode *)&v8 axmDescription];
  id v5 = [(AXMAVPlayerItemNode *)self targetPlayerItem];
  objc_super v6 = [v3 stringWithFormat:@"%@ playerItem:<%@>", v4, v5];

  return v6;
}

- (void)legibleOutput:(id)a3 didOutputAttributedStrings:(id)a4 nativeSampleBuffers:(id)a5 forItemTime:(id *)a6
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  objc_super v8 = AXMediaLogCaptionDescriptions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AXMAVPlayerItemNode legibleOutput:didOutputAttributedStrings:nativeSampleBuffers:forItemTime:]((uint64_t)v7, v8);
  }

  self->_triggeringLegibilityEvents = 1;
  if ([v7 count])
  {
    v25[0] = @"sourceProvidesResults";
    v25[1] = @"diagnosticsEnabled";
    v26[0] = MEMORY[0x1E4F1CC38];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
    v26[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    uint64_t v11 = [(AXMAVPlayerItemNode *)self analysisOptions];
    id v12 = +[AXMVisionPipelineContext contextWithSourceParameters:v10 options:v11];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = +[AXMVisionFeature featureWithMediaLegibility:*(void *)(*((void *)&v20 + 1) + 8 * v17)];
          [v12 appendFeature:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    v19.receiver = self;
    v19.super_class = (Class)AXMAVPlayerItemNode;
    [(AXMSourceNode *)&v19 triggerWithContext:v12 cacheKey:0 resultHandler:0];
  }
}

- (BOOL)isTriggeringLegibilityEvents
{
  return self->_triggeringLegibilityEvents;
}

- (AVPlayerItem)targetPlayerItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetPlayerItem);

  return (AVPlayerItem *)WeakRetained;
}

- (void)setTargetPlayerItem:(id)a3
{
}

- (AXMVisionAnalysisOptions)analysisOptions
{
  return self->_analysisOptions;
}

- (void)setAnalysisOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisOptions, 0);
  objc_destroyWeak((id *)&self->_targetPlayerItem);

  objc_storeStrong((id *)&self->_avkit_queue, 0);
}

void __67__AXMAVPlayerItemNode_autoTriggerLegibilityEventsWithAVPlayerItem___block_invoke_cold_1(uint64_t *a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  id v5 = [*a2 targetPlayerItem];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1B57D5000, a3, OS_LOG_TYPE_ERROR, "Asked to auto-trigger events with item: '%@', but targetPalyerItem already exists: '%@'. Unregistering current targetPalyerItem first. ", (uint8_t *)&v6, 0x16u);
}

- (void)legibleOutput:(uint64_t)a1 didOutputAttributedStrings:(NSObject *)a2 nativeSampleBuffers:forItemTime:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "legibility event: %@", (uint8_t *)&v2, 0xCu);
}

@end