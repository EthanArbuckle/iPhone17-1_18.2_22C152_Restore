@interface KCJoiningAcceptSession
+ (id)sessionWithInitialMessage:(id)a3 secretDelegate:(id)a4 circleDelegate:(id)a5 dsid:(unint64_t)a6 error:(id *)a7;
- (BOOL)isDone;
- (BOOL)setupSession:(id *)a3;
- (BOOL)shouldAcceptOctagonRequests;
- (BOOL)shouldProcessSOSApplication:(id)a3 pairingMessage:(id)a4;
- (KCAESGCMDuplexSession)session;
- (KCJoiningAcceptCircleDelegate)circleDelegate;
- (KCJoiningAcceptSecretDelegate)secretDelegate;
- (KCJoiningAcceptSession)initWithSecretDelegate:(id)a3 circleDelegate:(id)a4 dsid:(unint64_t)a5 rng:(ccrng_state *)a6 error:(id *)a7;
- (KCSRPServerContext)context;
- (NSData)octagon;
- (NSData)startMessage;
- (NSMutableDictionary)defaults;
- (NSString)piggy_uuid;
- (OTControl)otControl;
- (OTControlArguments)controlArguments;
- (OTJoiningConfiguration)joiningConfiguration;
- (id)copyChallengeMessage:(id *)a3;
- (id)createPairingMessageFromJoiningMessage:(id)a3 error:(id *)a4;
- (id)createTLKRequestResponse:(id *)a3;
- (id)description;
- (id)processApplication:(id)a3 error:(id *)a4;
- (id)processInitialMessage:(id)a3 error:(id *)a4;
- (id)processMessage:(id)a3 error:(id *)a4;
- (id)processResponse:(id)a3 error:(id *)a4;
- (id)processSOSApplication:(id)a3 error:(id *)a4;
- (id)stateString;
- (int)piggy_version;
- (int)state;
- (unint64_t)dsid;
- (void)setCircleDelegate:(id)a3;
- (void)setControlArguments:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setJoiningConfiguration:(id)a3;
- (void)setOctagon:(id)a3;
- (void)setOtControl:(id)a3;
- (void)setPiggy_uuid:(id)a3;
- (void)setPiggy_version:(int)a3;
- (void)setSecretDelegate:(id)a3;
- (void)setStartMessage:(id)a3;
@end

@implementation KCJoiningAcceptSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_otControl, 0);
  objc_storeStrong((id *)&self->_controlArguments, 0);
  objc_storeStrong((id *)&self->_joiningConfiguration, 0);
  objc_storeStrong((id *)&self->_octagon, 0);
  objc_storeStrong((id *)&self->_piggy_uuid, 0);
  objc_storeStrong((id *)&self->_startMessage, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_circleDelegate);
  objc_destroyWeak((id *)&self->_secretDelegate);
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)defaults
{
  return self->_defaults;
}

- (void)setOtControl:(id)a3
{
}

- (OTControl)otControl
{
  return self->_otControl;
}

- (void)setControlArguments:(id)a3
{
}

- (OTControlArguments)controlArguments
{
  return self->_controlArguments;
}

- (void)setJoiningConfiguration:(id)a3
{
}

- (OTJoiningConfiguration)joiningConfiguration
{
  return self->_joiningConfiguration;
}

- (void)setOctagon:(id)a3
{
}

- (NSData)octagon
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPiggy_version:(int)a3
{
  self->_piggy_version = a3;
}

- (int)piggy_version
{
  return self->_piggy_version;
}

- (void)setPiggy_uuid:(id)a3
{
}

- (NSString)piggy_uuid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStartMessage:(id)a3
{
}

- (NSData)startMessage
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (int)state
{
  return self->_state;
}

- (KCAESGCMDuplexSession)session
{
  return (KCAESGCMDuplexSession *)objc_getProperty(self, a2, 48, 1);
}

- (KCSRPServerContext)context
{
  return (KCSRPServerContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCircleDelegate:(id)a3
{
}

- (KCJoiningAcceptCircleDelegate)circleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_circleDelegate);
  return (KCJoiningAcceptCircleDelegate *)WeakRetained;
}

- (void)setSecretDelegate:(id)a3
{
}

- (KCJoiningAcceptSecretDelegate)secretDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secretDelegate);
  return (KCJoiningAcceptSecretDelegate *)WeakRetained;
}

