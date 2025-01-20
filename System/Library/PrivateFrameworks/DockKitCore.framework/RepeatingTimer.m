@interface RepeatingTimer
- (_TtC11DockKitCore14RepeatingTimer)init;
- (void)dealloc;
@end

@implementation RepeatingTimer

- (void)dealloc
{
  v2 = self;
  RepeatingTimer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore14RepeatingTimer_date);
}

- (_TtC11DockKitCore14RepeatingTimer)init
{
  result = (_TtC11DockKitCore14RepeatingTimer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end