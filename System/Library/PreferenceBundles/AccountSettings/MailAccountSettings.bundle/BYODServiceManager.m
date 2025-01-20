@interface BYODServiceManager
- (BOOL)receivedValidResponse:(id)a3 forRequest:(id)a4;
- (BYODServiceManager)init;
- (void)_finishedLoading;
- (void)_preLoadCancel;
- (void)loadRequest:(id)a3 withCompletion:(id)a4;
@end

@implementation BYODServiceManager

- (BYODServiceManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)BYODServiceManager;
  return [(BYODServiceManager *)&v3 init];
}

- (void)loadRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BYODServiceManager *)self _preLoadCancel];
  if (self->_request)
  {
    v15 = "!_request";
    int v16 = 27;
    goto LABEL_8;
  }
  if (self->_dataTask)
  {
    v15 = "!_dataTask";
    int v16 = 28;
LABEL_8:
    __assert_rtn("-[BYODServiceManager loadRequest:withCompletion:]", "BYODServiceManager.m", v16, v15);
  }
  if (!self->_urlSession)
  {
    v8 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    v9 = +[NSOperationQueue mainQueue];
    v10 = +[NSURLSession sessionWithConfiguration:v8 delegate:self delegateQueue:v9];
    urlSession = self->_urlSession;
    self->_urlSession = v10;

    v12 = self->_urlSession;
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_634E0;
    v20 = &unk_B9800;
    v21 = self;
    id v22 = v7;
    v13 = [(NSURLSession *)v12 dataTaskWithRequest:v6 completionHandler:&v17];
    dataTask = self->_dataTask;
    self->_dataTask = v13;

    [(NSURLSessionDataTask *)self->_dataTask resume];
  }
}

- (void)_preLoadCancel
{
  dataTask = self->_dataTask;
  if (dataTask)
  {
    [(NSURLSessionDataTask *)dataTask cancel];
    [(BYODServiceManager *)self _finishedLoading];
  }
  request = self->_request;
  self->_request = 0;
}

- (void)_finishedLoading
{
  dataTask = self->_dataTask;
  self->_dataTask = 0;

  request = self->_request;
  self->_request = 0;
}

- (BOOL)receivedValidResponse:(id)a3 forRequest:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0
    || (unint64_t)((uint64_t)[v4 statusCode] / 100 - 6) < 0xFFFFFFFFFFFFFFFELL;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end