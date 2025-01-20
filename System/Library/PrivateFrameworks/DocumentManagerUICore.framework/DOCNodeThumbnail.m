@interface DOCNodeThumbnail
- (BOOL)hasFinishedTryingToFetchCorrectThumbnail;
- (BOOL)isInteractive;
- (BOOL)isLoading;
- (BOOL)isRepresentativeIcon;
- (BOOL)needsUpdate;
- (BOOL)registerGenerationCompletionHandler:(id)a3;
- (BOOL)representativeIcon;
- (CGSize)size;
- (DOCNode)node;
- (DOCNodeThumbnail)initWithGenerator:(id)a3 node:(id)a4 descriptor:(id)a5 fallback:(id)a6;
- (DOCNodeThumbnailIdentifier)nodeThumbnailIdentifier;
- (DOCThumbnail)fallback;
- (DOCThumbnailDescriptor)descriptor;
- (DOCThumbnailGenerator)generator;
- (DOCThumbnailRequest)currentRequest;
- (NSHashTable)listeners;
- (UIImage)thumbnail;
- (UIImage)thumbnailImage;
- (double)minimumSize;
- (double)scale;
- (id)averageColorInRect:(CGRect)a3;
- (unint64_t)style;
- (void)_callGenerationCompletionHandlers;
- (void)_cancelCurrentRequest;
- (void)_fetchThumbnailWithOptions:(unint64_t)a3;
- (void)_notifyListeners;
- (void)addListener:(id)a3;
- (void)fetchWithOptions:(unint64_t)a3;
- (void)removeListener:(id)a3;
- (void)scheduleUpdateIfNeeded;
- (void)setFallback:(id)a3;
- (void)setNeedsUpdate;
- (void)setRepresentativeIcon:(BOOL)a3;
- (void)thumbnailLoaded:(id)a3;
- (void)thumbnailOperationDidLoadThumbnail:(id)a3 representativeIcon:(BOOL)a4;
- (void)thumbnailOperationFailedToLoadThumbnail;
- (void)updateNodeThumbnailIdentifierTo:(id)a3;
@end

@implementation DOCNodeThumbnail

uint64_t __74__DOCNodeThumbnail_thumbnailOperationDidLoadThumbnail_representativeIcon___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyListeners];
}

- (void)fetchWithOptions:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  [(DOCNodeThumbnail *)obj _fetchThumbnailWithOptions:a3];
  objc_sync_exit(obj);
}

