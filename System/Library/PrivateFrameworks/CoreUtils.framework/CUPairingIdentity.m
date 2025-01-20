@interface CUPairingIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)signDataPtr:(const void *)a3 dataLen:(unint64_t)a4 signatureBytes:(unsigned __int8)a5[64] error:(id *)a6;
- (BOOL)verifySignature:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)verifySignaturePtr:(const void *)a3 signatureLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 error:(id *)a7;
- (CUPairingIdentity)initWithCoder:(id)a3;
- (NSData)altIRK;
- (NSData)publicKey;
- (NSData)secretKey;
- (NSUUID)identifier;
- (id)description;
- (id)signData:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAltIRK:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setRandomKeyPair;
- (void)setSecretKey:(id)a3;
@end

@implementation CUPairingIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secretKey, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_altIRK, 0);
}

- (void)setSecretKey:(id)a3
{
}

- (NSData)secretKey
{
  return self->_secretKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setAltIRK:(id)a3
{
}

- (NSData)altIRK
{
  return self->_altIRK;
}

- (BOOL)verifySignaturePtr:(const void *)a3 signatureLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 error:(id *)a7
{
  if (a4 == 64)
  {
    v9 = self->_publicKey;
    if ([(NSData *)v9 length] == 32)
    {
      [(NSData *)v9 bytes];
      ccsha512_di();
      int v15 = cced25519_verify();
      BOOL v16 = v15 == 0;
      if (!a7 || !v15) {
        goto LABEL_13;
      }
      v17 = (void *)*MEMORY[0x1E4F28760];
      v18 = "Signature verify failed";
      uint64_t v19 = 4294960542;
    }
    else
    {
      if (!a7)
      {
        BOOL v16 = 0;
        goto LABEL_13;
      }
      v17 = (void *)*MEMORY[0x1E4F28760];
      v18 = "No EdPK";
      uint64_t v19 = 4294896141;
    }
    NSErrorF_safe(v17, v19, (uint64_t)v18, v10, v11, v12, v13, v14, v21);
    BOOL v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    return v16;
  }
  if (!a7) {
    return 0;
  }
  NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960580, (uint64_t)"Bad signature size (%zu)", a4, (uint64_t)a5, a6, (uint64_t)a7, v7, a4);
  BOOL v16 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
  return v16;
}

- (BOOL)verifySignature:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  uint64_t v12 = [v10 length];

  id v13 = v9;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];

  return [(CUPairingIdentity *)self verifySignaturePtr:v11 signatureLen:v12 dataPtr:v14 dataLen:v15 error:a5];
}

- (BOOL)signDataPtr:(const void *)a3 dataLen:(unint64_t)a4 signatureBytes:(unsigned __int8)a5[64] error:(id *)a6
{
  id v8 = self->_publicKey;
  if ([(NSData *)v8 length] == 32)
  {
    uint64_t v14 = self->_secretKey;
    uint64_t v15 = [(NSData *)v14 length];
    BOOL v21 = v15 == 32;
    if (v15 == 32)
    {
      [(NSData *)v8 bytes];
      [(NSData *)v14 bytes];
      ccsha512_di();
      cced25519_sign();
    }
    else if (a6)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294896142, (uint64_t)"No EdSK", v16, v17, v18, v19, v20, v23);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a6)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294896141, (uint64_t)"No EdPK", v9, v10, v11, v12, v13, v23);
    BOOL v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)signData:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  if ([(CUPairingIdentity *)self signDataPtr:v7 dataLen:v8 signatureBytes:v11 error:a4])
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v11 length:64];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)description
{
  CFMutableStringRef v38 = 0;
  NSAppendPrintF(&v38, (uint64_t)"CUPairingIdentity", v2, v3, v4, v5, v6, v7, v32);
  uint64_t v9 = v38;
  uint64_t v16 = v9;
  identifier = self->_identifier;
  if (identifier)
  {
    CFMutableStringRef v37 = v9;
    NSAppendPrintF(&v37, (uint64_t)", ID %@", v10, v11, v12, v13, v14, v15, (uint64_t)identifier);
    uint64_t v18 = v37;

    uint64_t v16 = v18;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    CFMutableStringRef v36 = v16;
    NSAppendPrintF(&v36, (uint64_t)", PK <%.4@>", v10, v11, v12, v13, v14, v15, (uint64_t)publicKey);
    uint64_t v20 = v36;

    uint64_t v16 = v20;
  }
  secretKey = self->_secretKey;
  if (secretKey)
  {
    CFMutableStringRef v35 = v16;
    uint64_t v22 = [(NSData *)secretKey length];
    NSAppendPrintF(&v35, (uint64_t)", SK %ld", v23, v24, v25, v26, v27, v28, v22);
    v29 = v35;

    uint64_t v16 = v29;
  }
  if (self->_altIRK)
  {
    altIRK = self->_altIRK;
    CFMutableStringRef v34 = v16;
    NSAppendPrintF(&v34, (uint64_t)", IRK %{mask}", v10, v11, v12, v13, v14, v15, (uint64_t)altIRK);
    v30 = v34;

    uint64_t v16 = v30;
  }
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  altIRK = self->_altIRK;
  id v9 = v4;
  if (altIRK)
  {
    [v4 encodeObject:altIRK forKey:@"altIRK"];
    id v4 = v9;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v9 encodeObject:identifier forKey:@"ident"];
    id v4 = v9;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    [v9 encodeObject:publicKey forKey:@"pk"];
    id v4 = v9;
  }
  secretKey = self->_secretKey;
  if (secretKey)
  {
    [v9 encodeObject:secretKey forKey:@"sk"];
    id v4 = v9;
  }
}

- (void)setRandomKeyPair
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  cced25519_make_key_pair_compat((uint64_t)v8, (uint64_t)v7);
  uint64_t v3 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v8 length:32];
  publicKey = self->_publicKey;
  self->_publicKey = v3;

  uint64_t v5 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 length:32];
  secretKey = self->_secretKey;
  self->_secretKey = v5;
}

- (CUPairingIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CUPairingIdentity;
  uint64_t v5 = [(CUPairingIdentity *)&v16 init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = objc_opt_class();
    NSDecodeObjectIfPresent(v6, @"altIRK", v7, (void **)&v5->_altIRK);

    id v8 = v6;
    uint64_t v9 = objc_opt_class();
    NSDecodeObjectIfPresent(v8, @"ident", v9, (void **)&v5->_identifier);

    id v10 = v8;
    uint64_t v11 = objc_opt_class();
    NSDecodeObjectIfPresent(v10, @"pk", v11, (void **)&v5->_publicKey);

    id v12 = v10;
    uint64_t v13 = objc_opt_class();
    NSDecodeObjectIfPresent(v12, @"sk", v13, (void **)&v5->_secretKey);

    uint64_t v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end