@interface KCAESGCMDuplexSession
+ (BOOL)supportsSecureCoding;
+ (id)sessionAsReceiver:(id)a3 context:(unint64_t)a4;
+ (id)sessionAsSender:(id)a3 context:(unint64_t)a4;
- ($0DD201535F598B6025D84F9AACEC468E)receive;
- ($0DD201535F598B6025D84F9AACEC468E)send;
- (BOOL)GCM:(const ccmode_gcm *)a3 context:(id *)a4 iv:(id)a5 size:(unint64_t)a6 data:(const char *)a7 processed:(char *)a8 tag:(char *)a9 error:(id *)a10;
- (BOOL)asSender;
- (KCAESGCMDuplexSession)initWithCoder:(id)a3;
- (KCAESGCMDuplexSession)initWithSecret:(id)a3 context:(unint64_t)a4 as:(BOOL)a5;
- (KCAESGCMDuplexSession)initWithSecret:(id)a3 context:(unint64_t)a4 as:(BOOL)a5 altDSID:(id)a6 pairingUUID:(id)a7 piggybackingVersion:(unint64_t)a8 epoch:(unint64_t)a9;
- (NSData)secret;
- (NSString)altDSID;
- (NSString)pairingUUID;
- (id)decryptAndVerify:(id)a3 error:(id *)a4;
- (id)encrypt:(id)a3 error:(id *)a4;
- (id)initAsReceiver:(id)a3 context:(unint64_t)a4;
- (id)initAsSender:(id)a3 context:(unint64_t)a4;
- (unint64_t)context;
- (unint64_t)encryptCapsuleSize:(id)a3 IV:(id)a4;
- (unint64_t)epoch;
- (unint64_t)piggybackingVersion;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAsSender:(BOOL)a3;
- (void)setContext:(unint64_t)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setPairingUUID:(id)a3;
- (void)setPiggybackingVersion:(unint64_t)a3;
- (void)setReceive:(id *)a3;
- (void)setSecret:(id)a3;
- (void)setSend:(id *)a3;
@end

@implementation KCAESGCMDuplexSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secret, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_pairingUUID, 0);
}

- (void)setReceive:(id *)a3
{
  self->_receive = a3;
}

- ($0DD201535F598B6025D84F9AACEC468E)receive
{
  return self->_receive;
}

- (void)setSend:(id *)a3
{
  self->_send = a3;
}

- ($0DD201535F598B6025D84F9AACEC468E)send
{
  return self->_send;
}

- (void)setSecret:(id)a3
{
}

- (NSData)secret
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setAsSender:(BOOL)a3
{
  self->_asSender = a3;
}

- (BOOL)asSender
{
  return self->_asSender;
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setPiggybackingVersion:(unint64_t)a3
{
  self->_piggybackingVersion = a3;
}

- (unint64_t)piggybackingVersion
{
  return self->_piggybackingVersion;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPairingUUID:(id)a3
{
}

- (NSString)pairingUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  if ([(KCAESGCMDuplexSession *)self send])
  {
    ccaes_gcm_encrypt_mode();
    ccgcm_context_size();
    [(KCAESGCMDuplexSession *)self send];
    cc_clear();
    free([(KCAESGCMDuplexSession *)self send]);
  }
  if ([(KCAESGCMDuplexSession *)self receive])
  {
    ccaes_gcm_decrypt_mode();
    ccgcm_context_size();
    [(KCAESGCMDuplexSession *)self receive];
    cc_clear();
    free([(KCAESGCMDuplexSession *)self receive]);
  }
  v3.receiver = self;
  v3.super_class = (Class)KCAESGCMDuplexSession;
  [(KCAESGCMDuplexSession *)&v3 dealloc];
}

- (id)decryptAndVerify:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  unint64_t v9 = v7 + v8;
  uint64_t v39 = 0;
  uint64_t v10 = ccder_decode_constructed_tl();
  if (v10) {
    BOOL v16 = v39 == v9;
  }
  else {
    BOOL v16 = 0;
  }
  if (!v16)
  {
    KCJoiningErrorCreate(1, a4, @"decode failed", v11, v12, v13, v14, v15, v37);
    id v17 = 0;
    goto LABEL_20;
  }
  id v38 = 0;
  unint64_t v18 = kcder_decode_data_internal(&v38, 1, a4, v10, v9);
  id v19 = v38;
  unint64_t v40 = v18;
  if (v18)
  {
    uint64_t v20 = ccder_decode_constructed_tl();
    unint64_t v21 = v40;
    uint64_t v22 = ccder_decode_constructed_tl();
    if (v40)
    {
      if (v40 == v9)
      {
        v29 = (long long *)v22;
        if (v9 - v22 == 16)
        {
          unint64_t v30 = v21 - v20;
          v31 = [MEMORY[0x263EFF990] dataWithLength:v21 - v20];
          long long v41 = *v29;
          uint64_t v32 = ccaes_gcm_decrypt_mode();
          v33 = [(KCAESGCMDuplexSession *)self receive];
          id v34 = v31;
          if (-[KCAESGCMDuplexSession GCM:context:iv:size:data:processed:tag:error:](self, "GCM:context:iv:size:data:processed:tag:error:", v32, v33, v19, v30, v20, [v34 mutableBytes], &v41, a4))
          {
            v35 = v34;
          }
          else
          {
            v35 = 0;
          }
          id v17 = v35;

          goto LABEL_19;
        }
        uint64_t v37 = v9 - v22;
        v28 = @"Unexpected tag size: %ld";
      }
      else
      {
        v28 = @"Extra space";
      }
    }
    else
    {
      v28 = @"Decode failure";
    }
    KCJoiningErrorCreate(1, a4, v28, v23, v24, v25, v26, v27, v37);
  }
  id v17 = 0;
LABEL_19:

LABEL_20:
  return v17;
}

