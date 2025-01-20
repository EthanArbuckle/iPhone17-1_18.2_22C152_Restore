@interface ASTSealablePayload
- (ASTSealablePayload)initWithPayload:(id)a3 signature:(id)a4;
- (BOOL)isSealed;
- (BOOL)sealWithPayloadSigner:(id)a3 error:(id *)a4;
- (NSData)payload;
- (NSData)signature;
- (NSString)base64Signature;
- (id)description;
- (id)generatePayload;
- (id)sealedDescription;
- (void)setBase64Signature:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSealed:(BOOL)a3;
- (void)setSignature:(id)a3;
@end

@implementation ASTSealablePayload

- (ASTSealablePayload)initWithPayload:(id)a3 signature:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASTSealablePayload;
  v9 = [(ASTSealablePayload *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payload, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_signature, a4);
      uint64_t v11 = [v8 base64EncodedStringWithOptions:0];
      base64Signature = v10->_base64Signature;
      v10->_base64Signature = (NSString *)v11;
    }
    v10->_sealed = 1;
  }

  return v10;
}

- (BOOL)sealWithPayloadSigner:(id)a3 error:(id *)a4
{
  v6 = (void (**)(id, void *, id *))a3;
  if ([(ASTSealablePayload *)self isSealed])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(ASTSealablePayload *)self generatePayload];
    v9 = +[ASTEncodingUtilities jsonSerializeObject:v8 error:a4];
    [(ASTSealablePayload *)self setPayload:v9];

    v10 = [(ASTSealablePayload *)self payload];

    BOOL v7 = v10 != 0;
    if (v10)
    {
      if (v6)
      {
        uint64_t v11 = [(ASTSealablePayload *)self payload];
        v12 = v6[2](v6, v11, a4);
        [(ASTSealablePayload *)self setSignature:v12];
      }
      [(ASTSealablePayload *)self setSealed:1];
    }
    v13 = [(ASTSealablePayload *)self signature];

    if (v13)
    {
      objc_super v14 = [(ASTSealablePayload *)self signature];
      v15 = [v14 base64EncodedStringWithOptions:0];
      [(ASTSealablePayload *)self setBase64Signature:v15];
    }
  }

  return v7;
}

- (id)sealedDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ASTSealablePayload *)self signature];
  v6 = [(ASTSealablePayload *)self payload];
  BOOL v7 = [v3 stringWithFormat:@"<%@[Sealed], signature=%@, payload=%@>", v4, v5, v6];

  return v7;
}

- (id)description
{
  if ([(ASTSealablePayload *)self isSealed])
  {
    v3 = [(ASTSealablePayload *)self sealedDescription];
  }
  else
  {
    uint64_t v4 = [(ASTSealablePayload *)self generatePayload];
    v3 = [v4 description];
  }

  return v3;
}

- (id)generatePayload
{
  return 0;
}

- (BOOL)isSealed
{
  return self->_sealed;
}

- (void)setSealed:(BOOL)a3
{
  self->_sealed = a3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)base64Signature
{
  return self->_base64Signature;
}

- (void)setBase64Signature:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_base64Signature, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end