@interface FigDisplayMirroringChangeObserver
- (FigDisplayMirroringChangeObserver)init;
- (FigDisplayMirroringChangeObserver)initWithCallback:(void *)a3 context:(void *)a4;
- (FigDisplayMirroringChangeObserver)initWithPlayer:(OpaqueFigPlayer *)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeCallback;
- (void)removeObserversOnCADisplays;
- (void)removeReferenceToPlayer;
- (void)setBaseDisplayList:(id)a3;
- (void)updatePlayerDisplayList;
@end

@implementation FigDisplayMirroringChangeObserver

- (FigDisplayMirroringChangeObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)FigDisplayMirroringChangeObserver;
  v2 = [(FigDisplayMirroringChangeObserver *)&v5 init];
  if (v2)
  {
    v2->_clonedDisplays = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_cloningSupportedDisplays = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_baseDisplayList = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__FigDisplayMirroringChangeObserver_init__block_invoke;
    block[3] = &unk_1E5794738;
    block[4] = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v2->_player = 0;
    v2->_callback = 0;
    v2->_weakCallbackContext = 0;
  }
  return v2;
}

uint64_t __41__FigDisplayMirroringChangeObserver_init__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E4F39B60], "displays", 0);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        [v7 addObserver:*(void *)(a1 + 32) forKeyPath:@"cloned" options:4 context:0];
        [v7 addObserver:*(void *)(a1 + 32) forKeyPath:@"cloningSupported" options:4 context:0];
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  return result;
}

- (FigDisplayMirroringChangeObserver)initWithPlayer:(OpaqueFigPlayer *)a3
{
  uint64_t result = [(FigDisplayMirroringChangeObserver *)self init];
  if (result) {
    result->_player = a3;
  }
  return result;
}

- (FigDisplayMirroringChangeObserver)initWithCallback:(void *)a3 context:(void *)a4
{
  uint64_t v6 = [(FigDisplayMirroringChangeObserver *)self init];
  v7 = v6;
  if (v6)
  {
    v6->_callback = a3;
    if (a4) {
      v6->_weakCallbackContext = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    }
  }
  return v7;
}

- (void)removeObserversOnCADisplays
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__FigDisplayMirroringChangeObserver_removeObserversOnCADisplays__block_invoke;
  block[3] = &unk_1E5794738;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__FigDisplayMirroringChangeObserver_removeObserversOnCADisplays__block_invoke(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(result + 32) + 40))
  {
    uint64_t v1 = result;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    v2 = objc_msgSend(MEMORY[0x1E4F39B60], "displays", 0);
    uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v8;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
          [v6 removeObserver:*(void *)(v1 + 32) forKeyPath:@"cloned"];
          [v6 removeObserver:*(void *)(v1 + 32) forKeyPath:@"cloningSupported"];
          ++v5;
        }
        while (v3 != v5);
        uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v3 = result;
      }
      while (result);
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 40) = 0;
  }
  return result;
}

- (void)dealloc
{
  weakCallbackContext = self->_weakCallbackContext;
  if (weakCallbackContext)
  {
    CFRelease(weakCallbackContext);
    self->_weakCallbackContext = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)FigDisplayMirroringChangeObserver;
  [(FigDisplayMirroringChangeObserver *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"cloned", a4, a5, a6))
  {
    clonedDisplays = self->_clonedDisplays;
    char v10 = [a4 isCloned];
  }
  else
  {
    if (![a3 isEqualToString:@"cloningSupported"]) {
      return;
    }
    clonedDisplays = self->_cloningSupportedDisplays;
    char v10 = [a4 isCloningSupported];
  }
  char v11 = v10;
  if (clonedDisplays)
  {
    if (FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce != -1) {
      dispatch_once(&FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce, &__block_literal_global_24);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__FigDisplayMirroringChangeObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v12[3] = &unk_1E5795C68;
    char v13 = v11;
    v12[4] = clonedDisplays;
    v12[5] = a4;
    v12[6] = self;
    dispatch_async((dispatch_queue_t)FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringAccessQueue, v12);
  }
}

uint64_t __84__FigDisplayMirroringChangeObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) name];
  if (v2) {
    [v3 addObject:v4];
  }
  else {
    [v3 removeObject:v4];
  }
  uint64_t v5 = *(void **)(a1 + 48);

  return [v5 updatePlayerDisplayList];
}

- (void)setBaseDisplayList:(id)a3
{
  if (FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce != -1) {
    dispatch_once(&FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce, &__block_literal_global_24);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__FigDisplayMirroringChangeObserver_setBaseDisplayList___block_invoke;
  v5[3] = &unk_1E57955D0;
  v5[4] = a3;
  v5[5] = self;
  dispatch_sync((dispatch_queue_t)FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringAccessQueue, v5);
}

uint64_t __56__FigDisplayMirroringChangeObserver_setBaseDisplayList___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(result + 40) + 32);
  if (*(void **)(result + 32) != v1)
  {
    uint64_t v2 = result;

    *(void *)(*(void *)(v2 + 40) + 32) = *(id *)(v2 + 32);
    uint64_t v3 = *(void **)(v2 + 40);
    return [v3 updatePlayerDisplayList];
  }
  return result;
}

- (void)updatePlayerDisplayList
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  baseDisplayList = self->_baseDisplayList;
  if (baseDisplayList) {
    id v4 = (id)[(NSArray *)baseDisplayList mutableCopy];
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v5 = v4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  clonedDisplays = self->_clonedDisplays;
  uint64_t v7 = [(NSMutableSet *)clonedDisplays countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(clonedDisplays);
        }
        if ([(NSArray *)self->_baseDisplayList containsObject:*(void *)(*((void *)&v18 + 1) + 8 * i)])
        {
          objc_msgSend(v5, "addObjectsFromArray:", -[NSMutableSet allObjects](self->_cloningSupportedDisplays, "allObjects"));
          goto LABEL_14;
        }
      }
      uint64_t v8 = [(NSMutableSet *)clonedDisplays countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_14:
  player = self->_player;
  if (player)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject(player);
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v14 = v13 ? v13 : 0;
    v15 = *(void (**)(uint64_t, uint64_t, void *))(v14 + 56);
    if (v15) {
      v15(FigBaseObject, 0x1EE553D78, v5);
    }
  }
  if (self->_callback)
  {
    if (self->_weakCallbackContext)
    {
      uint64_t v16 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v16)
      {
        v17 = (const void *)v16;
        ((void (*)(void *, uint64_t))self->_callback)(v5, v16);
        CFRelease(v17);
      }
    }
  }
}

- (void)removeReferenceToPlayer
{
  if (FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce != -1) {
    dispatch_once(&FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce, &__block_literal_global_24);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__FigDisplayMirroringChangeObserver_removeReferenceToPlayer__block_invoke;
  block[3] = &unk_1E5794738;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringAccessQueue, block);
}

uint64_t __60__FigDisplayMirroringChangeObserver_removeReferenceToPlayer__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (void)removeCallback
{
  if (FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce != -1) {
    dispatch_once(&FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce, &__block_literal_global_24);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__FigDisplayMirroringChangeObserver_removeCallback__block_invoke;
  block[3] = &unk_1E5794738;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringAccessQueue, block);
}

void __51__FigDisplayMirroringChangeObserver_removeCallback__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  uint64_t v2 = *(const void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 56) = 0;
  }
}

@end