- (unint64_t)dsid
{
  return self->_dsid;
}

- (BOOL)isDone
{
  return [(KCJoiningAcceptSession *)self state] == 3;
}

- (id)processMessage:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = secLogObjForScope("acceptor");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(KCJoiningAcceptSession *)self description];
    *(_DWORD *)v18 = 138412290;
    *(void *)&v18[4] = v8;
    _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "processMessages: %@", v18, 0xCu);
  }
  if ([(KCJoiningAcceptSession *)self state])
  {
    v9 = +[KCJoiningMessage messageWithDER:v6 error:a4];
  }
  else
  {
    v9 = 0;
  }
  switch([(KCJoiningAcceptSession *)self state])
  {
    case 0:
      uint64_t v15 = [(KCJoiningAcceptSession *)self processInitialMessage:v6 error:a4];
      goto LABEL_12;
    case 1:
      if (!v9) {
        goto LABEL_14;
      }
      uint64_t v15 = [(KCJoiningAcceptSession *)self processResponse:v9 error:a4];
      goto LABEL_12;
    case 2:
      if (!v9) {
        goto LABEL_14;
      }
      uint64_t v15 = [(KCJoiningAcceptSession *)self processApplication:v9 error:a4];
LABEL_12:
      v16 = (void *)v15;
      break;
    case 3:
      KCJoiningErrorCreate(6, a4, @"Unexpected message while done", v10, v11, v12, v13, v14, *(uint64_t *)v18);
      goto LABEL_14;
    default:
LABEL_14:
      v16 = 0;
      break;
  }

  return v16;
}

- (id)processApplication:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 type] == 6)
  {
    v7 = [(KCJoiningAcceptSession *)self createTLKRequestResponse:a4];
    goto LABEL_44;
  }
  if ([v6 type] != 4)
  {
    KCJoiningErrorCreate(6, a4, @"Expected peerInfo!", v8, v9, v10, v11, v12, v48);
LABEL_16:
    v7 = 0;
    goto LABEL_44;
  }
  if ([(KCJoiningAcceptSession *)self piggy_version] == 2)
  {
    *(void *)&long long v62 = 0;
    *((void *)&v62 + 1) = &v62;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__866;
    v65 = __Block_byref_object_dispose__867;
    id v66 = 0;
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__866;
    v58 = __Block_byref_object_dispose__867;
    id v59 = 0;
    uint64_t v13 = [(KCJoiningAcceptSession *)self createPairingMessageFromJoiningMessage:v6 error:a4];
    v53 = v13;
    if (v13)
    {
      if ([v13 hasPrepare])
      {
        uint64_t v14 = [v53 prepare];
        uint64_t v15 = @"full";
        v52 = [(KCJoiningAcceptSession *)self otControl];
        v51 = [(KCJoiningAcceptSession *)self controlArguments];
        v50 = [(KCJoiningAcceptSession *)self joiningConfiguration];
        v49 = [v14 peerID];
        v16 = [v14 permanentInfo];
        v17 = [v14 permanentInfoSig];
        v18 = [v14 stableInfo];
        uint64_t v19 = [v14 stableInfoSig];
        id v20 = v53;
        v21 = v14;
        objc_msgSend(v52, "rpcVoucherWithArguments:configuration:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:maxCapability:reply:", v51, v50, v49, v16, v17, v18);

        if (*(void *)(*((void *)&v62 + 1) + 40))
        {
          if ([(KCJoiningAcceptSession *)self shouldProcessSOSApplication:v6 pairingMessage:v20])
          {
            v22 = secLogObjForScope("joining");
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_218274000, v22, OS_LOG_TYPE_DEFAULT, "doing SOS processSOSApplication", buf, 2u);
            }

            v23 = [v6 secondData];
            v24 = [(KCJoiningAcceptSession *)self processSOSApplication:v23 error:a4];

            if (!v24)
            {
              v25 = secLogObjForScope("SecError");
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                if (a4) {
                  id v26 = *a4;
                }
                else {
                  id v26 = 0;
                }
                *(_DWORD *)buf = 138412290;
                id v61 = v26;
                _os_log_impl(&dword_218274000, v25, OS_LOG_TYPE_DEFAULT, "joining: failed to process SOS application: %@", buf, 0xCu);
              }

              KCJoiningErrorCreate(9, a4, @"message failed to process application", v42, v43, v44, v45, v46, (uint64_t)v19);
              goto LABEL_41;
            }
          }
          else
          {
            v24 = 0;
          }
          self->_state = 3;
          v41 = +[KCJoiningMessage messageWithType:5 data:*(void *)(*((void *)&v62 + 1) + 40) payload:v24 error:a4];
          v7 = [v41 der];
        }
        else
        {
          if (!a4 || (v40 = (void *)v55[5]) == 0)
          {
LABEL_41:
            v7 = 0;
            goto LABEL_42;
          }
          v7 = 0;
          *a4 = v40;
        }
