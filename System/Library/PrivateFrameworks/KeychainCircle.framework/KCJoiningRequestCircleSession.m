@interface KCJoiningRequestCircleSession
+ (id)sessionWithCircleDelegate:(id)a3 session:(id)a4 error:(id *)a5;
- (BOOL)isDone;
- (BOOL)shouldJoinSOS:(id)a3 pairingMessage:(id)a4;
- (KCAESGCMDuplexSession)session;
- (KCJoiningRequestCircleDelegate)circleDelegate;
- (KCJoiningRequestCircleSession)initWithCircleDelegate:(id)a3 session:(id)a4 error:(id *)a5;
- (KCJoiningRequestCircleSession)initWithCircleDelegate:(id)a3 session:(id)a4 otcontrol:(id)a5 error:(id *)a6;
- (OTControl)otControl;
- (OTControlArguments)controlArguments;
- (OTJoiningConfiguration)joiningConfiguration;
- (id)encryptPeerInfo:(id *)a3;
- (id)encryptedInitialMessage:(id)a3 error:(id *)a4;
- (id)encryptedPeerInfo:(id *)a3;
- (id)handleCircleBlob:(id)a3 error:(id *)a4;
- (id)initialMessage:(id *)a3;
- (id)processMessage:(id)a3 error:(id *)a4;
- (int)state;
- (unint64_t)piggy_version;
- (void)setContextIDForSession:(id)a3;
- (void)setControlArguments:(id)a3;
- (void)setJoiningConfiguration:(id)a3;
- (void)setOtControl:(id)a3;
- (void)setPiggy_version:(unint64_t)a3;
- (void)setState:(int)a3;
- (void)waitForOctagonUpgrade;
@end

@implementation KCJoiningRequestCircleSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlArguments, 0);
  objc_storeStrong((id *)&self->_joiningConfiguration, 0);
  objc_storeStrong((id *)&self->_otControl, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_circleDelegate, 0);
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

- (void)setOtControl:(id)a3
{
}

- (OTControl)otControl
{
  return self->_otControl;
}

- (void)setPiggy_version:(unint64_t)a3
{
  self->_piggy_version = a3;
}

- (unint64_t)piggy_version
{
  return self->_piggy_version;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (int)state
{
  return self->_state;
}

- (KCAESGCMDuplexSession)session
{
  return (KCAESGCMDuplexSession *)objc_getProperty(self, a2, 24, 1);
}

- (KCJoiningRequestCircleDelegate)circleDelegate
{
  return (KCJoiningRequestCircleDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (KCJoiningRequestCircleSession)initWithCircleDelegate:(id)a3 session:(id)a4 otcontrol:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = secLogObjForScope("joining");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v11 pairingUUID];
    *(_DWORD *)buf = 138412290;
    v28 = v14;
    _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestCircleSession initWithCircleDelegate called, uuid=%@", buf, 0xCu);
  }
  v26.receiver = self;
  v26.super_class = (Class)KCJoiningRequestCircleSession;
  v15 = [(KCJoiningRequestCircleSession *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_circleDelegate, a3);
    objc_storeStrong((id *)&v16->_session, a4);
    [(KCJoiningRequestCircleSession *)v16 setState:0];
    objc_storeStrong((id *)&v16->_otControl, a5);
    id v17 = objc_alloc(MEMORY[0x263F16D50]);
    v18 = [v11 pairingUUID];
    uint64_t v19 = objc_msgSend(v17, "initWithProtocolType:uniqueDeviceID:uniqueClientID:pairingUUID:epoch:isInitiator:", @"OctagonPiggybacking", @"requester-id", @"requester-id", v18, objc_msgSend(v11, "epoch"), 1);
    joiningConfiguration = v16->_joiningConfiguration;
    v16->_joiningConfiguration = (OTJoiningConfiguration *)v19;

    id v21 = objc_alloc(MEMORY[0x263F16D48]);
    v22 = [v11 altDSID];
    uint64_t v23 = [v21 initWithAltDSID:v22];
    controlArguments = v16->_controlArguments;
    v16->_controlArguments = (OTControlArguments *)v23;

    v16->_piggy_version = [v11 piggybackingVersion];
  }

  return v16;
}

