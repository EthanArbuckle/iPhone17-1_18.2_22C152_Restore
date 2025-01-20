@interface PrimaryAppleAccountListSectionProvider
- (_TtC11SettingsApp38PrimaryAppleAccountListSectionProvider)init;
- (void)dealloc;
@end

@implementation PrimaryAppleAccountListSectionProvider

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 defaultCenter];
  v7 = v5;
  v8 = (void *)static FamilySettingsFactory.FamilySettingsViewsHaveChanged.getter();
  [v6 removeObserver:v7 name:v8 object:0];

  v9.receiver = v7;
  v9.super_class = ObjectType;
  [(PrimaryAppleAccountListSectionProvider *)&v9 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp38PrimaryAppleAccountListSectionProvider_primaryAppleAccountStatusObserver));
  swift_release();
  sub_10003F5D0((uint64_t)self + OBJC_IVAR____TtC11SettingsApp38PrimaryAppleAccountListSectionProvider____lazy_storage___familyModel, &qword_100162DE0);
}

- (_TtC11SettingsApp38PrimaryAppleAccountListSectionProvider)init
{
  result = (_TtC11SettingsApp38PrimaryAppleAccountListSectionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end