LABEL_42:

        goto LABEL_43;
      }
      v33 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218274000, v33, OS_LOG_TYPE_DEFAULT, "octagon, message does not contain prepare message", buf, 2u);
      }
      v34 = @"Expected prepare message!";
    }
    else
    {
      v33 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218274000, v33, OS_LOG_TYPE_DEFAULT, "octagon, failed to create pairing message from JoiningMessage", buf, 2u);
      }
      v34 = @"Failed to create pairing message from JoiningMessage";
    }

    KCJoiningErrorCreate(6, a4, v34, v35, v36, v37, v38, v39, v48);
    v7 = 0;
LABEL_43:

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v62, 8);

    goto LABEL_44;
  }
  if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0)
  {
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"cannot join piggyback version %d with SOS disabled", -[KCJoiningAcceptSession piggy_version](self, "piggy_version"));
    v32 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v62) = 136315138;
      *(void *)((char *)&v62 + 4) = [v31 UTF8String];
      _os_log_impl(&dword_218274000, v32, OS_LOG_TYPE_DEFAULT, "joining: %s", (uint8_t *)&v62, 0xCu);
    }

    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithJoiningError:7, @"%@", v31 format];
    }

    goto LABEL_16;
  }
  v27 = [v6 firstData];
  v28 = [(KCJoiningAcceptSession *)self processSOSApplication:v27 error:a4];

  self->_state = 3;
  v29 = secLogObjForScope("joining");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v62) = 0;
    _os_log_impl(&dword_218274000, v29, OS_LOG_TYPE_DEFAULT, "posting kSOSCCCircleOctagonKeysChangedNotification", (uint8_t *)&v62, 2u);
  }

  notify_post((const char *)*MEMORY[0x263F16E08]);
  v30 = +[KCJoiningMessage messageWithType:5 data:v28 error:a4];
  v7 = [v30 der];

LABEL_44:
  return v7;
}

void __51__KCJoiningAcceptSession_processApplication_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v9;
      _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "error producing octagon voucher: %@", (uint8_t *)&v23, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  else
  {
    uint64_t v11 = objc_alloc_init(OTPairingMessage);
    uint64_t v12 = objc_alloc_init(OTSupportSOSMessage);
    [(OTPairingMessage *)v11 setSupportsSOS:v12];

    uint64_t v13 = objc_alloc_init(OTSupportOctagonMessage);
    [(OTPairingMessage *)v11 setSupportsOctagon:v13];

    uint64_t v14 = objc_alloc_init(OTSponsorToApplicantRound2M2);
    [(OTPairingMessage *)v11 setVoucher:v14];

    uint64_t v15 = [(OTPairingMessage *)v11 voucher];
    [v15 setVoucher:v7];

    v16 = [(OTPairingMessage *)v11 voucher];
    [v16 setVoucherSignature:v8];

    if (SOSCCIsSOSTrustAndSyncingEnabled()) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    v18 = [*(id *)(a1 + 32) supportsSOS];
    [v18 setSupported:v17];

    uint64_t v19 = [*(id *)(a1 + 32) supportsOctagon];
    [v19 setSupported:1];

    uint64_t v20 = [(OTPairingMessage *)v11 data];
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

- (BOOL)shouldProcessSOSApplication:(id)a3 pairingMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0)
  {
    uint64_t v10 = secLogObjForScope("joining");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      uint64_t v11 = "platform does not support SOS";
      uint64_t v12 = (uint8_t *)&v17;
      goto LABEL_12;
    }
