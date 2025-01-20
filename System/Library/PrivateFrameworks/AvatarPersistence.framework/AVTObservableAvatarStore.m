@interface AVTObservableAvatarStore
+ (unint64_t)maximumNumberOfFetchableAvatars;
+ (unint64_t)maximumNumberOfSavableAvatars;
- (AVTAvatarStoreDelegate)delegate;
- (AVTAvatarStoreInternal)store;
- (AVTObservableAvatarStore)initWithStore:(id)a3 callbackQueue:(id)a4;
- (BOOL)canCreateAvatar;
- (BOOL)canCreateAvatarWithError:(id *)a3;
- (OS_dispatch_queue)callbackQueue;
- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4;
- (id)recentStickersForFetchRequest:(id)a3 error:(id *)a4;
- (void)deleteAvatar:(id)a3 completionHandler:(id)a4;
- (void)deleteAvatarWithIdentifier:(id)a3 completionBlock:(id)a4;
- (void)deleteRecentStickersForChangeTracker:(id)a3 completionHandler:(id)a4;
- (void)deleteRecentStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5;
- (void)didUseStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5;
- (void)duplicateAvatar:(id)a3 completionBlock:(id)a4;
- (void)fetchAvatarsForFetchRequest:(id)a3 completionHandler:(id)a4;
- (void)saveAvatarRecord:(id)a3 thumbnailAvatar:(id)a4 completionBlock:(id)a5 thumbnailGenerationCompletionBlock:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation AVTObservableAvatarStore

- (AVTObservableAvatarStore)initWithStore:(id)a3 callbackQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTObservableAvatarStore;
  v9 = [(AVTObservableAvatarStore *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_callbackQueue, a4);
  }

  return v10;
}

- (BOOL)canCreateAvatar
{
  return [(AVTObservableAvatarStore *)self canCreateAvatarWithError:0];
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  v4 = [(AVTObservableAvatarStore *)self store];
  LOBYTE(a3) = [v4 canCreateAvatarWithError:a3];

  return (char)a3;
}

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(AVTObservableAvatarStore *)self store];
  id v8 = [v7 avatarsForFetchRequest:v6 error:a4];

  return v8;
}

- (void)fetchAvatarsForFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AVTObservableAvatarStore *)self store];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__AVTObservableAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke;
  v10[3] = &unk_2647C3CC0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchAvatarsForFetchRequest:v7 completionHandler:v10];
}

void __74__AVTObservableAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__AVTObservableAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke_2;
  block[3] = &unk_2647C3C98;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __74__AVTObservableAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deleteAvatar:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 identifier];
  [(AVTObservableAvatarStore *)self deleteAvatarWithIdentifier:v7 completionBlock:v6];
}

- (void)deleteAvatarWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVTObservableAvatarStore *)self store];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke;
  v11[3] = &unk_2647C3D38;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 deleteAvatarWithIdentifier:v10 completionBlock:v11];
}

void __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_2;
  block[3] = &unk_2647C3D10;
  char v14 = a2;
  id v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v11 = v7;
  id v8 = *(id *)(a1 + 48);
  id v12 = v5;
  id v13 = v8;
  id v9 = v5;
  dispatch_async(v6, block);
}

void __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__2;
  id v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      v4 = [*(id *)(a1 + 32) delegate];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_4;
      v8[3] = &unk_2647C3CE8;
      v8[4] = &v9;
      [v4 store:v5 didDeleteAvatarWithIdentifier:v6 postCompletionHandler:v8];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v7 = v10[5];
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = MEMORY[0x22A660070](a2);

  return MEMORY[0x270F9A758]();
}

- (void)saveAvatarRecord:(id)a3 thumbnailAvatar:(id)a4 completionBlock:(id)a5 thumbnailGenerationCompletionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = [(AVTObservableAvatarStore *)self store];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke;
  v17[3] = &unk_2647C3D38;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v15 = v11;
  id v16 = v10;
  [v14 saveAvatarRecord:v16 thumbnailAvatar:v13 completionBlock:v17 thumbnailGenerationCompletionBlock:v12];
}

void __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_2;
  block[3] = &unk_2647C3D10;
  char v14 = a2;
  uint64_t v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v11 = v7;
  id v8 = *(id *)(a1 + 48);
  id v12 = v5;
  id v13 = v8;
  id v9 = v5;
  dispatch_async(v6, block);
}

void __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__2;
  id v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      v4 = [*(id *)(a1 + 32) delegate];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_3;
      v8[3] = &unk_2647C3CE8;
      v8[4] = &v9;
      [v4 store:v5 didSaveAvatar:v6 postCompletionHandler:v8];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v7 = v10[5];
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = MEMORY[0x22A660070](a2);

  return MEMORY[0x270F9A758]();
}

- (void)duplicateAvatar:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVTObservableAvatarStore *)self store];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke;
  v11[3] = &unk_2647C3D88;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 duplicateAvatar:v10 completionBlock:v11];
}

void __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) callbackQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke_2;
  v14[3] = &unk_2647C3D60;
  char v19 = a2;
  id v10 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v7;
  id v16 = v10;
  id v11 = *(id *)(a1 + 48);
  id v17 = v8;
  id v18 = v11;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v9, v14);
}

void __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__2;
  id v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  if (*(unsigned char *)(a1 + 72))
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      v4 = [*(id *)(a1 + 32) delegate];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke_3;
      v9[3] = &unk_2647C3CE8;
      v9[4] = &v10;
      [v4 store:v5 didCreateDuplicateAvatar:v6 forOriginal:v7 postCompletionHandler:v9];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  uint64_t v8 = v11[5];
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = MEMORY[0x22A660070](a2);

  return MEMORY[0x270F9A758]();
}

+ (unint64_t)maximumNumberOfSavableAvatars
{
  return +[AVTPAvatarStore maximumNumberOfSavableAvatars];
}

+ (unint64_t)maximumNumberOfFetchableAvatars
{
  return +[AVTPAvatarStore maximumNumberOfFetchableAvatars];
}

- (void)deleteRecentStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AVTObservableAvatarStore *)self store];
  [v11 deleteRecentStickersWithAvatarIdentifier:v10 stickerIdentifier:v9 completionHandler:v8];
}

- (void)didUseStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AVTObservableAvatarStore *)self store];
  [v11 didUseStickerWithAvatarIdentifier:v10 stickerIdentifier:v9 completionHandler:v8];
}

- (id)recentStickersForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(AVTObservableAvatarStore *)self store];
  id v8 = [v7 recentStickersForFetchRequest:v6 error:a4];

  return v8;
}

- (void)deleteRecentStickersForChangeTracker:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AVTObservableAvatarStore *)self store];
  [v8 deleteRecentStickersForChangeTracker:v7 completionHandler:v6];
}

- (AVTAvatarStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVTAvatarStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarStoreInternal)store
{
  return self->_store;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end