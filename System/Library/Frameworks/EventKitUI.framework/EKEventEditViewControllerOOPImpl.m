@interface EKEventEditViewControllerOOPImpl
- (BOOL)hasUnsavedChanges;
- (CGSize)preferredContentSize;
- (EKCalendar)defaultCalendar;
- (EKEvent)event;
- (EKEventEditViewDelegateAllOutOfProcess)editViewDelegate;
- (EKEventStore)eventStore;
- (UIColor)editorBackgroundColor;
- (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl)initWithCoder:(id)a3;
- (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelEditing;
- (void)focusAndSelectStartDate;
- (void)focusAndSelectTitle;
- (void)focusTitle;
- (void)setDefaultCalendar:(id)a3;
- (void)setEditViewDelegate:(id)a3;
- (void)setEditorBackgroundColor:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventStore:(id)a3;
- (void)viewDidLoad;
@end

@implementation EKEventEditViewControllerOOPImpl

- (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1B411E8C8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl *)sub_1B40FC018(v5, v7, a4);
}

- (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B40FF9B4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B40FC21C();
}

- (CGSize)preferredContentSize
{
  v2 = self;
  double v3 = EKUIContainedControllerIdealWidth();
  EKUIContainedControllerIdealHeight();

  double v5 = CGSizeMake(v4, v3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)sub_1B40FEE84((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore);
}

- (void)setEventStore:(id)a3
{
  id v6 = a3;
  double v5 = self;
  sub_1B40FFF64(a3, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore, (void (*)(void *))sub_1B41036FC);
}

- (EKEvent)event
{
  return (EKEvent *)sub_1B40FEE84((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event);
}

- (void)setEvent:(id)a3
{
  id v6 = a3;
  double v5 = self;
  sub_1B40FFF64(a3, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event, (void (*)(void *))sub_1B410378C);
}

- (EKEventEditViewDelegateAllOutOfProcess)editViewDelegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (EKEventEditViewDelegateAllOutOfProcess *)v2;
}

- (void)setEditViewDelegate:(id)a3
{
  uint64_t v4 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editViewDelegate);
  swift_beginAccess();
  *uint64_t v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)cancelEditing
{
}

- (EKCalendar)defaultCalendar
{
  return (EKCalendar *)sub_1B40FEE84((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar);
}

- (void)setDefaultCalendar:(id)a3
{
  id v6 = a3;
  double v5 = self;
  sub_1B40FFF64(a3, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar, sub_1B4103B48);
}

- (UIColor)editorBackgroundColor
{
  return (UIColor *)sub_1B40FEE84((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor);
}

- (void)setEditorBackgroundColor:(id)a3
{
  id v6 = a3;
  double v5 = self;
  sub_1B40FFF64(a3, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor, sub_1B4103DBC);
}

- (BOOL)hasUnsavedChanges
{
  double v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView);
  swift_beginAccess();
  uint64_t v4 = (void *)v3[1];
  if (v4)
  {
    double v5 = (void *)v3[9];
    id v6 = (void *)v3[8];
    uint64_t v16 = v3[7];
    uint64_t v13 = v3[5];
    uint64_t v14 = v3[6];
    uint64_t v11 = v3[3];
    uint64_t v12 = v3[4];
    uint64_t v10 = v3[2];
    uint64_t v7 = *v3;
    v15 = self;
    sub_1B40FFB74(v7, v4, v10, v11, v12, v13, v14, v16, v6, v5);
    char v8 = sub_1B4103E18();
    sub_1B40FFACC(v7, v4, v10, v11, v12, v13, v14, v16, v6, v5);
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (void)focusAndSelectTitle
{
}

- (void)focusAndSelectStartDate
{
}

- (void)focusTitle
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostingController));
  sub_1B40FFACC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._view + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tab + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(void **)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(void **)((char *)&self->super._toolbarItems+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostViewModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor);
}

@end