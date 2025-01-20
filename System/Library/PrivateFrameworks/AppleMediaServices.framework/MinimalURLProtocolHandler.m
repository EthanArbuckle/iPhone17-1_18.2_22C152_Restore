@interface MinimalURLProtocolHandler
- (AMSURLSession)session;
- (_TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler)init;
- (void)decodeMutableData:(NSMutableData *)a3 task:(NSURLSessionTask *)a4 completionHandler:(id)a5;
- (void)didCreateTask:(NSURLSessionTask *)a3 fromRequest:(NSURLRequest *)a4 completionHandler:(id)a5;
- (void)handleCompletionWithTask:(NSURLSessionTask *)a3 metrics:(NSURLSessionTaskMetrics *)a4 decodedObject:(id)a5 completionHandler:(id)a6;
- (void)handleResponse:(NSURLResponse *)a3 task:(NSURLSessionTask *)a4 completionHandler:(id)a5;
- (void)reconfigureNewRequest:(NSURLRequest *)a3 originalTask:(NSURLSessionTask *)a4 redirect:(BOOL)a5 completionHandler:(id)a6;
- (void)reportMetricsForContext:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation MinimalURLProtocolHandler

- (_TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler)init
{
  return (_TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler *)sub_18D72C144();
}

- (void)setSession:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_18D72C234((uint64_t)a3);
}

- (AMSURLSession)session
{
  v2 = sub_18D76D64C();
  return (AMSURLSession *)v2;
}

- (void)decodeMutableData:(NSMutableData *)a3 task:(NSURLSessionTask *)a4 completionHandler:(id)a5
{
}

- (void)didCreateTask:(NSURLSessionTask *)a3 fromRequest:(NSURLRequest *)a4 completionHandler:(id)a5
{
}

- (void)handleCompletionWithTask:(NSURLSessionTask *)a3 metrics:(NSURLSessionTaskMetrics *)a4 decodedObject:(id)a5 completionHandler:(id)a6
{
}

- (void)handleResponse:(NSURLResponse *)a3 task:(NSURLSessionTask *)a4 completionHandler:(id)a5
{
}

- (void)reconfigureNewRequest:(NSURLRequest *)a3 originalTask:(NSURLSessionTask *)a4 redirect:(BOOL)a5 completionHandler:(id)a6
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler_metricsHandler));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler_session);
}

- (void)reportMetricsForContext:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_18D76EF74((uint64_t)v4);
}

@end