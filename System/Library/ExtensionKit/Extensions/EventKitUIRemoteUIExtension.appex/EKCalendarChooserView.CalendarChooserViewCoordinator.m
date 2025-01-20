@interface EKCalendarChooserView.CalendarChooserViewCoordinator
- (_TtCV27EventKitUIRemoteUIExtension21EKCalendarChooserView30CalendarChooserViewCoordinator)init;
- (void)calendarChooserSelectionDidChange:(id)a3;
@end

@implementation EKCalendarChooserView.CalendarChooserViewCoordinator

- (void)calendarChooserSelectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000FD20(v4);
}

- (_TtCV27EventKitUIRemoteUIExtension21EKCalendarChooserView30CalendarChooserViewCoordinator)init
{
  result = (_TtCV27EventKitUIRemoteUIExtension21EKCalendarChooserView30CalendarChooserViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->calendarChooserView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension21EKCalendarChooserView30CalendarChooserViewCoordinator_calendarChooserView
                                           + 8];
  uint64_t v3 = *(void *)&self->calendarChooserView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension21EKCalendarChooserView30CalendarChooserViewCoordinator_calendarChooserView
                                           + 24];
  swift_release();
  sub_1000047A0(v2);

  sub_1000047A0(v3);
}

@end