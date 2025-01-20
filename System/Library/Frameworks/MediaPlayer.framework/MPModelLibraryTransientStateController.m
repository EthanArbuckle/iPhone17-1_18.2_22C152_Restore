@interface MPModelLibraryTransientStateController
+ (id)sharedDeviceLibraryController;
- (MPModelLibraryTransientStateController)init;
- (id)registerTransientAddState:(int64_t)a3 forModelObjects:(id)a4 relatedModelObjects:(id)a5;
- (id)registerTransientFavoriteState:(int64_t)a3 forModelObjects:(id)a4 relatedModelObjects:(id)a5;
- (id)registerTransientKeepLocalState:(int64_t)a3 forModelObjects:(id)a4 relatedModelObjects:(id)a5;
- (int64_t)transientAddStateForModelObject:(id)a3;
- (int64_t)transientFavoriteStateForModelObject:(id)a3;
- (int64_t)transientKeepLocalStateForModelObject:(id)a3;
- (void)addOperation:(id)a3;
- (void)performDeleteEntityChangeRequest:(id)a3 withRelatedModelObjects:(id)a4;
- (void)performDeleteEntityChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5;
- (void)performFavoriteStateChangeRequest:(id)a3 withRelatedModelObjects:(id)a4;
- (void)performFavoriteStateChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5;
- (void)performKeepLocalChangeRequest:(id)a3 withRelatedModelObjects:(id)a4;
- (void)performKeepLocalChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5;
- (void)performLibraryImportChangeRequest:(id)a3 withRelatedModelObjects:(id)a4;
- (void)performLibraryImportChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5;
- (void)unregisterTransientState:(id)a3;
@end

@implementation MPModelLibraryTransientStateController

