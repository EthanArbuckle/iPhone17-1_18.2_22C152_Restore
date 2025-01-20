@interface WFDownloadURLTask
- (NSURLRequest)request;
- (WFDownloadURLTask)initWithRequest:(id)a3;
- (id)completionHandler;
- (id)expectedByteCountHandler;
- (id)writtenByteCountHandler;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)setCompletionHandler:(id)a3;
- (void)setExpectedByteCountHandler:(id)a3;
- (void)setWrittenByteCountHandler:(id)a3;
- (void)start;
@end

@implementation WFDownloadURLTask

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_writtenByteCountHandler, 0);
  objc_storeStrong(&self->_expectedByteCountHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setWrittenByteCountHandler:(id)a3
{
}

- (id)writtenByteCountHandler
{
  return self->_writtenByteCountHandler;
}

- (void)setExpectedByteCountHandler:(id)a3
{
}

- (id)expectedByteCountHandler
{
  return self->_expectedByteCountHandler;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(WFDownloadURLTask *)self completionHandler];

  if (v8 && v10)
  {
    v11 = [(WFDownloadURLTask *)self completionHandler];
    v12 = [v13 response];
    ((void (**)(void, void, void *, id))v11)[2](v11, 0, v12, v8);

    [(WFDownloadURLTask *)self setCompletionHandler:0];
  }
  [(WFDownloadURLTask *)self setWrittenByteCountHandler:0];
  [v9 finishTasksAndInvalidate];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  id v8 = [(WFDownloadURLTask *)self completionHandler];

  if (v8)
  {
    id v9 = [(WFDownloadURLTask *)self completionHandler];
    v10 = [v12 response];
    v11 = [v12 error];
    ((void (**)(void, id, void *, void *))v9)[2](v9, v7, v10, v11);

    [(WFDownloadURLTask *)self setCompletionHandler:0];
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v16 = a3;
  id v11 = a4;
  if (*MEMORY[0x263F085D0] != a7)
  {
    id v12 = [(WFDownloadURLTask *)self expectedByteCountHandler];

    if (v12)
    {
      id v13 = [(WFDownloadURLTask *)self expectedByteCountHandler];
      v13[2](v13, a7);

      [(WFDownloadURLTask *)self setExpectedByteCountHandler:0];
    }
    v14 = [(WFDownloadURLTask *)self writtenByteCountHandler];

    if (v14)
    {
      v15 = [(WFDownloadURLTask *)self writtenByteCountHandler];
      v15[2](v15, a5);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v8 = (void (**)(id, id))a7;
  id v9 = a6;
  id v12 = (id)[v9 mutableCopy];
  [v12 _setNonAppInitiated:1];
  v10 = [v9 URL];

  id v11 = WFAppTransportSecuredURL(v10);
  [v12 setURL:v11];

  v8[2](v8, v12);
}

- (void)start
{
  v3 = (void *)MEMORY[0x263F08BF8];
  v4 = objc_msgSend(MEMORY[0x263F08C00], "wf_defaultSessionConfiguration");
  id v6 = [v3 sessionWithConfiguration:v4 delegate:self delegateQueue:0];

  v5 = [v6 downloadTaskWithRequest:self->_request];
  [v5 resume];
}

- (WFDownloadURLTask)initWithRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFDownloadURLTask.m", 22, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFDownloadURLTask;
  id v6 = [(WFDownloadURLTask *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    request = v6->_request;
    v6->_request = (NSURLRequest *)v7;

    id v9 = v6;
  }

  return v6;
}

@end