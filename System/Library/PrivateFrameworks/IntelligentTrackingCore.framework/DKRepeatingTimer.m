@interface DKRepeatingTimer
- (_TtC23IntelligentTrackingCore16DKRepeatingTimer)init;
- (void)dealloc;
@end

@implementation DKRepeatingTimer

- (void)dealloc
{
  v2 = self;
  DKRepeatingTimer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23IntelligentTrackingCore16DKRepeatingTimer_date);
}

- (_TtC23IntelligentTrackingCore16DKRepeatingTimer)init
{
  result = (_TtC23IntelligentTrackingCore16DKRepeatingTimer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end