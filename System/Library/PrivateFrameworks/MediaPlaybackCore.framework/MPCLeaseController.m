@interface MPCLeaseController
- (MFPlaybackStackController)stackController;
- (MPCLeaseController)initWithTranslator:(id)a3 leaseManager:(id)a4;
- (MPCMediaFoundationTranslator)translator;
- (_MPCLeaseManager)leaseManager;
- (void)relinquishLeaseForItem:(id)a3 completion:(id)a4;
- (void)requestLeaseForItem:(id)a3 completion:(id)a4;
- (void)setStackController:(id)a3;
@end

@implementation MPCLeaseController

- (void)setStackController:(id)a3
{
}

- (MPCLeaseController)initWithTranslator:(id)a3 leaseManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCLeaseController;
  v9 = [(MPCLeaseController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_translator, a3);
    objc_storeStrong((id *)&v10->_leaseManager, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaseManager, 0);
  objc_storeStrong((id *)&self->_translator, 0);

  objc_destroyWeak((id *)&self->_stackController);
}

- (_MPCLeaseManager)leaseManager
{
  return self->_leaseManager;
}

- (MPCMediaFoundationTranslator)translator
{
  return self->_translator;
}

- (MFPlaybackStackController)stackController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackController);

  return (MFPlaybackStackController *)WeakRetained;
}

- (void)relinquishLeaseForItem:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v26 = self;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseController: %p -  Relinquishing lease for %{public}@", buf, 0x16u);
  }

  v9 = [(MPCLeaseController *)self translator];
  v10 = [v9 MPAVItemForMFPlayerItem:v6];

  [v10 prepareForRate:v7 completionHandler:0.0];
  [v10 pauseContentKeySession];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v11 = [(MPCLeaseController *)self stackController];
  objc_super v12 = [v11 nextItems];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * v16);
        v18 = [(MPCLeaseController *)self translator];
        v19 = [v18 MPAVItemForMFPlayerItem:v17];

        if (v10 != v19) {
          [v19 pauseContentKeySession];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
}

- (void)requestLeaseForItem:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v28 = self;
    __int16 v29 = 2114;
    id v30 = v6;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseController: %p -  Requesting lease for %{public}@", buf, 0x16u);
  }

  v9 = [(MPCLeaseController *)self leaseManager];
  [v9 setCanStealLeaseIfNeeded];

  v10 = [(MPCLeaseController *)self translator];
  v11 = [v10 MPAVItemForMFPlayerItem:v6];

  [v11 resumeContentKeySession];
  LODWORD(v12) = 1.0;
  [v11 prepareForRate:v7 completionHandler:v12];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [(MPCLeaseController *)self stackController];
  uint64_t v14 = [v13 nextItems];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * v18);
        long long v20 = [(MPCLeaseController *)self translator];
        long long v21 = [v20 MPAVItemForMFPlayerItem:v19];

        if (v11 != v21) {
          [v21 resumeContentKeySession];
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
}

@end