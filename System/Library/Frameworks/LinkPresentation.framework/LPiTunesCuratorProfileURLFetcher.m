@interface LPiTunesCuratorProfileURLFetcher
- (LPiTunesCuratorProfileURLFetcher)initWithCuratorID:(id)a3;
- (NSString)curatorID;
- (void)_completedWithResponse:(id)a3;
- (void)_failedWithError:(id)a3;
- (void)cancel;
- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation LPiTunesCuratorProfileURLFetcher

- (LPiTunesCuratorProfileURLFetcher)initWithCuratorID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPiTunesCuratorProfileURLFetcher;
  v6 = [(LPFetcher *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_curatorID, a3);
    v8 = v7;
  }

  return v7;
}

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  id v8 = a4;
  v9 = _Block_copy(v8);

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v9;

  if (self->_curatorID)
  {
    v11 = [[LPiTunesMediaLookupTask alloc] initWithIdentifier:self->_curatorID storefrontCountryCode:0];
    lookupTask = self->_lookupTask;
    self->_lookupTask = v11;

    v13 = self->_lookupTask;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__LPiTunesCuratorProfileURLFetcher_fetchWithConfiguration_completionHandler___block_invoke;
    v14[3] = &unk_1E5B05790;
    v14[4] = self;
    [(LPiTunesMediaLookupTask *)v13 start:v14];
  }
}

void __77__LPiTunesCuratorProfileURLFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__LPiTunesCuratorProfileURLFetcher_fetchWithConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_1E5B05AF8;
  block[4] = *(void *)(a1 + 32);
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__LPiTunesCuratorProfileURLFetcher_fetchWithConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  v4 = *(unsigned char **)(a1 + 32);
  if (!v4[72])
  {
    if (*(void *)(a1 + 40))
    {
      objc_msgSend(v4, "_failedWithError:");
    }
    else
    {
      id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"shortUrl"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
        id v6 = *(void **)(a1 + 32);
        if (v5)
        {
          id v7 = [[LPFetcherURLResponse alloc] initWithURL:v5 fetcher:*(void *)(a1 + 32)];
          [v6 _completedWithResponse:v7];
        }
        else
        {
          [*(id *)(a1 + 32) _failedWithError:0];
        }
      }
      else
      {
        [*(id *)(a1 + 32) _failedWithError:0];
      }
    }
  }
}

- (void)cancel
{
  self->_cancelled = 1;
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)_failedWithError:(id)a3
{
  id v5 = a3;
  v4 = [[LPFetcherErrorResponse alloc] initWithError:v5 fetcher:self];
  [(LPiTunesCuratorProfileURLFetcher *)self _completedWithResponse:v4];
}

- (void)_completedWithResponse:(id)a3
{
  id v4 = a3;
  id completionHandler = (void (**)(void))self->_completionHandler;
  id v7 = v4;
  if (completionHandler)
  {
    completionHandler[2]();
    id v6 = self->_completionHandler;
  }
  else
  {
    id v6 = 0;
  }
  self->_id completionHandler = 0;
}

- (NSString)curatorID
{
  return self->_curatorID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupTask, 0);
  objc_storeStrong((id *)&self->_curatorID, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end