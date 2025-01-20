@interface ActiveITunesAccountProvider
- (void)accountCookiesDidChange:(id)a3;
- (void)accountStoreDidChange:(id)a3;
@end

@implementation ActiveITunesAccountProvider

- (void)accountCookiesDidChange:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = *(void **)self->stateLock;
  swift_retain();
  [v8 lock];
  id v9 = objc_msgSend(*(id *)self->store, "ams_activeiTunesAccount");
  v10 = *(void **)self->unlockedActiveiTunesAccount;
  *(void *)self->unlockedActiveiTunesAccount = v9;

  [v8 unlock];
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)accountStoreDidChange:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_10002F1D8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end