LABEL_13:

    BOOL v13 = 0;
    goto LABEL_14;
  }
  id v7 = [v5 secondData];

  if (!v7)
  {
    uint64_t v10 = secLogObjForScope("joining");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "message does not contain SOS data";
      uint64_t v12 = buf;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if ([v6 hasSupportsSOS])
  {
    id v8 = [v6 supportsSOS];
    int v9 = [v8 supported];

    if (v9 == 2)
    {
      uint64_t v10 = secLogObjForScope("joining");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = 0;
        uint64_t v11 = "requester explicitly does not support SOS";
        uint64_t v12 = (uint8_t *)&v15;
LABEL_12:
        _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  BOOL v13 = 1;
LABEL_14:

  return v13;
}

- (id)createTLKRequestResponse:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [(KCJoiningAcceptSession *)self circleDelegate];
  id v18 = 0;
  id v6 = [v5 circleGetInitialSyncViews:4 error:&v18];
  id v7 = v18;

  if (v6)
  {
    id v8 = [(KCJoiningAcceptSession *)self session];
    id v17 = v7;
    int v9 = [v8 encrypt:v6 error:&v17];
    id v10 = v17;

    if (v9)
    {
      self->_state = 3;
      uint64_t v11 = secLogObjForScope("joining");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218274000, v11, OS_LOG_TYPE_DEFAULT, "TLKRequest done.", buf, 2u);
      }

      uint64_t v12 = +[KCJoiningMessage messageWithType:6 data:v9 error:a3];
      BOOL v13 = [v12 der];
    }
    else
    {
      __int16 v15 = secLogObjForScope("joining");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v10;
        _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "TLK request failed to encrypt: %@", buf, 0xCu);
      }

      BOOL v13 = 0;
      if (a3 && v10)
      {
        BOOL v13 = 0;
        *a3 = v10;
      }
    }
  }
  else
  {
    uint64_t v14 = secLogObjForScope("joining");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl(&dword_218274000, v14, OS_LOG_TYPE_DEFAULT, "Failed to get initial sync view: %@", buf, 0xCu);
    }

    BOOL v13 = 0;
    if (a3 && v7)
    {
      id v10 = v7;
      BOOL v13 = 0;
      *a3 = v10;
    }
    else
    {
      id v10 = v7;
    }
  }

  return v13;
}

- (id)createPairingMessageFromJoiningMessage:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(KCJoiningAcceptSession *)self session];
  id v8 = [v6 firstData];
  int v9 = [v7 decryptAndVerify:v8 error:a4];

  if (v9)
  {
    id v10 = [[KCInitialMessageData alloc] initWithData:v9];
    if (v10)
    {
      uint64_t v11 = v10;
      if ([(KCInitialMessageData *)v10 hasPrepareMessage])
      {
        uint64_t v12 = [OTPairingMessage alloc];
        BOOL v13 = [v11 prepareMessage];
        uint64_t v14 = [(OTPairingMessage *)v12 initWithData:v13];

        goto LABEL_14;
      }
      int v23 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_218274000, v23, OS_LOG_TYPE_DEFAULT, "InitialMessageData does not contain prepare message", v31, 2u);
      }

      KCJoiningErrorCreate(6, a4, @"Expected prepare message inside InitialMessageData", v24, v25, v26, v27, v28, *(uint64_t *)v31);
    }
    else
    {
      id v17 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "Failed to parse InitialMessageData from decrypted message data", v31, 2u);
      }

      KCJoiningErrorCreate(6, a4, @"Failed to parse InitialMessageData from decrypted message data", v18, v19, v20, v21, v22, *(uint64_t *)v31);
      uint64_t v11 = 0;
    }
    uint64_t v14 = 0;
  }
  else
  {
    __int16 v15 = secLogObjForScope("KeychainCircle");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      if (a4) {
        v30 = (__CFString *)*a4;
      }
      else {
        v30 = &stru_26C972770;
      }
      *(_DWORD *)v31 = 138412290;
      *(void *)&v31[4] = v30;
      _os_log_debug_impl(&dword_218274000, v15, OS_LOG_TYPE_DEBUG, "Failed to decrypt message first data: %@. Trying legacy OTPairingMessage construction.", v31, 0xCu);
    }

    v16 = [OTPairingMessage alloc];
    uint64_t v11 = [v6 firstData];
    uint64_t v14 = [(OTPairingMessage *)v16 initWithData:v11];
  }
LABEL_14:

  return v14;
}

