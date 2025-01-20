@interface AccountsUISettingsDetailModel
- (_TtC18AccountsUISettings29AccountsUISettingsDetailModel)init;
@end

@implementation AccountsUISettingsDetailModel

- (_TtC18AccountsUISettings29AccountsUISettingsDetailModel)init
{
  result = (_TtC18AccountsUISettings29AccountsUISettingsDetailModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26924A0F8);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end