- (KCJoiningRequestCircleSession)initWithCircleDelegate:(id)a3 session:(id)a4 error:(id *)a5
{
  v8 = (void *)MEMORY[0x263F16D40];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 controlObject:1 error:a5];
  id v12 = [(KCJoiningRequestCircleSession *)self initWithCircleDelegate:v10 session:v9 otcontrol:v11 error:a5];

  return v12;
}

- (BOOL)isDone
{
  return 1;
}

- (id)processMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = secLogObjForScope("joining");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestCircleSession processMessage called", (uint8_t *)&v17, 2u);
  }

  v8 = +[KCJoiningMessage messageWithDER:v6 error:a4];

  if (v8)
  {
    int v9 = [(KCJoiningRequestCircleSession *)self state];
    if (v9 == 1)
    {
      KCJoiningErrorCreate(6, a4, @"Done, no messages expected.", v10, v11, v12, v13, v14, v17);
    }
    else if (!v9)
    {
      v15 = [(KCJoiningRequestCircleSession *)self handleCircleBlob:v8 error:a4];
      goto LABEL_9;
    }
  }
  v15 = 0;
LABEL_9:

  return v15;
}

- (id)handleCircleBlob:(id)a3 error:(id *)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = secLogObjForScope("joining");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestCircleSession handleCircleBlob called", buf, 2u);
  }

  if ([v6 type] != 5)
  {
    KCJoiningErrorCreate(6, a4, @"Expected CircleBlob!", v8, v9, v10, v11, v12, v61);
    goto LABEL_15;
  }
  if ([(KCJoiningRequestCircleSession *)self piggy_version] != 2
    || ([v6 firstData],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = v13 == 0,
        v13,
        v14))
  {
    if (!SOSCCIsSOSTrustAndSyncingEnabled())
    {
      v33 = secLogObjForScope("joining");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218274000, v33, OS_LOG_TYPE_DEFAULT, "SOS not enabled for this platform", buf, 2u);
      }
      goto LABEL_26;
    }
    v31 = [(KCJoiningRequestCircleSession *)self session];
    v32 = [v6 firstData];
    v33 = [v31 decryptAndVerify:v32 error:a4];

    if (v33)
    {
      v34 = [(KCJoiningRequestCircleSession *)self circleDelegate];
      char v35 = [v34 processCircleJoinData:v33 version:1 error:a4];

      if (v35)
      {
        v36 = secLogObjForScope("joining");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218274000, v36, OS_LOG_TYPE_DEFAULT, "joined the SOS circle!", buf, 2u);
        }

        v37 = secLogObjForScope("joining");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218274000, v37, OS_LOG_TYPE_DEFAULT, "kicking off SOS Upgrade into Octagon!", buf, 2u);
        }

        [(KCJoiningRequestCircleSession *)self waitForOctagonUpgrade];
LABEL_26:

        self->_state = 1;
        v30 = [MEMORY[0x263EFF8F8] data];
        goto LABEL_51;
      }
      v50 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218274000, v50, OS_LOG_TYPE_DEFAULT, "joining: failed to process SOS circle", buf, 2u);
      }

      KCJoiningErrorCreate(18, a4, @"Failed to process circleBlob", v51, v52, v53, v54, v55, v61);
    }
    else
    {
      v44 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218274000, v44, OS_LOG_TYPE_DEFAULT, "joining: circleBlob is nil", buf, 2u);
      }

      KCJoiningErrorCreate(17, a4, @"Failed to decrypt circleBlob", v45, v46, v47, v48, v49, v61);
    }

