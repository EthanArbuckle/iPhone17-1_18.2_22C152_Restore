@interface SKPaymentInternal
- (SKPaymentInternal)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SKPaymentInternal

- (SKPaymentInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKPaymentInternal;
  result = [(SKPaymentInternal *)&v3 init];
  if (result)
  {
    result->_quantity = 1;
    result->_simulatesAskToBuyInSandbox = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(SKPaymentInternal);
  uint64_t v6 = [(NSString *)self->_applicationUsername copyWithZone:a3];
  applicationUsername = v5->_applicationUsername;
  v5->_applicationUsername = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_partnerIdentifier copyWithZone:a3];
  partnerIdentifier = v5->_partnerIdentifier;
  v5->_partnerIdentifier = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_partnerTransactionIdentifier copyWithZone:a3];
  partnerTransactionIdentifier = v5->_partnerTransactionIdentifier;
  v5->_partnerTransactionIdentifier = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_productIdentifier copyWithZone:a3];
  productIdentifier = v5->_productIdentifier;
  v5->_productIdentifier = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_productKind copyWithZone:a3];
  productKind = v5->_productKind;
  v5->_productKind = (NSString *)v14;

  v5->_quantity = self->_quantity;
  uint64_t v16 = [(NSData *)self->_requestData copyWithZone:a3];
  requestData = v5->_requestData;
  v5->_requestData = (NSData *)v16;

  uint64_t v18 = [(NSDictionary *)self->_requestParameters copyWithZone:a3];
  requestParameters = v5->_requestParameters;
  v5->_requestParameters = (NSDictionary *)v18;

  v5->_simulatesAskToBuyInSandbox = self->_simulatesAskToBuyInSandbox;
  objc_storeStrong((id *)&v5->_subscriptionPeriod, self->_subscriptionPeriod);
  v5->_isStoreOriginated = self->_isStoreOriginated;
  objc_storeStrong((id *)&v5->_paymentDiscount, self->_paymentDiscount);
  v20 = [(SKPaymentAppleIDAuthorizationRequest *)self->_appleIDAuthorizationClientInfo copyWithZone:a3];
  appleIDAuthorizationClientInfo = v5->_appleIDAuthorizationClientInfo;
  v5->_appleIDAuthorizationClientInfo = v20;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleIDAuthorizationClientInfo, 0);
  objc_storeStrong((id *)&self->_paymentDiscount, 0);
  objc_storeStrong((id *)&self->_subscriptionPeriod, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_productKind, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);

  objc_storeStrong((id *)&self->_applicationUsername, 0);
}

@end