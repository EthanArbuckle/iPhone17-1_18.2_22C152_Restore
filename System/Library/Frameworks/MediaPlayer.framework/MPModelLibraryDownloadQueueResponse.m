@interface MPModelLibraryDownloadQueueResponse
- (MPModelLibraryDownloadQueueResponse)initWithRequest:(id)a3;
- (void)dealloc;
- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4;
@end

@implementation MPModelLibraryDownloadQueueResponse

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke;
    block[3] = &unk_1E57F8408;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MPModelLibraryDownloadQueueResponse;
    [(MPModelResponse *)&v13 getChangeDetailsFromPreviousResponse:v6 completion:v7];
  }
}

void __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke(id *a1)
{
  id v2 = a1[4];
  v3 = [v2 results];
  v4 = [a1[5] results];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke_2;
  v13[3] = &unk_1E57F6F18;
  id v5 = v3;
  id v14 = v5;
  id v15 = v4;
  id v6 = v4;
  id v7 = [v5 changeDetailsToSectionedCollection:v6 isEqualBlock:v13 isUpdatedBlock:&__block_literal_global_43848];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke_4;
  v10[3] = &unk_1E57F9140;
  id v8 = a1[6];
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((unint64_t)[v5 length] >= 2)
  {
    id v8 = [*(id *)(a1 + 32) identifiersForItemAtIndexPath:v5];
    id v9 = [*(id *)(a1 + 40) identifiersForItemAtIndexPath:v6];
    uint64_t v7 = [v8 isEqual:v9];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke_3()
{
  return 0;
}

- (void)dealloc
{
  v3 = +[MPMediaDownloadManager sharedManager];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPModelLibraryDownloadQueueResponse;
  [(MPModelLibraryDownloadQueueResponse *)&v4 dealloc];
}

- (MPModelLibraryDownloadQueueResponse)initWithRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPModelLibraryDownloadQueueResponse;
  id v5 = [(MPModelResponse *)&v8 initWithRequest:v4];
  if (v5)
  {
    id v6 = +[MPMediaDownloadManager sharedManager];
    [v6 registerObserver:v5];
  }
  return v5;
}

@end