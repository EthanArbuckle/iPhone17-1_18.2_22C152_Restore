@interface VideoStream
- (_TtC17ContinuityDisplay11VideoStream)init;
- (void)dealloc;
- (void)qosMonitor:(id)a3 didReceiveReport:(id)a4 streamToken:(int64_t)a5;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
@end

@implementation VideoStream

- (void)dealloc
{
  v2 = self;
  VideoStream.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  v3 = (char *)self + OBJC_IVAR____TtC17ContinuityDisplay11VideoStream_logger;
  uint64_t v4 = sub_10005E750();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17ContinuityDisplay11VideoStream_qosMonitor);
}

- (void)qosMonitor:(id)a3 didReceiveReport:(id)a4 streamToken:(int64_t)a5
{
  uint64_t v7 = sub_10005E880();
  id v8 = a3;
  v9 = self;
  VideoStream.qosMonitor(_:didReceiveReport:streamToken:)((uint64_t)v9, v7);

  swift_bridgeObjectRelease();
}

- (_TtC17ContinuityDisplay11VideoStream)init
{
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = self;
  id v9 = a5;
  VideoStream.stream(_:didStart:error:)();
}

@end