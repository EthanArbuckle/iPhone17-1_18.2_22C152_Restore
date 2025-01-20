@interface FKBankConnectAccountConsentManagementViewControllerProvider
+ (id)makeViewControllerWithAccountIdentifier:(id)a3 institutionIdentifier:(id)a4;
@end

@implementation FKBankConnectAccountConsentManagementViewControllerProvider

+ (id)makeViewControllerWithAccountIdentifier:(id)a3 institutionIdentifier:(id)a4
{
  return +[BankConnectAccountConsentManagementViewControllerProvider makeViewControllerWithAccountIdentifier:a3 institutionIdentifier:a4];
}

@end