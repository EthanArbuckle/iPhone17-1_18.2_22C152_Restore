@interface TTRIGroceryAddLanguageController
- (_TtC17RemindersSettings32TTRIGroceryAddLanguageController)initWithCoder:(id)a3;
- (_TtC17RemindersSettings32TTRIGroceryAddLanguageController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)automaticSecondaryGroceryLocale;
- (id)secondaryGroceryLanguageDisplayName;
- (id)specifiers;
- (void)setAutomaticSecondaryGroceryLocale:(id)a3;
- (void)viewDidLoad;
@end

@implementation TTRIGroceryAddLanguageController

- (_TtC17RemindersSettings32TTRIGroceryAddLanguageController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_14230();
  }
  return (_TtC17RemindersSettings32TTRIGroceryAddLanguageController *)sub_DBD8();
}

- (_TtC17RemindersSettings32TTRIGroceryAddLanguageController)initWithCoder:(id)a3
{
  *(void *)&self->PSListController_opaque[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_languageListSpecifier] = 0;
  *(void *)&self->PSListController_opaque[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_fixLanguageSpecifier] = 0;
  self->PSListController_opaque[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_hasSecondaryGroceryLocaleCache] = 0;
  *(void *)&self->PSListController_opaque[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_cachedSecondaryGroceryLocale] = 0;
  id v4 = a3;

  result = (_TtC17RemindersSettings32TTRIGroceryAddLanguageController *)sub_144B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_9F88();
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = sub_A720();

  if (v3)
  {
    v4.super.isa = sub_142A0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (id)secondaryGroceryLanguageDisplayName
{
  v2 = self;
  sub_B950();

  NSString v3 = sub_14200();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)automaticSecondaryGroceryLocale
{
  v2 = self;
  id v3 = &dword_0 + 1;
  NSArray v4 = sub_B2FC(1);
  if (v4)
  {
    v5 = v4;
    id v3 = [v4 isAutomatic];
  }
  id v6 = [objc_allocWithZone((Class)NSNumber) initWithBool:v3];

  return v6;
}

- (void)setAutomaticSecondaryGroceryLocale:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_BC94(v4);
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_cachedSecondaryGroceryLocale];
}

@end