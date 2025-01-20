@interface DaemonXPCConnectionManager
- (_TtC19HealthRecordsDaemon26DaemonXPCConnectionManager)init;
- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation DaemonXPCConnectionManager

- (void)dealloc
{
  v2 = self;
  sub_22D2BA110();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DaemonXPCConnectionManager();
  [(DaemonXPCConnectionManager *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthRecordsDaemon26DaemonXPCConnectionManager_listener));
  swift_bridgeObjectRelease();
}

- (_TtC19HealthRecordsDaemon26DaemonXPCConnectionManager)init
{
  result = (_TtC19HealthRecordsDaemon26DaemonXPCConnectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HealthRecordsDaemon26DaemonXPCConnectionManager_serviceMap);
  swift_beginAccess();
  uint64_t v9 = *v8;
  v10 = (objc_class *)type metadata accessor for DaemonConnectionServer();
  v11 = (char *)objc_allocWithZone(v10);
  *(void *)&v11[OBJC_IVAR____TtC19HealthRecordsDaemon22DaemonConnectionServer_client] = a4;
  *(void *)&v11[OBJC_IVAR____TtC19HealthRecordsDaemon22DaemonConnectionServer_serviceMap] = v9;
  v17.receiver = v11;
  v17.super_class = v10;
  id v12 = a4;
  id v13 = a3;
  v14 = self;
  swift_bridgeObjectRetain();
  v15 = [(DaemonXPCConnectionManager *)&v17 init];

  return v15;
}

@end