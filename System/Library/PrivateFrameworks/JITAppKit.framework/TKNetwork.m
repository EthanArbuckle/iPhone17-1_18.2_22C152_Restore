@interface TKNetwork
+ (id)shared;
+ (void)setShared:(id)a3;
- (double)timeoutInterval;
- (id)downloadImage:(id)a3 priority:(int64_t)a4 completion:(id)a5;
- (id)downloadRequest:(id)a3 priority:(int64_t)a4 completion:(id)a5;
- (id)loadRequest:(id)a3 priority:(int64_t)a4 completion:(id)a5;
- (void)updateNetworkActivity:(int64_t)a3;
@end

@implementation TKNetwork

+ (id)shared
{
  v5 = (dispatch_once_t *)&shared_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)_shared;
  return v2;
}

void __19__TKNetwork_shared__block_invoke()
{
  if (!_shared)
  {
    v0 = objc_alloc_init(TKNetwork);
    v1 = (void *)_shared;
    _shared = (uint64_t)v0;
  }
}

+ (void)setShared:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&_shared, location[0]);
  objc_storeStrong(location, 0);
}

- (id)loadRequest:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v23 = a4;
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = @"normal";
  if (v23 == -1)
  {
    objc_storeStrong(&v21, @"low");
  }
  else if (v23 == 1)
  {
    objc_storeStrong(&v21, @"high");
  }
  [(TKNetwork *)v25 updateNetworkActivity:1];
  id v9 = +[MCLURLDataLoader shared];
  id v7 = location[0];
  id v8 = v21;
  uint64_t v13 = MEMORY[0x263EF8330];
  int v14 = -1073741824;
  int v15 = 0;
  v16 = __45__TKNetwork_loadRequest_priority_completion___block_invoke;
  v17 = &unk_26485A718;
  v18 = v25;
  id v19 = v22;
  id v20 = (id)[v9 downloadRequest:v7 category:v8 completionHandler:&v13];

  v5 = [TKNetworkDefaultTask alloc];
  v10 = [(TKNetworkDefaultTask *)v5 initWithTask:v20];
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v10;
}

void __45__TKNetwork_loadRequest_priority_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v10 = 0;
  objc_storeStrong(&v10, a3);
  v9[1] = (id)a1;
  [*(id *)(a1 + 32) updateNetworkActivity:-1];
  if (!v10 && ([location[0] responseOk] & 1) != 0)
  {
    v3 = (void *)MEMORY[0x263EFF8F8];
    id v4 = (id)[location[0] targetPath];
    v9[0] = (id)objc_msgSend(v3, "dataWithContentsOfFile:");

    v5 = (void (**)(void))(*(void *)(a1 + 40) + 16);
    id v6 = (id)[location[0] response];
    (*v5)();

    objc_storeStrong(v9, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)downloadRequest:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v23 = a4;
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = @"normal";
  if (v23 == -1)
  {
    objc_storeStrong(&v21, @"low");
  }
  else if (v23 == 1)
  {
    objc_storeStrong(&v21, @"high");
  }
  [(TKNetwork *)v25 updateNetworkActivity:1];
  id v9 = +[MCLURLDataLoader shared];
  id v7 = location[0];
  id v8 = v21;
  uint64_t v13 = MEMORY[0x263EF8330];
  int v14 = -1073741824;
  int v15 = 0;
  v16 = __49__TKNetwork_downloadRequest_priority_completion___block_invoke;
  v17 = &unk_26485A718;
  v18 = v25;
  id v19 = v22;
  id v20 = (id)[v9 downloadRequest:v7 category:v8 completionHandler:&v13];

  v5 = [TKNetworkDefaultTask alloc];
  id v10 = [(TKNetworkDefaultTask *)v5 initWithTask:v20];
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v10;
}

void __49__TKNetwork_downloadRequest_priority_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  [*(id *)(a1 + 32) updateNetworkActivity:-1];
  if (!v7 && ([location[0] responseOk] & 1) != 0)
  {
    v3 = (void (**)(void))(*(void *)(a1 + 40) + 16);
    id v4 = (id)[location[0] targetPath];
    (*v3)();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)downloadImage:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v23 = a4;
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = @"normal";
  if (v23 == -1)
  {
    objc_storeStrong(&v21, @"low");
  }
  else if (v23 == 1)
  {
    objc_storeStrong(&v21, @"high");
  }
  [(TKNetwork *)v25 updateNetworkActivity:1];
  id v9 = +[MCLURLDataLoader shared];
  id v7 = location[0];
  id v8 = v21;
  uint64_t v13 = MEMORY[0x263EF8330];
  int v14 = -1073741824;
  int v15 = 0;
  v16 = __47__TKNetwork_downloadImage_priority_completion___block_invoke;
  v17 = &unk_26485A740;
  v18 = v25;
  id v19 = v22;
  id v20 = (id)[v9 downloadImageWithRequest:v7 category:v8 completionHandler:&v13];

  v5 = [TKNetworkDefaultTask alloc];
  id v10 = [(TKNetworkDefaultTask *)v5 initWithTask:v20];
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v10;
}

void __47__TKNetwork_downloadImage_priority_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  [*(id *)(a1 + 32) updateNetworkActivity:-1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)updateNetworkActivity:(int64_t)a3
{
  v12 = self;
  SEL v11 = a2;
  int64_t v10 = a3;
  v3 = MEMORY[0x263EF83A0];
  uint64_t block = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __35__TKNetwork_updateNetworkActivity___block_invoke;
  id v8 = &__block_descriptor_40_e5_v8__0l;
  int64_t v9 = v10;
  dispatch_async(v3, &block);
}

void __35__TKNetwork_updateNetworkActivity___block_invoke(uint64_t a1)
{
  if (_networkActivityCount + *(void *)(a1 + 32) <= 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = _networkActivityCount + *(void *)(a1 + 32);
  }
  if (v4)
  {
    if (!_networkActivityCount)
    {
      id v1 = (id)[MEMORY[0x263F82438] sharedApplication];
      [v1 setNetworkActivityIndicatorVisible:1];
    }
  }
  else
  {
    dispatch_time_t when = dispatch_time(0, 500000000);
    v3 = MEMORY[0x263EF83A0];
    dispatch_after(when, v3, &__block_literal_global_7);
  }
  _networkActivityCount = v4;
}

void __35__TKNetwork_updateNetworkActivity___block_invoke_2()
{
  if (!_networkActivityCount)
  {
    id v0 = (id)[MEMORY[0x263F82438] sharedApplication];
    [v0 setNetworkActivityIndicatorVisible:0];
  }
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

@end