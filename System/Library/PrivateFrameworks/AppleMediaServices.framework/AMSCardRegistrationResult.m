@interface AMSCardRegistrationResult
- (AMSCardRegistrationResult)initWithCardRegistrationResponse:(id)a3;
- (NSData)cardData;
- (NSURL)brokerURL;
- (NSURL)paymentServicesURL;
@end

@implementation AMSCardRegistrationResult

- (AMSCardRegistrationResult)initWithCardRegistrationResponse:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSCardRegistrationResult;
  v5 = [(AMSCardRegistrationResult *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 cardData];
    cardData = v5->_cardData;
    v5->_cardData = (NSData *)v6;

    uint64_t v8 = [v4 brokerURL];
    brokerURL = v5->_brokerURL;
    v5->_brokerURL = (NSURL *)v8;

    uint64_t v10 = [v4 paymentServicesURL];
    paymentServicesURL = v5->_paymentServicesURL;
    v5->_paymentServicesURL = (NSURL *)v10;
  }
  return v5;
}

- (NSData)cardData
{
  return self->_cardData;
}

- (NSURL)brokerURL
{
  return self->_brokerURL;
}

- (NSURL)paymentServicesURL
{
  return self->_paymentServicesURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentServicesURL, 0);
  objc_storeStrong((id *)&self->_brokerURL, 0);
  objc_storeStrong((id *)&self->_cardData, 0);
}

@end