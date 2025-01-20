@interface XPCServiceProvider
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14amsengagementd18XPCServiceProvider)init;
- (void)dealloc;
@end

@implementation XPCServiceProvider

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000171B8((uint64_t)v8, v7);

  return v9 & 1;
}

- (void)dealloc
{
  v2 = self;
  sub_1001B0CC4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1000423CC((uint64_t)self + OBJC_IVAR____TtC14amsengagementd18XPCServiceProvider_exportedObject);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14amsengagementd18XPCServiceProvider_remoteObjectInterface);
}

- (_TtC14amsengagementd18XPCServiceProvider)init
{
}

@end