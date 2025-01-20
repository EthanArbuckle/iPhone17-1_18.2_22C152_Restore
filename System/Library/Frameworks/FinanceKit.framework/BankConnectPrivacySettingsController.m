@interface BankConnectPrivacySettingsController
- (_TtC10FinanceKit36BankConnectPrivacySettingsController)init;
- (_TtC10FinanceKit36BankConnectPrivacySettingsController)initWithBundleID:(id)a3;
- (unint64_t)authorizationType;
@end

@implementation BankConnectPrivacySettingsController

- (_TtC10FinanceKit36BankConnectPrivacySettingsController)initWithBundleID:(id)a3
{
  uint64_t v4 = sub_2439582D0();
  uint64_t v6 = v5;
  uint64_t v7 = OBJC_IVAR____TtC10FinanceKit36BankConnectPrivacySettingsController_authorizationManager;
  type metadata accessor for AppAuthorizationStateManager();
  v8 = (objc_class *)swift_allocObject();
  v14 = &type metadata for FinancialDataTCC;
  v15 = &protocol witness table for FinancialDataTCC;
  v9 = self;
  *((void *)v8 + 2) = sub_2433725B8(MEMORY[0x263F8EE78]);
  sub_2433A857C(&v13, (uint64_t)v8 + 24);
  *(Class *)((char *)&self->super.isa + v7) = v8;
  v10 = (uint64_t *)((char *)v9 + OBJC_IVAR____TtC10FinanceKit36BankConnectPrivacySettingsController_bundleID);
  uint64_t *v10 = v4;
  v10[1] = v6;

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for BankConnectPrivacySettingsController();
  return [(BankConnectPrivacySettingsController *)&v12 init];
}

- (unint64_t)authorizationType
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC10FinanceKit36BankConnectPrivacySettingsController_bundleID);
  uint64_t v3 = *(void *)&self->bundleID[OBJC_IVAR____TtC10FinanceKit36BankConnectPrivacySettingsController_bundleID];
  uint64_t v4 = self;
  unint64_t v5 = AppAuthorizationStateManager.authorizationType(bundleID:)(v2, v3);

  return v5;
}

- (_TtC10FinanceKit36BankConnectPrivacySettingsController)init
{
  result = (_TtC10FinanceKit36BankConnectPrivacySettingsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end