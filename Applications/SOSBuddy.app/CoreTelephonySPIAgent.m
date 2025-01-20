@interface CoreTelephonySPIAgent
- (_TtC8SOSBuddy21CoreTelephonySPIAgent)init;
- (void)dealloc;
@end

@implementation CoreTelephonySPIAgent

- (_TtC8SOSBuddy21CoreTelephonySPIAgent)init
{
  return (_TtC8SOSBuddy21CoreTelephonySPIAgent *)sub_100273D9C();
}

- (void)dealloc
{
  v2 = self;
  sub_1002742BC();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy21CoreTelephonySPIAgent_client);
}

@end