@interface TKCloudKitFetch
- (BOOL)active;
- (BOOL)cancelled;
- (NSError)error;
- (NSMutableURLRequest)urlRequest;
- (NSURL)downloadURL;
- (TKCloudKitFetch)init;
- (TMLJSONObject)response;
- (void)cancel;
- (void)dealloc;
- (void)downloadAssetFromCloudKit;
- (void)handleDownloadResponse:(id)a3 error:(id)a4;
- (void)handleResponse:(id)a3 data:(id)a4 responseError:(id)a5;
- (void)send;
- (void)setDownloadURL:(id)a3;
- (void)setResponse:(id)a3;
- (void)setUrlRequest:(id)a3;
- (void)tmlDispose;
@end

@implementation TKCloudKitFetch

- (TKCloudKitFetch)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)TKCloudKitFetch;
  v6 = [(TKCloudKitFetch *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  [(TKCloudKitFetch *)self cancel];
  v2.receiver = v4;
  v2.super_class = (Class)TKCloudKitFetch;
  [(TKCloudKitFetch *)&v2 dealloc];
}

- (void)tmlDispose
{
  objc_super v4 = self;
  SEL v3 = a2;
  [(TKCloudKitFetch *)self cancel];
  v2.receiver = v4;
  v2.super_class = (Class)TKCloudKitFetch;
  [(TKCloudKitFetch *)&v2 tmlDispose];
}

- (void)setResponse:(id)a3
{
  objc_super v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_response, location[0]);
  objc_storeStrong(location, 0);
}

- (void)send
{
  v13 = self;
  location[1] = (id)a2;
  if (!self->_active)
  {
    if (v13->_urlRequest)
    {
      v13->_active = 1;
      objc_storeStrong((id *)&v13->_response, 0);
      v13->_cancelled = 0;
      objc_initWeak(location, v13);
      id v4 = +[TKNetwork shared];
      urlRequest = v13->_urlRequest;
      uint64_t v6 = MEMORY[0x263EF8330];
      int v7 = -1073741824;
      int v8 = 0;
      v9 = __23__TKCloudKitFetch_send__block_invoke;
      v10 = &unk_26485AC48;
      objc_copyWeak(v11, location);
      objc_super v2 = (TKNetworkTask *)(id)[v4 loadRequest:urlRequest priority:1 completion:&v6];
      queryTask = v13->_queryTask;
      v13->_queryTask = v2;

      objc_destroyWeak(v11);
      objc_destroyWeak(location);
    }
  }
}

void __23__TKCloudKitFetch_send__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained handleResponse:location[0] data:v9 responseError:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)cancel
{
  if (self->_queryTask)
  {
    [(TKNetworkTask *)self->_queryTask cancel];
    objc_storeStrong((id *)&self->_queryTask, 0);
  }
  self->_cancelled = 1;
  self->_active = 0;
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_downloadURL, 0);
}

- (void)handleResponse:(id)a3 data:(id)a4 responseError:(id)a5
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  if (v25->_cancelled)
  {
    int v21 = 1;
    goto LABEL_14;
  }
  if (!v23)
  {
    objc_initWeak(&v17, v25);
    queue = MEMORY[0x263EF83A0];
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    v14 = __53__TKCloudKitFetch_handleResponse_data_responseError___block_invoke;
    v15 = &unk_26485AC20;
    objc_copyWeak(&v16, &v17);
    dispatch_async(queue, &v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v17);
LABEL_10:
    if (v25->_downloadURL) {
      [(TKCloudKitFetch *)v25 downloadAssetFromCloudKit];
    }
    else {
      v25->_active = 0;
    }
    int v21 = 0;
    goto LABEL_14;
  }
  id v20 = 0;
  id v18 = 0;
  id v8 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v23 options:1 error:&v18];
  objc_storeStrong(&v20, v18);
  id v19 = v8;
  if (v8)
  {
    SEL v5 = (NSURL *)+[TKCloudKitWSRecord downloadURLFromCloudKitRecordResponse:v19];
    downloadURL = v25->_downloadURL;
    v25->_downloadURL = v5;

    int v21 = 0;
  }
  else
  {
    [(TKCloudKitFetch *)v25 emitTMLSignal:@"error" withArguments:&unk_26DD5EE00];
    int v21 = 1;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  if (!v21) {
    goto LABEL_10;
  }
LABEL_14:
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __53__TKCloudKitFetch_handleResponse_data_responseError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained emitTMLSignal:@"error" withArguments:&unk_26DD5EE18];
}

- (void)downloadAssetFromCloudKit
{
  id v18 = self;
  location[1] = (id)a2;
  if (self->_downloadURL)
  {
    objc_initWeak(location, v18);
    id v9 = objc_alloc(MEMORY[0x263F08BD8]);
    downloadURL = v18->_downloadURL;
    id v7 = +[TKNetwork shared];
    [v7 timeoutInterval];
    id v16 = (id)[v9 initWithURL:downloadURL cachePolicy:0 timeoutInterval:v2];

    id v5 = +[TKNetwork shared];
    id v6 = v16;
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    int v13 = __44__TKCloudKitFetch_downloadAssetFromCloudKit__block_invoke;
    v14 = &unk_26485AE58;
    objc_copyWeak(v15, location);
    SEL v3 = (TKNetworkTask *)(id)[v5 downloadRequest:v6 priority:1 completion:&v10];
    queryTask = v18->_queryTask;
    v18->_queryTask = v3;

    objc_destroyWeak(v15);
    objc_storeStrong(&v16, 0);
    objc_destroyWeak(location);
  }
}

void __44__TKCloudKitFetch_downloadAssetFromCloudKit__block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained handleDownloadResponse:location[0] error:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)handleDownloadResponse:(id)a3 error:(id)a4
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  v23->_active = 0;
  if (location[0] && [location[0] length])
  {
    id v20 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:location[0]];
    id v19 = 0;
    id v17 = 0;
    id v8 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v20 options:0 error:&v17];
    objc_storeStrong(&v19, v17);
    id v18 = v8;
    if (v8 && !v19)
    {
      id v4 = (TMLJSONObject *)objc_alloc_init(MEMORY[0x263F80CC8]);
      response = v23->_response;
      v23->_response = v4;

      objc_initWeak(&v16, v23);
      id v6 = v23->_response;
      id v7 = v18;
      uint64_t v10 = MEMORY[0x263EF8330];
      int v11 = -1073741824;
      int v12 = 0;
      int v13 = __48__TKCloudKitFetch_handleDownloadResponse_error___block_invoke;
      v14 = &unk_26485AC98;
      objc_copyWeak(&v15, &v16);
      [(TMLJSONObject *)v6 setRawJSONAsync:v7 completion:&v10];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v16);
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __48__TKCloudKitFetch_handleDownloadResponse_error___block_invoke(id *a1, char a2)
{
  int v11 = a1;
  char v10 = a2 & 1;
  v9[1] = a1;
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __48__TKCloudKitFetch_handleDownloadResponse_error___block_invoke_2;
  id v8 = &unk_26485AC20;
  objc_copyWeak(v9, a1 + 4);
  dispatch_async(queue, &v4);

  objc_destroyWeak(v9);
}

void __48__TKCloudKitFetch_handleDownloadResponse_error___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[v4 response];
  v6[0] = v3;
  id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  objc_msgSend(WeakRetained, "emitTMLSignal:withArguments:", @"load");
}

- (NSMutableURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (NSError)error
{
  return self->_error;
}

- (TMLJSONObject)response
{
  return self->_response;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (NSURL)downloadURL
{
  return self->_downloadURL;
}

- (void)setDownloadURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end