- (id)encrypt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF990] dataWithRandomBytes:16];
  objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", -[KCAESGCMDuplexSession encryptCapsuleSize:IV:](self, "encryptCapsuleSize:IV:", v6, v7));
  id v8 = objc_claimAutoreleasedReturnValue();
  [v8 mutableBytes];
  [v8 length];
  id v9 = v8;
  uint64_t v10 = [v9 bytes];
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v11 = [v6 length];
  kcder_encode_raw_octet_space(16, &v26);
  kcder_encode_raw_octet_space(v11, &v25);
  kcder_encode_data(v7);
  if (ccder_encode_constructed_tl() == v10)
  {
    uint64_t v18 = ccaes_gcm_encrypt_mode();
    id v19 = [(KCAESGCMDuplexSession *)self send];
    uint64_t v20 = [v6 length];
    uint64_t v21 = [v6 bytes];
    if ([(KCAESGCMDuplexSession *)self GCM:v18 context:v19 iv:v7 size:v20 data:v21 processed:v25 tag:v26 error:a4])
    {
      uint64_t v22 = v9;
    }
    else
    {
      uint64_t v22 = 0;
    }
    id v17 = v22;
  }
  else
  {
    KCJoiningErrorCreate(0, a4, @"Failed to allocate space for der", v12, v13, v14, v15, v16, v24);
    id v17 = 0;
  }

  return v17;
}

- (BOOL)GCM:(const ccmode_gcm *)a3 context:(id *)a4 iv:(id)a5 size:(unint64_t)a6 data:(const char *)a7 processed:(char *)a8 tag:(char *)a9 error:(id *)a10
{
  id v10 = a5;
  uint64_t v11 = ccgcm_reset();
  if (CoreCryptoError(v11, a10, @"ccgcm_reset failed: %d", v12, v13, v14, v15, v16, v11)
    && ([v10 length],
        [v10 bytes],
        uint64_t v17 = ccgcm_set_iv(),
        CoreCryptoError(v17, a10, @"ccgcm_set_iv failed: %d", v18, v19, v20, v21, v22, v17))
    && (uint64_t v23 = ccgcm_update(), CoreCryptoError(v23, a10, @"ccgcm_update failed: %d", v24, v25, v26, v27, v28, v23)))
  {
    uint64_t v29 = ccgcm_finalize();
    BOOL v35 = CoreCryptoError(v29, a10, @"ccgcm_finalize failed: %d", v30, v31, v32, v33, v34, v29);
  }
  else
  {
    BOOL v35 = 0;
  }

  return v35;
}

- (unint64_t)encryptCapsuleSize:(id)a3 IV:(id)a4
{
  id v5 = a3;
  [a4 length];
  unint64_t v6 = ccder_sizeof_raw_octet_string();
  if (v6)
  {
    [v5 length];
    if (ccder_sizeof_raw_octet_string()
      && ([MEMORY[0x263EFF990] dataWithLength:16],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v7 length],
          uint64_t v8 = ccder_sizeof_raw_octet_string(),
          v7,
          v8))
    {
      unint64_t v6 = ccder_sizeof();
    }
    else
    {
      unint64_t v6 = 0;
    }
  }

  return v6;
}

