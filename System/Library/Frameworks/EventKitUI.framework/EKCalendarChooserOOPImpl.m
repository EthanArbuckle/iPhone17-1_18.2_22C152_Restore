@interface EKCalendarChooserOOPImpl
- (BOOL)allowsPullToRefresh;
- (BOOL)disableCalendarsUnselectedByFocus;
- (BOOL)onlyShowUnmanagedAccounts;
- (BOOL)showAccountStatus;
- (BOOL)showDelegateSetupCell;
- (BOOL)showDetailAccessories;
- (BOOL)showIdentityChooser;
- (BOOL)showsDeclinedEventsSetting;
- (CGSize)preferredContentSize;
- (EKCalendar)selectedCalendar;
- (EKCalendarChooserDelegate)delegate;
- (EKEventStore)eventStore;
- (EKSource)limitedToSource;
- (NSSet)selectedCalendars;
- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)initWithCoder:(id)a3;
- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)initWithEventStore:(id)a3;
- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)initWithNibName:(id)a3 bundle:(id)a4;
- (int)explanatoryTextMode;
- (int64_t)chooserMode;
- (int64_t)displayStyle;
- (int64_t)selectionStyle;
- (unint64_t)entityType;
- (void)setAllowsPullToRefresh:(BOOL)a3;
- (void)setChooserMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setEntityType:(unint64_t)a3;
- (void)setExplanatoryTextMode:(int)a3;
- (void)setLimitedToSource:(id)a3;
- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3;
- (void)setSelectedCalendar:(id)a3;
- (void)setSelectedCalendars:(id)a3;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setShowAccountStatus:(BOOL)a3;
- (void)setShowDelegateSetupCell:(BOOL)a3;
- (void)setShowDetailAccessories:(BOOL)a3;
- (void)setShowIdentityChooser:(BOOL)a3;
- (void)setShowsDeclinedEventsSetting:(BOOL)a3;
- (void)toggleAllCalendars;
- (void)viewDidLoad;
@end

@implementation EKCalendarChooserOOPImpl

- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)initWithEventStore:(id)a3
{
  id v3 = a3;
  v4 = (_TtC10EventKitUI24EKCalendarChooserOOPImpl *)sub_1B40E8B00(v3);

  return v4;
}

- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B40E8C88();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B40E230C((uint64_t)v2);
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

- (int64_t)selectionStyle
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setSelectionStyle:(int64_t)a3
{
}

- (int64_t)displayStyle
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setDisplayStyle:(int64_t)a3
{
}

- (unint64_t)entityType
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType);
  swift_beginAccess();
  return *v2;
}

- (void)setEntityType:(unint64_t)a3
{
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore));
}

- (BOOL)showIdentityChooser
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser;
  swift_beginAccess();
  return *v2;
}

- (void)setShowIdentityChooser:(BOOL)a3
{
}

- (BOOL)showDelegateSetupCell
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell;
  swift_beginAccess();
  return *v2;
}

- (void)setShowDelegateSetupCell:(BOOL)a3
{
}

- (EKCalendarChooserDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (EKCalendarChooserDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  uint64_t v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (NSSet)selectedCalendars
{
  v2 = self;
  sub_1B40E4FA8();

  sub_1B40E1BC8(0, &qword_1E9CFC438);
  sub_1B40E9594();
  double v3 = (void *)sub_1B411E9C8();
  swift_bridgeObjectRelease();

  return (NSSet *)v3;
}

- (void)setSelectedCalendars:(id)a3
{
  sub_1B40E1BC8(0, &qword_1E9CFC438);
  sub_1B40E9594();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars) = (Class)sub_1B411E9E8();
  uint64_t v4 = self;
  swift_bridgeObjectRelease();
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_1B40E5410(v5);

  swift_bridgeObjectRelease();
}

- (BOOL)showDetailAccessories
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories;
  swift_beginAccess();
  return *v2;
}

- (void)setShowDetailAccessories:(BOOL)a3
{
}

- (int64_t)chooserMode
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode);
  swift_beginAccess();
  return *v2;
}

- (void)setChooserMode:(int64_t)a3
{
}

- (BOOL)disableCalendarsUnselectedByFocus
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus;
  swift_beginAccess();
  return *v2;
}

- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3
{
}

- (BOOL)allowsPullToRefresh
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsPullToRefresh:(BOOL)a3
{
}

- (EKCalendar)selectedCalendar
{
  v2 = self;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_1B40E6490(v3);

  swift_bridgeObjectRelease();

  return (EKCalendar *)v4;
}

- (void)setSelectedCalendar:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1B40E95FC(a3);
}

- (BOOL)showsDeclinedEventsSetting
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDeclinedEventsSetting:(BOOL)a3
{
}

- (EKSource)limitedToSource
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource);
  swift_beginAccess();
  return (EKSource *)*v2;
}

- (void)setLimitedToSource:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1B40E9728(a3);
}

- (int)explanatoryTextMode
{
  v2 = (int *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode);
  swift_beginAccess();
  return *v2;
}

- (void)setExplanatoryTextMode:(int)a3
{
  uint64_t v5 = (int *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode);
  swift_beginAccess();
  *uint64_t v5 = a3;
  id v6 = self;
  v7 = sub_1B40E21E0();
  sub_1B40E2178(v8, (uint64_t)v10);
  sub_1B40E2178((uint64_t)v10, (uint64_t)v11);
  if (sub_1B40E8ED0((uint64_t)v11) != 1)
  {
    swift_beginAccess();
    sub_1B4116C4C(*v5);
  }
  ((void (*)(unsigned char *, void))v7)(v9, 0);
}

- (BOOL)showAccountStatus
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus;
  swift_beginAccess();
  return *v2;
}

- (void)setShowAccountStatus:(BOOL)a3
{
}

- (BOOL)onlyShowUnmanagedAccounts
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts;
  swift_beginAccess();
  return *v2;
}

- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3
{
}

- (void)toggleAllCalendars
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView;
  swift_beginAccess();
  sub_1B40E2178((uint64_t)v3, (uint64_t)v17);
  sub_1B40E2178((uint64_t)v17, (uint64_t)v18);
  if (sub_1B40E8ED0((uint64_t)v18) != 1)
  {
    sub_1B40E2178((uint64_t)v17, (uint64_t)v5);
    long long v13 = v5[6];
    long long v14 = v5[7];
    long long v15 = v5[8];
    __int16 v16 = v6;
    long long v9 = v5[2];
    long long v10 = v5[3];
    long long v11 = v5[4];
    long long v12 = v5[5];
    long long v7 = v5[0];
    long long v8 = v5[1];
    uint64_t v4 = self;
    sub_1B40E8EE8((uint64_t)v17, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_1B40E8F54);
    sub_1B4117094();
    sub_1B40E8EE8((uint64_t)v17, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_1B40E8E2C);
  }
}

- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC10EventKitUI24EKCalendarChooserOOPImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostingController));
  sub_1B40E2178((uint64_t)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView, (uint64_t)v3);
  sub_1B40E8EE8((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_1B40E8E2C);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource));
}

@end