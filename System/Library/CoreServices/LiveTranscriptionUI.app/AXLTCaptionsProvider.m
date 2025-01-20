@interface AXLTCaptionsProvider
+ (AXLTCaptionsProvider)shared;
- (AXLTCaptionsProvider)init;
- (void)addPlaceholder;
- (void)cleanCaptions;
- (void)cleanOldestCaptionsIfNeeded;
- (void)dealloc;
- (void)handleAudioSessionInterruptionWithNotification:(id)a3;
- (void)handleAudioSessionResetWithNotification:(id)a3;
- (void)phoneCallListenerCallConnected:(id)a3 callID:(id)a4;
- (void)phoneCallListenerCallEnded:(id)a3 callID:(id)a4;
- (void)screenLockStateChanged:(BOOL)a3;
- (void)startTranscribing;
- (void)startTranscribing:(int64_t)a3 :(int64_t)a4;
- (void)stopTranscribing;
@end

@implementation AXLTCaptionsProvider

+ (AXLTCaptionsProvider)shared
{
  if (qword_10006AE28 != -1) {
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
  AXLTCaptionsProvider.startTranscribing(_:_:)(a3, (void **)a4);
}

- (void)stopTranscribing
{
  v2 = self;
  AXLTCaptionsProvider.stopTranscribing()();
}

- (AXLTCaptionsProvider)init
{
  return (AXLTCaptionsProvider *)sub_10003483C();
}

- (void)dealloc
{
  v2 = self;
  AXLTCaptionsProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___AXLTCaptionsProvider__captions;
  uint64_t v4 = sub_100006380(&qword_10006BF50);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___AXLTCaptionsProvider__audioHistogramSize;
  uint64_t v6 = sub_100006380(&qword_10006BF68);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();

  sub_1000067B8((uint64_t)self + OBJC_IVAR___AXLTCaptionsProvider_lastFinalCaption, &qword_10006BDF0);
  sub_1000067B8((uint64_t)self + OBJC_IVAR___AXLTCaptionsProvider_currentCaption, &qword_10006BDF0);

  swift_bridgeObjectRelease();
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AXLTCaptionsProvider_lockScreenObserver);
}

- (void)cleanCaptions
{
  v2 = self;
  static os_log_type_t.debug.getter();
  id v3 = (id)AXLogLiveTranscription();
  if (v3)
  {
    uint64_t v4 = v3;
    os_log(_:dso:log:_:_:)();

    swift_getKeyPath();
    swift_getKeyPath();
    v5 = (void (*)(uint64_t *, void))static Published.subscript.modify();
    void *v6 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    v5(&v7, 0);
    swift_release();
    swift_release();
    sub_100035A78(0, 0);
  }
  else
  {
    __break(1u);
  }
}

- (void)cleanOldestCaptionsIfNeeded
{
  v2 = self;
  sub_1000377E4();
}

- (void)handleAudioSessionInterruptionWithNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10003BE38((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)handleAudioSessionResetWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1000386FC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)addPlaceholder
{
  v2 = self;
  sub_10003921C();
}

- (void)phoneCallListenerCallConnected:(id)a3 callID:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  static os_log_type_t.default.getter();
  id v12 = (id)AXLogLiveTranscription();
  if (v12)
  {
    v13 = v12;
    os_log(_:dso:log:_:_:)();

    if (qword_10006AE20 != -1) {
      swift_once();
    }
    v14 = (unsigned char *)(static AXLTSettingsManager.shared + OBJC_IVAR___AXLTSettingsManager_inCallOn);
    swift_beginAccess();
    if (*v14 == 1)
    {
      AXLTCaptionsProvider.stopTranscribing()();
      AXLTCaptionsProvider.startTranscribing()();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    __break(1u);
  }
}

- (void)phoneCallListenerCallEnded:(id)a3 callID:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  static os_log_type_t.default.getter();
  id v12 = (id)AXLogLiveTranscription();
  if (v12)
  {
    v13 = v12;
    os_log(_:dso:log:_:_:)();

    if (*(Class *)((char *)&v11->super.isa + OBJC_IVAR___AXLTCaptionsProvider_activePid) == (Class)-2)
    {
      sub_100039A1C();
      AXLTCaptionsProvider.stopTranscribing()();
      AXLTCaptionsProvider.startTranscribing()();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    __break(1u);
  }
}

- (void)screenLockStateChanged:(BOOL)a3
{
  uint64_t v4 = self;
  AXLTCaptionsProvider.screenLockStateChanged(_:)(a3);
}

@end