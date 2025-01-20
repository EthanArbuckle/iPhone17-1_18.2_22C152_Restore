@interface CUIKORPayloadProvider
+ (CUIKORPayloadProvider)sharedProvider;
+ (NSCache)backgroundImageCache;
- (CUIKORPayloadProvider)init;
- (CUIKORStringGenerator)stringGenerator;
- (NSMutableDictionary)pendingRequests;
- (OS_dispatch_queue)drawingQueue;
- (OS_dispatch_queue)lookupQueue;
- (id)_lookupQueue_activeRequestForId:(int64_t)a3;
- (id)_renderBackgroundImageForState:(id)a3 backgroundColor:(id)a4;
- (id)_renderBackgroundImageWithState:(id)a3;
- (id)_renderColorBlockImageWithState:(id)a3;
- (id)_renderColorBlockImageWithState:(id)a3 backgroundColor:(id)a4 stripeColor:(id)a5 stripedImageAlpha:(double)a6;
- (id)_renderReminderImageWithState:(id)a3;
- (id)_renderSelectedColorBlockImageWithState:(id)a3;
- (id)_renderTextImageWithState:(id)a3 options:(unint64_t)a4;
- (id)_renderUnselectedColorBlockImageWithState:(id)a3;
- (id)_textDrawInfoWithState:(id)a3 options:(unint64_t)a4;
- (int64_t)requestPayloadForState:(id)a3 requestOptions:(unint64_t)a4 resultHandler:(id)a5;
- (void)_lookupQueue_enqueueRequest:(id)a3;
- (void)_lookupQueue_removeRequestId:(int64_t)a3;
- (void)_renderRequestId:(int64_t)a3;
- (void)_scheduleRequestId:(int64_t)a3;
- (void)cancelRequest:(int64_t)a3;
@end

@implementation CUIKORPayloadProvider

- (id)_renderTextImageWithState:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(CUIKORPayloadProvider *)self stringGenerator];
  v8 = [v7 generateContentStringsWithState:v6 options:a4];
  [v6 textSpace];
  double v10 = v9;
  double v12 = v11;
  v13 = [v6 primaryTextFont];
  [v6 languageAwareInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [v6 leadingIcon];
  v23 = [v6 trailingIcons];
  uint64_t v24 = [v6 isReminder];

  v25 = +[CUIKOccurrenceRenderer renderStrings:withSize:font:edgeInsets:leadingIcon:trailingIcons:shouldAutoHideLeadingIcon:](CUIKOccurrenceRenderer, "renderStrings:withSize:font:edgeInsets:leadingIcon:trailingIcons:shouldAutoHideLeadingIcon:", v8, v13, v22, v23, v24, v10, v12, v15, v17, v19, v21);

  return v25;
}

- (CUIKORStringGenerator)stringGenerator
{
  return self->_stringGenerator;
}

+ (CUIKORPayloadProvider)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)sharedProvider_provider;

  return (CUIKORPayloadProvider *)v2;
}

void __42__CUIKORPayloadProvider__renderRequestId___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resultHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

void __44__CUIKORPayloadProvider__scheduleRequestId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _renderRequestId:*(void *)(a1 + 40)];
}

- (int64_t)requestPayloadForState:(id)a3 requestOptions:(unint64_t)a4 resultHandler:(id)a5
{
  int64_t add_explicit = atomic_fetch_add_explicit(&requestPayloadForState_requestOptions_resultHandler__nextRequestId, 1uLL, memory_order_relaxed);
  id v9 = a5;
  id v10 = a3;
  double v11 = [[CUIKORContentImageRequest alloc] initWithId:add_explicit options:a4 state:v10 resultHandler:v9];

  [(CUIKORPayloadProvider *)self _lookupQueue_enqueueRequest:v11];
  if (_bitmaskContainsOption()) {
    [(CUIKORPayloadProvider *)self _renderRequestId:add_explicit];
  }
  else {
    [(CUIKORPayloadProvider *)self _scheduleRequestId:add_explicit];
  }

  return add_explicit;
}

