@interface DownloadTask
- (_TtC28ManagedAppDistributionDaemon12DownloadTask)init;
- (void)URLSession:(NSURLSession *)a3 dataTask:(NSURLSessionDataTask *)a4 didReceiveResponse:(NSURLResponse *)a5 completionHandler:(id)a6;
- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 _willSendRequestForEstablishedConnection:(NSURLRequest *)a5 completionHandler:(id)a6;
- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 willPerformHTTPRedirection:(NSHTTPURLResponse *)a5 newRequest:(NSURLRequest *)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation DownloadTask

- (_TtC28ManagedAppDistributionDaemon12DownloadTask)init
{
  result = (_TtC28ManagedAppDistributionDaemon12DownloadTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100014524((uint64_t)self + OBJC_IVAR____TtC28ManagedAppDistributionDaemon12DownloadTask_consumer);
  swift_release();

  swift_release();
}

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 willPerformHTTPRedirection:(NSHTTPURLResponse *)a5 newRequest:(NSURLRequest *)a6 completionHandler:(id)a7
{
  uint64_t v13 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v13 - 8);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_10065D410;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_10065D418;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_100451B68((uint64_t)v15, (uint64_t)&unk_10065D420, (uint64_t)v20);
  swift_release();
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v9 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a5;
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  id v17 = a5;
  uint64_t v18 = v16;
  id v19 = v14;
  id v20 = v15;
  id v21 = v17;
  sub_100017544((uint64_t)v11, (uint64_t)&unk_10065D3B0, (uint64_t)v13);

  swift_release();
}

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 _willSendRequestForEstablishedConnection:(NSURLRequest *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = _Block_copy(a6);
  id v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  id v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10065D378;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10065D380;
  v18[5] = v17;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  uint64_t v22 = self;
  sub_100451B68((uint64_t)v13, (uint64_t)&unk_10065F940, (uint64_t)v18);
  swift_release();
}

- (void)URLSession:(NSURLSession *)a3 dataTask:(NSURLSessionDataTask *)a4 didReceiveResponse:(NSURLResponse *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = _Block_copy(a6);
  id v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  id v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10065D318;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10065D320;
  v18[5] = v17;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  uint64_t v22 = self;
  sub_100451B68((uint64_t)v13, (uint64_t)&unk_10065D328, (uint64_t)v18);
  swift_release();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  id v15 = *(os_unfair_lock_s **)((char *)&v11->super.isa
                             + OBJC_IVAR____TtC28ManagedAppDistributionDaemon12DownloadTask_state);
  uint64_t v16 = (uint64_t)&v15[4];
  id v17 = v15 + 25;
  os_unfair_lock_lock(v15 + 25);
  sub_100252838(v16);
  os_unfair_lock_unlock(v17);
  sub_100013510(v12, v14);
}

@end