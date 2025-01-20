@interface MenstrualCyclesOnboardingPeriodTrackingViewController
- (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelButtonTapped:(id)a3;
- (void)dealloc;
- (void)nextButtonTapped:(id)a3;
- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MenstrualCyclesOnboardingPeriodTrackingViewController

- (void)dealloc
{
  v2 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController_userInfo)
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18OnboardingUserInfo_observers);
  v3 = self;
  objc_msgSend(v2, sel_unregisterObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for MenstrualCyclesOnboardingPeriodTrackingViewController();
  [(MenstrualCyclesOnboardingPeriodTrackingViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController_pinnedContentManager);
  sub_2411CD138((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController____lazy_storage___heightAnchor);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2413AF7A4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2413AF974();
}

- (void)nextButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  objc_super v4 = self;
  sub_241632CE8();
  swift_unknownObjectRelease();
  sub_2413AFB74();

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v5);
}

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  objc_super v4 = self;
  sub_241632CE8();
  swift_unknownObjectRelease();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  id v6 = sub_2411D33C8((uint64_t)sub_2413B2708, v5);
  swift_release_n();
  [(MenstrualCyclesOnboardingPeriodTrackingViewController *)v4 presentViewController:v6 animated:1 completion:0];

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v7);
}

- (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin53MenstrualCyclesOnboardingPeriodTrackingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  swift_retain();
  id v6 = sub_2413AC144(0);
  swift_release();
  int64_t v7 = v6[2];

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  v12 = sub_2413B0958(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_2413B0F40(v6, a4);
  v9 = v8;

  return v9;
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = self;
  sub_2413B14DC(a3, v4);
}

@end