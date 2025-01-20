@interface MCLHTTPURLRequest
- (MCLHTTPURLRequest)init;
- (NSData)data;
- (NSDictionary)httpHeaders;
- (NSError)error;
- (NSString)httpMethod;
- (NSURL)url;
- (double)timeout;
- (unint64_t)statusCode;
- (void)cancel;
- (void)handleCompletion:(id)a3;
- (void)loadRequest:(id)a3;
- (void)send;
- (void)sendData:(id)a3;
- (void)sendText:(id)a3;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
- (void)setHttpHeaders:(id)a3;
- (void)setHttpMethod:(id)a3;
- (void)setStatusCode:(unint64_t)a3;
- (void)setTimeout:(double)a3;
- (void)setUrl:(id)a3;
@end

@implementation MCLHTTPURLRequest

- (MCLHTTPURLRequest)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)MCLHTTPURLRequest;
  v6 = [(MCLHTTPURLRequest *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    objc_storeStrong((id *)&v6->_httpMethod, @"GET");
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)send
{
}

- (void)sendData:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(MCLHTTPURLRequest *)v7 setStatusCode:0];
  if (v7->_url)
  {
    [(MCLHTTPURLRequest *)v7 cancel];
    id v4 = (id)[MEMORY[0x263F089E0] requestWithURL:v7->_url cachePolicy:1 timeoutInterval:v7->_timeout];
    [v4 setNetworkServiceType:0];
    if ([(NSDictionary *)v7->_httpHeaders count]) {
      [v4 setAllHTTPHeaderFields:v7->_httpHeaders];
    }
    [v4 setHTTPMethod:v7->_httpMethod];
    if (location[0])
    {
      id v3 = (id)[location[0] copy];
      objc_msgSend(v4, "setHTTPBody:");
    }
    [(MCLHTTPURLRequest *)v7 loadRequest:v4];
    objc_storeStrong(&v4, 0);
    int v5 = 0;
  }
  else
  {
    int v5 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)sendText:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v6;
  id v4 = (id)[location[0] dataUsingEncoding:4];
  -[MCLHTTPURLRequest sendData:](v3, "sendData:");

  objc_storeStrong(location, 0);
}

- (void)cancel
{
  if (self->_task)
  {
    id v2 = +[MCLURLDataLoader shared];
    [v2 cancelTask:self->_task];

    objc_storeStrong((id *)&self->_task, 0);
  }
}

- (void)loadRequest:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v15);
  id v5 = +[MCLURLDataLoader shared];
  id v6 = location[0];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  v10 = __33__MCLHTTPURLRequest_loadRequest___block_invoke;
  v11 = &unk_26485ADE0;
  objc_copyWeak(v12, &from);
  id v3 = (MCLURLDataLoaderTask *)(id)[v5 loadRequest:v6 category:@"high" completionHandler:&v7];
  task = v15->_task;
  v15->_task = v3;

  objc_destroyWeak(v12);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __33__MCLHTTPURLRequest_loadRequest___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained handleCompletion:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)handleCompletion:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __38__MCLHTTPURLRequest_handleCompletion___block_invoke;
  int v8 = &unk_26485AA40;
  id v9 = location[0];
  v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __38__MCLHTTPURLRequest_handleCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) setError:*(void *)(a1 + 32)];
    return [*(id *)(a1 + 40) emitTMLSignal:@"error" withArguments:0];
  }
  else
  {
    id v2 = (id)[*(id *)(*(void *)(a1 + 40) + 8) response];
    objc_msgSend(*(id *)(a1 + 40), "setStatusCode:", objc_msgSend(v2, "statusCode"));

    id v4 = (id)[*(id *)(*(void *)(a1 + 40) + 8) responseData];
    id v3 = (id)[v4 copy];
    objc_msgSend(*(id *)(a1 + 40), "setData:");

    return [*(id *)(a1 + 40) emitTMLSignal:@"load" withArguments:0];
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)httpMethod
{
  return self->_httpMethod;
}

- (void)setHttpMethod:(id)a3
{
}

- (NSDictionary)httpHeaders
{
  return self->_httpHeaders;
}

- (void)setHttpHeaders:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(unint64_t)a3
{
  self->_statusCode = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end