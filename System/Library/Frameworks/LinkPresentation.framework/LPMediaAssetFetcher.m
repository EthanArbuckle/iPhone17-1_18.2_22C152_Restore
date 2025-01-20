@interface LPMediaAssetFetcher
- (BOOL)shouldDownloadIfPossible;
- (LPMediaAssetFetcher)init;
- (NSURL)URL;
- (id)audioProperties;
- (id)videoProperties;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_completedWithAudio:(id)a3;
- (void)_completedWithVideo:(id)a3;
- (void)_resolveVideo;
- (void)cancel;
- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setShouldDownloadIfPossible:(BOOL)a3;
- (void)setURL:(id)a3;
- (void)stopLoading;
@end

@implementation LPMediaAssetFetcher

- (LPMediaAssetFetcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPMediaAssetFetcher;
  v2 = [(LPFetcher *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldDownloadIfPossible = 1;
    v4 = v2;
  }

  return v3;
}

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_loadingIsNonAppInitiated = [v6 loadingIsNonAppInitiated];
  v8 = _Block_copy(v7);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v8;

  self->_fetchIsNotUserInitiated = [v6 fetchIsNotUserInitiated];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__LPMediaAssetFetcher_fetchWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E5B04DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__LPMediaAssetFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolveVideo];
}

- (void)_resolveVideo
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(LPMediaAssetFetcher *)self URL];

  if (v3)
  {
    v4 = [(LPMediaAssetFetcher *)self URL];
    BOOL v5 = +[LPPresentationSpecializations isYouTubeEmbedURL:v4];

    if (v5)
    {
      self->_hasAudio = 1;
      id v6 = [LPVideo alloc];
      id v23 = [(LPMediaAssetFetcher *)self URL];
      id v7 = [(LPMediaAssetFetcher *)self videoProperties];
      v8 = [(LPVideo *)v6 initWithYouTubeURL:v23 properties:v7];
      [(LPMediaAssetFetcher *)self _completedWithVideo:v8];
    }
    else if (self->_fetchIsNotUserInitiated)
    {
      v9 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v25 = [(LPFetcher *)self _loggingID];
        _os_log_impl(&dword_1A35DC000, v9, OS_LOG_TYPE_DEFAULT, "LPMediaAssetFetcher<%d>: forcing video to stream instead of downloading", buf, 8u);
      }

      v10 = [LPVideo alloc];
      v11 = [(LPMediaAssetFetcher *)self URL];
      v12 = [(LPMediaAssetFetcher *)self videoProperties];
      v13 = [(LPVideo *)v10 initWithStreamingURL:v11 properties:v12];
      [(LPMediaAssetFetcher *)self _completedWithVideo:v13];
    }
    else
    {
      v14 = [(LPMediaAssetFetcher *)self URL];
      v15 = +[LPTestingOverrides customLoader];

      if (v15)
      {
        v16 = +[LPTestingOverrides customLoader];
        uint64_t v17 = [v16 overrideURLForMediaURL:v14];

        v14 = (void *)v17;
      }
      v18 = [MEMORY[0x1E4F166C8] assetWithURL:v14];
      asset = self->_asset;
      self->_asset = v18;

      v20 = +[LPTestingOverrides customLoader];

      if (v20)
      {
        v21 = +[LPTestingOverrides customLoader];
        v22 = [(AVURLAsset *)self->_asset resourceLoader];
        [v21 installCustomMediaLoader:v22];
      }
      -[AVURLAsset loadValuesAsynchronouslyForKeys:completionHandler:](self->_asset, "loadValuesAsynchronouslyForKeys:completionHandler:");
    }
  }
  else
  {
    [(LPMediaAssetFetcher *)self _completedWithVideo:0];
  }
}

