@interface KCJoiningRequestSecretSession
+ (id)sessionWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 error:(id *)a5;
- (BOOL)isDone;
- (BOOL)setupSession:(id *)a3;
- (KCAESGCMDuplexSession)session;
- (KCJoiningRequestSecretDelegate)secretDelegate;
- (KCJoiningRequestSecretSession)initWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 error:(id *)a5;
- (KCJoiningRequestSecretSession)initWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 rng:(ccrng_state *)a5 error:(id *)a6;
- (KCSRPClientContext)context;
- (NSData)challenge;
- (NSData)salt;
- (NSMutableDictionary)defaults;
- (NSString)altDSID;
- (NSString)piggy_uuid;
- (NSString)sessionUUID;
- (id)copyResponseForChallenge:(id)a3 salt:(id)a4 secret:(id)a5 error:(id *)a6;
- (id)copyResponseForSecret:(id)a3 error:(id *)a4;
- (id)createUUID;
- (id)description;
- (id)handleChallenge:(id)a3 error:(id *)a4;
- (id)handleChallenge:(id)a3 secret:(id)a4 error:(id *)a5;
- (id)handleChallengeData:(id)a3 secret:(id)a4 error:(id *)a5;
- (id)handleVerification:(id)a3 error:(id *)a4;
- (id)initialMessage:(id *)a3;
- (id)processMessage:(id)a3 error:(id *)a4;
- (id)stateString;
- (int)state;
- (unint64_t)dsid;
- (unint64_t)epoch;
- (unint64_t)piggy_version;
- (void)setAltDSID:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setPiggy_uuid:(id)a3;
- (void)setPiggy_version:(unint64_t)a3;
- (void)setSalt:(id)a3;
- (void)setSecretDelegate:(id)a3;
- (void)setSessionUUID:(id)a3;
@end

@implementation KCJoiningRequestSecretSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_piggy_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_secretDelegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)defaults
{
  return self->_defaults;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSString)sessionUUID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSalt:(id)a3
{
}

- (NSData)salt
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setChallenge:(id)a3
{
}

- (NSData)challenge
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setPiggy_version:(unint64_t)a3
{
  self->_piggy_version = a3;
}

- (unint64_t)piggy_version
{
  return self->_piggy_version;
}

- (void)setPiggy_uuid:(id)a3
{
}

- (NSString)piggy_uuid
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (int)state
{
  return self->_state;
}

- (unint64_t)dsid
{
  return self->_dsid;
}

- (KCSRPClientContext)context
{
  return (KCSRPClientContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSecretDelegate:(id)a3
{
}

- (KCJoiningRequestSecretDelegate)secretDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secretDelegate);
  return (KCJoiningRequestSecretDelegate *)WeakRetained;
}

- (KCAESGCMDuplexSession)session
{
  return (KCAESGCMDuplexSession *)objc_getProperty(self, a2, 24, 1);
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(KCJoiningRequestSecretSession *)self dsid];
  v5 = [(KCJoiningRequestSecretSession *)self stateString];
  v6 = [(KCJoiningRequestSecretSession *)self context];
  v7 = [v3 stringWithFormat:@"<KCJoiningAcceptSession@%p %lld %@ %@>", self, v4, v5, v6];

  return v7;
}

- (id)stateString
{
  unsigned int v3 = [(KCJoiningRequestSecretSession *)self state];
  if (v3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", -[KCJoiningRequestSecretSession state](self, "state"));
    unint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v4 = off_264314AA8[v3];
  }
  return v4;
}

- (KCJoiningRequestSecretSession)initWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 rng:(ccrng_state *)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = secLogObjForScope("joining");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "joining: initWithSecretDelegate called", buf, 2u);
  }

  v26.receiver = self;
  v26.super_class = (Class)KCJoiningRequestSecretSession;
  v11 = [(KCJoiningRequestSecretSession *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_secretDelegate, v9);
    v12->_state = 0;
    v12->_dsid = a4;
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    defaults = v12->_defaults;
    v12->_defaults = (NSMutableDictionary *)v13;

    v12->_piggy_version = 2;
    v15 = [MEMORY[0x263F08C38] UUID];
    uint64_t v16 = [v15 UUIDString];
    sessionUUID = v12->_sessionUUID;
    v12->_sessionUUID = (NSString *)v16;

    v18 = secLogObjForScope("joining");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(KCJoiningRequestSecretSession *)v12 sessionUUID];
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl(&dword_218274000, v18, OS_LOG_TYPE_DEFAULT, "joining: initWithSecretDelegate called, uuid=%@", buf, 0xCu);
    }
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a4);
    v21 = [KCSRPClientContext alloc];
    uint64_t v22 = ccsha256_di();
    uint64_t v23 = [(KCSRPContext *)v21 initWithUser:v20 digestInfo:v22 group:ccsrp_gp_rfc5054_3072() randomSource:a5];
    context = v12->_context;
    v12->_context = (KCSRPClientContext *)v23;
  }
  return v12;
}

