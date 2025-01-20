@interface ENChaffTestResultSession
+ (id)sessionWithConfiguration:(id)a3 URLSession:(id)a4 queue:(id)a5 error:(id *)a6;
- (ENRegion)region;
- (NSString)agencyAPIKey;
- (NSURL)certificateURL;
- (NSURL)uploadURL;
- (NSURL)verificationURL;
- (id)_initWithAgencyAPIKey:(id)a3 certificateURL:(id)a4 queue:(id)a5 region:(id)a6 uploadURL:(id)a7 URLSession:(id)a8 verifyURL:(id)a9;
- (void)_callCompletionIfNecessaryWithError:(id)a3;
- (void)_invalidate;
- (void)_sendCertificateChaffRequest;
- (void)_sendChaffRequestWithURL:(id)a3 useAPIKey:(BOOL)a4 successHandler:(id)a5;
- (void)_sendUploadChaffRequest;
- (void)_sendVerificationChaffRequest;
- (void)dealloc;
- (void)sendChaffMessagesWithCompletion:(id)a3;
@end

@implementation ENChaffTestResultSession

- (id)_initWithAgencyAPIKey:(id)a3 certificateURL:(id)a4 queue:(id)a5 region:(id)a6 uploadURL:(id)a7 URLSession:(id)a8 verifyURL:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v34.receiver = self;
  v34.super_class = (Class)ENChaffTestResultSession;
  v22 = [(ENChaffTestResultSession *)&v34 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    agencyAPIKey = v22->_agencyAPIKey;
    v22->_agencyAPIKey = (NSString *)v23;

    objc_storeStrong((id *)&v22->_queue, a5);
    uint64_t v25 = [v18 copy];
    region = v22->_region;
    v22->_region = (ENRegion *)v25;

    objc_storeStrong((id *)&v22->_URLSession, a8);
    uint64_t v27 = [v16 copy];
    certificateURL = v22->_certificateURL;
    v22->_certificateURL = (NSURL *)v27;

    uint64_t v29 = [v19 copy];
    uploadURL = v22->_uploadURL;
    v22->_uploadURL = (NSURL *)v29;

    uint64_t v31 = [v21 copy];
    verificationURL = v22->_verificationURL;
    v22->_verificationURL = (NSURL *)v31;
  }
  return v22;
}

- (void)dealloc
{
  [(ENChaffTestResultSession *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ENChaffTestResultSession;
  [(ENChaffTestResultSession *)&v3 dealloc];
}

+ (id)sessionWithConfiguration:(id)a3 URLSession:(id)a4 queue:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v10 testVerificationAPIKey];
  if (v13)
  {
    v14 = [v10 testVerificationCertificateURL];
    if (v14)
    {
      id v15 = [v10 testVerificationURL];
      if (v15)
      {
        id v16 = [v10 tekUploadURL];
        if (v16)
        {
          id v17 = objc_alloc((Class)a1);
          id v18 = [v10 region];
          id v19 = (void *)[v17 _initWithAgencyAPIKey:v13 certificateURL:v14 queue:v12 region:v18 uploadURL:v16 URLSession:v11 verifyURL:v15];
        }
        else if (a6)
        {
          ENTestResultErrorF(10);
          id v19 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v19 = 0;
        }
      }
      else if (a6)
      {
        ENTestResultErrorF(10);
        id v19 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = 0;
      }
    }
    else if (a6)
    {
      ENTestResultErrorF(10);
      id v19 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = 0;
    }
  }
  else if (a6)
  {
    ENTestResultErrorF(10);
    id v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)_invalidate
{
  if (self->_state <= 4)
  {
    self->_state = 5;
    [(ENTestResultNetworkRequest *)self->_networkRequest invalidate];
    networkRequest = self->_networkRequest;
    self->_networkRequest = 0;

    ENTestResultErrorF(5);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ENChaffTestResultSession *)self _callCompletionIfNecessaryWithError:v4];
  }
}

- (void)sendChaffMessagesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  int64_t state = self->_state;
  v9 = v4;
  if (state)
  {
    v8 = ENErrorF();
    v9[2](v9, v8);
  }
  else
  {
    v6 = (void *)[v4 copy];
    id completion = self->_completion;
    self->_id completion = v6;

    [(ENChaffTestResultSession *)self _sendVerificationChaffRequest];
  }
}

- (void)_sendVerificationChaffRequest
{
  if (self->_state <= 0)
  {
    self->_int64_t state = 1;
    objc_super v3 = [(ENChaffTestResultSession *)self verificationURL];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__ENChaffTestResultSession__sendVerificationChaffRequest__block_invoke;
    v4[3] = &unk_1E69ACA50;
    v4[4] = self;
    [(ENChaffTestResultSession *)self _sendChaffRequestWithURL:v3 useAPIKey:1 successHandler:v4];
  }
}

