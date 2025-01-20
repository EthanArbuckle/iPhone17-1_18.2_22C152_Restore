@interface SettingsExportManager
+ (_TtC15JournalSettings21SettingsExportManager)shared;
- (BOOL)exportButtonShouldBeEnabled;
- (_TtC15JournalSettings21SettingsExportManager)init;
- (void)startExportFromVC:(id)a3;
@end

@implementation SettingsExportManager

+ (_TtC15JournalSettings21SettingsExportManager)shared
{
  if (qword_19AE50 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1A3BF0;

  return (_TtC15JournalSettings21SettingsExportManager *)v2;
}

- (void)startExportFromVC:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_7396C(v4);
}

- (BOOL)exportButtonShouldBeEnabled
{
  v2 = self;
  char v3 = sub_73C00();

  return v3 & 1;
}

- (_TtC15JournalSettings21SettingsExportManager)init
{
  uint64_t v3 = OBJC_IVAR____TtC15JournalSettings21SettingsExportManager_COREDATA_STACK;
  type metadata accessor for CoreDataStackShared();
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_6B884();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SettingsExportManager();
  return [(SettingsExportManager *)&v6 init];
}

- (void).cxx_destruct
{
}

@end