- (KCJoiningRequestSecretSession)initWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = ccrng();
  if (v9)
  {
    self = [(KCJoiningRequestSecretSession *)self initWithSecretDelegate:v8 dsid:a4 rng:v9 error:a5];
    v15 = self;
  }
  else
  {
    CoreCryptoError(0, a5, @"RNG fetch failed", v10, v11, v12, v13, v14, v17);
    v15 = 0;
  }

  return v15;
}

- (id)processMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = secLogObjForScope("joining");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession processMessage called", (uint8_t *)&v18, 2u);
  }

  id v8 = +[KCJoiningMessage messageWithDER:v6 error:a4];

  if (!v8) {
    goto LABEL_9;
  }
  int state = self->_state;
  if (state == 2)
  {
    KCJoiningErrorCreate(6, a4, @"Done, no messages expected.", v9, v10, v11, v12, v13, v18);
    goto LABEL_9;
  }
  if (state == 1)
  {
    uint64_t v15 = [(KCJoiningRequestSecretSession *)self handleVerification:v8 error:a4];
    goto LABEL_11;
  }
  if (state)
  {
LABEL_9:
    uint64_t v16 = 0;
    goto LABEL_12;
  }
  uint64_t v15 = [(KCJoiningRequestSecretSession *)self handleChallenge:v8 error:a4];
LABEL_11:
  uint64_t v16 = (void *)v15;
LABEL_12:

  return v16;
}

- (id)handleVerification:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = secLogObjForScope("joining");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession handleVerification called", buf, 2u);
  }

  id v8 = [(KCJoiningRequestSecretSession *)self secretDelegate];
  if (![v6 type])
  {
    v27 = [v6 firstData];
    uint64_t v28 = [v27 length];

    uint64_t v29 = [v8 verificationFailed:v28 == 0];
    if (v29)
    {
      if (v28)
      {
        v30 = [v6 firstData];
        id v26 = [(KCJoiningRequestSecretSession *)self handleChallengeData:v30 secret:v29 error:a4];
      }
      else
      {
        id v26 = [(KCJoiningRequestSecretSession *)self copyResponseForSecret:v29 error:a4];
      }
    }
    else
    {
      id v26 = 0;
    }

    goto LABEL_22;
  }
  if ([v6 type] == 3)
  {
    uint64_t v14 = [(KCJoiningRequestSecretSession *)self context];
    uint64_t v15 = [v6 firstData];
    char v16 = [v14 verifyConfirmation:v15 error:a4];

    if (v16)
    {
      uint64_t v22 = [(KCJoiningRequestSecretSession *)self session];
      uint64_t v23 = [v6 secondData];
      v24 = [v22 decryptAndVerify:v23 error:a4];

      if (v24)
      {
        v25 = [NSString decodeFromDER:v24 error:a4];
        if (v25 && ([v8 processAccountCode:v25 error:a4] & 1) != 0)
        {

          self->_int state = 2;
          id v26 = [MEMORY[0x263EFF8F8] data];
          goto LABEL_22;
        }
      }
    }
    else
    {
      KCJoiningErrorCreate(7, a4, @"Got verification but  acceptor doesn't have matching secret: %@", v17, v18, v19, v20, v21, (uint64_t)self);
      v31 = secLogObjForScope("request-session");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = self;
        _os_log_impl(&dword_218274000, v31, OS_LOG_TYPE_DEFAULT, "Verification failed: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    KCJoiningErrorCreate(6, a4, @"Expected verification!", v9, v10, v11, v12, v13, v33);
  }
  id v26 = 0;
LABEL_22:

  return v26;
}

- (id)handleChallenge:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(KCJoiningRequestSecretSession *)self secretDelegate];
  id v8 = [v7 secret];
  uint64_t v9 = [(KCJoiningRequestSecretSession *)self handleChallenge:v6 secret:v8 error:a4];

  return v9;
}

