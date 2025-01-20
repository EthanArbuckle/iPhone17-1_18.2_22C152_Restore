@interface AccountsUIModel
- (_TtC18AccountsUISettings15AccountsUIModel)init;
- (_TtP8Settings20SettingsHostProtocol_)settingsHost;
- (void)accountWasAdded:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)setSettingsHost:(id)a3;
- (void)willSelect:(id)a3;
@end

@implementation AccountsUIModel

- (_TtP8Settings20SettingsHostProtocol_)settingsHost
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP8Settings20SettingsHostProtocol_ *)v2;
}

- (void)setSettingsHost:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_settingsHost);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC18AccountsUISettings15AccountsUIModel)init
{
  return (_TtC18AccountsUISettings15AccountsUIModel *)AccountsUIModel.init()();
}

- (void)willSelect:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);
}

- (void)accountWasAdded:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_247388514(v5, 0);
}

- (void)accountWasRemoved:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_247388514(v5, 1);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__selectedAccount;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B598);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  id v5 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B588);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addOtherShown, v6);
  v7((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown, v6);
  v7((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__contactMergeAlertShown, v6);
  v7((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__detailsPaneShown, v6);
  v8 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountSetupView;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B560);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__persistentDetailModel;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B548);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountView;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B550);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v7((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView, v6);
  v14 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountGroups;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B568);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountPath;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12B570);
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore));
  v18 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accounts;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B12B578);
  v20 = *(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8);
  v20(v18, v19);
  v20((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts, v19);
  swift_bridgeObjectRelease();
  swift_release();
}

@end