- (id)processSOSApplication:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(KCJoiningAcceptSession *)self session];
  id v8 = [v7 decryptAndVerify:v6 error:a4];

  if (!v8)
  {
    v16 = 0;
    goto LABEL_27;
  }
  int v9 = [(KCJoiningAcceptSession *)self circleDelegate];
  id v26 = 0;
  uint64_t v10 = SOSPeerInfoCreateFromData();
  if (v10)
  {
    uint64_t v11 = (const void *)v10;
    uint64_t v12 = [v9 circleJoinDataFor:v10 error:a4];
    CFRelease(v11);
    if (v12)
    {
      int v13 = [(KCJoiningAcceptSession *)self piggy_version];
      if (v13 == 2)
      {
        uint64_t v14 = secLogObjForScope("acceptor");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v15 = 2;
          _os_log_impl(&dword_218274000, v14, OS_LOG_TYPE_DEFAULT, "piggy version is 2", buf, 2u);
        }
        else
        {
          uint64_t v15 = 2;
        }
      }
      else
      {
        if (v13 != 1)
        {
          id v17 = v12;
LABEL_23:
          uint64_t v22 = [(KCJoiningAcceptSession *)self session];
          v16 = [v22 encrypt:v17 error:a4];

          if (v16) {
            id v23 = v16;
          }

          goto LABEL_26;
        }
        uint64_t v14 = secLogObjForScope("acceptor");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218274000, v14, OS_LOG_TYPE_DEFAULT, "piggy version is 1", buf, 2u);
        }
        uint64_t v15 = 3;
      }

      id v25 = 0;
      uint64_t v18 = [v9 circleGetInitialSyncViews:v15 error:&v25];
      id v19 = v25;
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithData:v12];
      id v17 = v20;
      if (v18)
      {
        [v20 appendData:v18];
      }
      else
      {
        uint64_t v21 = secLogObjForScope("piggy");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v19;
          _os_log_impl(&dword_218274000, v21, OS_LOG_TYPE_DEFAULT, "PB threw an error: %@", buf, 0xCu);
        }
      }
      goto LABEL_23;
    }
    goto LABEL_12;
  }
  if (!a4)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_26;
  }
  v16 = 0;
  *a4 = v26;
LABEL_26:

LABEL_27:
  return v16;
}

- (id)processResponse:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 type] != 2)
  {
    KCJoiningErrorCreate(6, a4, @"Expected response!", v7, v8, v9, v10, v11, v37);
    uint64_t v22 = 0;
    goto LABEL_24;
  }
  uint64_t v12 = [(KCJoiningAcceptSession *)self secretDelegate];
  int v13 = [(KCJoiningAcceptSession *)self context];
  uint64_t v14 = [v6 firstData];
  uint64_t v15 = (void *)[v13 copyConfirmationFor:v14 error:0];

  if (v15)
  {
    v16 = (void *)MEMORY[0x263EFF8F8];
    id v17 = [v12 accountCode];
    uint64_t v18 = [v16 dataWithEncodedString:v17 error:a4];

    if (v18)
    {
      id v19 = [(KCJoiningAcceptSession *)self session];
      uint64_t v20 = [v19 encrypt:v18 error:a4];

      if (v20)
      {
        self->_state = 2;
        uint64_t v21 = +[KCJoiningMessage messageWithType:3 data:v15 payload:v20 error:a4];
        uint64_t v22 = [v21 der];
      }
      else
      {
        uint64_t v22 = 0;
      }
    }
    else
    {
      uint64_t v22 = 0;
    }

    goto LABEL_23;
  }
  int v23 = [v12 verificationFailed:a4];
  uint64_t v24 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v39 = v23;
    _os_log_impl(&dword_218274000, v24, OS_LOG_TYPE_DEFAULT, "processResponse: handle error: %d", buf, 8u);
  }

  if (v23 == 2)
  {
    v30 = [(KCJoiningAcceptSession *)self context];
    v31 = [v12 secret];
    int v32 = [v30 resetWithPassword:v31 error:a4];

    if (!v32)
    {
LABEL_22:
      uint64_t v22 = 0;
      goto LABEL_23;
    }
    id v33 = [(KCJoiningAcceptSession *)self copyChallengeMessage:a4];
  }
  else
  {
    if (v23 != 1)
    {
      if (!v23) {
        KCJoiningErrorCreate(7, a4, @"Delegate returned error without filling in error: %@", v25, v26, v27, v28, v29, (uint64_t)v12);
      }
      goto LABEL_22;
    }
    id v33 = [MEMORY[0x263EFF8F8] data];
  }
  v34 = v33;
  if (!v33) {
    goto LABEL_22;
  }
  uint64_t v35 = +[KCJoiningMessage messageWithType:0 data:v33 error:a4];
  uint64_t v22 = [v35 der];

