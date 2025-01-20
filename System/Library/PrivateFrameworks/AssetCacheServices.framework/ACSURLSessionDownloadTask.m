@interface ACSURLSessionDownloadTask
- (ACSURLSessionDownloadTask)initWithNSURLDownloadTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5;
- (BOOL)_isUpload;
- (NSError)_deferredLinkError;
- (NSURLRequest)_resumedOriginalRequest;
- (NSURLRequest)originalRequest;
- (id)_clientLocationCompletionHandler;
- (void)cancelByProducingResumeData:(id)a3;
- (void)set_clientLocationCompletionHandler:(id)a3;
- (void)set_deferredLinkError:(id)a3;
- (void)set_resumedOriginalRequest:(id)a3;
@end

@implementation ACSURLSessionDownloadTask

- (NSURLRequest)originalRequest
{
  v3 = [(ACSURLSessionDownloadTask *)self _resumedOriginalRequest];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ACSURLSessionDownloadTask;
    id v5 = [(ACSURLSessionTask *)&v8 originalRequest];
  }
  v6 = v5;

  return (NSURLRequest *)v6;
}

- (void)cancelByProducingResumeData:(id)a3
{
  id v4 = a3;
  id v5 = [(ACSURLSessionTask *)self _weakSession];
  [v5 _cancelDownloadTask:self byProducingResumeData:v4];
}

- (ACSURLSessionDownloadTask)initWithNSURLDownloadTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)ACSURLSessionDownloadTask;
  return [(ACSURLSessionTask *)&v6 initWithNSURLTaskCreator:a3 initialRequest:a4 forSession:a5];
}

- (BOOL)_isUpload
{
  return 0;
}

- (id)_clientLocationCompletionHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)set_clientLocationCompletionHandler:(id)a3
{
}

- (NSURLRequest)_resumedOriginalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_resumedOriginalRequest:(id)a3
{
}

- (NSError)_deferredLinkError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)set_deferredLinkError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deferredLinkError, 0);
  objc_storeStrong((id *)&self->__resumedOriginalRequest, 0);

  objc_storeStrong(&self->__clientLocationCompletionHandler, 0);
}

@end