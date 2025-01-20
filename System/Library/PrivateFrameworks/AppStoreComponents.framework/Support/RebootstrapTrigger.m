@interface RebootstrapTrigger
- (void)accountStoreDidChange:(id)a3;
- (void)appDistributorsDidChange:(id)a3;
@end

@implementation RebootstrapTrigger

- (void)accountStoreDidChange:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_10012B6E4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)appDistributorsDidChange:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = qword_1001A0E60;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for OSLogger();
  sub_10002F6AC(v8, (uint64_t)qword_1001AE368);
  sub_10002EB60((uint64_t *)&unk_1001A19E0);
  type metadata accessor for LogMessage();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10014CED0;
  LogMessage.init(stringLiteral:)();
  Logger.info(_:)();
  swift_bridgeObjectRelease();
  v9[15] = 1;
  AsyncEvent.post(_:)();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

@end