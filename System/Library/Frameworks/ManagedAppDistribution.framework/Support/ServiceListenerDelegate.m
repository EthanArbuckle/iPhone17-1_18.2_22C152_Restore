@interface ServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC28ManagedAppDistributionDaemon23ServiceListenerDelegate)init;
@end

@implementation ServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10000D4EC(v7);

  return v9 & 1;
}

- (_TtC28ManagedAppDistributionDaemon23ServiceListenerDelegate)init
{
  result = (_TtC28ManagedAppDistributionDaemon23ServiceListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28ManagedAppDistributionDaemon23ServiceListenerDelegate_service));
}

@end