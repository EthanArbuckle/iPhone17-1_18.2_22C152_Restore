@interface ModelDownloadRequest
- (NSProgress)progress;
- (_TtC6Speech20ModelDownloadRequest)init;
- (void)downloadWithCompletion:(id)a3;
@end

@implementation ModelDownloadRequest

- (NSProgress)progress
{
  id v2 = ModelDownloadRequest.progress.getter();

  return (NSProgress *)v2;
}

- (void)downloadWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  ModelDownloadRequest.download(withCompletion:)((uint64_t)sub_1B71AC238, v5);
  swift_release();
}

- (_TtC6Speech20ModelDownloadRequest)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6Speech20ModelDownloadRequest_progress);
}

@end