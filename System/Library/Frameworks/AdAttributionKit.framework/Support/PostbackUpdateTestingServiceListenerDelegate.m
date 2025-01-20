@interface PostbackUpdateTestingServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC20AttributionKitDaemon44PostbackUpdateTestingServiceListenerDelegate)init;
@end

@implementation PostbackUpdateTestingServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000BA3DC(v7);

  return v9 & 1;
}

- (_TtC20AttributionKitDaemon44PostbackUpdateTestingServiceListenerDelegate)init
{
  result = (_TtC20AttributionKitDaemon44PostbackUpdateTestingServiceListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AttributionKitDaemon44PostbackUpdateTestingServiceListenerDelegate_serviceBridge));
}

@end