void __36__LPMediaAssetFetcher__resolveVideo__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__LPMediaAssetFetcher__resolveVideo__block_invoke_2;
  v4[3] = &unk_1E5B04E18;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __36__LPMediaAssetFetcher__resolveVideo__block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*(void *)(a1 + 40) + 48) statusOfValueForKey:*(void *)(*((void *)&v25 + 1) + 8 * i) error:0] != 2)
        {
          [*(id *)(a1 + 40) _completedWithVideo:0];

          return;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  char v6 = [*(id *)(*(void *)(a1 + 40) + 48) isPlayable];
  id v7 = *(id **)(a1 + 40);
  if (v6)
  {
    v8 = [v7[6] tracksWithMediaCharacteristic:*MEMORY[0x1E4F15B00]];
    *(unsigned char *)(*(void *)(a1 + 40) + 56) = [v8 count] != 0;

    uint64_t v9 = *(void *)(a1 + 40);
    v10 = *(void **)(v9 + 48);
    if (v10 && ([v10 duration], uint64_t v9 = *(void *)(a1 + 40), (v24 & 0x1D) == 1) && *(unsigned char *)(v9 + 90))
    {
      v11 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
      v12 = +[LPTestingOverrides customLoader];

      if (v12)
      {
        v13 = +[LPTestingOverrides customLoader];
        [v13 installCustomURLSessionLoader:v11];
      }
      uint64_t v14 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v11 delegate:*(void *)(a1 + 40) delegateQueue:0];
      uint64_t v15 = *(void *)(a1 + 40);
      v16 = *(void **)(v15 + 72);
      *(void *)(v15 + 72) = v14;

      uint64_t v17 = [*(id *)(a1 + 40) URL];
      v18 = objc_msgSend(v17, "_lp_requestWithAttribution:", *(unsigned __int8 *)(*(void *)(a1 + 40) + 88));

      v19 = [*(id *)(*(void *)(a1 + 40) + 72) dataTaskWithRequest:v18];
      [v19 resume];
    }
    else
    {
      v20 = [LPVideo alloc];
      v21 = [*(id *)(a1 + 40) URL];
      v22 = [*(id *)(a1 + 40) videoProperties];
      id v23 = [(LPVideo *)v20 initWithStreamingURL:v21 properties:v22];
      [(id)v9 _completedWithVideo:v23];
    }
  }
  else
  {
    [v7 _completedWithVideo:0];
  }
}

- (void)stopLoading
{
  [(AVURLAsset *)self->_asset cancelLoading];
  session = self->_session;

  [(NSURLSession *)session invalidateAndCancel];
}

