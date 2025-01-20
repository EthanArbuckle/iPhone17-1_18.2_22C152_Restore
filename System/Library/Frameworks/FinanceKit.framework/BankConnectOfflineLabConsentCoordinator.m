@interface BankConnectOfflineLabConsentCoordinator
- (_TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator)init;
- (id)offlineLabPrivacyBundleIdentifier;
- (void)loadOfflineLabSharingPreferenceWithCompletion:(id)a3;
- (void)saveOfflineLabSharingPermission:(BOOL)a3 withCompletion:(id)a4;
@end

@implementation BankConnectOfflineLabConsentCoordinator

- (void)loadOfflineLabSharingPreferenceWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_2437016EC(v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)saveOfflineLabSharingPermission:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  *(void *)(v13 + 32) = self;
  *(unsigned char *)(v13 + 40) = a3;
  *(void *)(v13 + 48) = sub_243701698;
  *(void *)(v13 + 56) = v11;
  v14 = self;
  swift_retain();
  sub_24363A9D4((uint64_t)v9, (uint64_t)&unk_268D9E998, v13);

  swift_release();
  swift_release();
}

- (id)offlineLabPrivacyBundleIdentifier
{
  v2 = (void *)sub_2439582A0();

  return v2;
}

- (_TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator)init
{
  v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator__bankConnectService;
  v4 = (objc_class *)type metadata accessor for BankConnectOfflineLabConsentCoordinator();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(BankConnectOfflineLabConsentCoordinator *)&v6 init];
}

- (void).cxx_destruct
{
}

@end