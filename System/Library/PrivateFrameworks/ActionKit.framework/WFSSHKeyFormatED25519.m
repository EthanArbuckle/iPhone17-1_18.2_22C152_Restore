@interface WFSSHKeyFormatED25519
+ (id)defaultKeySize;
+ (id)generateKeyPairWithKeySize:(unint64_t)a3 comment:(id)a4;
+ (id)keyPairFromPrivateKey:(id)a3 comment:(id)a4 error:(id *)a5;
+ (id)localizedDisplayName;
+ (id)possibleKeySizes;
+ (id)privateKeySpecifier;
+ (id)privateKeyType;
+ (id)publicKeySpecifier;
+ (id)publicKeyType;
+ (id)sshPrivateKeyFromED25519PrivateKey:(id)a3 publicKey:(id)a4 comment:(id)a5;
+ (id)sshPublicKeyFromED25519Data:(id)a3;
@end

@implementation WFSSHKeyFormatED25519

+ (id)sshPrivateKeyFromED25519PrivateKey:(id)a3 publicKey:(id)a4 comment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(WFSSHKeyEncoder);
  [(WFSSHKeyEncoder *)v11 encodeString:@"openssh-key-v1"];
  [(WFSSHKeyEncoder *)v11 encodeChar:0];
  [(WFSSHKeyEncoder *)v11 encodeStringWithPreceedingLength:@"none"];
  [(WFSSHKeyEncoder *)v11 encodeStringWithPreceedingLength:@"none"];
  v12 = objc_opt_new();
  [(WFSSHKeyEncoder *)v11 encodeDataWithPreceedingLength:v12];

  [(WFSSHKeyEncoder *)v11 encodeInteger:1];
  v13 = [a1 sshPublicKeyFromED25519Data:v9];
  if (v13)
  {
    [(WFSSHKeyEncoder *)v11 encodeDataWithPreceedingLength:v13];
    v14 = objc_alloc_init(WFSSHKeyEncoder);
    uint64_t v15 = arc4random_uniform(0xFFFFFFFF);
    [(WFSSHKeyEncoder *)v14 encodeInteger:v15];
    [(WFSSHKeyEncoder *)v14 encodeInteger:v15];
    v16 = [a1 publicKeyType];
    [(WFSSHKeyEncoder *)v14 encodeStringWithPreceedingLength:v16];

    [(WFSSHKeyEncoder *)v14 encodeDataWithPreceedingLength:v9];
    -[WFSSHKeyEncoder encodeInteger:](v14, "encodeInteger:", [v9 length] + objc_msgSend(v8, "length"));
    [(WFSSHKeyEncoder *)v14 encodeData:v8];
    [(WFSSHKeyEncoder *)v14 encodeData:v9];
    [(WFSSHKeyEncoder *)v14 encodeStringWithPreceedingLength:v10];
    uint64_t v17 = -([(WFSSHKeyEncoder *)v14 encodedLength] & 7);
    uint64_t v18 = -8;
    do
      [(WFSSHKeyEncoder *)v14 encodeChar:(char)(v18++ + 9)];
    while (v17 != v18);
    v19 = [(WFSSHKeyEncoder *)v14 encodedData];
    [(WFSSHKeyEncoder *)v11 encodeDataWithPreceedingLength:v19];

    v20 = [(WFSSHKeyEncoder *)v11 encodedData];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)sshPublicKeyFromED25519Data:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(WFSSHKeyEncoder);
  [(WFSSHKeyEncoder *)v5 encodeInteger:11];
  v6 = [a1 publicKeyType];
  [(WFSSHKeyEncoder *)v5 encodeString:v6];

  [(WFSSHKeyEncoder *)v5 encodeDataWithPreceedingLength:v4];
  v7 = [(WFSSHKeyEncoder *)v5 encodedData];

  return v7;
}