- (id)handleChallenge:(id)a3 secret:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = secLogObjForScope("joining");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession handleChallenge called", v33, 2u);
  }

  if ([v8 type] == 1)
  {
    char v16 = [v8 secondData];
    if (v16) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    [(KCJoiningRequestSecretSession *)self setPiggy_version:v17];

    unint64_t v18 = [(KCJoiningRequestSecretSession *)self piggy_version];
    uint64_t v19 = [(KCJoiningRequestSecretSession *)self session];
    [v19 setPiggybackingVersion:v18];

    uint64_t v20 = [(KCJoiningRequestSecretSession *)self altDSID];
    uint64_t v21 = [(KCJoiningRequestSecretSession *)self session];
    [v21 setAltDSID:v20];

    if ([(KCJoiningRequestSecretSession *)self piggy_version] == 2)
    {
      uint64_t v22 = [OTPairingMessage alloc];
      uint64_t v23 = [v8 secondData];
      v24 = [(OTPairingMessage *)v22 initWithData:v23];

      if ([(OTPairingMessage *)v24 hasEpoch])
      {
        v25 = secLogObjForScope("octagon");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [(OTPairingMessage *)v24 epoch];
          v27 = [v26 dictionaryRepresentation];
          *(_DWORD *)uint64_t v33 = 138412290;
          *(void *)&v33[4] = v27;
          _os_log_impl(&dword_218274000, v25, OS_LOG_TYPE_DEFAULT, "received epoch message: %@", v33, 0xCu);
        }
        uint64_t v28 = [(OTPairingMessage *)v24 epoch];
        -[KCJoiningRequestSecretSession setEpoch:](self, "setEpoch:", [v28 epoch]);
      }
      else
      {
        v30 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v33 = 0;
          _os_log_impl(&dword_218274000, v30, OS_LOG_TYPE_DEFAULT, "octagon: acceptor did not send its epoch. discontinuing octagon protocol. downgrading to verison 1", v33, 2u);
        }

        [(KCJoiningRequestSecretSession *)self setPiggy_version:1];
      }
    }
    v31 = [v8 firstData];
    uint64_t v29 = [(KCJoiningRequestSecretSession *)self handleChallengeData:v31 secret:v9 error:a5];
  }
  else
  {
    KCJoiningErrorCreate(6, a5, @"Expected challenge!", v11, v12, v13, v14, v15, *(uint64_t *)v33);
    uint64_t v29 = 0;
  }

  return v29;
}

- (id)handleChallengeData:(id)a3 secret:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = secLogObjForScope("joining");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession handleChallengeData called", buf, 2u);
  }

  id v16 = 0;
  id v17 = 0;
  int v11 = [v9 decodeSequenceData:&v17 data:&v16 error:a5];

  id v12 = v17;
  id v13 = v16;
  id v14 = 0;
  if (v11) {
    id v14 = [(KCJoiningRequestSecretSession *)self copyResponseForChallenge:v13 salt:v12 secret:v8 error:a5];
  }

  return v14;
}

- (id)copyResponseForSecret:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(KCJoiningRequestSecretSession *)self challenge];
  id v8 = [(KCJoiningRequestSecretSession *)self salt];
  id v9 = [(KCJoiningRequestSecretSession *)self copyResponseForChallenge:v7 salt:v8 secret:v6 error:a4];

  return v9;
}

