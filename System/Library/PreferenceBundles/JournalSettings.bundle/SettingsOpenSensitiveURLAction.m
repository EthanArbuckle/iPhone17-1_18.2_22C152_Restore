@interface SettingsOpenSensitiveURLAction
- (_TtC15JournalSettings30SettingsOpenSensitiveURLAction)init;
- (void)callAsFunction:(id)a3;
@end

@implementation SettingsOpenSensitiveURLAction

- (void)callAsFunction:(id)a3
{
  uint64_t v5 = sub_A314(&qword_19EB20);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_144EF0();
    uint64_t v8 = sub_144F60();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_144F60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_139424((uint64_t)v7, 0, 0, 0);

  sub_1248C((uint64_t)v7, &qword_19EB20);
}

- (_TtC15JournalSettings30SettingsOpenSensitiveURLAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SettingsOpenSensitiveURLAction();
  return [(SettingsOpenSensitiveURLAction *)&v3 init];
}

@end