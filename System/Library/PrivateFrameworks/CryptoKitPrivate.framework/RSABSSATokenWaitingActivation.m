@interface RSABSSATokenWaitingActivation
- (NSData)blindedMessage;
- (NSData)blindingInverse;
- (NSData)tokenContent;
- (RSABSSATokenBlinder)tokenBlinder;
- (RSABSSATokenWaitingActivation)initWithBlindingInverse:(id)a3 blindedMessage:(id)a4 tokenContent:(id)a5 tokenBlinder:(id)a6 ciphersuite:(const ccrsabssa_ciphersuite *)a7;
- (id)activateTokenWithServerResponse:(id)a3 error:(id *)a4;
@end

@implementation RSABSSATokenWaitingActivation

- (RSABSSATokenWaitingActivation)initWithBlindingInverse:(id)a3 blindedMessage:(id)a4 tokenContent:(id)a5 tokenBlinder:(id)a6 ciphersuite:(const ccrsabssa_ciphersuite *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)RSABSSATokenWaitingActivation;
  v17 = [(RSABSSATokenWaitingActivation *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_tokenBlinder, a6);
    objc_storeStrong((id *)&v18->_blindedMessage, a4);
    objc_storeStrong((id *)&v18->_blindingInverse, a3);
    objc_storeStrong((id *)&v18->_tokenContent, a5);
    v18->_ciphersuite = a7;
  }

  return v18;
}

- (id)activateTokenWithServerResponse:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1CA58];
  id v6 = a3;
  v7 = [(RSABSSATokenWaitingActivation *)self blindingInverse];
  v8 = objc_msgSend(v5, "dataWithLength:", objc_msgSend(v7, "length"));

  v28 = [(RSABSSATokenWaitingActivation *)self tokenBlinder];
  [v28 publicKey];
  id v9 = v6;
  [v9 bytes];
  [v9 length];

  id v10 = [(RSABSSATokenWaitingActivation *)self blindingInverse];
  [v10 bytes];
  v11 = [(RSABSSATokenWaitingActivation *)self blindingInverse];
  [v11 length];
  id v12 = [(RSABSSATokenWaitingActivation *)self tokenContent];
  [v12 bytes];
  id v13 = [(RSABSSATokenWaitingActivation *)self tokenContent];
  [v13 length];
  id v14 = v8;
  uint64_t v25 = [v14 mutableBytes];
  uint64_t v26 = [v14 length];
  int v15 = ccrsabssa_unblind_signature();

  if (v15)
  {
    if (a4)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      v29 = @"corecrypto_error";
      v17 = objc_msgSend(NSNumber, "numberWithInteger:", v15, v25, v26);
      v30[0] = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      *a4 = [v16 errorWithDomain:@"com.apple.cryptokit.rsabssa" code:4 userInfo:v18];
    }
    v19 = 0;
  }
  else
  {
    objc_super v20 = [RSABSSATokenReady alloc];
    v21 = [(RSABSSATokenWaitingActivation *)self tokenContent];
    v22 = [(RSABSSATokenWaitingActivation *)self tokenBlinder];
    v23 = [v22 keyId];
    v19 = [(RSABSSATokenReady *)v20 initWithTokenContent:v21 tokenSignature:v14 keyId:v23];
  }
  return v19;
}

- (NSData)blindedMessage
{
  return self->_blindedMessage;
}

- (NSData)blindingInverse
{
  return self->_blindingInverse;
}

- (RSABSSATokenBlinder)tokenBlinder
{
  return self->_tokenBlinder;
}

- (NSData)tokenContent
{
  return self->_tokenContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenContent, 0);
  objc_storeStrong((id *)&self->_tokenBlinder, 0);
  objc_storeStrong((id *)&self->_blindingInverse, 0);
  objc_storeStrong((id *)&self->_blindedMessage, 0);
}

@end