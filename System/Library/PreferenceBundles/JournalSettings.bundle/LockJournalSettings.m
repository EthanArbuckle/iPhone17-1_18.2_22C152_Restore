@interface LockJournalSettings
+ (BOOL)canAppFeatureLockJournalBeEnabled;
+ (BOOL)isAppFeatureLockJournalEnabled;
+ (BOOL)isDevicePasscodeProtected;
+ (BOOL)isOSFeatureAppProtectionEnabled;
+ (NSString)navigationTitle;
- (BOOL)canBeShownFromSuspendedState;
- (_TtC15JournalSettings19LockJournalSettings)initWithCoder:(id)a3;
- (_TtC15JournalSettings19LockJournalSettings)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifierValueFor:(id)a3;
- (id)specifiers;
- (void)setSpecifierValue:(id)a3 for:(id)a4;
- (void)viewDidLoad;
@end

@implementation LockJournalSettings

+ (BOOL)isDevicePasscodeProtected
{
  id v2 = [objc_allocWithZone((Class)LAContext) init];
  unsigned __int8 v3 = [v2 canEvaluatePolicy:2 error:0];

  return v3;
}

+ (BOOL)isOSFeatureAppProtectionEnabled
{
  id v2 = [self applicationWithBundleIdentifier:@"com.apple.journal"];
  unsigned __int8 v3 = [v2 isLocked];

  return v3;
}

+ (BOOL)canAppFeatureLockJournalBeEnabled
{
  return sub_5A66C() & 1;
}

+ (BOOL)isAppFeatureLockJournalEnabled
{
  return sub_5A714();
}

+ (NSString)navigationTitle
{
  if (qword_19ADE0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v2 = sub_145B80();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LockJournalSettings();
  id v2 = v4.receiver;
  [(LockJournalSettings *)&v4 viewDidLoad];
  if (qword_19ADE0 != -1) {
    swift_once();
  }
  NSString v3 = sub_145B80();
  objc_msgSend(v2, "setTitle:", v3, v4.receiver, v4.super_class);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)specifiers
{
  id v2 = self;
  sub_5834C();
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

- (id)specifierValueFor:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  sub_59714(v4, (uint64_t)v13);

  uint64_t v6 = v14;
  if (v14)
  {
    v7 = sub_2F114(v13, v14);
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

- (void)setSpecifierValue:(id)a3 for:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1466A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    uint64_t v9 = self;
  }
  sub_5998C((uint64_t)v10, a4);

  sub_C5BC((uint64_t)v10);
}

- (_TtC15JournalSettings19LockJournalSettings)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_145BC0();
    id v6 = a4;
    NSString v7 = sub_145B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LockJournalSettings();
  uint64_t v9 = [(LockJournalSettings *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC15JournalSettings19LockJournalSettings)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LockJournalSettings();
  return [(LockJournalSettings *)&v5 initWithCoder:a3];
}

@end