void __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 32) reverseObjectEnumerator];
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v26;
    v14 = v17;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v26 != v4) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v25 + 1) + 8 * v5);
      v7 = objc_msgSend(v6, "modelObjects", v14);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke_2;
      v21[3] = &unk_1E57F4388;
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      v23 = v6;
      uint64_t v24 = v9;
      id v22 = v8;
      [v7 enumerateItemIdentifiersUsingBlock:v21];
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (!v10)
      {
        v11 = [v6 relatedModelObjects];

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v17[0] = __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke_3;
        v17[1] = &unk_1E57F4388;
        id v12 = *(id *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        v19 = v6;
        uint64_t v20 = v13;
        id v18 = v12;
        [v11 enumerateItemIdentifiersUsingBlock:v16];

        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        v7 = v11;
      }

      if (v10) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (id)sharedDeviceLibraryController
{
  if (sharedDeviceLibraryController_sOnceToken != -1) {
    dispatch_once(&sharedDeviceLibraryController_sOnceToken, &__block_literal_global_32328);
  }
  uint64_t v2 = (void *)sharedDeviceLibraryController_sSharedDeviceLibraryController;

  return v2;
}

- (int64_t)transientAddStateForModelObject:(id)a3
{
  uint64_t v4 = [a3 identifiers];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke;
    block[3] = &unk_1E57F9F48;
    block[4] = self;
    id v10 = v4;
    v11 = &v12;
    dispatch_sync(accessQueue, block);
    int64_t v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

void __71__MPModelLibraryTransientStateController_sharedDeviceLibraryController__block_invoke()
{
  v0 = objc_alloc_init(MPModelLibraryTransientStateController);
  v1 = (void *)sharedDeviceLibraryController_sSharedDeviceLibraryController;
  sharedDeviceLibraryController_sSharedDeviceLibraryController = (uint64_t)v0;
}

- (MPModelLibraryTransientStateController)init
{
  v10.receiver = self;
  v10.super_class = (Class)MPModelLibraryTransientStateController;
  uint64_t v2 = [(MPModelLibraryTransientStateController *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlayer.MPModelLibraryTransientStateController.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlayer.MPModelLibraryTransientStateController.notificationQueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    int64_t v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v7;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.MediaPlayer.MPModelLibraryTransientStateController.operationQueue"];
    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:25];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredTransientState, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)performFavoriteStateChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8
    && ([v8 requestAction], v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    uint64_t v12 = [v8 requestAction];
    uint64_t v13 = [v12 changeRequestAction];

    switch(v13)
    {
      case 0:
        int v14 = 1;
        uint64_t v15 = 3;
        break;
      case 1:
      case 3:
        int v14 = 1;
        uint64_t v15 = 1;
        break;
      case 2:
        int v14 = 1;
        uint64_t v15 = 2;
        break;
      default:
        int v14 = 0;
        uint64_t v15 = 0;
        break;
    }
    uint64_t v16 = [v8 modelObject];
    v17 = (void *)v16;
    id v18 = 0;
    if (v14 && v16)
    {
      v19 = objc_alloc_init(MPMutableSectionedCollection);
      [(MPMutableSectionedCollection *)v19 appendSection:&stru_1EE680640];
      [(MPMutableSectionedCollection *)v19 appendItem:v17];
      id v18 = [(MPModelLibraryTransientStateController *)self registerTransientFavoriteState:v15 forModelObjects:v19 relatedModelObjects:v9];
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __111__MPModelLibraryTransientStateController_performFavoriteStateChangeRequest_withRelatedModelObjects_completion___block_invoke;
    v22[3] = &unk_1E57F43B0;
    id v23 = v18;
    uint64_t v24 = self;
    id v25 = v10;
    id v20 = v18;
    v21 = (void *)[v8 newOperationWithResponseHandler:v22];
    [(NSOperationQueue *)self->_operationQueue addOperation:v21];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __111__MPModelLibraryTransientStateController_performFavoriteStateChangeRequest_withRelatedModelObjects_completion___block_invoke(int8x16_t *a1, void *a2)
{
  id v3 = a2;
  if (a1[2].i64[0])
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__MPModelLibraryTransientStateController_performFavoriteStateChangeRequest_withRelatedModelObjects_completion___block_invoke_2;
    block[3] = &unk_1E57F9F98;
    int8x16_t v7 = a1[2];
    id v5 = (id)v7.i64[0];
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
  uint64_t v6 = a1[3].i64[0];
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __111__MPModelLibraryTransientStateController_performFavoriteStateChangeRequest_withRelatedModelObjects_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterTransientState:*(void *)(a1 + 40)];
}

- (void)performFavoriteStateChangeRequest:(id)a3 withRelatedModelObjects:(id)a4
{
}

- (void)performKeepLocalChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8)
  {
    uint64_t v12 = [v8 enableState];
    uint64_t v13 = 0;
    int v14 = 0;
    switch(v12)
    {
      case -1:
        int v14 = 1;
        uint64_t v13 = 3;
        break;
      case 1:
      case 2:
        int v14 = 1;
        uint64_t v13 = v12;
        break;
      case 3:
        int v14 = 1;
        uint64_t v13 = 4;
        break;
      default:
        break;
    }
    uint64_t v15 = [v8 modelObject];
    uint64_t v16 = (void *)v15;
    v17 = 0;
    if (v14 && v15)
    {
      id v18 = objc_alloc_init(MPMutableSectionedCollection);
      [(MPMutableSectionedCollection *)v18 appendSection:&stru_1EE680640];
      [(MPMutableSectionedCollection *)v18 appendItem:v16];
      v17 = [(MPModelLibraryTransientStateController *)self registerTransientKeepLocalState:v13 forModelObjects:v18 relatedModelObjects:v9];
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __107__MPModelLibraryTransientStateController_performKeepLocalChangeRequest_withRelatedModelObjects_completion___block_invoke;
    v21[3] = &unk_1E57F43B0;
    id v22 = v17;
    id v23 = self;
    id v24 = v11;
    id v19 = v17;
    id v20 = (void *)[v8 newOperationWithResponseHandler:v21];
    [(NSOperationQueue *)self->_operationQueue addOperation:v20];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __107__MPModelLibraryTransientStateController_performKeepLocalChangeRequest_withRelatedModelObjects_completion___block_invoke(int8x16_t *a1, void *a2)
{
  id v3 = a2;
  if (a1[2].i64[0])
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __107__MPModelLibraryTransientStateController_performKeepLocalChangeRequest_withRelatedModelObjects_completion___block_invoke_2;
    block[3] = &unk_1E57F9F98;
    int8x16_t v7 = a1[2];
    id v5 = (id)v7.i64[0];
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
  uint64_t v6 = a1[3].i64[0];
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __107__MPModelLibraryTransientStateController_performKeepLocalChangeRequest_withRelatedModelObjects_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterTransientState:*(void *)(a1 + 40)];
}

- (void)performKeepLocalChangeRequest:(id)a3 withRelatedModelObjects:(id)a4
{
}

- (void)performLibraryImportChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8)
  {
    if ([v8 shouldLibraryAdd])
    {
      uint64_t v12 = [v8 modelObjects];
      uint64_t v13 = [(MPModelLibraryTransientStateController *)self registerTransientAddState:1 forModelObjects:v12 relatedModelObjects:v9];
    }
    else
    {
      uint64_t v13 = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __111__MPModelLibraryTransientStateController_performLibraryImportChangeRequest_withRelatedModelObjects_completion___block_invoke;
    v16[3] = &unk_1E57F4E98;
    id v14 = v13;
    id v17 = v14;
    id v18 = self;
    id v19 = v11;
    uint64_t v15 = (void *)[v8 newOperationWithResponseHandler:v16];
    if (v15) {
      [(NSOperationQueue *)self->_operationQueue addOperation:v15];
    }
  }
  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __111__MPModelLibraryTransientStateController_performLibraryImportChangeRequest_withRelatedModelObjects_completion___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1[2].i64[0])
  {
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__MPModelLibraryTransientStateController_performLibraryImportChangeRequest_withRelatedModelObjects_completion___block_invoke_2;
    block[3] = &unk_1E57F9F98;
    int8x16_t v10 = a1[2];
    id v8 = (id)v10.i64[0];
    int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  uint64_t v9 = a1[3].i64[0];
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

uint64_t __111__MPModelLibraryTransientStateController_performLibraryImportChangeRequest_withRelatedModelObjects_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterTransientState:*(void *)(a1 + 40)];
}

- (void)performLibraryImportChangeRequest:(id)a3 withRelatedModelObjects:(id)a4
{
}

- (void)performDeleteEntityChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8)
  {
    int8x16_t v12 = [v8 modelObject];
    if (v12)
    {
      uint64_t v13 = objc_alloc_init(MPMutableSectionedCollection);
      [(MPMutableSectionedCollection *)v13 appendSection:&stru_1EE680640];
      [(MPMutableSectionedCollection *)v13 appendItem:v12];
      id v14 = [(MPModelLibraryTransientStateController *)self registerTransientAddState:2 forModelObjects:v13 relatedModelObjects:v9];
    }
    else
    {
      id v14 = 0;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __110__MPModelLibraryTransientStateController_performDeleteEntityChangeRequest_withRelatedModelObjects_completion___block_invoke;
    v17[3] = &unk_1E57F43B0;
    id v15 = v14;
    id v18 = v15;
    id v19 = self;
    id v20 = v11;
    uint64_t v16 = (void *)[v8 newOperationWithResponseHandler:v17];
    if (v16) {
      [(NSOperationQueue *)self->_operationQueue addOperation:v16];
    }
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __110__MPModelLibraryTransientStateController_performDeleteEntityChangeRequest_withRelatedModelObjects_completion___block_invoke(int8x16_t *a1, void *a2)
{
  id v3 = a2;
  if (a1[2].i64[0])
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__MPModelLibraryTransientStateController_performDeleteEntityChangeRequest_withRelatedModelObjects_completion___block_invoke_2;
    block[3] = &unk_1E57F9F98;
    int8x16_t v7 = a1[2];
    id v5 = (id)v7.i64[0];
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
  uint64_t v6 = a1[3].i64[0];
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __110__MPModelLibraryTransientStateController_performDeleteEntityChangeRequest_withRelatedModelObjects_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterTransientState:*(void *)(a1 + 40)];
}

- (void)performDeleteEntityChangeRequest:(id)a3 withRelatedModelObjects:(id)a4
{
}

- (int64_t)transientFavoriteStateForModelObject:(id)a3
{
  dispatch_time_t v4 = [a3 identifiers];
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke;
    block[3] = &unk_1E57F9F48;
    void block[4] = self;
    id v10 = v4;
    v11 = &v12;
    dispatch_sync(accessQueue, block);
    int64_t v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

void __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 32) reverseObjectEnumerator];
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v26;
    uint64_t v14 = v17;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v26 != v4) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void **)(*((void *)&v25 + 1) + 8 * v5);
      int64_t v7 = objc_msgSend(v6, "modelObjects", v14);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke_2;
      v21[3] = &unk_1E57F4388;
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      id v23 = v6;
      uint64_t v24 = v9;
      id v22 = v8;
      [v7 enumerateItemIdentifiersUsingBlock:v21];
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (!v10)
      {
        v11 = [v6 relatedModelObjects];

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v17[0] = __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke_3;
        v17[1] = &unk_1E57F4388;
        id v12 = *(id *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        id v19 = v6;
        uint64_t v20 = v13;
        id v18 = v12;
        [v11 enumerateItemIdentifiersUsingBlock:v16];

        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int64_t v7 = v11;
      }

      if (v10) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 intersectsSet:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) favoriteState];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 intersectsSet:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) favoriteState];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

