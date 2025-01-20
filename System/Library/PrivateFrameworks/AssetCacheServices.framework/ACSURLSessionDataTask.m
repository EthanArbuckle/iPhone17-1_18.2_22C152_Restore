@interface ACSURLSessionDataTask
- (ACSURLSessionDataTask)initWithNSURLDataTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5;
- (BOOL)_isUpload;
- (id)_clientDataCompletionHandler;
- (void)set_clientDataCompletionHandler:(id)a3;
@end

@implementation ACSURLSessionDataTask

- (ACSURLSessionDataTask)initWithNSURLDataTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)ACSURLSessionDataTask;
  return [(ACSURLSessionTask *)&v6 initWithNSURLTaskCreator:a3 initialRequest:a4 forSession:a5];
}

- (BOOL)_isUpload
{
  return 0;
}

- (id)_clientDataCompletionHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)set_clientDataCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end