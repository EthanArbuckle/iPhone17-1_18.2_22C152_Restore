@interface HPRFMindReminderViewController
+ (NSString)remindersDidChangeNotification;
- (HPRFMindReminderViewController)initWithCoder:(id)a3;
- (HPRFMindReminderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HPRFMindReminderViewController)initWithReminderProvider:(id)a3 currentReminder:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelTapped;
- (void)enableSwitchTappedWithEnableSwitch:(id)a3;
- (void)rightBarButtonTapped;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HPRFMindReminderViewController

+ (NSString)remindersDidChangeNotification
{
  if (qword_19E10 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1A400;

  return (NSString *)v2;
}

- (HPRFMindReminderViewController)initWithReminderProvider:(id)a3 currentReminder:(id)a4
{
  if (a4)
  {
    objc_allocWithZone((Class)type metadata accessor for MindReminderViewController());
    id v6 = a3;
    id v7 = a4;
    id v8 = v6;
    id v9 = a4;
  }
  else
  {
    objc_allocWithZone((Class)type metadata accessor for MindReminderViewController());
    id v8 = a3;
    id v9 = 0;
  }
  v10 = (HPRFMindReminderViewController *)sub_66EC(v8, v9);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

- (HPRFMindReminderViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___HPRFMindReminderViewController_reminderEnabled) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HPRFMindReminderViewController_weekdaySelection) = 0;
  id v4 = a3;

  result = (HPRFMindReminderViewController *)sub_E4C0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_69C8();
}

- (void)cancelTapped
{
}

- (void)rightBarButtonTapped
{
  v2 = self;
  sub_7B0C();
}

- (void)enableSwitchTappedWithEnableSwitch:(id)a3
{
  id v4 = a3;
  id v6 = self;
  unsigned __int8 v5 = [v4 isOn];
  *((unsigned char *)&v6->super.super.super.isa + OBJC_IVAR___HPRFMindReminderViewController_reminderEnabled) = v5;
}

- (HPRFMindReminderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (HPRFMindReminderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HPRFMindReminderViewController_tableView);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_E1C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E190();
  id v10 = a3;
  v11 = self;
  sub_89B8(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HPRFMindReminderViewController_state)) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HPRFMindReminderViewController_state)) {
    return 2;
  }
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_E1C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E190();
  id v10 = a3;
  v11 = self;
  id v12 = sub_C004();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

@end