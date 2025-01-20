@interface SecureTaskDelegate
- (_TtC28ManagedAppDistributionDaemonP33_7C6A6A5846008938E730A14DB607337C18SecureTaskDelegate)init;
- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 willPerformHTTPRedirection:(NSHTTPURLResponse *)a5 newRequest:(NSURLRequest *)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
@end

@implementation SecureTaskDelegate

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = self;
  sub_100458A80(v12, v13, v14, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);
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
  v19[4] = &unk_100663B48;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_10065D320;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_100451B68((uint64_t)v15, (uint64_t)&unk_10065D328, (uint64_t)v20);
  swift_release();
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC28ManagedAppDistributionDaemonP33_7C6A6A5846008938E730A14DB607337C18SecureTaskDelegate__metrics);
  v9 = (id *)(v8 + 16);
  v10 = (os_unfair_lock_s *)(v8 + 24);
  id v11 = a5;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  os_unfair_lock_lock(v10);
  sub_100458810(v9);
  os_unfair_lock_unlock(v10);
}

- (_TtC28ManagedAppDistributionDaemonP33_7C6A6A5846008938E730A14DB607337C18SecureTaskDelegate)init
{
  result = (_TtC28ManagedAppDistributionDaemonP33_7C6A6A5846008938E730A14DB607337C18SecureTaskDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28ManagedAppDistributionDaemonP33_7C6A6A5846008938E730A14DB607337C18SecureTaskDelegate_logKey));

  swift_release();
}

@end