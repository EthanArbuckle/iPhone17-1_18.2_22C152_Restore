@interface NEIKEv2EncryptedKeyIDIdentifier
+ (id)copyTypeDescription;
- (BOOL)isEqual:(id)a3;
- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyID:(id)a3 aad:(id)a4 key:(id)a5;
- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyID:(id)a3 aad:(id)a4 keyRef:(__SecKey *)a5;
- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyIDString:(id)a3 aad:(id)a4 key:(id)a5;
- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyIDString:(id)a3 aad:(id)a4 keyRef:(__SecKey *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decryptWithSession:(id)a3 returnError:(id *)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAad:(uint64_t)a1;
- (void)setKeyData:(uint64_t)a1;
@end

@implementation NEIKEv2EncryptedKeyIDIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aad, 0);

  objc_storeStrong((id *)&self->_keyData, 0);
}

- (id)decryptWithSession:(id)a3 returnError:(id *)a4
{
  if (!a3 || (v10 = objc_getProperty(a3, a2, 336, 1)) == 0)
  {
    id ErrorInternal = (id)NEIKEv2CreateErrorInternal(@"Missing IKE SA", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v39);
    v11 = 0;
    v25 = 0;
    if (!a4) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v11 = v10;
  v12 = self;
  id location = 0;
  v13 = [(NEIKEv2Identifier *)v12 identifierData];
  unint64_t v14 = [v13 length];

  if (v14 <= 0x20)
  {
    v15 = [(NEIKEv2Identifier *)v12 identifierData];
    uint64_t v16 = [v15 length];
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Encrypted identifier length %u too short", v17, v18, v19, v20, v21, v22, v23, v16);
    id location = ErrorPeerInvalidSyntax;

    v25 = 0;
    goto LABEL_18;
  }
  v26 = -[NEIKEv2IKESA createConcatenatedSPIsAndReturnError:](v11, (char *)&location);
  if (!v26)
  {
    v25 = 0;
    goto LABEL_17;
  }
  v27 = -[NEIKEv2IKESA createConcatedNoncesAndReturnError:](v11, (char *)&location);
  if (!v27)
  {
    v25 = 0;
    goto LABEL_16;
  }
  if (v12) {
    BOOL v28 = v12->_keyRef == 0;
  }
  else {
    BOOL v28 = 1;
  }
  v29 = [_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE alloc];
  v30 = [(NEIKEv2Identifier *)v12 identifierData];
  if (!v12)
  {
    v31 = 0;
    keyRef = 0;
    keyData = 0;
    if (v28) {
      goto LABEL_12;
    }
LABEL_14:
    v34 = [(NEIKEv2CryptoKitHPKE *)v29 initWithPayload:v30 aad:v31 psk:v27 pskID:v26 keyRef:keyRef];
    goto LABEL_15;
  }
  v31 = v12->_aad;
  if (!v28)
  {
    keyRef = v12->_keyRef;
    goto LABEL_14;
  }
  keyData = v12->_keyData;
LABEL_12:
  v33 = keyData;
  v34 = [(NEIKEv2CryptoKitHPKE *)v29 initWithPayload:v30 aad:v31 psk:v27 pskID:v26 keyData:v33];

LABEL_15:
  id obj = location;
  v25 = [(NEIKEv2CryptoKitHPKE *)v34 performHPKEOpenAndReturnError:&obj];
  objc_storeStrong(&location, obj);

LABEL_16:
LABEL_17:

  ErrorPeerInvalidSyntax = location;
LABEL_18:
  id ErrorInternal = ErrorPeerInvalidSyntax;
  if (ErrorInternal)
  {

    v25 = 0;
    id v37 = location;
  }
  else
  {
    id v37 = 0;
  }

  if (a4) {
LABEL_22:
  }
    *a4 = ErrorInternal;
LABEL_23:

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NEIKEv2EncryptedKeyIDIdentifier;
  if ([(NEIKEv2Identifier *)&v24 isEqual:v4])
  {
    uint64_t v5 = v4;
    if (self) {
      aad = self->_aad;
    }
    else {
      aad = 0;
    }
    uint64_t v7 = aad;
    if (v5) {
      v8 = (void *)v5[4];
    }
    else {
      v8 = 0;
    }
    v9 = v8;
    if (v7 == v9)
    {

      if (!self) {
        goto LABEL_28;
      }
      goto LABEL_15;
    }
    v10 = v9;
    if (self)
    {
      v11 = self->_aad;
      if (v5)
      {
LABEL_9:
        uint64_t v12 = v5[4];
LABEL_10:
        v13 = v11;
        int v14 = [(NSData *)v13 isEqual:v12];

        BOOL v15 = 0;
        if (!v14 || !self) {
          goto LABEL_29;
        }
LABEL_15:
        uint64_t v16 = self->_keyData;
        if (v16)
        {
          if (!v5)
          {

            goto LABEL_28;
          }
          uint64_t v17 = v5[3];

          if (v17)
          {
            keyData = self->_keyData;
            uint64_t v19 = v5[3];
            uint64_t v20 = keyData;
            BOOL v15 = [(NSData *)v20 isEqualToData:v19];

LABEL_29:
            goto LABEL_30;
          }
        }
        BOOL v15 = 0;
        if (!v5) {
          goto LABEL_29;
        }
        keyRef = self->_keyRef;
        if (!keyRef) {
          goto LABEL_29;
        }
        uint64_t v22 = (const void *)v5[2];
        if (v22)
        {
          BOOL v15 = CFEqual(keyRef, v22) != 0;
          goto LABEL_29;
        }
LABEL_28:
        BOOL v15 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      v11 = 0;
      if (v5) {
        goto LABEL_9;
      }
    }
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  BOOL v15 = 0;
LABEL_30:

  return v15;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2EncryptedKeyIDIdentifier;
  unint64_t v3 = [(NEIKEv2Identifier *)&v10 hash];
  if (self)
  {
    if (self->_keyRef)
    {
      id v4 = (void *)SecKeyCopyPublicKeyHash();
      uint64_t v5 = [v4 hash];

      uint64_t v6 = v5 ^ v3;
      goto LABEL_6;
    }
    keyData = self->_keyData;
  }
  else
  {
    keyData = 0;
  }
  uint64_t v6 = [(NSData *)keyData hash] ^ v3;
  if (!self)
  {
    aad = 0;
    return [(NSData *)aad hash] ^ v6;
  }
LABEL_6:
  aad = self->_aad;
  return [(NSData *)aad hash] ^ v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2EncryptedKeyIDIdentifier;
  id v4 = [(NEIKEv2Identifier *)&v10 copyWithZone:a3];
  uint64_t v6 = v4;
  if (self)
  {
    keyRef = self->_keyRef;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  keyRef = 0;
  if (v4) {
LABEL_3:
  }
    objc_setProperty_nonatomic(v4, v5, keyRef, 16);
LABEL_4:
  if (self)
  {
    -[NEIKEv2EncryptedKeyIDIdentifier setKeyData:]((uint64_t)v6, self->_keyData);
    aad = self->_aad;
  }
  else
  {
    -[NEIKEv2EncryptedKeyIDIdentifier setKeyData:]((uint64_t)v6, 0);
    aad = 0;
  }
  -[NEIKEv2EncryptedKeyIDIdentifier setAad:]((uint64_t)v6, aad);
  return v6;
}

- (void)setKeyData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setAad:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)dealloc
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, 0, 16);
  }
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2EncryptedKeyIDIdentifier;
  [(NEIKEv2EncryptedKeyIDIdentifier *)&v3 dealloc];
}

- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyIDString:(id)a3 aad:(id)a4 key:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v10)
  {
    BOOL v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      v13 = 0;
      goto LABEL_4;
    }
    int v17 = 136315138;
    uint64_t v18 = "-[NEIKEv2EncryptedKeyIDIdentifier initWithKeyIDString:aad:key:]";
    uint64_t v16 = "%s called with null key";
LABEL_10:
    _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, v16, (uint8_t *)&v17, 0xCu);
    goto LABEL_8;
  }
  if ([v10 length] != 32)
  {
    BOOL v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v17 = 134217984;
    uint64_t v18 = (const char *)[v11 length];
    uint64_t v16 = "Invalid key length %tu!";
    goto LABEL_10;
  }
  uint64_t v12 = [(NEIKEv2KeyIDIdentifier *)self initWithKeyIDString:v8];
  -[NEIKEv2EncryptedKeyIDIdentifier setKeyData:]((uint64_t)v12, v11);
  -[NEIKEv2EncryptedKeyIDIdentifier setAad:]((uint64_t)v12, v9);
  self = v12;
  v13 = self;
LABEL_4:

  return v13;
}

- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyIDString:(id)a3 aad:(id)a4 keyRef:(__SecKey *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (a5)
  {
    id v10 = [(NEIKEv2KeyIDIdentifier *)self initWithKeyIDString:a3];
    p_isa = (id *)&v10->super.super.super.isa;
    if (v10)
    {
      objc_setProperty_nonatomic(v10, v11, a5, 16);
      objc_storeStrong(p_isa + 4, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    BOOL v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136315138;
      int v17 = "-[NEIKEv2EncryptedKeyIDIdentifier initWithKeyIDString:aad:keyRef:]";
      _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "%s called with null keyRef", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyID:(id)a3 aad:(id)a4 key:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v10)
  {
    BOOL v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      v13 = 0;
      goto LABEL_4;
    }
    int v17 = 136315138;
    uint64_t v18 = "-[NEIKEv2EncryptedKeyIDIdentifier initWithKeyID:aad:key:]";
    int v16 = "%s called with null key";
LABEL_10:
    _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, v16, (uint8_t *)&v17, 0xCu);
    goto LABEL_8;
  }
  if ([v10 length] != 32)
  {
    BOOL v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v17 = 134217984;
    uint64_t v18 = (const char *)[v11 length];
    int v16 = "Invalid key length %tu!";
    goto LABEL_10;
  }
  uint64_t v12 = [(NEIKEv2KeyIDIdentifier *)self initWithKeyID:v8];
  -[NEIKEv2EncryptedKeyIDIdentifier setKeyData:]((uint64_t)v12, v11);
  -[NEIKEv2EncryptedKeyIDIdentifier setAad:]((uint64_t)v12, v9);
  self = v12;
  v13 = self;
LABEL_4:

  return v13;
}

- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyID:(id)a3 aad:(id)a4 keyRef:(__SecKey *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (a5)
  {
    id v10 = [(NEIKEv2KeyIDIdentifier *)self initWithKeyID:a3];
    p_isa = (id *)&v10->super.super.super.isa;
    if (v10)
    {
      objc_setProperty_nonatomic(v10, v11, a5, 16);
      objc_storeStrong(p_isa + 4, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    BOOL v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136315138;
      int v17 = "-[NEIKEv2EncryptedKeyIDIdentifier initWithKeyID:aad:keyRef:]";
      _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "%s called with null keyRef", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

+ (id)copyTypeDescription
{
  return @"KeyID (Encrypted)";
}

@end