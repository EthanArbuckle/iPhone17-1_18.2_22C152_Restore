@interface WFSSHKeyFormatRSA
+ (id)defaultKeySize;
+ (id)generateKeyPairWithKeySize:(unint64_t)a3 comment:(id)a4;
+ (id)keyPairFromPrivateKey:(id)a3 comment:(id)a4 error:(id *)a5;
+ (id)localizedDisplayName;
+ (id)pkcs1FromRSAKey:(_CCRSACryptor *)a3;
+ (id)possibleKeySizes;
+ (id)privateKeySpecifier;
+ (id)privateKeyType;
+ (id)publicKeySpecifier;
+ (id)publicKeyType;
+ (id)sshPublicKeyFromRSAKey:(_CCRSACryptor *)a3;
@end

@implementation WFSSHKeyFormatRSA

+ (id)sshPublicKeyFromRSAKey:(_CCRSACryptor *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v4 = CCRSAGetKeySize();
  int v5 = v4 + 7;
  if (v4 < -7) {
    int v5 = v4 + 14;
  }
  uint64_t v16 = (uint64_t)v5 >> 3;
  uint64_t v17 = v16;
  v6 = (char *)&v15 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  CCRSAGetKeyComponents();
  v7 = objc_alloc_init(WFSSHKeyEncoder);
  [(WFSSHKeyEncoder *)v7 encodeInteger:7];
  v8 = [a1 publicKeyType];
  [(WFSSHKeyEncoder *)v7 encodeString:v8];

  if (*v6 < 0)
  {
    [(WFSSHKeyEncoder *)v7 encodeInteger:(v16 + 1)];
    [(WFSSHKeyEncoder *)v7 encodeChar:0];
  }
  else
  {
    [(WFSSHKeyEncoder *)v7 encodeInteger:v16];
  }
  id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
  v10 = (void *)[v9 initWithBytes:v6 length:v16];
  [(WFSSHKeyEncoder *)v7 encodeData:v10];

  if (*v6 < 0)
  {
    [(WFSSHKeyEncoder *)v7 encodeInteger:(v17 + 1)];
    [(WFSSHKeyEncoder *)v7 encodeChar:0];
  }
  else
  {
    [(WFSSHKeyEncoder *)v7 encodeInteger:v17];
  }
  id v11 = objc_alloc(MEMORY[0x263EFF8F8]);
  v12 = (void *)[v11 initWithBytes:v6 length:v17];
  [(WFSSHKeyEncoder *)v7 encodeData:v12];

  v13 = [(WFSSHKeyEncoder *)v7 encodedData];

  return v13;
}

+ (id)pkcs1FromRSAKey:(_CCRSACryptor *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (CCRSACryptorExport())
  {
    v3 = 0;
  }
  else
  {
    v3 = [MEMORY[0x263EFF8F8] dataWithBytes:v6 length:v5];
  }
  return v3;
}

+ (id)keyPairFromPrivateKey:(id)a3 comment:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  [v10 bytes];
  [v10 length];
  if (!CCRSACryptorImport())
  {
    uint64_t PublicKeyFromPrivateKey = CCRSACryptorCreatePublicKeyFromPrivateKey();
    v12 = [a1 sshPublicKeyFromRSAKey:PublicKeyFromPrivateKey];
    uint64_t v16 = CCRSAGetKeySize();
    if (PublicKeyFromPrivateKey) {
      MEMORY[0x23ECE4A80](PublicKeyFromPrivateKey);
    }
    if (!v12)
    {
      v14 = 0;
      goto LABEL_9;
    }
    uint64_t v17 = [WFSSHKeyPair alloc];
    v13 = [NSNumber numberWithInt:v16];
    v14 = [(WFSSHKeyPair *)v17 initWithFormat:a1 privateKeyData:v10 publicKeyData:v12 keySize:v13 comment:v9];
LABEL_8:

LABEL_9:
    goto LABEL_11;
  }
  if (a5)
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    v12 = WFLocalizedString(@"Private key is not a valid RSA private key.");
    v20[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v11 errorWithDomain:@"WFSSHKeyRSAErrorDomain" code:2 userInfo:v13];
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

+ (id)publicKeySpecifier
{
  return @"id_rsa.pub";
}

+ (id)privateKeySpecifier
{
  return @"id_rsa";
}

+ (id)publicKeyType
{
  return @"ssh-rsa";
}

+ (id)privateKeyType
{
  return @"RSA PRIVATE KEY";
}

+ (id)defaultKeySize
{
  return &unk_26F0760F8;
}

+ (id)possibleKeySizes
{
  return &unk_26F076920;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"RSA");
}

+ (id)generateKeyPairWithKeySize:(unint64_t)a3 comment:(id)a4
{
  id v6 = a4;
  uint64_t v7 = 0;
  if (!CCRSACryptorGeneratePair())
  {
    id v8 = [a1 pkcs1FromRSAKey:0];
    id v9 = [a1 sshPublicKeyFromRSAKey:0];
    uint64_t v7 = 0;
    if (v8 && v9)
    {
      id v10 = [WFSSHKeyPair alloc];
      id v11 = [NSNumber numberWithUnsignedInteger:a3];
      uint64_t v7 = [(WFSSHKeyPair *)v10 initWithFormat:a1 privateKeyData:v8 publicKeyData:v9 keySize:v11 comment:v6];
    }
  }

  return v7;
}

@end