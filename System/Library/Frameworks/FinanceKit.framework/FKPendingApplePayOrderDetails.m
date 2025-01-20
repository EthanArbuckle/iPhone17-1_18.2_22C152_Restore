@interface FKPendingApplePayOrderDetails
- (FKPendingApplePayOrderDetails)initWithTransactionIdentifier:(id)a3 orderTypeIdentifier:(id)a4 orderIdentifier:(id)a5 webServiceBaseURL:(id)a6 authenticationToken:(id)a7;
- (NSString)authenticationToken;
- (NSString)orderIdentifier;
- (NSString)orderTypeIdentifier;
- (NSString)transactionIdentifier;
- (NSURL)webServiceBaseURL;
@end

@implementation FKPendingApplePayOrderDetails

- (FKPendingApplePayOrderDetails)initWithTransactionIdentifier:(id)a3 orderTypeIdentifier:(id)a4 orderIdentifier:(id)a5 webServiceBaseURL:(id)a6 authenticationToken:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)FKPendingApplePayOrderDetails;
  v17 = [(FKPendingApplePayOrderDetails *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    transactionIdentifier = v17->_transactionIdentifier;
    v17->_transactionIdentifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    orderTypeIdentifier = v17->_orderTypeIdentifier;
    v17->_orderTypeIdentifier = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    orderIdentifier = v17->_orderIdentifier;
    v17->_orderIdentifier = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    webServiceBaseURL = v17->_webServiceBaseURL;
    v17->_webServiceBaseURL = (NSURL *)v24;

    uint64_t v26 = [v16 copy];
    authenticationToken = v17->_authenticationToken;
    v17->_authenticationToken = (NSString *)v26;
  }
  return v17;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSString)orderTypeIdentifier
{
  return self->_orderTypeIdentifier;
}

- (NSString)orderIdentifier
{
  return self->_orderIdentifier;
}

- (NSURL)webServiceBaseURL
{
  return self->_webServiceBaseURL;
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_webServiceBaseURL, 0);
  objc_storeStrong((id *)&self->_orderIdentifier, 0);
  objc_storeStrong((id *)&self->_orderTypeIdentifier, 0);

  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end