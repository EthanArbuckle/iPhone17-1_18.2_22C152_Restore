@interface AAUIImageFetcher
+ (id)sharedImageFetcher;
- (id)_urlSession;
- (void)fetchImageAtURL:(id)a3 completionHandler:(id)a4;
@end

@implementation AAUIImageFetcher

+ (id)sharedImageFetcher
{
  if (sharedImageFetcher_onceToken != -1) {
    dispatch_once(&sharedImageFetcher_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedImageFetcher_s_instance;
  return v2;
}

uint64_t __38__AAUIImageFetcher_sharedImageFetcher__block_invoke()
{
  sharedImageFetcher_s_instance = objc_alloc_init(AAUIImageFetcher);
  return MEMORY[0x270F9A758]();
}

- (void)fetchImageAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F82B60];
  id v8 = a3;
  v9 = [v7 mainScreen];
  [v9 scale];
  uint64_t v11 = v10;

  v12 = [(AAUIImageFetcher *)self _urlSession];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __54__AAUIImageFetcher_fetchImageAtURL_completionHandler___block_invoke;
  v18 = &unk_263F93628;
  uint64_t v20 = v11;
  id v19 = v6;
  id v13 = v6;
  v14 = [v12 dataTaskWithURL:v8 completionHandler:&v15];

  objc_msgSend(v14, "resume", v15, v16, v17, v18);
}

void __54__AAUIImageFetcher_fetchImageAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = 0;
  if (v7 && !v9)
  {
    if ([v8 statusCode] == 200)
    {
      uint64_t v10 = [MEMORY[0x263F827E8] imageWithData:v7 scale:*(double *)(a1 + 40)];
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__AAUIImageFetcher_fetchImageAtURL_completionHandler___block_invoke_2;
    block[3] = &unk_263F92460;
    id v14 = *(id *)(a1 + 32);
    id v12 = v10;
    id v13 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __54__AAUIImageFetcher_fetchImageAtURL_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_urlSession
{
  urlSession = self->_urlSession;
  if (!urlSession)
  {
    v4 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v5 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:@"com.apple.icloud"];
    objc_msgSend(v4, "set_appleIDContext:", v5);

    id v6 = (void *)MEMORY[0x263F08BF8];
    id v7 = [MEMORY[0x263F257B0] sharedPinner];
    id v8 = [v6 sessionWithConfiguration:v4 delegate:v7 delegateQueue:0];
    id v9 = self->_urlSession;
    self->_urlSession = v8;

    urlSession = self->_urlSession;
  }
  return urlSession;
}

- (void).cxx_destruct
{
}

@end