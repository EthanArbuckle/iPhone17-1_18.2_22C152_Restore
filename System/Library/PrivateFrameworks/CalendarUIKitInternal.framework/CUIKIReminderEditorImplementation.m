@interface CUIKIReminderEditorImplementation
- (BOOL)saveChangesToEvents:(id)a3 error:(id *)a4;
- (CUIKIntegrationAlertDisplayer)alertDisplayer;
- (_TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation)init;
- (_TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation)initWithEventStore:(id)a3 alertDisplayer:(id)a4 undoManager:(id)a5 changeTracker:(id)a6;
- (void)delete:(id)a3 completionHandler:(id)a4;
- (void)setAlertDisplayer:(id)a3;
@end

@implementation CUIKIReminderEditorImplementation

- (_TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation)initWithEventStore:(id)a3 alertDisplayer:(id)a4 undoManager:(id)a5 changeTracker:(id)a6
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = a5;
  id v11 = a6;
  v12 = (_TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation *)sub_2496F1944(v9, (uint64_t)a4, (uint64_t)a5, v11);

  swift_unknownObjectRelease();
  return v12;
}

- (CUIKIntegrationAlertDisplayer)alertDisplayer
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (CUIKIntegrationAlertDisplayer *)v2;
}

- (void)setAlertDisplayer:(id)a3
{
  v5 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer);
  swift_beginAccess();
  id *v5 = a3;
  swift_unknownObjectRetain_n();
  v6 = self;
  swift_unknownObjectRelease();
  *(Class *)((char *)&v6->super.isa
           + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer) = 0;

  swift_unknownObjectRelease();
  swift_release();
}

- (BOOL)saveChangesToEvents:(id)a3 error:(id *)a4
{
  sub_2496E5150(0, &qword_2696CBAB0);
  unint64_t v5 = sub_2496F99A0();
  v6 = self;
  sub_2496E7194(v5);

  swift_bridgeObjectRelease();
  return 1;
}

- (void)delete:(id)a3 completionHandler:(id)a4
{
  unint64_t v5 = _Block_copy(a4);
  sub_2496E5150(0, &qword_2696CBAB0);
  unint64_t v6 = sub_2496F99A0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = self;
  sub_2496EB158(v6, (uint64_t)sub_2496F3234, v7);
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation)init
{
  result = (_TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore));
  swift_unknownObjectRelease();
}

@end