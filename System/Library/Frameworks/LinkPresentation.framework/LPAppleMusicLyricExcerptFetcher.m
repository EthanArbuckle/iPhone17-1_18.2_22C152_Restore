@interface LPAppleMusicLyricExcerptFetcher
- (LPAppleMusicLyricExcerptFetcher)init;
- (MPStoreLyricsSnippetURLComponents)lyricComponents;
- (void)cancel;
- (void)completedWithLyrics:(id)a3;
- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setLyricComponents:(id)a3;
@end

@implementation LPAppleMusicLyricExcerptFetcher

- (LPAppleMusicLyricExcerptFetcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPAppleMusicLyricExcerptFetcher;
  v2 = [(LPFetcher *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v5;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__LPAppleMusicLyricExcerptFetcher_fetchWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E5B04DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__LPAppleMusicLyricExcerptFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v2 = (void *)getMPStoreLyricsSnippetRequestClass_softClass;
  uint64_t v13 = getMPStoreLyricsSnippetRequestClass_softClass;
  if (!getMPStoreLyricsSnippetRequestClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getMPStoreLyricsSnippetRequestClass_block_invoke;
    v9[3] = &unk_1E5B04EB8;
    v9[4] = &v10;
    __getMPStoreLyricsSnippetRequestClass_block_invoke((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  v3 = v2;
  _Block_object_dispose(&v10, 8);
  v4 = (void *)[[v3 alloc] init];
  [v4 setSnippetURL:*(void *)(*(void *)(a1 + 32) + 56)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__LPAppleMusicLyricExcerptFetcher_fetchWithConfiguration_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5B05898;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v5 = [v4 newOperationWithResponseHandler:v8];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  [*(id *)(*(void *)(a1 + 32) + 48) start];
}

void __76__LPAppleMusicLyricExcerptFetcher_fetchWithConfiguration_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12)
  {
    uint64_t v6 = objc_alloc_init(LPLyricExcerptMetadata);
    v7 = NSNumber;
    [*(id *)(*(void *)(a1 + 32) + 56) startTime];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [(LPLyricExcerptMetadata *)v6 setStartTime:v8];

    v9 = NSNumber;
    [*(id *)(*(void *)(a1 + 32) + 56) endTime];
    uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
    [(LPLyricExcerptMetadata *)v6 setEndTime:v10];

    v11 = [*(id *)(*(void *)(a1 + 32) + 56) language];
    [(LPLyricExcerptMetadata *)v6 setLanguage:v11];

    [(LPLyricExcerptMetadata *)v6 setLyrics:v12];
    [*(id *)(a1 + 32) completedWithLyrics:v6];
  }
  else
  {
    [*(id *)(a1 + 32) completedWithLyrics:0];
  }
}

- (void)cancel
{
  [(NSOperation *)self->_operation cancel];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)completedWithLyrics:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__LPAppleMusicLyricExcerptFetcher_completedWithLyrics___block_invoke;
  v6[3] = &unk_1E5B04E18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __55__LPAppleMusicLyricExcerptFetcher_completedWithLyrics___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    id v4 = (void (**)(void *, LPFetcherLyricsResponse *))_Block_copy(v3);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = [[LPFetcherLyricsResponse alloc] initWithLyrics:*(void *)(a1 + 40) fetcher:*(void *)(a1 + 32)];
      id v7 = v6;
    }
    else
    {
      v8 = [LPFetcherErrorResponse alloc];
      id v7 = makeLPError(2, 0);
      uint64_t v6 = [(LPFetcherErrorResponse *)v8 initWithError:v7 fetcher:*(void *)(a1 + 32)];
    }
    v9 = v6;
    v4[2](v4, v6);
    if (!v5) {

    }
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
  }
  *(void *)(v2 + 40) = 0;
}

- (MPStoreLyricsSnippetURLComponents)lyricComponents
{
  return self->_lyricComponents;
}

- (void)setLyricComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricComponents, 0);
  objc_storeStrong((id *)&self->_operation, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end