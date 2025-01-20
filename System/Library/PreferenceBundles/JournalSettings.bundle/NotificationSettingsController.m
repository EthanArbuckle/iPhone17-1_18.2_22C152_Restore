@interface NotificationSettingsController
- (NSString)formattedValue;
- (_TtC15JournalSettings30NotificationSettingsController)initWithCoder:(id)a3;
- (_TtC15JournalSettings30NotificationSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifierValueFor:(id)a3;
- (id)specifiers;
- (void)onButtonActionFor:(id)a3;
- (void)saveIfNeeded;
- (void)setSpecifierValue:(id)a3 for:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NotificationSettingsController

- (void)viewDidLoad
{
  v2 = self;
  sub_12D7BC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_12DF10(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NotificationSettingsController();
  id v4 = v6.receiver;
  [(NotificationSettingsController *)&v6 viewWillDisappear:v3];
  objc_msgSend(v4, "saveIfNeeded", v6.receiver, v6.super_class);
  id v5 = [self defaultCenter];
  [v5 removeObserver:v4 name:UIApplicationWillResignActiveNotification object:0];
}

- (id)specifiers
{
  v2 = self;
  sub_12E0D8();
  uint64_t v4 = v3;

  if (v4)
  {
    v5.super.isa = sub_145DD0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }

  return v5.super.isa;
}

- (NSString)formattedValue
{
  v2 = self;
  sub_1316D4();

  NSString v3 = sub_145B80();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC15JournalSettings30NotificationSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_145BC0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC15JournalSettings30NotificationSettingsController *)sub_131E80(v5, v7, a4);
}

- (_TtC15JournalSettings30NotificationSettingsController)initWithCoder:(id)a3
{
  return (_TtC15JournalSettings30NotificationSettingsController *)sub_13208C(a3);
}

- (void).cxx_destruct
{
  sub_2C34C(*(void *)&self->PSListController_opaque[OBJC_IVAR____TtC15JournalSettings30NotificationSettingsController____lazy_storage___scheduledReminder]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_135C24(*(void *)&self->PSListController_opaque[OBJC_IVAR____TtC15JournalSettings30NotificationSettingsController_savePhase]);
  unint64_t v3 = *(void *)&self->PSListController_opaque[OBJC_IVAR____TtC15JournalSettings30NotificationSettingsController_scheduleRecoveryPhase];

  sub_136834(v3);
}

- (void)setSpecifierValue:(id)a3 for:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    sub_1466A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    v9 = self;
  }
  sub_132A00((uint64_t)v10, (void (*)(char *, uint64_t))a4);

  sub_1248C((uint64_t)v10, &qword_19B1E0);
}

- (id)specifierValueFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1336B8(v4, (uint64_t)v13);

  uint64_t v6 = v14;
  if (v14)
  {
    uint64_t v7 = sub_2F114(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    __chkstk_darwin(v7);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)sub_146B80();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    sub_C7FC((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)onButtonActionFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_133F40(v4);
}

- (void)saveIfNeeded
{
  v2 = self;
  sub_134518();
}

@end