- (void)cancel
{
  [(LPMediaAssetFetcher *)self stopLoading];
  asset = self->_asset;
  self->_asset = 0;

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)_completedWithVideo:(id)a3
{
  id v4 = a3;
  [(LPMediaAssetFetcher *)self stopLoading];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__LPMediaAssetFetcher__completedWithVideo___block_invoke;
  v6[3] = &unk_1E5B04E18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __43__LPMediaAssetFetcher__completedWithVideo___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(const void **)(v2 + 40);
  if (v3)
  {
    id v4 = (void (**)(void *, LPFetcherVideoResponse *))_Block_copy(v3);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      char v6 = [[LPFetcherVideoResponse alloc] initWithVideo:*(void *)(a1 + 40) fetcher:*(void *)(a1 + 32)];
      id v7 = v6;
    }
    else
    {
      v8 = [LPFetcherErrorResponse alloc];
      id v7 = makeLPError(2, 0);
      char v6 = [(LPFetcherErrorResponse *)v8 initWithError:v7 fetcher:*(void *)(a1 + 32)];
    }
    uint64_t v9 = v6;
    v4[2](v4, v6);
    if (!v5) {

    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v10 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

- (void)_completedWithAudio:(id)a3
{
  id v4 = a3;
  [(LPMediaAssetFetcher *)self stopLoading];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__LPMediaAssetFetcher__completedWithAudio___block_invoke;
  v6[3] = &unk_1E5B04E18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __43__LPMediaAssetFetcher__completedWithAudio___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      id v4 = [[LPFetcherAudioResponse alloc] initWithAudio:*(void *)(a1 + 40) fetcher:*(void *)(a1 + 32)];
      id v5 = v4;
    }
    else
    {
      char v6 = [LPFetcherErrorResponse alloc];
      id v5 = makeLPError(2, 0);
      id v4 = [(LPFetcherErrorResponse *)v6 initWithError:v5 fetcher:*(void *)(a1 + 32)];
    }
    id v7 = v4;
    (*(void (**)(uint64_t, LPFetcherAudioResponse *))(v2 + 16))(v2, v4);
    if (!v3) {
  }
    }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

- (id)videoProperties
{
  uint64_t v3 = [(id)objc_opt_class() videoPropertiesForFetcher:self];
  [v3 setHasAudio:self->_hasAudio];

  return v3;
}

- (id)audioProperties
{
  uint64_t v3 = objc_opt_class();

  return (id)[v3 audioPropertiesForFetcher:self];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v16 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(id, uint64_t))a6;
  if ([v16 countOfBytesExpectedToReceive] <= 10485760
    && [v16 countOfBytesReceived] <= 10485760)
  {
    v12 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    receivedData = self->_receivedData;
    self->_receivedData = v12;

    uint64_t v14 = [v9 MIMEType];
    MIMEType = self->_MIMEType;
    self->_MIMEType = v14;

    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v10[2](v10, v11);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  if ([v8 countOfBytesExpectedToReceive] <= 10485760
    && [v8 countOfBytesReceived] <= 10485760)
  {
    [(NSMutableData *)self->_receivedData appendData:v7];
  }
  else
  {
    [v8 cancel];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__LPMediaAssetFetcher_URLSession_task_didCompleteWithError___block_invoke;
  v8[3] = &unk_1E5B04E18;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __60__LPMediaAssetFetcher_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 40)) {
    return;
  }
  BOOL v3 = *(void *)(a1 + 40)
    || ![*(id *)(v1 + 80) length]
    || (unint64_t)[*(id *)(*(void *)(a1 + 32) + 80) length] > 0xA00000;
  BOOL v4 = +[LPMIMETypeRegistry isHLSType:*(void *)(*(void *)(a1 + 32) + 64)];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    *(unsigned char *)(v5 + 56) = 1;
LABEL_9:
    id v7 = *(void **)(a1 + 32);
    id v8 = [LPVideo alloc];
    id v21 = [*(id *)(a1 + 32) URL];
    id v9 = [*(id *)(a1 + 32) videoProperties];
    uint64_t v10 = [(LPVideo *)v8 initWithStreamingURL:v21 properties:v9];
    [v7 _completedWithVideo:v10];
LABEL_10:

LABEL_11:

    return;
  }
  id v20 = [*(id *)(v5 + 48) tracksWithMediaCharacteristic:*MEMORY[0x1E4F15B98]];
  uint64_t v6 = [v20 count];

  if (v6)
  {
    if (!v3)
    {
      v13 = *(void **)(a1 + 32);
      uint64_t v14 = [LPVideo alloc];
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = v15[10];
      uint64_t v17 = v15[8];
      id v21 = [v15 videoProperties];
      v18 = -[LPVideo initWithData:MIMEType:properties:](v14, "initWithData:MIMEType:properties:", v16, v17);
      [v13 _completedWithVideo:v18];

      goto LABEL_11;
    }
    goto LABEL_9;
  }
  uint64_t v11 = *(unsigned char **)(a1 + 32);
  if (v11[56])
  {
    v12 = [LPAudio alloc];
    id v21 = [*(id *)(a1 + 32) URL];
    id v9 = [*(id *)(a1 + 32) audioProperties];
    uint64_t v10 = [(LPAudio *)v12 initWithStreamingURL:v21 properties:v9];
    [v11 _completedWithAudio:v10];
    goto LABEL_10;
  }
  v19 = *(void **)(a1 + 32);

  [v19 _completedWithVideo:0];
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (BOOL)shouldDownloadIfPossible
{
  return self->_shouldDownloadIfPossible;
}

- (void)setShouldDownloadIfPossible:(BOOL)a3
{
  self->_shouldDownloadIfPossible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end