void __57__ENChaffTestResultSession__sendVerificationChaffRequest__block_invoke(uint64_t a1)
{
  double v2 = (double)(arc4random_uniform(0x78u) + 60);
  CFPrefs_GetDouble();
  if (v3 != 0.0) {
    double v2 = v3;
  }
  id v4 = [MEMORY[0x1E4F28F88] processInfo];
  v5 = [v4 environment];
  v6 = [v5 objectForKey:@"XCTestSessionIdentifier"];

  if (v6) {
    int64_t v7 = 100000000;
  }
  else {
    int64_t v7 = (uint64_t)(v2 * 1000000000.0);
  }
  dispatch_time_t v8 = dispatch_time(0, v7);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ENChaffTestResultSession__sendVerificationChaffRequest__block_invoke_2;
  block[3] = &unk_1E69ACA50;
  block[4] = v9;
  dispatch_after(v8, v10, block);
}

uint64_t __57__ENChaffTestResultSession__sendVerificationChaffRequest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCertificateChaffRequest];
}

- (void)_sendCertificateChaffRequest
{
  if (self->_state <= 1)
  {
    self->_int64_t state = 2;
    double v3 = [(ENChaffTestResultSession *)self certificateURL];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__ENChaffTestResultSession__sendCertificateChaffRequest__block_invoke;
    v4[3] = &unk_1E69ACA50;
    v4[4] = self;
    [(ENChaffTestResultSession *)self _sendChaffRequestWithURL:v3 useAPIKey:1 successHandler:v4];
  }
}

uint64_t __56__ENChaffTestResultSession__sendCertificateChaffRequest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendUploadChaffRequest];
}

- (void)_sendUploadChaffRequest
{
  if (self->_state <= 2)
  {
    self->_int64_t state = 3;
    double v3 = [(ENChaffTestResultSession *)self uploadURL];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__ENChaffTestResultSession__sendUploadChaffRequest__block_invoke;
    v4[3] = &unk_1E69ACA50;
    v4[4] = self;
    [(ENChaffTestResultSession *)self _sendChaffRequestWithURL:v3 useAPIKey:0 successHandler:v4];
  }
}

uint64_t __51__ENChaffTestResultSession__sendUploadChaffRequest__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = 4;
  return [*(id *)(a1 + 32) _callCompletionIfNecessaryWithError:0];
}

- (void)_sendChaffRequestWithURL:(id)a3 useAPIKey:(BOOL)a4 successHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(ENTestResultNetworkRequest *)[ENTestResultChaffRequest alloc] initWithRequestURL:v9 URLSession:self->_URLSession queue:self->_queue];

  [(ENTestResultNetworkRequest *)v10 setPaddedRequestSize:3072];
  if (v5) {
    agencyAPIKey = self->_agencyAPIKey;
  }
  else {
    agencyAPIKey = 0;
  }
  [(ENTestResultNetworkRequest *)v10 setAPIKey:agencyAPIKey];
  networkRequest = self->_networkRequest;
  self->_networkRequest = &v10->super;
  v13 = v10;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__ENChaffTestResultSession__sendChaffRequestWithURL_useAPIKey_successHandler___block_invoke;
  v15[3] = &unk_1E69ACA78;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [(ENTestResultNetworkRequest *)v13 resumeWithCompletionHandler:v15];
}

void __78__ENChaffTestResultSession__sendChaffRequestWithURL_useAPIKey_successHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;

  if (v6)
  {
    [*(id *)(a1 + 32) _callCompletionIfNecessaryWithError:v6];
    [*(id *)(a1 + 32) invalidate];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_callCompletionIfNecessaryWithError:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void (**)(void, void))MEMORY[0x1D9439FF0](self->_completion);
  if (v4)
  {
    id completion = self->_completion;
    self->_id completion = 0;

    ((void (**)(void, id))v4)[2](v4, v6);
  }
}

- (ENRegion)region
{
  return self->_region;
}

- (NSString)agencyAPIKey
{
  return self->_agencyAPIKey;
}

- (NSURL)certificateURL
{
  return self->_certificateURL;
}

- (NSURL)verificationURL
{
  return self->_verificationURL;
}

- (NSURL)uploadURL
{
  return self->_uploadURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadURL, 0);
  objc_storeStrong((id *)&self->_verificationURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_agencyAPIKey, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_networkRequest, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end