LABEL_15:
    v30 = 0;
    goto LABEL_51;
  }
  *(void *)buf = 0;
  v64 = buf;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__362;
  v67 = __Block_byref_object_dispose__363;
  id v68 = 0;
  v15 = [OTPairingMessage alloc];
  v16 = [v6 firstData];
  uint64_t v17 = [(OTPairingMessage *)v15 initWithData:v16];

  if (![(OTPairingMessage *)v17 hasVoucher])
  {
    v38 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v69 = 0;
      _os_log_impl(&dword_218274000, v38, OS_LOG_TYPE_DEFAULT, "octagon: expected voucher! returning from piggybacking.", v69, 2u);
    }

    KCJoiningErrorCreate(15, a4, @"Missing voucher from acceptor", v39, v40, v41, v42, v43, v61);
    v30 = 0;
    goto LABEL_50;
  }
  v18 = [(OTPairingMessage *)v17 voucher];
  uint64_t v19 = [(KCJoiningRequestCircleSession *)self otControl];
  v20 = [(KCJoiningRequestCircleSession *)self controlArguments];
  id v21 = [(KCJoiningRequestCircleSession *)self joiningConfiguration];
  v22 = [v18 voucher];
  uint64_t v23 = [v18 voucherSignature];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __56__KCJoiningRequestCircleSession_handleCircleBlob_error___block_invoke;
  v62[3] = &unk_264314B50;
  v62[4] = buf;
  [v19 rpcJoinWithArguments:v20 configuration:v21 vouchData:v22 vouchSig:v23 reply:v62];

  if (![(KCJoiningRequestCircleSession *)self shouldJoinSOS:v6 pairingMessage:v17]) {
    goto LABEL_13;
  }
  v24 = secLogObjForScope("joining");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v69 = 0;
    _os_log_impl(&dword_218274000, v24, OS_LOG_TYPE_DEFAULT, "doing SOS processCircleJoinData", v69, 2u);
  }

  v25 = [(KCJoiningRequestCircleSession *)self session];
  objc_super v26 = [v6 secondData];
  v27 = [v25 decryptAndVerify:v26 error:a4];

  if (!v27)
  {
    v56 = secLogObjForScope("joining");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v57 = *a4;
      }
      else {
        id v57 = 0;
      }
      *(_DWORD *)v69 = 138412290;
      id v70 = v57;
      v59 = "decryptAndVerify failed: %@";
      goto LABEL_47;
    }
LABEL_48:

    v30 = 0;
    goto LABEL_49;
  }
  v28 = [(KCJoiningRequestCircleSession *)self circleDelegate];
  char v29 = [v28 processCircleJoinData:v27 version:1 error:a4];

  if ((v29 & 1) == 0)
  {
    v56 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v58 = *a4;
      }
      else {
        id v58 = 0;
      }
      *(_DWORD *)v69 = 138412290;
      id v70 = v58;
      v59 = "joining: processCircleJoinData failed %@";
LABEL_47:
      _os_log_impl(&dword_218274000, v56, OS_LOG_TYPE_DEFAULT, v59, v69, 0xCu);
      goto LABEL_48;
    }
    goto LABEL_48;
  }

LABEL_13:
  self->_state = 1;
  v30 = [MEMORY[0x263EFF8F8] data];
  self->_state = 1;
LABEL_49:

LABEL_50:
  _Block_object_dispose(buf, 8);

LABEL_51:
  return v30;
}

void __56__KCJoiningRequestCircleSession_handleCircleBlob_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_218274000, v4, OS_LOG_TYPE_DEFAULT, "octagon: error joining octagon: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = v3;
    v7 = *(NSObject **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }
  else
  {
    v7 = secLogObjForScope("octagon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_218274000, v7, OS_LOG_TYPE_DEFAULT, "successfully joined octagon", (uint8_t *)&v8, 2u);
    }
  }
}

