@interface BankConnectInstitutionConsentManagementViewControllerProvider
+ (id)makeViewControllerWithInstitutionIdentifier:(id)a3;
- (_TtC12FinanceKitUI61BankConnectInstitutionConsentManagementViewControllerProvider)init;
@end

@implementation BankConnectInstitutionConsentManagementViewControllerProvider

+ (id)makeViewControllerWithInstitutionIdentifier:(id)a3
{
  uint64_t v3 = sub_243DFE910();
  uint64_t v5 = v4;
  id v6 = objc_allocWithZone((Class)type metadata accessor for BankConnectInstitutionConsentManagementViewController());
  swift_bridgeObjectRetain();
  v7 = sub_243C559D0(v3, v5);
  swift_bridgeObjectRelease();

  return v7;
}

- (_TtC12FinanceKitUI61BankConnectInstitutionConsentManagementViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectInstitutionConsentManagementViewControllerProvider();
  return [(BankConnectInstitutionConsentManagementViewControllerProvider *)&v3 init];
}

@end