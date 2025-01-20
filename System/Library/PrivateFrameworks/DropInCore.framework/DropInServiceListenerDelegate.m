@interface DropInServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC10DropInCore29DropInServiceListenerDelegate)init;
@end

@implementation DropInServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_24D0AA728((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtC10DropInCore29DropInServiceListenerDelegate)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10DropInCore29DropInServiceListenerDelegate_logger;
  sub_24D0F01C0();
  OUTLINED_FUNCTION_64();
  (*(void (**)(char *))(v4 + 8))(v3);

  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC10DropInCore29DropInServiceListenerDelegate_xpcClientDelegate;

  sub_24D05C8DC((uint64_t)v5);
}

@end