- (int64_t)transientKeepLocalStateForModelObject:(id)a3
{
  uint64_t v4 = [a3 identifiers];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke;
    block[3] = &unk_1E57F9F48;
    void block[4] = self;
    id v10 = v4;
    v11 = &v12;
    dispatch_sync(accessQueue, block);
    int64_t v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

void __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 32) reverseObjectEnumerator];
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v26;
    uint64_t v14 = v17;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v26 != v4) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void **)(*((void *)&v25 + 1) + 8 * v5);
      int64_t v7 = objc_msgSend(v6, "modelObjects", v14);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke_2;
      v21[3] = &unk_1E57F4388;
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      id v23 = v6;
      uint64_t v24 = v9;
      id v22 = v8;
      [v7 enumerateItemIdentifiersUsingBlock:v21];
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (!v10)
      {
        v11 = [v6 relatedModelObjects];

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v17[0] = __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke_3;
        v17[1] = &unk_1E57F4388;
        id v12 = *(id *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        id v19 = v6;
        uint64_t v20 = v13;
        id v18 = v12;
        [v11 enumerateItemIdentifiersUsingBlock:v16];

        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int64_t v7 = v11;
      }

      if (v10) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 intersectsSet:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) keepLocalState];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 intersectsSet:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) keepLocalState];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 intersectsSet:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) addState];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 intersectsSet:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) addState];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

