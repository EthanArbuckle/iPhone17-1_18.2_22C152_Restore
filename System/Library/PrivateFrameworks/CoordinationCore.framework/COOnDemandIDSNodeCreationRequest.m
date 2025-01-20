@interface COOnDemandIDSNodeCreationRequest
- (COIDSMessage)message;
- (COOnDemandIDSNodeCreationRequest)initWithMessage:(id)a3 idsIdentifier:(id)a4 uriToken:(id)a5 requestIdentifier:(id)a6 responseIdentifier:(id)a7;
- (NSString)fromURIToken;
- (NSString)idsIdentifier;
- (NSString)requestIdentifier;
- (NSString)responseIdentifier;
@end

@implementation COOnDemandIDSNodeCreationRequest

- (COOnDemandIDSNodeCreationRequest)initWithMessage:(id)a3 idsIdentifier:(id)a4 uriToken:(id)a5 requestIdentifier:(id)a6 responseIdentifier:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)COOnDemandIDSNodeCreationRequest;
  v17 = [(COOnDemandIDSNodeCreationRequest *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_message, a3);
    objc_storeStrong((id *)&v18->_idsIdentifier, a4);
    objc_storeStrong((id *)&v18->_fromURIToken, a5);
    objc_storeStrong((id *)&v18->_requestIdentifier, a6);
    objc_storeStrong((id *)&v18->_responseIdentifier, a7);
  }

  return v18;
}

- (COIDSMessage)message
{
  return self->_message;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)fromURIToken
{
  return self->_fromURIToken;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)responseIdentifier
{
  return self->_responseIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_fromURIToken, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end