+ (id)keyPairFromPrivateKey:(id)a3 comment:(id)a4 error:(id *)a5
{
  v36[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [[WFSSHKeyDecoder alloc] initWithData:v7];
  id v9 = -[WFSSHKeyDecoder decodeStringWithLength:](v8, "decodeStringWithLength:", [@"openssh-key-v1" length]);
  if ([v9 isEqualToString:@"openssh-key-v1"])
  {
    [(WFSSHKeyDecoder *)v8 advanceBy:1];
    id v10 = [(WFSSHKeyDecoder *)v8 decodeStringWithPrecedingLength];
    v11 = [(WFSSHKeyDecoder *)v8 decodeStringWithPrecedingLength];
    v12 = [(WFSSHKeyDecoder *)v8 decodeDataWithPrecedingLength];
    if ([v10 isEqualToString:@"none"])
    {
      if ([(WFSSHKeyDecoder *)v8 decodeInteger] == 1)
      {
        [(WFSSHKeyDecoder *)v8 advanceBy:[(WFSSHKeyDecoder *)v8 decodeInteger]];
        [(WFSSHKeyDecoder *)v8 decodeInteger];
        unsigned int v13 = [(WFSSHKeyDecoder *)v8 decodeInteger];
        if (v13 == [(WFSSHKeyDecoder *)v8 decodeInteger])
        {
          v14 = [(WFSSHKeyDecoder *)v8 decodeStringWithPrecedingLength];
          uint64_t v15 = [a1 publicKeyType];
          int v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            uint64_t v17 = [(WFSSHKeyDecoder *)v8 decodeDataWithPrecedingLength];
            uint64_t v18 = [(WFSSHKeyDecoder *)v8 decodeDataWithPrecedingLength];
            v30 = [(WFSSHKeyDecoder *)v8 decodeStringWithPrecedingLength];
            if ([v17 length] == 32)
            {
              v29 = v18;
              v19 = [a1 sshPublicKeyFromED25519Data:v17];
              if (v19) {
                v20 = [[WFSSHKeyPair alloc] initWithFormat:a1 privateKeyData:v7 publicKeyData:v19 keySize:0 comment:v30];
              }
              else {
                v20 = 0;
              }

              uint64_t v18 = v29;
            }
            else
            {
              v20 = 0;
            }
          }
          else
          {
            v20 = 0;
          }

          goto LABEL_18;
        }
LABEL_17:
        v20 = 0;
LABEL_18:

        goto LABEL_19;
      }
      if (!a5) {
        goto LABEL_17;
      }
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      v23 = WFLocalizedString(@"Multiple keys are not supported.");
      v32 = v23;
      v24 = NSDictionary;
      v25 = &v32;
      v26 = &v31;
    }
    else
    {
      if (!a5) {
        goto LABEL_17;
      }
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      v23 = WFLocalizedString(@"Encrypted SSH keys are not currently supported.");
      v34 = v23;
      v24 = NSDictionary;
      v25 = &v34;
      v26 = &v33;
    }
    v27 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
    *a5 = [v22 errorWithDomain:@"WFSSHKeyED25519ErrorDomain" code:1 userInfo:v27];

    goto LABEL_17;
  }
  if (!a5)
  {
    v20 = 0;
    goto LABEL_20;
  }
  v21 = (void *)MEMORY[0x263F087E8];
  uint64_t v35 = *MEMORY[0x263F08320];
  id v10 = WFLocalizedString(@"Unable to parse magic bytes from OpenSSH key.");
  v36[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
  [v21 errorWithDomain:@"WFSSHKeyED25519ErrorDomain" code:1 userInfo:v11];
  v20 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
  return v20;
}

+ (id)publicKeySpecifier
{
  return @"id_ed25519.pub";
}

+ (id)privateKeySpecifier
{
  return @"id_ed25519";
}

+ (id)publicKeyType
{
  return @"ssh-ed25519";
}

+ (id)privateKeyType
{
  return @"OPENSSH PRIVATE KEY";
}

+ (id)defaultKeySize
{
  return 0;
}

+ (id)possibleKeySizes
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"ed25519");
}

+ (id)generateKeyPairWithKeySize:(unint64_t)a3 comment:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (ccrng()
    && (memset(v15, 0, sizeof(v15)), long long v13 = 0u, v14 = 0u, ccsha512_di(), !cced25519_make_key_pair()))
  {
    id v7 = objc_msgSend(MEMORY[0x263EFF8F8], "_newZeroingDataWithBytes:length:", v15, 32, v13, v14);
    id v8 = (void *)[MEMORY[0x263EFF8F8] _newZeroingDataWithBytes:&v13 length:32];
    id v9 = [a1 sshPrivateKeyFromED25519PrivateKey:v8 publicKey:v7 comment:v5];
    uint64_t v10 = [a1 sshPublicKeyFromED25519Data:v7];
    v11 = (void *)v10;
    v6 = 0;
    if (v9 && v10) {
      v6 = [[WFSSHKeyPair alloc] initWithFormat:a1 privateKeyData:v9 publicKeyData:v10 keySize:0 comment:v5];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end