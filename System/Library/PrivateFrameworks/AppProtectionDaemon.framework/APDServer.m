@interface APDServer
- (_TtC19AppProtectionDaemon9APDServer)init;
- (void)runWithArguments:(id)a3;
@end

@implementation APDServer

- (_TtC19AppProtectionDaemon9APDServer)init
{
  return (_TtC19AppProtectionDaemon9APDServer *)APDServer.init()();
}

- (void)runWithArguments:(id)a3
{
  sub_247E00090();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppProtectionDaemon9APDServer_serviceQueue);
  v5 = (char *)self + OBJC_IVAR____TtC19AppProtectionDaemon9APDServer_platformExpert;
  sub_247DFF940();
  uint64_t v8 = swift_allocObject();
  sub_247DFF9CC((uint64_t)v5, v8 + 16);
  v6 = self;
  id v7 = v4;
  sub_247E00080();
  sub_247E00070();
  __break(1u);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19AppProtectionDaemon9APDServer_platformExpert;

  sub_247DFFE80((uint64_t)v3);
}

@end