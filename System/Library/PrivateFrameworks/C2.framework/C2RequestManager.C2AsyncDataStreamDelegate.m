@interface C2RequestManager.C2AsyncDataStreamDelegate
- (_TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate)init;
- (void)URLSession:(NSURLSession *)a3 dataTask:(NSURLSessionDataTask *)a4 didReceiveResponse:(NSURLResponse *)a5 completionHandler:(id)a6;
- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 _willSendRequestForEstablishedConnection:(NSURLRequest *)a5 completionHandler:(id)a6;
- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 willPerformHTTPRedirection:(NSHTTPURLResponse *)a5 newRequest:(NSURLRequest *)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation C2RequestManager.C2AsyncDataStreamDelegate

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 willPerformHTTPRedirection:(NSHTTPURLResponse *)a5 newRequest:(NSURLRequest *)a6 completionHandler:(id)a7
{
  v12 = _Block_copy(a7);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = self;
  sub_1DD5571A4((uint64_t)&unk_1EAB54468, (uint64_t)v13);
}

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 needNewBodyStream:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1DD5571A4((uint64_t)&unk_1EAB54458, (uint64_t)v9);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v12 = a5;
  sub_1DD55765C((uint64_t)v12, v11, a5);
}

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 _willSendRequestForEstablishedConnection:(NSURLRequest *)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(NSURLSession *)a3 dataTask:(NSURLSessionDataTask *)a4 didReceiveResponse:(NSURLResponse *)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  if (a5)
  {
    id v8 = a3;
    id v9 = a4;
    v10 = self;
    id v11 = a5;
    uint64_t v12 = sub_1DD55AF70();
    unint64_t v14 = v13;
  }
  else
  {
    id v17 = a3;
    id v18 = a4;
    v15 = self;
    uint64_t v12 = 0;
    unint64_t v14 = 0xF000000000000000;
  }
  sub_1DD5584A8((uint64_t)v15, v16, v12, v14);
  sub_1DD559634(v12, v14);
}

- (_TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseConitnuation;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9BD2E8);
  OUTLINED_FUNCTION_7();
  (*(void (**)(char *))(v4 + 8))(v3);
  sub_1DD55A398((uint64_t)self+ OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation, (uint64_t *)&unk_1EB9BD310);
}

@end