- (void)unregisterTransientState:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke;
  block[3] = &unk_1E57F9F98;
  void block[4] = self;
  id v10 = v4;
  id v6 = v4;
  dispatch_barrier_sync(accessQueue, block);
  notificationQueue = self->_notificationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke_3;
  v8[3] = &unk_1E57F9EA8;
  v8[4] = self;
  dispatch_async(notificationQueue, v8);
}

void __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  int64_t v7 = __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke_2;
  id v8 = &unk_1E57F4360;
  id v9 = *(id *)(a1 + 40);
  id v10 = &v11;
  [v2 enumerateObjectsUsingBlock:&v5];
  if (v12[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObjectAtIndex:", v5, v6, v7, v8);
    if (![*(id *)(*(void *)(a1 + 32) + 32) count])
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 32);
      *(void *)(v3 + 32) = 0;
    }
  }

  _Block_object_dispose(&v11, 8);
}

void __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPModelLibraryTransientStateControllerDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int64_t v7 = [a2 token];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)registerTransientFavoriteState:(int64_t)a3 forModelObjects:(id)a4 relatedModelObjects:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__32272;
  long long v27 = __Block_byref_object_dispose__32273;
  id v28 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__MPModelLibraryTransientStateController_registerTransientFavoriteState_forModelObjects_relatedModelObjects___block_invoke;
  block[3] = &unk_1E57F4338;
  v21 = &v23;
  int64_t v22 = a3;
  id v18 = v8;
  id v19 = v9;
  uint64_t v20 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_barrier_sync(accessQueue, block);
  notificationQueue = self->_notificationQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __109__MPModelLibraryTransientStateController_registerTransientFavoriteState_forModelObjects_relatedModelObjects___block_invoke_2;
  v16[3] = &unk_1E57F9EA8;
  void v16[4] = self;
  dispatch_async(notificationQueue, v16);
  id v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v14;
}

void __109__MPModelLibraryTransientStateController_registerTransientFavoriteState_forModelObjects_relatedModelObjects___block_invoke(void *a1)
{
  id v9 = objc_alloc_init(_MPModelLibraryRegisteredTransientState);
  [(_MPModelLibraryRegisteredTransientState *)v9 setFavoriteState:a1[8]];
  [(_MPModelLibraryRegisteredTransientState *)v9 setModelObjects:a1[4]];
  [(_MPModelLibraryRegisteredTransientState *)v9 setRelatedModelObjects:a1[5]];
  uint64_t v2 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [(_MPModelLibraryRegisteredTransientState *)v9 setToken:*(void *)(*(void *)(a1[7] + 8) + 40)];
  uint64_t v5 = *(void **)(a1[6] + 32);
  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = a1[6];
    id v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v6;

    uint64_t v5 = *(void **)(a1[6] + 32);
  }
  [v5 addObject:v9];
}