LABEL_23:
LABEL_24:

  return v22;
}

- (id)processInitialMessage:(id)a3 error:(id *)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v53 = 0;
  uint64_t v54 = 0;
  id v52 = 0;
  uint64_t v7 = extractStartFromInitialMessage(v6, &v54, &v53, &v52, a4);
  id v8 = v53;
  id v9 = v52;
  [(KCJoiningAcceptSession *)self setStartMessage:v7];

  uint64_t v10 = [(KCJoiningAcceptSession *)self startMessage];

  if (!v10)
  {
    uint64_t v12 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_218274000, v12, OS_LOG_TYPE_DEFAULT, "joining: failed to extract startMessage: %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_31;
  }
  uint64_t v11 = v54;
  if (v54 == 2)
  {
    if ([(KCJoiningAcceptSession *)self shouldAcceptOctagonRequests])
    {
      [(KCJoiningAcceptSession *)self setOctagon:v9];
      uint64_t v11 = 2;
      goto LABEL_15;
    }
    uint64_t v14 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_218274000, v14, OS_LOG_TYPE_DEFAULT, "joining: octagon refusing octagon acceptor since we don't have a selfEgo", (uint8_t *)&buf, 2u);
    }

    if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) != 0
      || ([(KCJoiningAcceptSession *)self joiningConfiguration],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 testsEnabled],
          v15,
          (v16 & 1) != 0))
    {
      id v17 = secLogObjForScope("joining");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_218274000, v17, OS_LOG_TYPE_DEFAULT, "device supports SOS, continuing flow with piggyV1", (uint8_t *)&buf, 2u);
      }

      uint64_t v11 = 1;
      goto LABEL_15;
    }
    uint64_t v36 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_218274000, v36, OS_LOG_TYPE_DEFAULT, "joining: device does not support SOS, failing flow", (uint8_t *)&buf, 2u);
    }

    KCJoiningErrorCreate(20, a4, @"Unable to piggyback with device due to lack of trust system support", v37, v38, v39, v40, v41, v44);
LABEL_31:
    uint64_t v26 = 0;
    goto LABEL_43;
  }
LABEL_15:
  [(KCJoiningAcceptSession *)self setPiggy_uuid:v8];
  [(KCJoiningAcceptSession *)self setPiggy_version:v11];
  id v18 = [(KCJoiningAcceptSession *)self copyChallengeMessage:a4];
  if (v18)
  {
    self->_state = 1;
    id v19 = [NSString alloc];
    uint64_t v20 = [(KCJoiningAcceptSession *)self octagon];
    uint64_t v21 = [v19 initWithData:v20 encoding:4];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__866;
    v58 = __Block_byref_object_dispose__867;
    id v59 = 0;
    if (v11 == 2 && v21 && [v21 isEqualToString:@"o"])
    {
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__866;
      v50 = __Block_byref_object_dispose__867;
      id v51 = 0;
      uint64_t v22 = [(KCJoiningAcceptSession *)self otControl];
      int v23 = [(KCJoiningAcceptSession *)self controlArguments];
      uint64_t v24 = [(KCJoiningAcceptSession *)self joiningConfiguration];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __54__KCJoiningAcceptSession_processInitialMessage_error___block_invoke;
      v45[3] = &unk_264314FA0;
      v45[4] = &buf;
      v45[5] = &v46;
      [v22 rpcEpochWithArguments:v23 configuration:v24 reply:v45];

      uint64_t v25 = *(void **)(*((void *)&buf + 1) + 40);
      if (v25)
      {
        uint64_t v26 = 0;
        if (a4) {
          *a4 = v25;
        }
      }
      else
      {
        uint64_t v42 = +[KCJoiningMessage messageWithType:1 data:v18 payload:v47[5] error:a4];
        uint64_t v26 = [v42 der];
      }
      _Block_object_dispose(&v46, 8);
    }
    else if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) != 0 {
           || ([(KCJoiningAcceptSession *)self joiningConfiguration],
    }
               uint64_t v27 = objc_claimAutoreleasedReturnValue(),
               int v28 = [v27 testsEnabled],
               v27,
               v28))
    {
      v34 = +[KCJoiningMessage messageWithType:1 data:v18 error:a4];
      uint64_t v26 = [v34 der];
    }
    else
    {
      KCJoiningErrorCreate(20, a4, @"Unable to piggyback with device due to lack of trust system support", v29, v30, v31, v32, v33, v44);
      uint64_t v26 = 0;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v21 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v35 = *a4;
      }
      else {
        id v35 = 0;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v35;
      _os_log_impl(&dword_218274000, v21, OS_LOG_TYPE_DEFAULT, "joining: failed to copy srpMessage: %@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v26 = 0;
  }

LABEL_43:
  return v26;
}

