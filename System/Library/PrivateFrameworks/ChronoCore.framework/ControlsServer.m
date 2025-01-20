@interface ControlsServer
- (_TtC10ChronoCore14ControlsServer)init;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation ControlsServer

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore14ControlsServer__listener);
  v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_invalidate);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ControlsServer();
  [(ControlsServer *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC10ChronoCore14ControlsServer)init
{
  result = (_TtC10ChronoCore14ControlsServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1DAC64760(v8);

  swift_unknownObjectRelease();
}

@end