@interface AVTStickerChangeObserver
- (AVTCoreEnvironment)environment;
- (AVTPBackendImageHandlingDelegate)imageHandlingDelegate;
- (AVTStickerBackend)stickerBackend;
- (AVTStickerChangeObserver)initWithStickerBackend:(id)a3 environment:(id)a4;
- (void)processChangesForChangeTracker:(id)a3 completionHandler:(id)a4;
- (void)setImageHandlingDelegate:(id)a3;
@end

@implementation AVTStickerChangeObserver

- (AVTStickerChangeObserver)initWithStickerBackend:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTStickerChangeObserver;
  v9 = [(AVTStickerChangeObserver *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a4);
    objc_storeStrong((id *)&v10->_stickerBackend, a3);
  }

  return v10;
}

- (void)processChangesForChangeTracker:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_environment;
  v9 = [(AVTCoreEnvironment *)v8 stickerImageStoreLocation];
  v10 = self->_stickerBackend;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageHandlingDelegate);
  objc_initWeak(&location, v10);
  objc_initWeak(&from, WeakRetained);
  objc_super v12 = [(AVTCoreEnvironment *)self->_environment logger];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__AVTStickerChangeObserver_processChangesForChangeTracker_completionHandler___block_invoke;
  v16[3] = &unk_2647C4288;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  id v13 = v6;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  id v15 = v7;
  id v19 = v15;
  [v12 deletingStickerRecentsForRemoteChanges:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __77__AVTStickerChangeObserver_processChangesForChangeTracker_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__AVTStickerChangeObserver_processChangesForChangeTracker_completionHandler___block_invoke_2;
  v11[3] = &unk_2647C4260;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  objc_copyWeak(&v13, (id *)(a1 + 64));
  v4 = (void *)MEMORY[0x22A660070](v11);
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = 0;
  uint64_t v7 = [v5 processChangeTransactionsWithChangeTokenLocation:v6 handler:v4 error:&v10];
  id v8 = v10;
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v8);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
}

uint64_t __77__AVTStickerChangeObserver_processChangesForChangeTracker_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = objc_msgSend(v3, "avt_map:", &__block_literal_global_8);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [v5 deleteImagesForAvatarRecordIdentifier:v11 error:0];
        [WeakRetained deleteRecentStickersWithAvatarIdentifier:v11 stickerIdentifier:0 completionHandler:0];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return 1;
}

uint64_t __77__AVTStickerChangeObserver_processChangesForChangeTracker_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 recordIdentifier];
}

- (AVTPBackendImageHandlingDelegate)imageHandlingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageHandlingDelegate);

  return (AVTPBackendImageHandlingDelegate *)WeakRetained;
}

- (void)setImageHandlingDelegate:(id)a3
{
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTStickerBackend)stickerBackend
{
  return self->_stickerBackend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerBackend, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_destroyWeak((id *)&self->_imageHandlingDelegate);
}

@end