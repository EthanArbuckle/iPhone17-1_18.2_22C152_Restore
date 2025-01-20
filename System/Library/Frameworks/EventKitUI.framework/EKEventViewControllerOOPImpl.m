@interface EKEventViewControllerOOPImpl
- (BOOL)ICSPreview;
- (BOOL)allowsCalendarPreview;
- (BOOL)allowsEditing;
- (BOOL)allowsInviteResponses;
- (BOOL)allowsSubitems;
- (BOOL)calendarPreviewIsInlineDayView;
- (BOOL)hasInProcessNavBar;
- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter;
- (BOOL)isLargeDayView;
- (BOOL)minimalMode;
- (BOOL)noninteractivePlatterMode;
- (BOOL)showsAddToCalendarForICSPreview;
- (BOOL)showsDelegateMessage;
- (BOOL)showsDelegatorMessage;
- (BOOL)showsDeleteForICSPreview;
- (BOOL)showsDetectedConferenceItem;
- (BOOL)showsDoneButton;
- (BOOL)showsOutOfDateMessage;
- (BOOL)showsUpdateCalendarForICSPreview;
- (CGSize)preferredContentSize;
- (EKEvent)event;
- (EKEventViewDelegate)delegate;
- (_TtC10EventKitUI28EKEventViewControllerOOPImpl)initWithCoder:(id)a3;
- (_TtC10EventKitUI28EKEventViewControllerOOPImpl)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doneButtonTapped;
- (void)eventEditViewCompletedWith:(int64_t)a3 eventID:(id)a4 waitUntil:(id)a5;
- (void)eventEditViewPresented:(BOOL)a3;
- (void)setAllowsCalendarPreview:(BOOL)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsInviteResponses:(BOOL)a3;
- (void)setAllowsSubitems:(BOOL)a3;
- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setHasInProcessNavBar:(BOOL)a3;
- (void)setICSPreview:(BOOL)a3;
- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3;
- (void)setIsLargeDayView:(BOOL)a3;
- (void)setMinimalMode:(BOOL)a3;
- (void)setNoninteractivePlatterMode:(BOOL)a3;
- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3;
- (void)setShowsDelegateMessage:(BOOL)a3;
- (void)setShowsDelegatorMessage:(BOOL)a3;
- (void)setShowsDeleteForICSPreview:(BOOL)a3;
- (void)setShowsDetectedConferenceItem:(BOOL)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)setShowsOutOfDateMessage:(BOOL)a3;
- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation EKEventViewControllerOOPImpl

- (BOOL)hasInProcessNavBar
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar;
  swift_beginAccess();
  return *v2;
}

- (void)setHasInProcessNavBar:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_TtC10EventKitUI28EKEventViewControllerOOPImpl)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10EventKitUI28EKEventViewControllerOOPImpl *)sub_1B410A85C(v5, v7, a4);
}

- (_TtC10EventKitUI28EKEventViewControllerOOPImpl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B4110E3C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B410AAFC();
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

- (void)doneButtonTapped
{
  double v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  swift_beginAccess();
  uint64_t v4 = (void *)v3[1];
  if (v4)
  {
    uint64_t v5 = *v3;
    uint64_t v8 = *v3;
    uint64_t v11 = v3[3];
    uint64_t v9 = v3[2];
    uint64_t v6 = v3[4];
    uint64_t v7 = v3[5];
    uint64_t v12 = v3[6];
    v10 = self;
    sub_1B4111070(v5, v4, v9, v11, v6, v7, v12);
    sub_1B40F24A4();
    sub_1B4110FF0(v8, v4, v9, v11, v6, v7, v12);
  }
}

- (void)eventEditViewCompletedWith:(int64_t)a3 eventID:(id)a4 waitUntil:(id)a5
{
  uint64_t v8 = sub_1B411E8C8();
  uint64_t v22 = v9;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  swift_beginAccess();
  uint64_t v11 = (void *)v10[1];
  if (v11)
  {
    uint64_t v12 = v10[6];
    uint64_t v20 = v10[5];
    uint64_t v21 = v8;
    uint64_t v19 = v10[2];
    uint64_t v13 = *v10;
    uint64_t v15 = *v10;
    uint64_t v16 = v10[4];
    uint64_t v14 = v10[3];
    id v18 = a5;
    v17 = self;
    sub_1B4111070(v13, v11, v19, v14, v16, v20, v12);
    sub_1B40F262C(a3, v21, v22, (uint64_t)a5);
    sub_1B4110FF0(v15, v11, v19, v14, v16, v20, v12);
  }
  swift_bridgeObjectRelease();
}

- (void)eventEditViewPresented:(BOOL)a3
{
  BOOL v14 = a3;
  uint64_t v4 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  swift_beginAccess();
  uint64_t v5 = (void *)v4[1];
  if (v5)
  {
    uint64_t v13 = v4[2];
    uint64_t v6 = *v4;
    uint64_t v10 = *v4;
    uint64_t v11 = v4[3];
    uint64_t v7 = v4[4];
    uint64_t v8 = v4[5];
    uint64_t v9 = v4[6];
    uint64_t v12 = self;
    sub_1B4111070(v6, v5, v13, v11, v7, v8, v9);
    sub_1B40F2764(v14);
    sub_1B4110FF0(v10, v5, v13, v11, v7, v8, v9);
  }
}

- (EKEvent)event
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event);
  swift_beginAccess();
  return (EKEvent *)*v2;
}

- (void)setEvent:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1B4111364(a3);
}

- (BOOL)allowsEditing
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsEditing:(BOOL)a3
{
}

- (EKEventViewDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (EKEventViewDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  uint64_t v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)allowsCalendarPreview
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsCalendarPreview:(BOOL)a3
{
}

- (BOOL)showsDoneButton
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)calendarPreviewIsInlineDayView
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView;
  swift_beginAccess();
  return *v2;
}

- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3
{
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter;
  swift_beginAccess();
  return *v2;
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
}

- (BOOL)ICSPreview
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview;
  swift_beginAccess();
  return *v2;
}

- (void)setICSPreview:(BOOL)a3
{
}

- (BOOL)allowsInviteResponses
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsInviteResponses:(BOOL)a3
{
}

- (BOOL)showsAddToCalendarForICSPreview
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3
{
}

- (BOOL)showsUpdateCalendarForICSPreview
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3
{
}

- (BOOL)showsDeleteForICSPreview
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDeleteForICSPreview:(BOOL)a3
{
}

- (BOOL)allowsSubitems
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsSubitems:(BOOL)a3
{
}

- (BOOL)showsOutOfDateMessage
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsOutOfDateMessage:(BOOL)a3
{
}

- (BOOL)showsDelegatorMessage
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDelegatorMessage:(BOOL)a3
{
}

- (BOOL)showsDelegateMessage
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDelegateMessage:(BOOL)a3
{
}

- (BOOL)showsDetectedConferenceItem
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDetectedConferenceItem:(BOOL)a3
{
}

- (BOOL)minimalMode
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode;
  swift_beginAccess();
  return *v2;
}

- (void)setMinimalMode:(BOOL)a3
{
}

- (BOOL)noninteractivePlatterMode
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode;
  swift_beginAccess();
  return *v2;
}

- (void)setNoninteractivePlatterMode:(BOOL)a3
{
}

- (BOOL)isLargeDayView
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLargeDayView:(BOOL)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostingController));
  sub_1B4110FF0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._view + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tabBarItem + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tab + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event));

  swift_unknownObjectRelease();
}

@end