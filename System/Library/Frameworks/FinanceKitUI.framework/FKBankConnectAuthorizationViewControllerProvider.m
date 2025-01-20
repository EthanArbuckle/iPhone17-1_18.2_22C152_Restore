@interface FKBankConnectAuthorizationViewControllerProvider
+ (id)makeAuthorizationViewControllerForAuthorizationSession:(id)a3 completion:(id)a4;
+ (id)makeAuthorizationViewControllerWithPaymentPass:(id)a3 institution:(id)a4 completion:(id)a5;
+ (id)makeMismatchedAccountAuthorizationViewControllerWithPaymentPass:(id)a3 institution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6;
+ (id)makeReconsentAuthorizationViewControllerWithPaymentPass:(id)a3 institution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6;
@end

@implementation FKBankConnectAuthorizationViewControllerProvider

+ (id)makeAuthorizationViewControllerWithPaymentPass:(id)a3 institution:(id)a4 completion:(id)a5
{
  return +[BankConnectAuthorizationViewControllerProvider makeConsentViewControllerWithPaymentPass:a3 fkInstitution:a4 completion:a5];
}

+ (id)makeReconsentAuthorizationViewControllerWithPaymentPass:(id)a3 institution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  return +[BankConnectAuthorizationViewControllerProvider makeReconsentViewControllerWithPaymentPass:a3 fkInstitution:a4 previousConsentUUID:a5 completion:a6];
}

+ (id)makeMismatchedAccountAuthorizationViewControllerWithPaymentPass:(id)a3 institution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  return +[BankConnectAuthorizationViewControllerProvider makeMismatchedAccountViewControllerWithPaymentPass:a3 fkInstitution:a4 previousConsentUUID:a5 completion:a6];
}

+ (id)makeAuthorizationViewControllerForAuthorizationSession:(id)a3 completion:(id)a4
{
  return +[BankConnectAuthorizationViewControllerProvider makeAuthorizationViewControllerFor:a3 completion:a4];
}

@end