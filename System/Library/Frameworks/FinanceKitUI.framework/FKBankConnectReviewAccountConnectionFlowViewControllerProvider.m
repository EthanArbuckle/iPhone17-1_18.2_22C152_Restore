@interface FKBankConnectReviewAccountConnectionFlowViewControllerProvider
+ (id)makeViewControllerWithInstitution:(id)a3 paymentPass:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6;
@end

@implementation FKBankConnectReviewAccountConnectionFlowViewControllerProvider

+ (id)makeViewControllerWithInstitution:(id)a3 paymentPass:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  return +[BankConnectReviewAccountConnectionFlowViewControllerProvider makeViewControllerWithInstitution:a3 paymentPass:a4 previousConsentUUID:a5 completion:a6];
}

@end