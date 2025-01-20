@interface CalendarSheet.CalendarCoordinator
- (_TtCV16EventViewService13CalendarSheet19CalendarCoordinator)init;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
@end

@implementation CalendarSheet.CalendarCoordinator

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  v4 = *(void (**)(int64_t))((char *)&self->super.isa
                                             + OBJC_IVAR____TtCV16EventViewService13CalendarSheet19CalendarCoordinator_completionHandler);
  if (v4)
  {
    id v7 = a3;
    v8 = self;
    v4(a4);
  }
}

- (_TtCV16EventViewService13CalendarSheet19CalendarCoordinator)init
{
  result = (_TtCV16EventViewService13CalendarSheet19CalendarCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100009CD8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV16EventViewService13CalendarSheet19CalendarCoordinator_completionHandler));
}

@end