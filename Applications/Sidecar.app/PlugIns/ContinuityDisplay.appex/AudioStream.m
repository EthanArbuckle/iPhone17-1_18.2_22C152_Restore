@interface AudioStream
- (_TtC17ContinuityDisplay11AudioStream)init;
- (void)dealloc;
- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4;
- (void)stream:(id)a3 didReceiveRTCPPackets:(id)a4;
- (void)stream:(id)a3 didResume:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 didStartSynchronizer:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 updateInputFrequencyLevel:(id)a4;
- (void)stream:(id)a3 updateOutputFrequencyLevel:(id)a4;
@end

@implementation AudioStream

- (void)dealloc
{
  v2 = self;
  AudioStream.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  v3 = (char *)self + OBJC_IVAR____TtC17ContinuityDisplay11AudioStream_logger;
  uint64_t v4 = sub_10005E750();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17ContinuityDisplay11AudioStream_audioConfig);
}

- (_TtC17ContinuityDisplay11AudioStream)init
{
}

- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  AudioStream.stream(_:didPause:error:)((uint64_t)v10, v6, (uint64_t)a5);
}

- (void)stream:(id)a3 didResume:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  AudioStream.stream(_:didResume:error:)((uint64_t)v10, v6, (uint64_t)a5);
}

- (void)stream:(id)a3 didStartSynchronizer:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  AudioStream.stream(_:didStartSynchronizer:error:)((uint64_t)v10, v6, (uint64_t)a5);
}

- (void)stream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4
{
  id v5 = a3;
  BOOL v6 = self;
  AudioStream.stream(_:didReceiveDTMFEventWithDigit:)();
}

- (void)stream:(id)a3 didReceiveRTCPPackets:(id)a4
{
  if (a4) {
    sub_10005EAC0();
  }
  id v6 = a3;
  v7 = self;
  AudioStream.stream(_:didReceiveRTCPPackets:)();

  swift_bridgeObjectRelease();
}

- (void)stream:(id)a3 updateInputFrequencyLevel:(id)a4
{
}

- (void)stream:(id)a3 updateOutputFrequencyLevel:(id)a4
{
}

@end