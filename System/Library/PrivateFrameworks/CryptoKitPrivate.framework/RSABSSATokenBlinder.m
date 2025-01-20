@interface RSABSSATokenBlinder
+ (id)keyIDFromSPKI:(id)a3;
- (BOOL)setParamsForSize:(unint64_t)a3 params:(id)a4 error:(id *)a5;
- (BOOL)verifyFullyParsedASN1:(const char *)a3 end:(const char *)a4 error:(id *)a5;
- (NSData)keyId;
- (RSABSSATokenBlinder)initWithPublicKey:(id)a3 error:(id *)a4;
- (ccrsa_pub_ctx)publicKey;
- (id)tokenWaitingActivationWithContent:(id)a3 error:(id *)a4;
@end

@implementation RSABSSATokenBlinder

+ (id)keyIDFromSPKI:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithLength:32];
  id v6 = v4;
  v7 = (const void *)[v6 bytes];
  CC_LONG v8 = [v6 length];

  id v9 = v5;
  CC_SHA256(v7, v8, (unsigned __int8 *)[v9 mutableBytes]);
  return v9;
}

- (ccrsa_pub_ctx)publicKey
{
  return self->_publicKey;
}

- (BOOL)verifyFullyParsedASN1:(const char *)a3 end:(const char *)a4 error:(id *)a5
{
  if (a3 != a4 && a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.rsabssa" code:2 userInfo:0];
  }
  return a3 == a4;
}

- (BOOL)setParamsForSize:(unint64_t)a3 params:(id)a4 error:(id *)a5
{
  id v8 = a4;
  unint64_t v9 = 8 * a3;
  self->_ciphersuiteModulusByteCount = 8 * a3;
  self->_publicKey[0].pb_n = a3;
  if (8 * a3 == 256)
  {
    v10 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E4F146F8];
    goto LABEL_7;
  }
  if (v9 == 512)
  {
    v10 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E4F14708];
    goto LABEL_7;
  }
  if (v9 == 384)
  {
    v10 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E4F14700];
LABEL_7:
    self->_ciphersuite = v10;
    BOOL v11 = 1;
    goto LABEL_8;
  }
  self->_ciphersuite = 0;
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.rsabssa" code:1 userInfo:0];
    BOOL v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_8:

  return v11;
}

- (RSABSSATokenBlinder)initWithPublicKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RSABSSATokenBlinder;
  v7 = [(RSABSSATokenBlinder *)&v19 init];
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = +[RSABSSATokenBlinder keyIDFromSPKI:v6];
  keyId = v7->_keyId;
  v7->_keyId = (NSData *)v8;

  v10 = [[_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging alloc] initWithData:v6 error:a4];
  if (!v10)
  {
LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
  BOOL v11 = v10;
  id v12 = [(RSAPSSSPKI_Bridging *)v10 publicKeyBytes];
  uint64_t v13 = [v12 bytes];
  uint64_t v14 = v13 + [v12 length];
  id v15 = v12;
  [v15 bytes];
  if (!-[RSABSSATokenBlinder setParamsForSize:params:error:](v7, "setParamsForSize:params:error:", ccder_decode_rsa_pub_n(), v11, a4)|| (id v16 = v15, [v16 bytes], !-[RSABSSATokenBlinder verifyFullyParsedASN1:end:error:](v7, "verifyFullyParsedASN1:end:error:", ccder_decode_rsa_pub(), v14, a4)))
  {

    goto LABEL_8;
  }

LABEL_6:
  v17 = v7;
LABEL_9:

  return v17;
}

- (id)tokenWaitingActivationWithContent:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
LABEL_8:
    uint64_t v14 = ccrng();
    v24 = a4;
    id v15 = [MEMORY[0x1E4F1CA58] dataWithLength:self->_ciphersuiteModulusByteCount];
    id v16 = [MEMORY[0x1E4F1CA58] dataWithLength:self->_ciphersuiteModulusByteCount];
    id v12 = v8;
    [v12 bytes];
    [v12 length];
    id v17 = v15;
    [v17 mutableBytes];
    [v17 length];
    id v18 = v16;
    [v18 mutableBytes];
    [v18 length];
    int v19 = ccrsabssa_blind_message();
    if (v19)
    {
      if (v24)
      {
        v20 = (void *)MEMORY[0x1E4F28C58];
        v25 = @"corecrypto_error";
        v21 = objc_msgSend(NSNumber, "numberWithInteger:", v19, v14);
        v26[0] = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
        id *v24 = [v20 errorWithDomain:@"com.apple.cryptokit.rsabssa" code:3 userInfo:v22];
      }
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = -[RSABSSATokenWaitingActivation initWithBlindingInverse:blindedMessage:tokenContent:tokenBlinder:ciphersuite:]([RSABSSATokenWaitingActivation alloc], "initWithBlindingInverse:blindedMessage:tokenContent:tokenBlinder:ciphersuite:", v17, v18, v12, self, self->_ciphersuite, v14);
    }

    goto LABEL_14;
  }
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
  v10 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  size_t v11 = [v9 length];
  id v8 = v9;
  if (!SecRandomCopyBytes(v10, v11, (void *)[v8 mutableBytes])) {
    goto LABEL_8;
  }
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.rsabssa" code:0 userInfo:0];
  }

  id v12 = 0;
  uint64_t v13 = 0;
LABEL_14:

  return v13;
}

- (NSData)keyId
{
  return self->_keyId;
}

- (void).cxx_destruct
{
}

@end