void __54__KCJoiningAcceptSession_processInitialMessage_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "error retrieving next message! :%@", (uint8_t *)&v19, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    id v8 = objc_alloc_init(OTPairingMessage);
    id v9 = objc_alloc_init(OTSupportSOSMessage);
    [(OTPairingMessage *)v8 setSupportsSOS:v9];

    uint64_t v10 = objc_alloc_init(OTSupportOctagonMessage);
    [(OTPairingMessage *)v8 setSupportsOctagon:v10];

    uint64_t v11 = objc_alloc_init(OTSponsorToApplicantRound1M2);
    [(OTPairingMessage *)v8 setEpoch:v11];

    uint64_t v12 = [(OTPairingMessage *)v8 epoch];
    [v12 setEpoch:a2];

    if (SOSCCIsSOSTrustAndSyncingEnabled()) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
    uint64_t v14 = [(OTPairingMessage *)v8 supportsSOS];
    [v14 setSupported:v13];

    uint64_t v15 = [(OTPairingMessage *)v8 supportsOctagon];
    [v15 setSupported:1];

    uint64_t v16 = [(OTPairingMessage *)v8 data];
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

- (BOOL)shouldAcceptOctagonRequests
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v3 = objc_alloc_init(MEMORY[0x263F16D58]);
  [v3 setDiscretionaryNetwork:1];
  v4 = [(KCJoiningAcceptSession *)self otControl];
  id v5 = [(KCJoiningAcceptSession *)self controlArguments];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__KCJoiningAcceptSession_shouldAcceptOctagonRequests__block_invoke;
  v7[3] = &unk_264314F78;
  v7[4] = &v8;
  [v4 fetchTrustStatus:v5 configuration:v3 reply:v7];

  LOBYTE(v4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

void __53__KCJoiningAcceptSession_shouldAcceptOctagonRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5, void *a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67110146;
    v15[1] = a2;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 1024;
    int v21 = a5;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl(&dword_218274000, v14, OS_LOG_TYPE_DEFAULT, "octagon haveSelfEgo: status %d: %@ %@ %d: %@", (uint8_t *)v15, 0x2Cu);
  }

  if (!a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (id)copyChallengeMessage:(id *)a3
{
  id v5 = [(KCJoiningAcceptSession *)self context];
  id v6 = [(KCJoiningAcceptSession *)self startMessage];
  uint64_t v7 = (void *)[v5 copyChallengeFor:v6 error:a3];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF8F8];
    id v9 = [(KCJoiningAcceptSession *)self context];
    uint64_t v10 = [v9 salt];
    id v11 = [v8 dataWithEncodedSequenceData:v10 data:v7 error:a3];

    if ([(KCJoiningAcceptSession *)self setupSession:a3]) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3 = NSString;
  unint64_t v4 = [(KCJoiningAcceptSession *)self dsid];
  id v5 = [(KCJoiningAcceptSession *)self stateString];
  id v6 = [(KCJoiningAcceptSession *)self context];
  uint64_t v7 = [(KCJoiningAcceptSession *)self piggy_uuid];
  uint64_t v8 = [v3 stringWithFormat:@"<KCJoiningAcceptSession: %lld %@ %@ uuid: %@>", v4, v5, v6, v7];

  return v8;
}

- (id)stateString
{
  unsigned int v3 = [(KCJoiningAcceptSession *)self state];
  if (v3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", -[KCJoiningAcceptSession state](self, "state"));
    unint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v4 = off_264314FF0[v3];
  }
  return v4;
}