- (void)_fetchThumbnailWithOptions:(unint64_t)a3
{
  char v3 = a3;
  v5 = [(DOCNodeThumbnail *)self node];
  v6 = v5;
  if ((v3 & 2) != 0) {
    goto LABEL_5;
  }
  id v7 = v5;
  if ([v7 isActionable])
  {
    v8 = [v7 providerDomainID];
    char v9 = DOCProviderDomainIDIsSharedServerDomainID();

    if ((v9 & 1) == 0)
    {

      if ((v3 & 1) == 0) {
        goto LABEL_6;
      }
LABEL_9:
      v13 = self;
      objc_sync_enter(v13);
      if (v13->_currentRequest || v13->_thumbnailImage)
      {
        objc_sync_exit(v13);
        goto LABEL_12;
      }
      objc_sync_exit(v13);

LABEL_6:
      [(DOCNodeThumbnail *)self _cancelCurrentRequest];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
      v13 = [WeakRetained thumbnailGenerator];

      v14 = +[DOCThumbnailRequest requestForNode:self->_node descriptor:self->_descriptor thumbnailGenerator:v13];
      v15 = self;
      objc_sync_enter(v15);
      objc_storeStrong((id *)&v15->_currentRequest, v14);
      objc_sync_exit(v15);

      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke;
      v20[3] = &unk_264674790;
      v20[4] = v15;
      [v14 setThumbnailGenerationRequiresDownloadHandler:v20];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke_2;
      v17[3] = &unk_264674928;
      id v18 = v14;
      v19 = v15;
      id v16 = v14;
      [v16 generateThumbnailWithCompletionHandler:v17];

LABEL_12:
      goto LABEL_13;
    }
    v10 = objc_msgSend(v7, "fpfs_fpItem");
    int v11 = objc_msgSend(v10, "doc_isSMBSharepoint");

    if (v11)
    {
LABEL_5:
      if ((v3 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
LABEL_13:
}

void __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    v8 = (NSObject **)MEMORY[0x263F3AC28];
    char v9 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      char v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke_2_cold_1(a1, (uint64_t)v7, v9);
    }
    [*(id *)(a1 + 40) thumbnailOperationFailedToLoadThumbnail];
  }
  else
  {
    [*(id *)(a1 + 40) thumbnailOperationDidLoadThumbnail:v5 representativeIcon:1];
  }
}

- (void)thumbnailOperationDidLoadThumbnail:(id)a3 representativeIcon:(BOOL)a4
{
  id v6 = (UIImage *)a3;
  id v7 = self;
  objc_sync_enter(v7);
  v7->_representativeIcon = a4;
  currentRequest = v7->_currentRequest;
  v7->_currentRequest = 0;

  [(DOCNodeThumbnail *)v7 _callGenerationCompletionHandlers];
  thumbnailImage = v7->_thumbnailImage;
  v7->_thumbnailImage = v6;
  v10 = v6;

  objc_sync_exit(v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__DOCNodeThumbnail_thumbnailOperationDidLoadThumbnail_representativeIcon___block_invoke;
  block[3] = &unk_264674790;
  block[4] = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_cancelCurrentRequest
{
  obj = self;
  objc_sync_enter(obj);
  [(DOCThumbnailRequest *)obj->_currentRequest cancel];
  currentRequest = obj->_currentRequest;
  obj->_currentRequest = 0;

  [(DOCNodeThumbnail *)obj _callGenerationCompletionHandlers];
  objc_sync_exit(obj);
}

- (void)_callGenerationCompletionHandlers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (void *)[(NSMutableArray *)v2->_generationCompletionHandlers copy];
  [(NSMutableArray *)v2->_generationCompletionHandlers removeAllObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
}

- (UIImage)thumbnail
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = [(DOCNodeThumbnail *)v2 thumbnailImage];
  if (v3)
  {
    objc_sync_exit(v2);
    id v4 = v2;
  }
  else
  {
    id v4 = [(DOCNodeThumbnail *)v2 fallback];
    objc_sync_exit(v2);

    char v3 = [v4 thumbnail];
  }

  [(DOCNodeThumbnail *)v2 scheduleUpdateIfNeeded];
  uint64_t v5 = [(DOCNodeThumbnail *)v2 generator];
  [v5 markThumbnailAsRecentlyUsed:v2];

  return (UIImage *)v3;
}

- (void)scheduleUpdateIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  if ([(DOCNodeThumbnail *)obj needsUpdate])
  {
    obj->_needsUpdate = 0;
    [(DOCNodeThumbnail *)obj _fetchThumbnailWithOptions:0];
  }
  objc_sync_exit(obj);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (DOCThumbnailGenerator)generator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  return (DOCThumbnailGenerator *)WeakRetained;
}

- (BOOL)isRepresentativeIcon
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = [(DOCNodeThumbnail *)v2 thumbnailImage];

  if (v3)
  {
    LOBYTE(v4) = v2->_representativeIcon;
    objc_sync_exit(v2);
  }
  else
  {
    uint64_t v5 = [(DOCNodeThumbnail *)v2 fallback];
    objc_sync_exit(v2);

    BOOL v4 = [(DOCNodeThumbnail *)v5 isRepresentativeIcon];
    v2 = v5;
  }

  return v4;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (DOCNode)node
{
  return self->_node;
}

- (DOCNodeThumbnailIdentifier)nodeThumbnailIdentifier
{
  return self->_nodeThumbnailIdentifier;
}

- (unint64_t)style
{
  return [(DOCThumbnailDescriptor *)self->_descriptor style];
}

- (DOCThumbnail)fallback
{
  return self->_fallback;
}

- (DOCNodeThumbnail)initWithGenerator:(id)a3 node:(id)a4 descriptor:(id)a5 fallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)DOCNodeThumbnail;
  v14 = [(DOCNodeThumbnail *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_generator, v10);
    objc_storeStrong((id *)&v15->_descriptor, a5);
    objc_storeStrong((id *)&v15->_fallback, a6);
    *(_WORD *)&v15->_representativeIcon = 0;
    uint64_t v16 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    listeners = v15->_listeners;
    v15->_listeners = (NSHashTable *)v16;

    objc_storeStrong((id *)&v15->_node, a4);
    uint64_t v18 = [v11 thumbnailIdentifier];
    nodeThumbnailIdentifier = v15->_nodeThumbnailIdentifier;
    v15->_nodeThumbnailIdentifier = (DOCNodeThumbnailIdentifier *)v18;

    uint64_t v20 = objc_opt_new();
    generationCompletionHandlers = v15->_generationCompletionHandlers;
    v15->_generationCompletionHandlers = (NSMutableArray *)v20;

    [(DOCThumbnail *)v15->_fallback addListener:v15];
  }

  return v15;
}

- (void)updateNodeThumbnailIdentifierTo:(id)a3
{
  id v8 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(DOCNodeThumbnail *)v5 nodeThumbnailIdentifier];
  char v7 = [v8 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&v5->_nodeThumbnailIdentifier, a3);
    [(DOCNodeThumbnail *)v5 setNeedsUpdate];
  }
  objc_sync_exit(v5);
}

