@interface CPSImageDownloader
- (CPSImageDownloader)init;
- (void)_downloadImageWithURL:(id)a3 completionHandler:(id)a4;
- (void)downloadImageWithURL:(id)a3 completionHandler:(id)a4;
@end

@implementation CPSImageDownloader

- (CPSImageDownloader)init
{
  v12.receiver = self;
  v12.super_class = (Class)CPSImageDownloader;
  v2 = [(CPSImageDownloader *)&v12 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.ClipServices.%@.%p", objc_opt_class(), v2];
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v8;

    v10 = v2;
  }

  return v2;
}

- (void)downloadImageWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CPSImageDownloader_downloadImageWithURL_completionHandler___block_invoke;
  block[3] = &unk_26424E678;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __61__CPSImageDownloader_downloadImageWithURL_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadImageWithURL:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_downloadImageWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    if (v6)
    {
      id v9 = [(NSMutableDictionary *)self->_requests objectForKeyedSubscript:v6];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke;
      v24[3] = &unk_26424EB08;
      id v25 = v8;
      id v10 = v9;
      id v26 = v10;
      v11 = (void *)MEMORY[0x2166BE5C0](v24);
      id v12 = (void *)MEMORY[0x2166BE5C0]();
      [(NSMutableDictionary *)self->_requests setObject:v12 forKeyedSubscript:v6];

      if (!v10)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_2;
        v22[3] = &unk_26424EB58;
        v22[4] = self;
        id v13 = v6;
        id v23 = v13;
        v14 = (void *)MEMORY[0x2166BE5C0](v22);
        v15 = (void *)MEMORY[0x263F08BF8];
        v16 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
        v17 = [v15 sessionWithConfiguration:v16];

        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_4;
        v20[3] = &unk_26424EB80;
        id v21 = v14;
        id v18 = v14;
        v19 = [v17 dataTaskWithURL:v13 completionHandler:v20];
        [v19 resume];
      }
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_3;
  v11[3] = &unk_26424EB30;
  v11[4] = v7;
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

void __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_3(void *a1)
{
  id v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  if (v2) {
    (*((void (**)(id, void, void))v2 + 2))(v2, a1[6], a1[7]);
  }
  [*(id *)(a1[4] + 16) removeObjectForKey:a1[5]];
}

uint64_t __62__CPSImageDownloader__downloadImageWithURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end