- (void)_renderRequestId:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = -[CUIKORPayloadProvider _lookupQueue_activeRequestForId:](self, "_lookupQueue_activeRequestForId:");
  if (v5)
  {
    [(CUIKORPayloadProvider *)self _lookupQueue_removeRequestId:a3];
    id v6 = [v5 state];
    if ([v6 isValid])
    {
      uint64_t v7 = [v5 options];
      v8 = +[CUIKLogSubsystem signpost];
      id v9 = v8;
      if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BDF08000, v9, OS_SIGNPOST_INTERVAL_BEGIN, a3 + 1, "RenderPayload", "", buf, 2u);
      }

      id v10 = [v6 traitCollection];
      [MEMORY[0x1E4FB1E20] setCurrentTraitCollection:v10];

      if (_bitmaskContainsOption())
      {
        double v11 = [(id)objc_opt_class() backgroundImageCache];
        double v12 = [v11 objectForKey:v6];
        if (!v12)
        {
          double v12 = [(CUIKORPayloadProvider *)self _renderBackgroundImageWithState:v6];
          [v11 setObject:v12 forKey:v6];
        }
      }
      else
      {
        double v12 = 0;
      }
      if (_bitmaskContainsOption())
      {
        v13 = [(CUIKORPayloadProvider *)self _renderTextImageWithState:v6 options:v7];
      }
      else
      {
        v13 = 0;
      }
      if (_bitmaskContainsOption())
      {
        double v14 = [(CUIKORPayloadProvider *)self _renderTravelTimeImageWithState:v6];
        double v15 = [(CUIKORPayloadProvider *)self stringGenerator];
        double v16 = [v15 generateTravelTimeStringWithState:v6];
      }
      else
      {
        double v14 = 0;
        double v16 = 0;
      }
      double v17 = +[CUIKLogSubsystem signpost];
      double v18 = v17;
      if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BDF08000, v18, OS_SIGNPOST_INTERVAL_END, a3 + 1, "RenderPayload", "", buf, 2u);
      }

      double v19 = [[CUIKORContentPayload alloc] initWithRequestId:a3 requestOptions:v7 backgroundImage:v12 textImage:v13 textDrawInfo:0 travelTimeImage:v14 travelTimeString:v16];
      if ((v7 & 0x10) != 0)
      {
        dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
        double v20 = [v5 resultHandler];
        ((void (**)(void, CUIKORContentPayload *))v20)[2](v20, v19);
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __42__CUIKORPayloadProvider__renderRequestId___block_invoke;
        block[3] = &unk_1E6369CC8;
        id v22 = v5;
        v23 = v19;
        dispatch_async(MEMORY[0x1E4F14428], block);

        double v20 = (void (**)(void, void))v22;
      }
    }
    else
    {
      double v12 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(CUIKORPayloadProvider *)(uint64_t)v6 _renderRequestId:v12];
      }
    }
  }
  else
  {
    id v6 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v25 = a3;
      _os_log_impl(&dword_1BDF08000, v6, OS_LOG_TYPE_INFO, "Aborting occurrence render. Could not find request with id <%ld>", buf, 0xCu);
    }
  }
}

- (id)_renderBackgroundImageWithState:(id)a3
{
  id v4 = a3;
  if ([v4 isReminder]) {
    [(CUIKORPayloadProvider *)self _renderReminderImageWithState:v4];
  }
  else {
  v5 = [(CUIKORPayloadProvider *)self _renderColorBlockImageWithState:v4];
  }

  return v5;
}

- (id)_renderColorBlockImageWithState:(id)a3
{
  id v4 = a3;
  if ([v4 isSelected]) {
    [(CUIKORPayloadProvider *)self _renderSelectedColorBlockImageWithState:v4];
  }
  else {
  v5 = [(CUIKORPayloadProvider *)self _renderUnselectedColorBlockImageWithState:v4];
  }

  return v5;
}

