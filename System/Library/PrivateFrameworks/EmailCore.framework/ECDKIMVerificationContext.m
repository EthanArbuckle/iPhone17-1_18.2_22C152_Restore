@interface ECDKIMVerificationContext
- (BOOL)requireFullBodySignature;
- (ECDKIMVerifiableMessage)verifiableMessage;
- (ECDKIMVerificationContext)initWithVerifiableMessage:(id)a3 dkimSignatureHeaders:(id)a4;
- (ECRawMessageHeaders)headers;
- (NSArray)dkimSignatureHeaders;
- (NSData)bodyData;
- (void)removeDKIMSignatureHeaders:(id)a3;
- (void)setDkimSignatureHeaders:(id)a3;
- (void)setRequireFullBodySignature:(BOOL)a3;
@end

@implementation ECDKIMVerificationContext

- (ECDKIMVerificationContext)initWithVerifiableMessage:(id)a3 dkimSignatureHeaders:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ECDKIMVerificationContext;
  v9 = [(ECDKIMVerificationContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_verifiableMessage, a3);
    uint64_t v11 = [v8 copy];
    dkimSignatureHeaders = v10->_dkimSignatureHeaders;
    v10->_dkimSignatureHeaders = (NSArray *)v11;
  }
  return v10;
}

- (ECRawMessageHeaders)headers
{
  v2 = [(ECDKIMVerificationContext *)self verifiableMessage];
  v3 = [v2 headers];

  return (ECRawMessageHeaders *)v3;
}

- (NSData)bodyData
{
  v2 = [(ECDKIMVerificationContext *)self verifiableMessage];
  v3 = [v2 bodyData];

  return (NSData *)v3;
}

- (void)removeDKIMSignatureHeaders:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    v4 = (void *)[(NSArray *)self->_dkimSignatureHeaders mutableCopy];
    [v4 removeObjectsInArray:v5];
    [(ECDKIMVerificationContext *)self setDkimSignatureHeaders:v4];
  }
}

- (NSArray)dkimSignatureHeaders
{
  return self->_dkimSignatureHeaders;
}

- (void)setDkimSignatureHeaders:(id)a3
{
}

- (BOOL)requireFullBodySignature
{
  return self->_requireFullBodySignature;
}

- (void)setRequireFullBodySignature:(BOOL)a3
{
  self->_requireFullBodySignature = a3;
}

- (ECDKIMVerifiableMessage)verifiableMessage
{
  return self->_verifiableMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiableMessage, 0);
  objc_storeStrong((id *)&self->_dkimSignatureHeaders, 0);
}

@end