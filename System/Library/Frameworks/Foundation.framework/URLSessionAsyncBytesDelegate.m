@interface URLSessionAsyncBytesDelegate
- (_TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate)init;
- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation URLSessionAsyncBytesDelegate

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = self;
  specialized URLSessionAsyncBytesDelegate.urlSession(_:dataTask:didReceive:completionHandler:)(v13, (uint64_t)v14, (void (**)(void, void))v10);
  _Block_release(v10);
  _Block_release(v10);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17 = self;
  id v14 = specialized Data.init(referencing:)(v13);
  unint64_t v16 = v15;

  _Block_copy(v10);
  specialized URLSessionAsyncBytesDelegate.urlSession(_:dataTask:_didReceive:completionHandler:)(v12, (uint64_t)v14, v16, (uint64_t)v17, (void (**)(void))v10);
  _Block_release(v10);
  _Block_release(v10);
  outlined consume of Data._Representation((uint64_t)v14, v16);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  specialized URLSessionAsyncBytesDelegate.urlSession(_:task:didCompleteWithError:)(a5);
}

- (_TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate)init
{
  result = (_TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate_state;

  outlined destroy of URLSessionAsyncBytesDelegate.State((uint64_t)v3);
}

@end