- (CGSize)size
{
  [(DOCThumbnailDescriptor *)self->_descriptor size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFallback:(id)a3
{
  id v8 = (DOCThumbnail *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_fallback == v8)
  {
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v6 = [(DOCNodeThumbnail *)v5 fallback];
    [v6 removeListener:v5];

    objc_storeStrong((id *)&v5->_fallback, a3);
    char v7 = [(DOCNodeThumbnail *)v5 fallback];
    [v7 addListener:v5];

    objc_sync_exit(v5);
    [(DOCNodeThumbnail *)v5 thumbnailLoaded:v8];
  }
}

- (void)thumbnailLoaded:(id)a3
{
  id v6 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(DOCNodeThumbnail *)v4 thumbnailImage];

  objc_sync_exit(v4);
  if (!v5) {
    [(DOCNodeThumbnail *)v4 _notifyListeners];
  }
}

- (double)scale
{
  [(DOCThumbnailDescriptor *)self->_descriptor scale];
  return result;
}

- (void)removeListener:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(DOCNodeThumbnail *)self listeners];
  objc_sync_enter(v4);
  if (v8)
  {
    uint64_t v5 = [(DOCNodeThumbnail *)self listeners];
    [v5 removeObject:v8];
  }
  id v6 = [(DOCNodeThumbnail *)self listeners];
  uint64_t v7 = [v6 count];

  objc_sync_exit(v4);
  if (!v7) {
    [(DOCNodeThumbnail *)self _cancelCurrentRequest];
  }
}

- (void)_notifyListeners
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v3 = [(DOCNodeThumbnail *)self listeners];
  objc_sync_enter(v3);
  BOOL v4 = [(DOCNodeThumbnail *)self listeners];
  uint64_t v5 = [v4 allObjects];

  objc_sync_exit(v3);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v18;
    id v10 = (NSObject **)MEMORY[0x263F3AC28];
    *(void *)&long long v8 = 138412802;
    long long v16 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        id v13 = *v10;
        if (!*v10)
        {
          DOCInitLogging();
          id v13 = *v10;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = v13;
          uint64_t v15 = objc_opt_class();
          *(_DWORD *)buf = v16;
          uint64_t v22 = v15;
          __int16 v23 = 2048;
          v24 = v12;
          __int16 v25 = 2112;
          v26 = self;
          _os_log_debug_impl(&dword_222E2D000, v14, OS_LOG_TYPE_DEBUG, "Notifying <%@: %p> that the thumbnail for %@ successfully loaded", buf, 0x20u);
        }
        objc_msgSend(v12, "thumbnailLoaded:", self, v16, (void)v17);
        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v7);
  }
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = [(DOCNodeThumbnail *)self listeners];
    objc_sync_enter(v5);
    id v6 = [(DOCNodeThumbnail *)self listeners];
    [v6 addObject:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (double)minimumSize
{
  [(DOCThumbnailDescriptor *)self->_descriptor minimumSize];
  return result;
}

- (BOOL)isInteractive
{
  return [(DOCThumbnailDescriptor *)self->_descriptor isInteractive];
}

- (void)setNeedsUpdate
{
  obj = self;
  objc_sync_enter(obj);
  obj->_needsUpdate = 1;
  objc_sync_exit(obj);
}

- (BOOL)isLoading
{
  double v2 = self;
  objc_sync_enter(v2);
  double v3 = [(DOCNodeThumbnail *)v2 currentRequest];

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    uint64_t v5 = [(DOCNodeThumbnail *)v2 thumbnailImage];

    if (v5)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      id v6 = [(DOCNodeThumbnail *)v2 fallback];
      uint64_t v4 = [v6 isLoading];
    }
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)averageColorInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(DOCNodeThumbnail *)self isRepresentativeIcon])
  {
    long long v8 = [(DOCNodeThumbnail *)self thumbnail];
    uint64_t v9 = objc_msgSend(v8, "doc_averageColorInRect:", x, y, width, height);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F1C550] whiteColor];
  }
  return v9;
}

- (BOOL)hasFinishedTryingToFetchCorrectThumbnail
{
  double v2 = self;
  objc_sync_enter(v2);
  double v3 = [(DOCNodeThumbnail *)v2 currentRequest];
  BOOL v4 = v3 == 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)thumbnailOperationFailedToLoadThumbnail
{
  obj = self;
  objc_sync_enter(obj);
  currentRequest = obj->_currentRequest;
  obj->_currentRequest = 0;

  [(DOCNodeThumbnail *)obj _callGenerationCompletionHandlers];
  [(DOCNodeThumbnail *)obj setNeedsUpdate];
  objc_sync_exit(obj);
}

void __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) _callGenerationCompletionHandlers];
  objc_sync_exit(obj);
}

- (BOOL)registerGenerationCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  currentRequest = v5->_currentRequest;
  if (currentRequest)
  {
    generationCompletionHandlers = v5->_generationCompletionHandlers;
    long long v8 = (void *)MEMORY[0x223CA9910](v4);
    [(NSMutableArray *)generationCompletionHandlers addObject:v8];
  }
  objc_sync_exit(v5);

  return currentRequest != 0;
}

- (BOOL)representativeIcon
{
  return self->_representativeIcon;
}

- (void)setRepresentativeIcon:(BOOL)a3
{
  self->_representativeIcon = a3;
}

- (DOCThumbnailDescriptor)descriptor
{
  return self->_descriptor;
}

- (DOCThumbnailRequest)currentRequest
{
  return self->_currentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_fallback, 0);
  objc_storeStrong((id *)&self->_nodeThumbnailIdentifier, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_generationCompletionHandlers, 0);
}

void __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_222E2D000, log, OS_LOG_TYPE_ERROR, "Failed to generate thumbnail for request %@: %@", (uint8_t *)&v4, 0x16u);
}

@end