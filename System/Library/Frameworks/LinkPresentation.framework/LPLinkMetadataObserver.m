@interface LPLinkMetadataObserver
- (LPLinkMetadataObserver)initWithMetadata:(id)a3 callback:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)stopObserving;
@end

@implementation LPLinkMetadataObserver

- (LPLinkMetadataObserver)initWithMetadata:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPLinkMetadataObserver;
  v9 = [(LPLinkMetadataObserver *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    v11 = _Block_copy(v8);
    id callback = v10->_callback;
    v10->_id callback = v11;

    [(LPLinkMetadata *)v10->_metadata addObserver:v10 forKeyPath:@"_dummyPropertyForObservation" options:0 context:observerContext];
    v13 = v10;
  }

  return v10;
}

- (void)dealloc
{
  [(LPLinkMetadataObserver *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)LPLinkMetadataObserver;
  [(LPLinkMetadataObserver *)&v3 dealloc];
}

- (void)stopObserving
{
  [(LPLinkMetadata *)self->_metadata removeObserver:self forKeyPath:@"_dummyPropertyForObservation" context:observerContext];
  metadata = self->_metadata;
  self->_metadata = 0;

  id callback = self->_callback;
  self->_id callback = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)observerContext == a6 && !self->_hasScheduledCallback)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__LPLinkMetadataObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5B04DF0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    self->_hasScheduledCallback = 1;
  }
}

uint64_t __73__LPLinkMetadataObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end