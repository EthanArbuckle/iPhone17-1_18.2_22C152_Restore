@interface ECDKIMVerifiableMessage
- (ECDKIMVerifiableMessage)initWithHeaders:(id)a3 bodyData:(id)a4;
- (ECRawMessageHeaders)headers;
- (NSData)bodyData;
@end

@implementation ECDKIMVerifiableMessage

- (ECDKIMVerifiableMessage)initWithHeaders:(id)a3 bodyData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ECDKIMVerifiableMessage;
  v9 = [(ECDKIMVerifiableMessage *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_headers, a3);
    uint64_t v11 = [v8 copy];
    bodyData = v10->_bodyData;
    v10->_bodyData = (NSData *)v11;
  }
  return v10;
}

- (ECRawMessageHeaders)headers
{
  return self->_headers;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end