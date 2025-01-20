@interface AXLTCaptionsProvider
+ (AXLTCaptionsProvider)shared;
- (AXLTCaptionsProvider)init;
- (void)addPlaceholder;
- (void)allActiveCallsEnded;
- (void)callConnected;
- (void)cleanCaptions;
- (void)cleanOldestCaptionsIfNeeded;
- (void)dealloc;
- (void)handleAudioSessionInterruptionWithNotification:(id)a3;
- (void)handleAudioSessionResetWithNotification:(id)a3;
- (void)screenLockStateChanged:(BOOL)a3;
- (void)startTranscribing;
- (void)startTranscribing:(int64_t)a3 :(int64_t)a4;
- (void)stopTranscribing;
@end

@implementation AXLTCaptionsProvider

+ (AXLTCaptionsProvider)shared
{
  if (qword_D7D98 != -1) {
    swift_once();
  }
  v2 = (void *)static AXLTCaptionsProvider.shared;

  return (AXLTCaptionsProvider *)v2;
}

- (void)startTranscribing
{
  v2 = self;
  AXLTCaptionsProvider.startTranscribing()();
}

- (void)startTranscribing:(int64_t)a3 :(int64_t)a4
{
  v6 = self;
  AXLTCaptionsProvider.startTranscribing(_:_:)(a3, a4);
}

- (void)stopTranscribing
{
  v2 = self;
  AXLTCaptionsProvider.stopTranscribing()();
}

- (AXLTCaptionsProvider)init
{
  return (AXLTCaptionsProvider *)sub_3B64C();
}

- (void)dealloc
{
  v2 = self;
  AXLTCaptionsProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___AXLTCaptionsProvider__captions;
  uint64_t v4 = sub_7AF4(&qword_D9120);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_A35C((uint64_t)self + OBJC_IVAR___AXLTCaptionsProvider_lastFinalCaption, &qword_D85F8);
  sub_A35C((uint64_t)self + OBJC_IVAR___AXLTCaptionsProvider_currentCaption, &qword_D85F8);

  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AXLTCaptionsProvider_lockScreenObserver);
}

- (void)cleanCaptions
{
  v2 = self;
  sub_A7420();
  id v3 = (id)AXLogLiveTranscription();
  if (v3)
  {
    uint64_t v4 = v3;
    sub_A5FD0();

    swift_getKeyPath();
    swift_getKeyPath();
    v5 = (void (*)(uint64_t *, void))sub_A60C0();
    void *v6 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    v5(&v7, 0);
    swift_release();
    swift_release();
    sub_3C738(0, 0);
  }
  else
  {
    __break(1u);
  }
}

- (void)cleanOldestCaptionsIfNeeded
{
  v2 = self;
  sub_3E4A4();
}

- (void)handleAudioSessionInterruptionWithNotification:(id)a3
{
  uint64_t v3 = sub_A58D0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A58A0();
  sub_42930((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)handleAudioSessionResetWithNotification:(id)a3
{
  uint64_t v4 = sub_A58D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A58A0();
  v8 = self;
  sub_3F234((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)addPlaceholder
{
  v2 = self;
  sub_3FD54();
}

- (void)screenLockStateChanged:(BOOL)a3
{
  uint64_t v4 = self;
  AXLTCaptionsProvider.screenLockStateChanged(_:)(a3);
}

- (void)callConnected
{
  uint64_t v4 = self;
  sub_A7450();
  id v2 = (id)AXLogLiveTranscription();
  if (v2)
  {
    uint64_t v3 = v2;
    sub_A5FD0();

    AXLTCaptionsProvider.stopTranscribing()();
    AXLTCaptionsProvider.startTranscribing()();
  }
  else
  {
    __break(1u);
  }
}

- (void)allActiveCallsEnded
{
  uint64_t v5 = self;
  sub_A7450();
  id v2 = (id)AXLogLiveTranscription();
  if (v2)
  {
    uint64_t v3 = v2;
    sub_A5FD0();

    uint64_t v4 = v5;
    if (*(Class *)((char *)&v5->super.isa + OBJC_IVAR___AXLTCaptionsProvider_activePid) == (Class)-2)
    {
      sub_4008C();
      AXLTCaptionsProvider.stopTranscribing()();
      AXLTCaptionsProvider.startTranscribing()();
      uint64_t v4 = v5;
    }
  }
  else
  {
    __break(1u);
  }
}

@end