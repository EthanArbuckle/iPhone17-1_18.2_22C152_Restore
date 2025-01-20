@interface EKEventEditView.EventEditViewCoordinator
- (_TtCV27EventKitUIRemoteUIExtension15EKEventEditView24EventEditViewCoordinator)init;
- (id)calendarModel;
- (id)pasteboardManagerForEventEditViewController:(id)a3;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
@end

@implementation EKEventEditView.EventEditViewCoordinator

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_10000C36C(v6, a4);
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  return 0;
}

- (id)calendarModel
{
  return 0;
}

- (_TtCV27EventKitUIRemoteUIExtension15EKEventEditView24EventEditViewCoordinator)init
{
  result = (_TtCV27EventKitUIRemoteUIExtension15EKEventEditView24EventEditViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->eventEditView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension15EKEventEditView24EventEditViewCoordinator_eventEditView
                                     + 8];
  uint64_t v3 = *(void *)&self->eventEditView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension15EKEventEditView24EventEditViewCoordinator_eventEditView
                                     + 24];
  swift_release();
  sub_1000047A0(v2);

  sub_1000047A0(v3);
}

@end