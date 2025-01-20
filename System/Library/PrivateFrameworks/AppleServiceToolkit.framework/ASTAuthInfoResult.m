@interface ASTAuthInfoResult
+ (id)authInfoResultWithAttestation:(id)a3;
+ (id)authInfoResultWithAttestation:(id)a3 certificate:(id)a4 type:(int64_t)a5 error:(int64_t)a6;
+ (id)sealedAuthInfoResultWithPayload:(id)a3 signature:(id)a4;
- (NSData)attestation;
- (NSData)cert;
- (id)generatePayload;
- (int64_t)error;
- (int64_t)type;
- (void)setAttestation:(id)a3;
- (void)setCert:(id)a3;
- (void)setError:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation ASTAuthInfoResult

- (id)generatePayload
{
  v3 = [(ASTAuthInfoResult *)self attestation];
  if (v3)
  {
    v4 = [(ASTAuthInfoResult *)self attestation];
    v5 = [MEMORY[0x263EFF9D0] null];

    if (v4 == v5)
    {
      v3 = 0;
    }
    else
    {
      v6 = [(ASTAuthInfoResult *)self attestation];
      v3 = [v6 base64EncodedStringWithOptions:0];
    }
  }
  v7 = [(ASTAuthInfoResult *)self cert];
  if (v7)
  {
    v8 = [(ASTAuthInfoResult *)self cert];
    v9 = [MEMORY[0x263EFF9D0] null];

    if (v8 == v9)
    {
      v7 = 0;
    }
    else
    {
      v10 = [(ASTAuthInfoResult *)self cert];
      v7 = [v10 base64EncodedStringWithOptions:0];
    }
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[ASTAuthInfoResult type](self, "type"));
  [v11 setObject:v12 forKeyedSubscript:@"type"];

  if (v3) {
    [v11 setObject:v3 forKeyedSubscript:@"attestation"];
  }
  if (v7) {
    [v11 setObject:v7 forKeyedSubscript:@"certificate"];
  }
  if ([(ASTAuthInfoResult *)self error])
  {
    v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[ASTAuthInfoResult error](self, "error"));
    [v11 setObject:v13 forKeyedSubscript:@"error"];
  }
  v14 = (void *)[v11 copy];

  return v14;
}

+ (id)sealedAuthInfoResultWithPayload:(id)a3 signature:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(ASTSealablePayload *)[ASTAuthInfoResult alloc] initWithPayload:v6 signature:v5];

  return v7;
}

+ (id)authInfoResultWithAttestation:(id)a3
{
  return +[ASTAuthInfoResult authInfoResultWithAttestation:a3 certificate:0 type:0 error:0];
}

+ (id)authInfoResultWithAttestation:(id)a3 certificate:(id)a4 type:(int64_t)a5 error:(int64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  [v11 setAttestation:v10];

  [v11 setCert:v9];
  [v11 setType:a5];
  [v11 setError:a6];

  return v11;
}

- (void)setAttestation:(id)a3
{
}

- (NSData)attestation
{
  return self->_attestation;
}

- (void)setCert:(id)a3
{
}

- (NSData)cert
{
  return self->_cert;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setError:(int64_t)a3
{
  self->_error = a3;
}

- (int64_t)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cert, 0);

  objc_storeStrong((id *)&self->_attestation, 0);
}

@end