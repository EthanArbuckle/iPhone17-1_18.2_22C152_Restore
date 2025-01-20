@interface RSABSSATokenIssuer
- (NSData)keyId;
- (NSData)publicKey;
- (RSABSSATokenIssuer)init;
- (RSABSSATokenIssuer)initWithKeyByteCount:(unint64_t)a3;
- (id)blindSign:(id)a3 error:(id *)a4;
- (void)setPublicKey:(id)a3;
@end

@implementation RSABSSATokenIssuer

- (RSABSSATokenIssuer)init
{
  return [(RSABSSATokenIssuer *)self initWithKeyByteCount:512];
}

- (RSABSSATokenIssuer)initWithKeyByteCount:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)RSABSSATokenIssuer;
  v4 = [(RSABSSATokenIssuer *)&v15 init];
  if (!v4) {
    goto LABEL_10;
  }
  ccrng();
  switch(a3)
  {
    case 0x100uLL:
      v5 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E4F146F8];
      break;
    case 0x200uLL:
      v5 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E4F14708];
      break;
    case 0x180uLL:
      v5 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E4F14700];
      break;
    default:
      v4->_ciphersuite = 0;
      goto LABEL_12;
  }
  v4->_ciphersuite = v5;
  v4->_ciphersuiteModulusByteCount = a3;
  if (ccrsa_generate_key())
  {
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  ccrsa_ctx_public();
  id v6 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:ccder_encode_rsa_pub_size()];
  [v6 mutableBytes];
  id v7 = v6;
  [v7 mutableBytes];
  [v7 length];
  ccder_encode_rsa_pub();
  uint64_t v8 = +[RSAPSSSPKI_Bridging serializeWithKeyBytes:v7 error:0];
  publicKey = v4->_publicKey;
  v4->_publicKey = (NSData *)v8;

  v10 = [(RSABSSATokenIssuer *)v4 publicKey];
  uint64_t v11 = +[RSABSSATokenBlinder keyIDFromSPKI:v10];
  keyId = v4->_keyId;
  v4->_keyId = (NSData *)v11;

LABEL_10:
  v13 = v4;
LABEL_13:

  return v13;
}

- (id)blindSign:(id)a3 error:(id *)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  ccrng();
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:self->_ciphersuiteModulusByteCount];
  id v8 = v6;
  [v8 bytes];
  [v8 length];
  id v9 = v7;
  [v9 mutableBytes];
  [v9 length];
  int v10 = ccrsabssa_sign_blinded_message();
  if (v10)
  {
    if (a4)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      objc_super v15 = @"corecrypto_error";
      v12 = [NSNumber numberWithInteger:v10];
      v16[0] = v12;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = [v11 errorWithDomain:@"com.apple.cryptokit.rsabssa" code:5 userInfo:v13];

      a4 = 0;
    }
  }
  else
  {
    id v9 = v9;
    a4 = (id *)v9;
  }

  return a4;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)keyId
{
  return self->_keyId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyId, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end