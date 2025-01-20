@interface MaintenanceService.ListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC21contactsdonationagent18MaintenanceService16ListenerDelegate)init;
@end

@implementation MaintenanceService.ListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100014B64(v7);

  return v9 & 1;
}

- (_TtCC21contactsdonationagent18MaintenanceService16ListenerDelegate)init
{
  result = (_TtCC21contactsdonationagent18MaintenanceService16ListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end