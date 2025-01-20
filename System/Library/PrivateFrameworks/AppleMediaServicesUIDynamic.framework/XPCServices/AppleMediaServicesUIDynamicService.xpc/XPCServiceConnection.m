@interface XPCServiceConnection
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection)init;
@end

@implementation XPCServiceConnection

- (_TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection)init
{
  return (_TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection *)sub_10003B668();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  v7 = (void **)a4;
  v8 = self;
  sub_10003B9BC((uint64_t)v8, v7);

  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection_connectionListener));
}

@end