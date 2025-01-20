@interface Client
- (_TtC13MediaRemoteUI6Client)init;
- (int64_t)hash;
- (void)connectForBannerPresentation:(id)a3 reply:(id)a4;
- (void)revokeAllBannersWithReply:(id)a3;
- (void)revokeBannerWithIdentifier:(id)a3 withReply:(id)a4;
@end

@implementation Client

- (void)connectForBannerPresentation:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_10001D9C4(v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)revokeAllBannersWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  static os_log_type_t.default.getter();
  if (qword_10005C1A0 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  sub_10002FA28(0x757165722044524DLL, 0xEB00000000747365, (uint64_t)sub_10001E6D4, v5);

  swift_release();
}

- (void)revokeBannerWithIdentifier:(id)a3 withReply:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  sub_10001B64C(v6, v8, (uint64_t)sub_10001E6CC, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = UUID.hashValue.getter();

  return v3;
}

- (_TtC13MediaRemoteUI6Client)init
{
  result = (_TtC13MediaRemoteUI6Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI6Client_identifier;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI6Client_bannerController);
}

@end