- (id)copyResponseForChallenge:(id)a3 salt:(id)a4 secret:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = secLogObjForScope("joining");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v18 = 0;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession copyResponseForChallenge called", v18, 2u);
  }

  id v14 = [(KCSRPClientContext *)self->_context copyResposeToChallenge:v10 password:v12 salt:v11 error:a6];
  if (v14 && [(KCJoiningRequestSecretSession *)self setupSession:a6])
  {
    [(KCJoiningRequestSecretSession *)self setChallenge:v10];
    [(KCJoiningRequestSecretSession *)self setSalt:v11];
    self->_int state = 1;
    uint64_t v15 = +[KCJoiningMessage messageWithType:2 data:v14 error:a6];
    id v16 = [v15 der];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
  id v5 = a3;
  id v6 = [(KCJoiningRequestSecretSession *)self session];
  [v6 setAltDSID:v5];
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (BOOL)setupSession:(id *)a3
{
  id v10 = [(KCSRPContext *)self->_context getKey];
  if (v10)
  {
    id v11 = +[KCAESGCMDuplexSession sessionAsSender:v10 context:[(KCJoiningRequestSecretSession *)self dsid]];
    session = self->_session;
    self->_session = v11;

    id v13 = [(KCJoiningRequestSecretSession *)self sessionUUID];
    id v14 = [(KCJoiningRequestSecretSession *)self session];
    [v14 setPairingUUID:v13];

    uint64_t v15 = [(KCJoiningRequestSecretSession *)self altDSID];
    id v16 = [(KCJoiningRequestSecretSession *)self session];
    [v16 setAltDSID:v15];

    unint64_t v17 = [(KCJoiningRequestSecretSession *)self piggy_version];
    unint64_t v18 = [(KCJoiningRequestSecretSession *)self session];
    [v18 setPiggybackingVersion:v17];

    uint64_t v19 = [(KCJoiningRequestSecretSession *)self session];
    BOOL v20 = v19 != 0;
  }
  else
  {
    KCJoiningErrorCreate(7, a3, @"No session key available", v5, v6, v7, v8, v9, v22);
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)isDone
{
  return self->_state == 2;
}

- (id)initialMessage:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = -[KCSRPClientContext copyStart:](self->_context, "copyStart:");
  if (!v5)
  {
    id v11 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = secLogObjForScope("joining");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_218274000, v6, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession initialMessage called", (uint8_t *)&v17, 2u);
  }

  if ([(KCJoiningRequestSecretSession *)self piggy_version] != 2)
  {
    if ([(KCJoiningRequestSecretSession *)self piggy_version] != 1)
    {
      id v13 = [MEMORY[0x263EFF990] dataWithLength:sizeof_initialmessage(v5)];
      [v13 mutableBytes];
      id v10 = v13;
      [v10 mutableBytes];
      [v10 length];
      if (encode_initialmessage(v5)) {
        goto LABEL_12;
      }
LABEL_17:
      id v11 = 0;
      goto LABEL_18;
    }
    uint64_t v7 = [(KCJoiningRequestSecretSession *)self createUUID];
    objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", sizeof_initialmessage_version1(v5, 1, v7));
    id v12 = objc_claimAutoreleasedReturnValue();
    [v12 mutableBytes];
    id v10 = v12;
    [v10 mutableBytes];
    [v10 length];
    if (encode_initialmessage_version1(v5, v7)) {
      goto LABEL_10;
    }
    uint64_t v8 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *a3;
      int v17 = 138412290;
      id v18 = v16;
      _os_log_impl(&dword_218274000, v8, OS_LOG_TYPE_DEFAULT, "failed to create version 1 message: %@", (uint8_t *)&v17, 0xCu);
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v7 = [(KCJoiningRequestSecretSession *)self createUUID];
  uint64_t v8 = [@"o" dataUsingEncoding:134217984];
  objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", sizeof_initialmessage_version2(v5, 1, v7, v8));
  id v9 = objc_claimAutoreleasedReturnValue();
  [v9 mutableBytes];
  id v10 = v9;
  [v10 mutableBytes];
  [v10 length];
  if (!encode_initialmessage_version2(v5, v7, v8))
  {
    id v14 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_218274000, v14, OS_LOG_TYPE_DEFAULT, "failed to create version 2 message", (uint8_t *)&v17, 2u);
    }

    goto LABEL_16;
  }

LABEL_10:
LABEL_12:
  id v11 = v10;
  id v10 = v11;
LABEL_18:

LABEL_19:
  return v11;
}

- (id)createUUID
{
  v7[2] = *MEMORY[0x263EF8340];
  unsigned int v3 = [MEMORY[0x263F08C38] UUID];
  v7[0] = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = [v3 UUIDString];
  [(KCJoiningRequestSecretSession *)self setPiggy_uuid:v4];

  [v3 getUUIDBytes:v7];
  id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:16];

  return v5;
}

+ (id)sessionWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = [[KCJoiningRequestSecretSession alloc] initWithSecretDelegate:v7 dsid:a4 error:a5];

  return v8;
}

@end