void __109__MPModelLibraryTransientStateController_registerTransientFavoriteState_forModelObjects_relatedModelObjects___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPModelLibraryTransientStateControllerDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (id)registerTransientKeepLocalState:(int64_t)a3 forModelObjects:(id)a4 relatedModelObjects:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__32272;
  long long v27 = __Block_byref_object_dispose__32273;
  id v28 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__MPModelLibraryTransientStateController_registerTransientKeepLocalState_forModelObjects_relatedModelObjects___block_invoke;
  block[3] = &unk_1E57F4338;
  v21 = &v23;
  int64_t v22 = a3;
  id v18 = v8;
  id v19 = v9;
  uint64_t v20 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_barrier_sync(accessQueue, block);
  notificationQueue = self->_notificationQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __110__MPModelLibraryTransientStateController_registerTransientKeepLocalState_forModelObjects_relatedModelObjects___block_invoke_2;
  v16[3] = &unk_1E57F9EA8;
  void v16[4] = self;
  dispatch_async(notificationQueue, v16);
  id v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v14;
}

void __110__MPModelLibraryTransientStateController_registerTransientKeepLocalState_forModelObjects_relatedModelObjects___block_invoke(void *a1)
{
  id v9 = objc_alloc_init(_MPModelLibraryRegisteredTransientState);
  [(_MPModelLibraryRegisteredTransientState *)v9 setKeepLocalState:a1[8]];
  [(_MPModelLibraryRegisteredTransientState *)v9 setModelObjects:a1[4]];
  [(_MPModelLibraryRegisteredTransientState *)v9 setRelatedModelObjects:a1[5]];
  uint64_t v2 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [(_MPModelLibraryRegisteredTransientState *)v9 setToken:*(void *)(*(void *)(a1[7] + 8) + 40)];
  uint64_t v5 = *(void **)(a1[6] + 32);
  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = a1[6];
    id v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v6;

    uint64_t v5 = *(void **)(a1[6] + 32);
  }
  [v5 addObject:v9];
}

void __110__MPModelLibraryTransientStateController_registerTransientKeepLocalState_forModelObjects_relatedModelObjects___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPModelLibraryTransientStateControllerDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (id)registerTransientAddState:(int64_t)a3 forModelObjects:(id)a4 relatedModelObjects:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__32272;
  long long v27 = __Block_byref_object_dispose__32273;
  id v28 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__MPModelLibraryTransientStateController_registerTransientAddState_forModelObjects_relatedModelObjects___block_invoke;
  block[3] = &unk_1E57F4338;
  v21 = &v23;
  int64_t v22 = a3;
  id v18 = v8;
  id v19 = v9;
  uint64_t v20 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_barrier_sync(accessQueue, block);
  notificationQueue = self->_notificationQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __104__MPModelLibraryTransientStateController_registerTransientAddState_forModelObjects_relatedModelObjects___block_invoke_2;
  v16[3] = &unk_1E57F9EA8;
  void v16[4] = self;
  dispatch_async(notificationQueue, v16);
  id v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v14;
}

void __104__MPModelLibraryTransientStateController_registerTransientAddState_forModelObjects_relatedModelObjects___block_invoke(void *a1)
{
  id v9 = objc_alloc_init(_MPModelLibraryRegisteredTransientState);
  [(_MPModelLibraryRegisteredTransientState *)v9 setAddState:a1[8]];
  [(_MPModelLibraryRegisteredTransientState *)v9 setModelObjects:a1[4]];
  [(_MPModelLibraryRegisteredTransientState *)v9 setRelatedModelObjects:a1[5]];
  uint64_t v2 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [(_MPModelLibraryRegisteredTransientState *)v9 setToken:*(void *)(*(void *)(a1[7] + 8) + 40)];
  uint64_t v5 = *(void **)(a1[6] + 32);
  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = a1[6];
    id v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v6;

    uint64_t v5 = *(void **)(a1[6] + 32);
  }
  [v5 addObject:v9];
}

void __104__MPModelLibraryTransientStateController_registerTransientAddState_forModelObjects_relatedModelObjects___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPModelLibraryTransientStateControllerDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)addOperation:(id)a3
{
}

@end