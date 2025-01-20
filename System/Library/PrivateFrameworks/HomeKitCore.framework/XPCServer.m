@interface XPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC11HomeKitCore9XPCServer)init;
- (void)start;
@end

@implementation XPCServer

- (_TtC11HomeKitCore9XPCServer)init
{
  result = (_TtC11HomeKitCore9XPCServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)start
{
  v2 = self;
  XPCServer.start()();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_236D83708(v7);

  return v9 & 1;
}

@end