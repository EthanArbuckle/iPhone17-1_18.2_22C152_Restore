@interface FigVideoLayer
+ (id)defaultActionForKey:(id)a3;
- (BOOL)isVideoLayerBeingServiced;
- (FigVideoLayer)initWithDeferredTransaction:(OpaqueFigDeferredTransaction *)a3;
- (FigVideoLayer)initWithLayer:(id)a3;
- (FigVideoLayer)initWithoutDeferredTransaction;
- (id)actionForKey:(id)a3;
- (id)layerDisplayName;
- (void)_sendVideoLayerIsBeingServicedNotification;
- (void)_setupInternalFigVideoLayer;
- (void)dealloc;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)notificationBarrier;
@end

@implementation FigVideoLayer

- (void)_setupInternalFigVideoLayer
{
  self->_videoLayer->isPresentationLayer = 0;
  self->_videoLayer->visible = 0;
  self->_videoLayer->serializationMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  self->_videoLayer->notificationSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.videolayer.notificationqueue", 0);
}

- (FigVideoLayer)initWithDeferredTransaction:(OpaqueFigDeferredTransaction *)a3
{
  v3 = a3;
  CFTypeRef cf = 0;
  if (!a3)
  {
    if (FigDeferredTransactionCreate(*MEMORY[0x1E4F1CF80], (uint64_t *)&cf)) {
      goto LABEL_11;
    }
    v3 = cf;
  }
  v7.receiver = self;
  v7.super_class = (Class)FigVideoLayer;
  self = [(FigThreadSafeCALayer *)&v7 initWithDeferredTransaction:v3];
  if (!self) {
    goto LABEL_7;
  }
  v5 = objc_alloc_init(FigVideoLayerInternal);
  self->_videoLayer = v5;
  if (v5)
  {
    CFRetain(v5);
    [(FigVideoLayer *)self _setupTraceLevel];
    FBLSupportAppendDeferredTransactionChangeToSetAllowsDisplayCompositing(v3, self, 1, (uint64_t)"-[FigVideoLayer initWithDeferredTransaction:]");
    [(FigVideoLayer *)self _setupInternalFigVideoLayer];
    goto LABEL_7;
  }
  if (!FigSignalErrorAt())
  {
LABEL_7:
    if (cf)
    {
      FigDeferredTransactionCommit((uint64_t)cf);
      CFRelease(cf);
    }
    return self;
  }
LABEL_11:

  if (cf) {
    CFRelease(cf);
  }
  return 0;
}

- (FigVideoLayer)initWithoutDeferredTransaction
{
  v5.receiver = self;
  v5.super_class = (Class)FigVideoLayer;
  v2 = [(FigThreadSafeCALayer *)&v5 initWithoutDeferredTransaction];
  if (v2)
  {
    v3 = objc_alloc_init(FigVideoLayerInternal);
    v2->_videoLayer = v3;
    if (v3)
    {
      CFRetain(v3);
      [(FigVideoLayer *)v2 _setupTraceLevel];
      [MEMORY[0x1E4F39CF8] begin];
      if (!pthread_main_np()) {
        [MEMORY[0x1E4F39CF8] activateBackground:1];
      }
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      [(FigVideoLayer *)v2 setAllowsDisplayCompositing:1];
      [MEMORY[0x1E4F39CF8] commit];
      [(FigVideoLayer *)v2 _setupInternalFigVideoLayer];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (FigVideoLayer)initWithLayer:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)FigVideoLayer;
  objc_super v5 = [(FigVideoLayer *)&v8 initWithLayer:a3];
  if (v5)
  {
    v6 = objc_alloc_init(FigVideoLayerInternal);
    v5->_videoLayer = v6;
    if (v6)
    {
      CFRetain(v6);
      v5->_videoLayer->isPresentationLayer = 1;
      v5->_videoLayer->visible = 0;
      return v5;
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  videoLayer = self->_videoLayer;
  if (videoLayer->serializationMutex)
  {
    FigSimpleMutexDestroy();
    videoLayer = self->_videoLayer;
  }
  if (videoLayer->notificationSerialQueue
    && (dispatch_release((dispatch_object_t)videoLayer->notificationSerialQueue), (videoLayer = self->_videoLayer) == 0))
  {
    v4 = 0;
  }
  else
  {
    CFRelease(videoLayer);
    v4 = self->_videoLayer;
  }

  v5.receiver = self;
  v5.super_class = (Class)FigVideoLayer;
  [(FigVideoLayer *)&v5 dealloc];
}

- (id)actionForKey:(id)a3
{
  return 0;
}

+ (id)defaultActionForKey:(id)a3
{
  return 0;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  videoLayer = self->_videoLayer;
  if (!videoLayer->isPresentationLayer)
  {
    MEMORY[0x19970E910](videoLayer->serializationMutex, a2);
    self->_videoLayer->visible = v3;
    MEMORY[0x19970E930](self->_videoLayer->serializationMutex);
    notificationSerialQueue = self->_videoLayer->notificationSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__FigVideoLayer_layerDidBecomeVisible___block_invoke;
    block[3] = &unk_1E5794738;
    block[4] = self;
    dispatch_async(notificationSerialQueue, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)FigVideoLayer;
  [(FigVideoLayer *)&v7 layerDidBecomeVisible:v3];
}

uint64_t __39__FigVideoLayer_layerDidBecomeVisible___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendVideoLayerIsBeingServicedNotification];
}

- (BOOL)isVideoLayerBeingServiced
{
  v2 = self;
  MEMORY[0x19970E910](self->_videoLayer->serializationMutex, a2);
  videoLayer = v2->_videoLayer;
  LOBYTE(v2) = videoLayer->visible;
  MEMORY[0x19970E930](videoLayer->serializationMutex);
  return (char)v2;
}

- (id)layerDisplayName
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_videoLayer->visible) {
    return 0;
  }
  v2 = objc_msgSend((id)-[FigVideoLayer context](self, "context"), "options");
  BOOL v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F39E58]];
  if (v3)
  {
    int v4 = [v3 unsignedIntValue];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v5 = objc_msgSend(MEMORY[0x1E4F39B60], "displays", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (v4 == [v10 displayId]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            goto LABEL_5;
          }
          goto LABEL_14;
        }
      }
      id result = (id)[v10 name];
      if (result) {
        return result;
      }
    }
  }
LABEL_14:
  id result = (id)[v2 objectForKey:*MEMORY[0x1E4F39E60]];
  if (!result) {
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39B60], "mainDisplay"), "name");
  }
  return result;
}

- (void)notificationBarrier
{
  notificationSerialQueue = self->_videoLayer->notificationSerialQueue;
  if (notificationSerialQueue) {
    dispatch_sync(notificationSerialQueue, &__block_literal_global_91);
  }
}

- (void)_sendVideoLayerIsBeingServicedNotification
{
  CMNotificationCenterGetDefaultLocalCenter();

  CMNotificationCenterPostNotification();
}

@end