- (BOOL)shouldJoinSOS:(id)a3 pairingMessage:(id)a4
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
  v7 = [v5 secondData];

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
    int v8 = [v6 supportsSOS];
    int v9 = [v8 supported];

    if (v9 == 2)
    {
      uint64_t v10 = secLogObjForScope("joining");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = 0;
        uint64_t v11 = "acceptor explicitly does not support SOS";
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

- (void)waitForOctagonUpgrade
{
  id v4 = [(KCJoiningRequestCircleSession *)self otControl];
  id v3 = [(KCJoiningRequestCircleSession *)self controlArguments];
  [v4 waitForOctagonUpgrade:v3 reply:&__block_literal_global_391];
}

void __54__KCJoiningRequestCircleSession_waitForOctagonUpgrade__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_218274000, v3, OS_LOG_TYPE_DEFAULT, "pairing: failed to upgrade initiator into Octagon: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)initialMessage:(id *)a3
{
  id v5 = secLogObjForScope("joining");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v5, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestCircleSession initialMessage called", buf, 2u);
  }

  if ([(KCJoiningRequestCircleSession *)self piggy_version] == 2)
  {
    *(void *)buf = 0;
    uint64_t v41 = buf;
    uint64_t v42 = 0x3032000000;
    uint64_t v43 = __Block_byref_object_copy__362;
    v44 = __Block_byref_object_dispose__363;
    id v45 = 0;
    uint64_t v34 = 0;
    char v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__362;
    v38 = __Block_byref_object_dispose__363;
    id v39 = 0;
    uint64_t v6 = [(KCJoiningRequestCircleSession *)self joiningConfiguration];
    uint64_t v7 = [v6 epoch];

    if (!v7)
    {
      id v21 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_218274000, v21, OS_LOG_TYPE_DEFAULT, "joining: expected acceptor epoch! returning nil.", v33, 2u);
      }

      KCJoiningErrorCreate(11, a3, @"expected acceptor epoch", v22, v23, v24, v25, v26, v32[0]);
      goto LABEL_17;
    }
    int v8 = [(KCJoiningRequestCircleSession *)self otControl];
    int v9 = [(KCJoiningRequestCircleSession *)self controlArguments];
    uint64_t v10 = [(KCJoiningRequestCircleSession *)self joiningConfiguration];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = (uint64_t)__48__KCJoiningRequestCircleSession_initialMessage___block_invoke;
    v32[3] = (uint64_t)&unk_264314B08;
    v32[4] = (uint64_t)&v34;
    v32[5] = (uint64_t)buf;
    [v8 rpcPrepareIdentityAsApplicantWithArguments:v9 configuration:v10 reply:v32];

    uint64_t v11 = (void *)v35[5];
    if (v11)
    {
      if (a3)
      {
        uint64_t v12 = 0;
        *a3 = v11;
LABEL_27:
        _Block_object_dispose(&v34, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_28;
      }
LABEL_17:
      uint64_t v12 = 0;
      goto LABEL_27;
    }
    if (SOSCCIsSOSTrustAndSyncingEnabled())
    {
      v27 = [(KCJoiningRequestCircleSession *)self encryptPeerInfo:a3];
      if (!v27) {
        goto LABEL_17;
      }
    }
    else
    {
      v28 = secLogObjForScope("joining");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_218274000, v28, OS_LOG_TYPE_DEFAULT, "SOS not enabled, skipping peer info encryption", v33, 2u);
      }

      v27 = 0;
    }
    self->_state = 0;
    char v29 = [(KCJoiningRequestCircleSession *)self encryptedInitialMessage:*((void *)v41 + 5) error:a3];
    v30 = +[KCJoiningMessage messageWithType:4 data:v29 payload:v27 error:a3];
    uint64_t v12 = [v30 der];

    goto LABEL_27;
  }
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    BOOL v13 = [(KCJoiningRequestCircleSession *)self encryptPeerInfo:a3];
    if (v13)
    {
      self->_state = 0;
      BOOL v14 = +[KCJoiningMessage messageWithType:4 data:v13 error:a3];
      uint64_t v12 = [v14 der];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    __int16 v15 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218274000, v15, OS_LOG_TYPE_DEFAULT, "joining: device does not support SOS nor piggybacking version 2", buf, 2u);
    }

    KCJoiningErrorCreate(14, a3, @"device does not support SOS nor piggybacking version 2", v16, v17, v18, v19, v20, v32[0]);
    uint64_t v12 = 0;
  }
LABEL_28:
  return v12;
}

