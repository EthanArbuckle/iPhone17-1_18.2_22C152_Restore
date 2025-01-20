@interface StewieStateMonitorAgent
- (_TtC8SOSBuddy23StewieStateMonitorAgent)init;
- (void)dealloc;
- (void)stateChanged:(id)a3;
@end

@implementation StewieStateMonitorAgent

- (void)dealloc
{
  v2 = self;
  sub_100148060();
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)stateChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001482EC(v4);
}

- (_TtC8SOSBuddy23StewieStateMonitorAgent)init
{
  result = (_TtC8SOSBuddy23StewieStateMonitorAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end