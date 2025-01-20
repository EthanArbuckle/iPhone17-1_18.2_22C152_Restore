@interface AcmeClient
- (AcmeClient)init;
- (AcmeClient)initWithURLString:(id)a3;
- (id)delegate;
- (id)url;
- (id)urlRequest;
- (void)post:(id)a3 withMethod:(id)a4 contentType:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUrlRequest:(id)a3;
- (void)start3:(id)a3;
@end

@implementation AcmeClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->urlRequest, 0);
  objc_storeStrong((id *)&self->url, 0);

  objc_destroyWeak(&self->delegate);
}

- (void)setUrlRequest:(id)a3
{
}

- (id)urlRequest
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setUrl:(id)a3
{
}

- (id)url
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->delegate);

  return WeakRetained;
}

- (void)start3:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(-2, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002B80;
  v7[3] = &unk_100008628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)post:(id)a3 withMethod:(id)a4 contentType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AcmeClient *)self urlRequest];
  [v11 setHTTPMethod:v9];

  [v11 setHTTPBody:v10];
  [v11 setValue:@"com.apple.security.acmeclient/1.0" forHTTPHeaderField:@"User-Agent"];
  [v11 setValue:v8 forHTTPHeaderField:@"Content-Type"];
}

- (AcmeClient)initWithURLString:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AcmeClient;
  v5 = [(AcmeClient *)&v14 init];
  if (v5)
  {
    id v6 = [v4 stringByAddingPercentEscapesUsingEncoding:4];
    v7 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v6];
    url = v5->url;
    v5->url = v7;

    id v9 = objc_alloc((Class)NSMutableURLRequest);
    id v10 = [(AcmeClient *)v5 url];
    id v11 = (NSMutableURLRequest *)[v9 initWithURL:v10 cachePolicy:1 timeoutInterval:15.0];
    urlRequest = v5->urlRequest;
    v5->urlRequest = v11;
  }
  return v5;
}

- (AcmeClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)AcmeClient;
  return [(AcmeClient *)&v3 init];
}

@end