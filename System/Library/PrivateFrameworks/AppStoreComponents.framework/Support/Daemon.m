@interface Daemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC19appstorecomponentsd6Daemon)init;
@end

@implementation Daemon

- (_TtC19appstorecomponentsd6Daemon)init
{
  return (_TtC19appstorecomponentsd6Daemon *)sub_1000BF6E4();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_1000C0414(v7);

  return v9;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd6Daemon_widgetEventListener);
}

@end