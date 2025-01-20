@interface DeveloperModeServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC20AttributionKitDaemon36DeveloperModeServiceListenerDelegate)init;
@end

@implementation DeveloperModeServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10006EF1C(v7);

  return v9 & 1;
}

- (_TtC20AttributionKitDaemon36DeveloperModeServiceListenerDelegate)init
{
  result = (_TtC20AttributionKitDaemon36DeveloperModeServiceListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AttributionKitDaemon36DeveloperModeServiceListenerDelegate_serviceBridge));
}

@end