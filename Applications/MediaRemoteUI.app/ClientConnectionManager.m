@interface ClientConnectionManager
- (_TtC13MediaRemoteUI23ClientConnectionManager)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation ClientConnectionManager

- (_TtC13MediaRemoteUI23ClientConnectionManager)init
{
  return (_TtC13MediaRemoteUI23ClientConnectionManager *)sub_10001BDE4();
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_10001DBC0((uint64_t)v8);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue));

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_interface);
}

@end