- (KCJoiningAcceptSession)initWithSecretDelegate:(id)a3 circleDelegate:(id)a4 dsid:(unint64_t)a5 rng:(ccrng_state *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v36.receiver = self;
  v36.super_class = (Class)KCJoiningAcceptSession;
  uint64_t v14 = [(KCJoiningAcceptSession *)&v36 init];
  if (v14)
  {
    uint64_t v15 = secLogObjForScope("accepting");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "initWithSecretDelegate", buf, 2u);
    }

    __int16 v16 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a5);
    id v17 = [KCSRPServerContext alloc];
    __int16 v18 = [v12 secret];
    uint64_t v19 = ccsha256_di();
    uint64_t v20 = [(KCSRPServerContext *)v17 initWithUser:v16 password:v18 digestInfo:v19 group:ccsrp_gp_rfc5054_3072() randomSource:a6];
    context = v14->_context;
    v14->_context = (KCSRPServerContext *)v20;

    [(KCJoiningAcceptSession *)v14 setSecretDelegate:v12];
    [(KCJoiningAcceptSession *)v14 setCircleDelegate:v13];
    v14->_state = 0;
    v14->_dsid = a5;
    piggy_uuid = v14->_piggy_uuid;
    v14->_piggy_uuid = 0;

    uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
    defaults = v14->_defaults;
    v14->_defaults = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x263F16D40] controlObject:1 error:a7];
    otControl = v14->_otControl;
    v14->_otControl = (OTControl *)v25;

    v14->_piggy_version = 2;
    id v27 = objc_alloc(MEMORY[0x263F16D50]);
    int v28 = [MEMORY[0x263F08C38] UUID];
    uint64_t v29 = [v28 UUIDString];
    uint64_t v30 = [v27 initWithProtocolType:@"OctagonPiggybacking" uniqueDeviceID:@"acceptor-deviceid" uniqueClientID:@"requester-deviceid" pairingUUID:v29 epoch:0 isInitiator:0];
    joiningConfiguration = v14->_joiningConfiguration;
    v14->_joiningConfiguration = (OTJoiningConfiguration *)v30;

    uint64_t v32 = (OTControlArguments *)objc_alloc_init(MEMORY[0x263F16D48]);
    controlArguments = v14->_controlArguments;
    v14->_controlArguments = v32;
  }
  return v14;
}

- (BOOL)setupSession:(id *)a3
{
  uint64_t v10 = [(KCSRPContext *)self->_context getKey];
  if (v10)
  {
    id v11 = +[KCAESGCMDuplexSession sessionAsReceiver:v10 context:[(KCJoiningAcceptSession *)self dsid]];
    session = self->_session;
    self->_session = v11;

    id v13 = [(KCJoiningAcceptSession *)self joiningConfiguration];
    uint64_t v14 = [v13 pairingUUID];
    uint64_t v15 = [(KCJoiningAcceptSession *)self session];
    [v15 setPairingUUID:v14];

    __int16 v16 = [(KCJoiningAcceptSession *)self controlArguments];
    id v17 = [v16 altDSID];
    __int16 v18 = [(KCJoiningAcceptSession *)self session];
    [v18 setAltDSID:v17];

    uint64_t v19 = [(KCJoiningAcceptSession *)self piggy_version];
    uint64_t v20 = [(KCJoiningAcceptSession *)self session];
    [v20 setPiggybackingVersion:v19];

    int v21 = [(KCJoiningAcceptSession *)self session];
    BOOL v22 = v21 != 0;
  }
  else
  {
    KCJoiningErrorCreate(7, a3, @"No session key available", v5, v6, v7, v8, v9, v24);
    BOOL v22 = 0;
  }

  return v22;
}

+ (id)sessionWithInitialMessage:(id)a3 secretDelegate:(id)a4 circleDelegate:(id)a5 dsid:(unint64_t)a6 error:(id *)a7
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = ccrng();
  if (v12)
  {
    __int16 v18 = [[KCJoiningAcceptSession alloc] initWithSecretDelegate:v10 circleDelegate:v11 dsid:a6 rng:v12 error:a7];
  }
  else
  {
    CoreCryptoError(0, a7, @"RNG fetch failed", v13, v14, v15, v16, v17, v20);
    __int16 v18 = 0;
  }

  return v18;
}

@end