- (id)_renderUnselectedColorBlockImageWithState:(id)a3
{
  id v4 = a3;
  v5 = [v4 baseColor];
  uint64_t v6 = [v4 userInterfaceStyle];
  int v7 = [v4 isCancelled];
  int v8 = [v4 isDeclined];
  int v9 = [v4 isTentative];
  if ([v4 needsReply] && (v7 & 1) == 0)
  {
    id v10 = CUIKNeedsReplyBackgroundColor();
    double v11 = CUIKNeedsReplyStripeColor();
    double v12 = self;
    id v13 = v4;
    double v14 = v10;
    double v15 = v11;
LABEL_4:
    double v16 = [(CUIKORPayloadProvider *)v12 _renderColorBlockImageWithState:v13 backgroundColor:v14 stripeColor:v15 stripedImageAlpha:0.6];

    goto LABEL_13;
  }
  if ((v7 | v8) == 1)
  {
    uint64_t v17 = CUIKDeclinedEventBackgroundColor();
  }
  else
  {
    if (v9)
    {
      id v10 = CUIKLightStripeColorForColor(v5);
      if (v6 == 2)
      {
        uint64_t v18 = CUIKColorDarkenedToPercentageWithFinalAlpha(v5, 0.25);

        id v10 = (void *)v18;
      }
      double v11 = CUIKBackgroundColorForCalendarColorWithOpaqueForStyle(v5, 1, v6, 0);
      double v12 = self;
      id v13 = v4;
      double v14 = v11;
      double v15 = v10;
      goto LABEL_4;
    }
    uint64_t v17 = CUIKBackgroundColorForCalendarColorWithOpaqueForStyle(v5, 0, v6, 0);
  }
  id v10 = (void *)v17;
  double v16 = [(CUIKORPayloadProvider *)self _renderBackgroundImageForState:v4 backgroundColor:v17];
LABEL_13:

  return v16;
}

- (id)_renderColorBlockImageWithState:(id)a3 backgroundColor:(id)a4 stripeColor:(id)a5 stripedImageAlpha:(double)a6
{
  id v8 = a5;
  id v9 = a4;
  +[CUIKORImageUtils colorBarThickness];
  double v11 = v10;
  id v12 = v9;
  uint64_t v13 = [v12 CGColor];

  id v14 = v8;
  uint64_t v15 = [v14 CGColor];

  return +[CUIKOccurrenceRenderer renderColorBlockImageWithThickness:v13 backgroundColor:v15 stripeColor:v11 stripedImageAlpha:a6];
}

- (id)_renderBackgroundImageForState:(id)a3 backgroundColor:(id)a4
{
  return [(CUIKORPayloadProvider *)self _renderColorBlockImageWithState:a3 backgroundColor:a4 stripeColor:0 stripedImageAlpha:1.0];
}

- (id)_lookupQueue_activeRequestForId:(int64_t)a3
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__4;
  uint64_t v13 = __Block_byref_object_dispose__4;
  id v14 = 0;
  v5 = [(CUIKORPayloadProvider *)self lookupQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CUIKORPayloadProvider__lookupQueue_activeRequestForId___block_invoke;
  block[3] = &unk_1E636A028;
  void block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_lookupQueue_removeRequestId:(int64_t)a3
{
  v5 = [(CUIKORPayloadProvider *)self lookupQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CUIKORPayloadProvider__lookupQueue_removeRequestId___block_invoke;
  v6[3] = &unk_1E636A050;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)_lookupQueue_enqueueRequest:(id)a3
{
  id v4 = a3;
  v5 = [(CUIKORPayloadProvider *)self lookupQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CUIKORPayloadProvider__lookupQueue_enqueueRequest___block_invoke;
  v7[3] = &unk_1E6369CC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)lookupQueue
{
  return self->_lookupQueue;
}

+ (NSCache)backgroundImageCache
{
  if (backgroundImageCache_onceToken != -1) {
    dispatch_once(&backgroundImageCache_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)backgroundImageCache_cache;

  return (NSCache *)v2;
}

- (void)_scheduleRequestId:(int64_t)a3
{
  objc_initWeak(&location, self);
  v5 = [(CUIKORPayloadProvider *)self drawingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CUIKORPayloadProvider__scheduleRequestId___block_invoke;
  block[3] = &unk_1E636A000;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)drawingQueue
{
  return self->_drawingQueue;
}

void __54__CUIKORPayloadProvider__lookupQueue_removeRequestId___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) pendingRequests];
  v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v3 removeObjectForKey:v2];
}

void __57__CUIKORPayloadProvider__lookupQueue_activeRequestForId___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) pendingRequests];
  v2 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __53__CUIKORPayloadProvider__lookupQueue_enqueueRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) pendingRequests];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "requestId"));
  [v4 setObject:v2 forKeyedSubscript:v3];
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

uint64_t __45__CUIKORPayloadProvider_backgroundImageCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)backgroundImageCache_cache;
  backgroundImageCache_cache = (uint64_t)v0;

  uint64_t v2 = (void *)backgroundImageCache_cache;

  return [v2 setCountLimit:10];
}

void __39__CUIKORPayloadProvider_sharedProvider__block_invoke()
{
  id v0 = objc_alloc_init(CUIKORPayloadProvider);
  v1 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v0;
}

