@interface MaintenanceService
- (_TtC21contactsdonationagent18MaintenanceService)init;
- (void)dealloc;
@end

@implementation MaintenanceService

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21contactsdonationagent18MaintenanceService_logger);
  v3 = self;
  [v2 maintenanceServiceWillStop];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for MaintenanceService();
  [(MaintenanceService *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (_TtC21contactsdonationagent18MaintenanceService)init
{
  return (_TtC21contactsdonationagent18MaintenanceService *)sub_1000149CC();
}

@end