- (KCAESGCMDuplexSession)initWithSecret:(id)a3 context:(unint64_t)a4 as:(BOOL)a5 altDSID:(id)a6 pairingUUID:(id)a7 piggybackingVersion:(unint64_t)a8 epoch:(unint64_t)a9
{
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  if (initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch__onceToken != -1) {
    dispatch_once(&initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch__onceToken, &__block_literal_global_256);
  }
  v32.receiver = self;
  v32.super_class = (Class)KCAESGCMDuplexSession;
  uint64_t v18 = [(KCAESGCMDuplexSession *)&v32 init];
  uint64_t v19 = v18;
  if (v18)
  {
    [(KCAESGCMDuplexSession *)v18 setAsSender:v12];
    [(KCAESGCMDuplexSession *)v19 setSecret:v15];
    ccaes_gcm_encrypt_mode();
    size_t v20 = ccgcm_context_size();
    [(KCAESGCMDuplexSession *)v19 setSend:malloc_type_malloc(v20, 0x6B11E69AuLL)];
    ccaes_gcm_decrypt_mode();
    size_t v21 = ccgcm_context_size();
    [(KCAESGCMDuplexSession *)v19 setReceive:malloc_type_malloc(v21, 0x92BC9A35uLL)];
    [(KCAESGCMDuplexSession *)v19 setContext:a4];
    objc_storeStrong((id *)&v19->_pairingUUID, a7);
    v19->_piggybackingVersion = a8;
    v19->_epoch = a9;
    objc_storeStrong((id *)&v19->_altDSID, a6);
    if (![(KCAESGCMDuplexSession *)v19 send] || ![(KCAESGCMDuplexSession *)v19 receive])
    {
      uint64_t v30 = 0;
      goto LABEL_15;
    }
    uint64_t v22 = ccaes_gcm_encrypt_mode();
    uint64_t v23 = [(KCAESGCMDuplexSession *)v19 send];
    uint64_t v24 = [(KCAESGCMDuplexSession *)v19 secret];
    if (v12) {
      uint64_t v25 = &kdfInfoSendToReceive;
    }
    else {
      uint64_t v25 = &kdfInfoReceiveToSend;
    }
    if (v12) {
      uint64_t v26 = &kdfInfoReceiveToSend;
    }
    else {
      uint64_t v26 = &kdfInfoSendToReceive;
    }
    derive_and_init(v22, v23, v24, (void *)*v25);

    uint64_t v27 = ccaes_gcm_decrypt_mode();
    uint64_t v28 = [(KCAESGCMDuplexSession *)v19 receive];
    uint64_t v29 = [(KCAESGCMDuplexSession *)v19 secret];
    derive_and_init(v27, v28, v29, (void *)*v26);
  }
  uint64_t v30 = v19;
LABEL_15:

  return v30;
}

uint64_t __97__KCAESGCMDuplexSession_initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:"send->recv" length:10 freeWhenDone:0];
  v1 = (void *)kdfInfoSendToReceive;
  kdfInfoSendToReceive = v0;

  kdfInfoReceiveToSend = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:"recv->send" length:10 freeWhenDone:0];
  return MEMORY[0x270F9A758]();
}

- (KCAESGCMDuplexSession)initWithSecret:(id)a3 context:(unint64_t)a4 as:(BOOL)a5
{
  return [(KCAESGCMDuplexSession *)self initWithSecret:a3 context:a4 as:a5 altDSID:0 pairingUUID:0 piggybackingVersion:0 epoch:1];
}

- (id)initAsReceiver:(id)a3 context:(unint64_t)a4
{
  return [(KCAESGCMDuplexSession *)self initWithSecret:a3 context:a4 as:0];
}

- (id)initAsSender:(id)a3 context:(unint64_t)a4
{
  return [(KCAESGCMDuplexSession *)self initWithSecret:a3 context:a4 as:1];
}

- (KCAESGCMDuplexSession)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"asSender"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secret"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"context"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  uint64_t v10 = [v4 decodeInt64ForKey:@"piggy"];
  uint64_t v11 = [v4 decodeInt64ForKey:@"epoch"];

  BOOL v12 = [(KCAESGCMDuplexSession *)self initWithSecret:v6 context:v7 as:v5 altDSID:v8 pairingUUID:v9 piggybackingVersion:v10 epoch:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[KCAESGCMDuplexSession asSender](self, "asSender"), @"asSender");
  id v4 = [(KCAESGCMDuplexSession *)self secret];
  [v7 encodeObject:v4 forKey:@"secret"];

  objc_msgSend(v7, "encodeInt64:forKey:", -[KCAESGCMDuplexSession context](self, "context"), @"context");
  uint64_t v5 = [(KCAESGCMDuplexSession *)self altDSID];
  [v7 encodeObject:v5 forKey:@"altDSID"];

  unint64_t v6 = [(KCAESGCMDuplexSession *)self pairingUUID];
  [v7 encodeObject:v6 forKey:@"uuid"];

  objc_msgSend(v7, "encodeInt64:forKey:", -[KCAESGCMDuplexSession piggybackingVersion](self, "piggybackingVersion"), @"piggy");
  objc_msgSend(v7, "encodeInt64:forKey:", -[KCAESGCMDuplexSession epoch](self, "epoch"), @"epoch");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sessionAsReceiver:(id)a3 context:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [[KCAESGCMDuplexSession alloc] initAsReceiver:v5 context:a4];

  return v6;
}

+ (id)sessionAsSender:(id)a3 context:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [[KCAESGCMDuplexSession alloc] initAsSender:v5 context:a4];

  return v6;
}

@end