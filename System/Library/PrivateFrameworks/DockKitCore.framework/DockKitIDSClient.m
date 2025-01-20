@interface DockKitIDSClient
- (_TtC11DockKitCore16DockKitIDSClient)init;
@end

@implementation DockKitIDSClient

- (_TtC11DockKitCore16DockKitIDSClient)init
{
  result = (_TtC11DockKitCore16DockKitIDSClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore16DockKitIDSClient_token;
  uint64_t v4 = sub_24CF3A9D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_24CE74DA8((uint64_t)self + OBJC_IVAR____TtC11DockKitCore16DockKitIDSClient_delegate);
  swift_bridgeObjectRelease();
}

@end