- (CUIKORPayloadProvider)init
{
  v14.receiver = self;
  v14.super_class = (Class)CUIKORPayloadProvider;
  uint64_t v2 = [(CUIKORPayloadProvider *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.calendar-occurrencecontentlookup", 0);
    lookupQueue = v2->_lookupQueue;
    v2->_lookupQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.calendar-occurrencecontentdrawing", v6);
    drawingQueue = v2->_drawingQueue;
    v2->_drawingQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v9;

    uint64_t v11 = objc_alloc_init(CUIKORStringGenerator);
    stringGenerator = v2->_stringGenerator;
    v2->_stringGenerator = v11;
  }
  return v2;
}

- (void)cancelRequest:(int64_t)a3
{
  if (a3 < 0)
  {
    id v4 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CUIKORPayloadProvider cancelRequest:](a3, v4);
    }
  }
  else
  {
    -[CUIKORPayloadProvider _lookupQueue_removeRequestId:](self, "_lookupQueue_removeRequestId:");
  }
}

- (id)_renderReminderImageWithState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 isSelected];
  uint64_t v5 = [v3 reminderStackDepth];
  uint64_t v6 = [v3 userInterfaceStyle];
  uint64_t v7 = [v3 isMiniPreviewInEventDetail];
  uint64_t v8 = [v3 isCompleted];

  return +[CUIKOccurrenceRenderer renderReminderBackgroundSelected:v4 stackDepth:v5 userInterfaceStyle:v6 miniPreview:v7 completed:v8];
}

- (id)_renderSelectedColorBlockImageWithState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 baseColor];
  int v6 = [v4 isCancelled];
  int v7 = [v4 isDeclined];
  int v8 = [v4 isTentative];
  if ([v4 needsReply] && (v6 & 1) == 0)
  {
    uint64_t v9 = CUIKSelectedNeedsReplyBackgroundColor();
    uint64_t v10 = CUIKSelectedNeedsReplyStripeColor();
LABEL_8:
    id v12 = (void *)v10;
    uint64_t v13 = [(CUIKORPayloadProvider *)self _renderColorBlockImageWithState:v4 backgroundColor:v9 stripeColor:v10 stripedImageAlpha:0.9];

    goto LABEL_11;
  }
  if ((v6 | v7) == 1)
  {
    uint64_t v11 = CUIKSelectedDeclinedBackgroundColor();
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = [v5 colorWithAlphaComponent:1.0];
      uint64_t v10 = CUIKSelectedTentativeStripeColor();
      goto LABEL_8;
    }
    uint64_t v11 = [v5 colorWithAlphaComponent:0.9];
  }
  uint64_t v9 = (void *)v11;
  uint64_t v13 = [(CUIKORPayloadProvider *)self _renderBackgroundImageForState:v4 backgroundColor:v11];
LABEL_11:

  return v13;
}

- (id)_textDrawInfoWithState:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  int v7 = [(CUIKORPayloadProvider *)self stringGenerator];
  int v8 = [v7 generateContentStringsWithState:v6 options:a4];
  double v29 = 0.0;
  double v30 = 0.0;
  [v6 textSpace];
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [v6 primaryTextFont];
  [v6 languageAwareInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  id v22 = [v6 leadingIcon];
  v23 = [v6 trailingIcons];
  uint64_t v24 = [v6 isReminder];

  int64_t v25 = +[CUIKOccurrenceRenderer renderingBlockForStrings:withSize:font:edgeInsets:leadingIcon:trailingIcons:outImageSize:shouldAutoHideLeadingIcon:](CUIKOccurrenceRenderer, "renderingBlockForStrings:withSize:font:edgeInsets:leadingIcon:trailingIcons:outImageSize:shouldAutoHideLeadingIcon:", v8, v13, v22, v23, &v29, v24, v10, v12, v15, v17, v19, v21);

  uint64_t v26 = [CUIKORTextDrawInfo alloc];
  v27 = -[CUIKORTextDrawInfo initWithContentSize:renderingBlock:](v26, "initWithContentSize:renderingBlock:", v25, v29, v30);

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringGenerator, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_drawingQueue, 0);

  objc_storeStrong((id *)&self->_lookupQueue, 0);
}

- (void)cancelRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Attempted to cancel an invalid id <%ld>", (uint8_t *)&v2, 0xCu);
}

- (void)_renderRequestId:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "Aborting occurrence render. Request <%ld> is not valid: %@", (uint8_t *)&v3, 0x16u);
}

@end