void __48__KCJoiningRequestCircleSession_initialMessage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v18)
  {
    uint64_t v19 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v18;
      _os_log_impl(&dword_218274000, v19, OS_LOG_TYPE_DEFAULT, "octagon: error preparing identity: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a7);
  }
  else
  {
    uint64_t v20 = objc_alloc_init(OTPairingMessage);
    id v21 = objc_alloc_init(OTSupportSOSMessage);
    [(OTPairingMessage *)v20 setSupportsSOS:v21];

    uint64_t v22 = objc_alloc_init(OTSupportOctagonMessage);
    [(OTPairingMessage *)v20 setSupportsOctagon:v22];

    uint64_t v23 = objc_alloc_init(OTApplicantToSponsorRound2M1);
    [(OTApplicantToSponsorRound2M1 *)v23 setPeerID:v13];
    [(OTApplicantToSponsorRound2M1 *)v23 setPermanentInfo:v14];
    [(OTApplicantToSponsorRound2M1 *)v23 setPermanentInfoSig:v15];
    [(OTApplicantToSponsorRound2M1 *)v23 setStableInfo:v16];
    [(OTApplicantToSponsorRound2M1 *)v23 setStableInfoSig:v17];
    [(OTPairingMessage *)v20 setPrepare:v23];
    if (SOSCCIsSOSTrustAndSyncingEnabled()) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = 2;
    }
    [(OTPairingMessage *)v20 supportsSOS];
    id v36 = v17;
    id v25 = v16;
    id v26 = v15;
    id v27 = v14;
    id v28 = v13;
    v30 = uint64_t v29 = a1;
    [v30 setSupported:v24];

    v31 = [(OTPairingMessage *)v20 supportsOctagon];
    [v31 setSupported:1];

    uint64_t v32 = [(OTPairingMessage *)v20 data];
    uint64_t v33 = *(void *)(v29 + 40);
    id v13 = v28;
    id v14 = v27;
    id v15 = v26;
    id v16 = v25;
    id v17 = v36;
    uint64_t v34 = *(void *)(v33 + 8);
    char v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v32;
  }
}

- (id)encryptPeerInfo:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = secLogObjForScope("joining");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v5, OS_LOG_TYPE_DEFAULT, "doing SOS encryptedPeerInfo", buf, 2u);
  }

  id v18 = 0;
  uint64_t v6 = [(KCJoiningRequestCircleSession *)self encryptedPeerInfo:&v18];
  id v7 = v18;
  int v8 = v7;
  if (v6 && !v7)
  {
    id v9 = v6;
    goto LABEL_13;
  }
  uint64_t v10 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v8;
    _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "joining: failed to create encrypted peerInfo: %@", buf, 0xCu);
  }

  if (v8)
  {
    if (a3)
    {
      id v9 = 0;
      *a3 = v8;
      goto LABEL_13;
    }
  }
  else
  {
    KCJoiningErrorCreate(13, a3, @"failed to encrypt the SOS peer info", v11, v12, v13, v14, v15, v17);
  }
  id v9 = 0;
LABEL_13:

  return v9;
}

- (id)encryptedInitialMessage:(id)a3 error:(id *)a4
{
  id v11 = a3;
  if (self->_session)
  {
    uint64_t v12 = objc_alloc_init(KCInitialMessageData);
    [(KCInitialMessageData *)v12 setPrepareMessage:v11];
    session = self->_session;
    uint64_t v14 = [(KCInitialMessageData *)v12 data];
    uint64_t v15 = [(KCAESGCMDuplexSession *)session encrypt:v14 error:a4];
  }
  else
  {
    KCJoiningErrorCreate(7, a4, @"Attempt to encrypt with no session", v6, v7, v8, v9, v10, v17);
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)encryptedPeerInfo:(id *)a3
{
  if (!self->_session)
  {
    KCJoiningErrorCreate(7, a3, @"Attempt to encrypt with no session", v3, v4, v5, v6, v7, v15);
    goto LABEL_6;
  }
  uint64_t v10 = [(KCJoiningRequestCircleSession *)self circleDelegate];
  id v11 = (const void *)[v10 copyPeerInfoError:a3];

  if (!v11)
  {
LABEL_6:
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  uint64_t v12 = (void *)SOSPeerInfoCopyEncodedData();
  CFRelease(v11);
  if (v12)
  {
    uint64_t v13 = [(KCAESGCMDuplexSession *)self->_session encrypt:v12 error:a3];
  }
  else
  {
    uint64_t v13 = 0;
    if (a3) {
      *a3 = 0;
    }
  }

LABEL_10:
  return v13;
}

- (void)setContextIDForSession:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F16D48];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v11 = [(KCJoiningRequestCircleSession *)self controlArguments];
  uint64_t v7 = [v11 containerName];
  uint64_t v8 = [(KCJoiningRequestCircleSession *)self controlArguments];
  uint64_t v9 = [v8 altDSID];
  uint64_t v10 = (void *)[v6 initWithContainerName:v7 contextID:v5 altDSID:v9];

  [(KCJoiningRequestCircleSession *)self setControlArguments:v10];
}

+ (id)sessionWithCircleDelegate:(id)a3 session:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[KCJoiningRequestCircleSession alloc] initWithCircleDelegate:v8 session:v7 error:a5];

  return v9;
}

@end