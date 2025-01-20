@interface HMDRapportMessageTransport
+ (id)logCategory;
+ (unint64_t)restriction;
- (BOOL)canSendMessage:(id)a3;
- (BOOL)isSecure;
- (BOOL)isValidMessage:(id)a3;
- (HMDAppleAccountManager)appleAccountManager;
- (HMDRapportMessageTransport)initWithAccountRegistry:(id)a3;
- (HMDRapportMessageTransport)initWithAccountRegistry:(id)a3 rapportMessaging:(id)a4 logEventSubmitter:(id)a5 appleAccountManager:(id)a6;
- (HMDRapportMessaging)rapportMessaging;
- (HMDRemoteMessageListener)remoteMessageListener;
- (HMMLogEventSubmitting)logEventSubmitter;
- (id)_IDSIdentifierForDestination:(id)a3;
- (id)_IDSIdentifierForDevice:(id)a3;
- (id)_IDSIdentifiersForMessage:(id)a3;
- (id)_rpOptions:(id)a3 stringForKey:(id)a4;
- (id)_serializeRemoteMessage:(id)a3 withResponseErrorData:(id)a4 serializationError:(id *)a5;
- (id)start;
- (id)startHMMM;
- (id)startHMMMEnergy;
- (int)transportType;
- (void)_configureHMMMEnergyRapport;
- (void)_configureHMMMRapport;
- (void)_configureRapport;
- (void)_didReceiveRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_sendMessage:(id)a3 completionHandler:(id)a4;
- (void)_sendMessage:(id)a3 completionHandler:(id)a4 requestID:(id)a5;
- (void)_setSharedUserIDSIdentifierForDevice:(id)a3 idsIdentifier:(id)a4;
- (void)rapportMessaging:(id)a3 idsIdentifier:(id)a4 didAppearReachable:(BOOL)a5;
- (void)sendHMMMEnergyMessage:(id)a3 completionHandler:(id)a4;
- (void)sendHMMMMessage:(id)a3 completionHandler:(id)a4;
- (void)setRemoteMessageListener:(id)a3;
@end

@implementation HMDRapportMessageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_rapportMessaging, 0);
  objc_storeStrong((id *)&self->_remoteMessageListener, 0);
}

- (HMDAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDRapportMessaging)rapportMessaging
{
  return self->_rapportMessaging;
}

- (void)setRemoteMessageListener:(id)a3
{
}

- (HMDRemoteMessageListener)remoteMessageListener
{
  return self->_remoteMessageListener;
}

- (id)_rpOptions:(id)a3 stringForKey:(id)a4
{
  v4 = objc_msgSend(a3, "hmf_stringForKey:", a4);
  if ([v4 length]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_didReceiveRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__HMDRapportMessageTransport__didReceiveRequest_options_responseHandler___block_invoke;
  aBlock[3] = &unk_264A2E288;
  id v11 = v10;
  id v107 = v11;
  v103 = (void (**)(void *, void))_Block_copy(aBlock);
  v12 = [(HMDRapportMessageTransport *)self _rpOptions:v9 stringForKey:*MEMORY[0x263F62C88]];
  v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v12];
  v14 = (void *)MEMORY[0x230FBD990]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    v109 = v17;
    __int16 v110 = 2112;
    uint64_t v111 = (uint64_t)v8;
    __int16 v112 = 2160;
    uint64_t v113 = 1752392040;
    __int16 v114 = 2112;
    v115 = v13;
    __int16 v116 = 2112;
    id v117 = v9;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Received message: %@, from: %{mask.hash}@, with options: %@", buf, 0x34u);
  }
  id v105 = 0;
  v18 = +[HMDRemoteMessageSerialization remoteMessageWithDictionary:v8 isHH2Payload:1 error:&v105];
  id v19 = v105;
  v20 = v19;
  v104 = v18;
  if (v18)
  {
    if (v12)
    {
      if (v13)
      {
        v99 = [(HMDRapportMessageTransport *)v15 _rpOptions:v9 stringForKey:*MEMORY[0x263F62C58]];
        if (v99)
        {
          id v98 = v11;
          v21 = [(HMDRemoteMessageTransport *)v15 accountRegistry];
          v22 = [v21 deviceForIDSIdentifier:v13];

          v100 = v22;
          if (v22)
          {
            uint64_t v23 = [v22 remoteDestinationString];
            v97 = (void *)v23;
            if (v23)
            {
              uint64_t v24 = v23;
              v95 = v20;
              v103[2](v103, 0);
              v25 = [v18 userInfo];
              v26 = (void *)[v25 mutableCopy];

              [v26 setObject:v24 forKeyedSubscript:@"kIDSMessageSourceIDKey"];
              v27 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDRapportMessageTransport transportType](v15, "transportType"));
              [v26 setObject:v27 forKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];

              v28 = objc_msgSend(v8, "hmf_dataForKey:", @"kIDSMessageResponseErrorDataKey");
              [v26 setObject:v28 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

              v29 = [v18 internal];
              uint64_t v96 = (uint64_t)v26;
              [v29 setUserInfo:v26];

              v30 = [HMDRemoteDeviceMessageDestination alloc];
              v31 = [v18 destination];
              v32 = [v31 target];
              uint64_t v94 = [(HMDRemoteDeviceMessageDestination *)v30 initWithTarget:v32 device:v100];

              [v18 setDestination:v94];
              objc_msgSend(v18, "setRestriction:", objc_msgSend((id)objc_opt_class(), "restriction"));
              objc_msgSend(v18, "setSecure:", -[HMDRapportMessageTransport isSecure](v15, "isSecure"));
              v93 = +[HMDDeviceHandle deviceHandleForDeviceIdentifier:v13];
              v33 = [[HMDRemoteMessageSenderContext alloc] initWithDeviceHandle:v93 accountHandle:0 accountIdentifier:0 deviceVersion:0 pairingIdentityIdentifier:v99];
              [v18 setSenderContext:v33];

              v34 = [(HMDRapportMessageTransport *)v15 logEventSubmitter];
              v35 = +[HMDRemoteMessageLogEvent receivedRemoteMessage:v18 transportType:6];
              [v34 submitLogEvent:v35];

              v36 = [(HMDRapportMessageTransport *)v15 remoteMessageListener];
              uint64_t v37 = [(HMDRapportMessageTransport *)v15 transportType];
              v38 = [v18 senderContext];
              [v36 receivedRemoteMessageOverTransportType:v37 remoteMessageSenderContext:v38];

              v39 = [(HMFMessageTransport *)v15 delegate];
              v40 = v15;
              v41 = v103;
              v20 = v95;
              [v39 messageTransport:v40 didReceiveMessage:v18];

              v42 = (void *)v94;
            }
            else
            {
              v88 = (void *)MEMORY[0x230FBD990]();
              v89 = v15;
              v90 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
              {
                v91 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v109 = v91;
                __int16 v110 = 2112;
                uint64_t v111 = (uint64_t)v18;
                _os_log_impl(&dword_22F52A000, v90, OS_LOG_TYPE_ERROR, "%{public}@Could not find remote destination for incoming message: %@", buf, 0x16u);
              }
              v92 = (void *)MEMORY[0x263F087E8];
              uint64_t v96 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3210];
              v42 = objc_msgSend(v92, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, 0, 0, 0);
              v41 = v103;
              ((void (**)(void *, void *))v103)[2](v103, v42);
            }

            v81 = v97;
            id v11 = v98;
            v80 = v100;
            v87 = (void *)v96;
          }
          else
          {
            v82 = (void *)MEMORY[0x230FBD990]();
            v83 = v15;
            v84 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              v85 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138544130;
              v109 = v85;
              __int16 v110 = 2160;
              uint64_t v111 = 1752392040;
              __int16 v112 = 2112;
              uint64_t v113 = (uint64_t)v12;
              __int16 v114 = 2112;
              v115 = v18;
              _os_log_impl(&dword_22F52A000, v84, OS_LOG_TYPE_ERROR, "%{public}@Could not find source device for sender IDS DeviceID: %{mask.hash}@ message: %@", buf, 0x2Au);
            }
            v86 = (void *)MEMORY[0x263F087E8];
            v81 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3209];
            v87 = [v86 hmErrorWithCode:2 description:0 reason:0 suggestion:0 underlyingError:v81];
            v41 = v103;
            ((void (**)(void *, void *))v103)[2](v103, v87);
            id v11 = v98;
            v80 = 0;
          }
        }
        else
        {
          v102 = v12;
          id v71 = v8;
          v72 = v13;
          v73 = v20;
          id v74 = v11;
          v75 = (void *)MEMORY[0x230FBD990]();
          v76 = v15;
          v77 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            v78 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v109 = v78;
            __int16 v110 = 2112;
            uint64_t v111 = (uint64_t)v18;
            __int16 v112 = 2112;
            uint64_t v113 = (uint64_t)v9;
            _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because pairing identity identifier is missing in options: %@", buf, 0x20u);
          }
          v79 = (void *)MEMORY[0x263F087E8];
          v80 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3208];
          v81 = [v79 hmErrorWithCode:2 description:0 reason:0 suggestion:0 underlyingError:v80];
          v41 = v103;
          ((void (**)(void *, void *))v103)[2](v103, v81);
          id v11 = v74;
          v20 = v73;
          v13 = v72;
          id v8 = v71;
          v12 = v102;
        }

        goto LABEL_32;
      }
      v101 = v12;
      id v53 = v8;
      v54 = 0;
      id v55 = v19;
      id v56 = v11;
      v65 = (void *)MEMORY[0x230FBD990]();
      v66 = v15;
      v67 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v68 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v109 = v68;
        __int16 v110 = 2112;
        uint64_t v111 = (uint64_t)v18;
        __int16 v112 = 2112;
        uint64_t v113 = (uint64_t)v9;
        _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because IDS Device ID is an invalid UUID in options: %@", buf, 0x20u);
      }
      v69 = (void *)MEMORY[0x263F087E8];
      v62 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3207];
      v63 = v69;
      uint64_t v64 = -1;
    }
    else
    {
      v101 = 0;
      id v53 = v8;
      v54 = v13;
      id v55 = v19;
      id v56 = v11;
      v57 = (void *)MEMORY[0x230FBD990]();
      v58 = v15;
      v59 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v60 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v109 = v60;
        __int16 v110 = 2112;
        uint64_t v111 = (uint64_t)v18;
        __int16 v112 = 2112;
        uint64_t v113 = (uint64_t)v9;
        _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because IDS Device ID is missing in options: %@", buf, 0x20u);
      }
      v61 = (void *)MEMORY[0x263F087E8];
      v62 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3206];
      v63 = v61;
      uint64_t v64 = 2;
    }
    v70 = [v63 hmErrorWithCode:v64 description:0 reason:0 suggestion:0 underlyingError:v62];
    v41 = v103;
    ((void (**)(void *, void *))v103)[2](v103, v70);

    id v11 = v56;
    v20 = v55;
    v13 = v54;
    id v8 = v53;
    v12 = v101;
    goto LABEL_32;
  }
  v43 = (void *)MEMORY[0x230FBD990]();
  v44 = v15;
  v45 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v46 = v9;
    v47 = v12;
    id v48 = v8;
    v49 = v13;
    v50 = v20;
    v52 = id v51 = v11;
    *(_DWORD *)buf = 138544386;
    v109 = v52;
    __int16 v110 = 2112;
    uint64_t v111 = (uint64_t)v48;
    __int16 v112 = 2160;
    uint64_t v113 = 1752392040;
    __int16 v114 = 2112;
    v115 = v49;
    __int16 v116 = 2112;
    id v117 = v50;
    _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Dropping invalid message, %@, from: %{mask.hash}@, error: %@", buf, 0x34u);

    id v11 = v51;
    v20 = v50;
    v13 = v49;
    id v8 = v48;
    v12 = v47;
    id v9 = v46;
  }

  v41 = v103;
LABEL_32:
}

uint64_t __73__HMDRapportMessageTransport__didReceiveRequest_options_responseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

- (id)_serializeRemoteMessage:(id)a3 withResponseErrorData:(id)a4 serializationError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[HMDRemoteMessageSerialization dictionaryForMessage:v7 isHH2Payload:1 error:a5];
  id v10 = (void *)[v9 mutableCopy];

  if (v10)
  {
    uint64_t v11 = [v7 type];
    if (v8 && v11 == 1) {
      [v10 setObject:v8 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
    }
    v12 = (void *)[v10 copy];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_sendMessage:(id)a3 completionHandler:(id)a4 requestID:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v38 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke;
  aBlock[3] = &unk_264A2EDE0;
  id v10 = v9;
  id v55 = v10;
  id v11 = v8;
  id v54 = v11;
  v12 = _Block_copy(aBlock);
  v13 = [(HMDRapportMessageTransport *)self _IDSIdentifiersForMessage:v11];
  if ([v13 count])
  {
    v14 = [(id)objc_opt_class() remoteMessageFromMessage:v11 secure:1 accountRegistry:0];
    v15 = [v11 userInfo];
    v16 = [v15 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
    id v52 = 0;
    v17 = [(HMDRapportMessageTransport *)self _serializeRemoteMessage:v14 withResponseErrorData:v16 serializationError:&v52];
    id v37 = v52;

    if (v17)
    {
      v18 = objc_opt_new();
      [v11 timeout];
      if (v19 > 0.0)
      {
        v20 = NSNumber;
        [v11 timeout];
        v21 = objc_msgSend(v20, "numberWithDouble:");
        [v18 setObject:v21 forKeyedSubscript:*MEMORY[0x263F62CA0]];
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v51[3] = 0;
      id v57 = 0;
      v22 = [v11 identifier];
      uint64_t v23 = [v11 name];

      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_23;
      v39[3] = &unk_264A249F8;
      v39[4] = self;
      id v40 = 0;
      id v24 = v18;
      id v41 = v24;
      id v42 = v14;
      id v43 = v17;
      id v44 = v38;
      id v25 = v22;
      id v45 = v25;
      id v26 = v23;
      id v46 = v26;
      v49 = buf;
      v50 = v51;
      id v48 = v12;
      id v47 = v13;
      objc_msgSend(v47, "na_each:", v39);

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(buf, 8);

      id v11 = 0;
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      v32 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        v35 = objc_msgSend(v11, "identifier", context);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2112;
        id v57 = v37;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not send message: failed to serialize message %{public}@ with error: %@", buf, 0x20u);
      }
      (*((void (**)(void *, id))v12 + 2))(v12, v37);
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x230FBD990]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      v31 = [v11 identifier];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not send message %{public}@: No valid destinations", buf, 0x16u);
    }
    v14 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Invalid parameter." reason:@"No destinations have a valid IDS DeviceID." suggestion:0];
    (*((void (**)(void *, void *))v12 + 2))(v12, v14);
  }
}

void __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = _Block_copy(*(const void **)(a1 + 40));
  v4 = v3;
  if (v3) {
    (*((void (**)(void *, id))v3 + 2))(v3, v5);
  }

  [*(id *)(a1 + 32) respondWithPayload:0 error:v5];
}

void __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) identifier];
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544386;
    id v37 = v7;
    __int16 v38 = 2114;
    v39 = v8;
    __int16 v40 = 2160;
    uint64_t v41 = 1752392040;
    __int16 v42 = 2112;
    id v43 = v3;
    __int16 v44 = 2114;
    uint64_t v45 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ to IDS DeviceID: %{mask.hash}@, with options: %{public}@", buf, 0x34u);
  }
  id v10 = [*(id *)(a1 + 56) destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    v13 = [v12 devices];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_24;
    v34[3] = &unk_264A249A8;
    v34[4] = *(void *)(a1 + 32);
    id v35 = v3;
    v14 = objc_msgSend(v13, "na_firstObjectPassingTest:", v34);

    if (v14)
    {
      v15 = [*(id *)(a1 + 32) logEventSubmitter];
      v16 = +[HMDRemoteMessageLogEvent sentRemoteMessage:*(void *)(a1 + 56) device:v14 transportType:6];
      [v15 submitLogEvent:v16];
    }
  }
  else
  {
    v17 = [*(id *)(a1 + 32) logEventSubmitter];
    v18 = +[HMDRemoteMessageLogEvent sentRemoteMessage:*(void *)(a1 + 56) transportType:6];
    [v17 submitLogEvent:v18];
  }
  double v19 = [*(id *)(a1 + 32) rapportMessaging];
  v20 = (void *)[*(id *)(a1 + 64) copy];
  uint64_t v21 = *(void *)(a1 + 72);
  v22 = [v3 UUIDString];
  uint64_t v23 = (void *)[*(id *)(a1 + 48) copy];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_2;
  v27[3] = &unk_264A249D0;
  v27[4] = *(void *)(a1 + 32);
  id v28 = *(id *)(a1 + 80);
  id v29 = *(id *)(a1 + 88);
  id v30 = v3;
  uint64_t v33 = *(void *)(a1 + 120);
  long long v26 = *(_OWORD *)(a1 + 104);
  id v24 = (id)v26;
  long long v32 = v26;
  id v31 = *(id *)(a1 + 96);
  id v25 = v3;
  [v19 sendRequest:v20 requestID:v21 destinationID:v22 options:v23 responseHandler:v27];
}

uint64_t __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_24(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _IDSIdentifierForDevice:a2];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 40)];

  return v4;
}

void __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x263F62CA8]);
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = *(id *)(a1 + 32);
  v13 = HMFGetOSLogHandle();
  v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      v17 = *(void **)(a1 + 48);
      uint64_t v18 = *(void *)(a1 + 56);
      int v30 = 138544642;
      id v31 = v15;
      __int16 v32 = 2114;
      uint64_t v33 = v16;
      __int16 v34 = 2112;
      id v35 = v17;
      __int16 v36 = 2112;
      id v37 = v10;
      __int16 v38 = 2112;
      uint64_t v39 = v18;
      __int16 v40 = 2112;
      id v41 = v9;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Message failed over rapport, %{public}@ / %@ with rapport xid %@, to IDS DeviceID: %@ with error: %@", (uint8_t *)&v30, 0x3Eu);
    }
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 80) + 8) + 24), 1uLL);
    unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 88) + 8) + 24), 1uLL);
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = [*(id *)(a1 + 56) UUIDString];
    v22 = [v20 hmInternalErrorWithCode:3204 description:@"Partial communication failure" reason:v21 suggestion:0 underlyingError:v9];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      uint64_t v24 = *(void *)(a1 + 40);
      id v25 = *(void **)(a1 + 56);
      int v30 = 138544130;
      id v31 = v23;
      __int16 v32 = 2114;
      uint64_t v33 = v24;
      __int16 v34 = 2112;
      id v35 = v10;
      __int16 v36 = 2112;
      id v37 = v25;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Message succeeded over rapport, %{public}@ with rapport xid %@, to IDS DeviceID: %@", (uint8_t *)&v30, 0x2Au);
    }
    unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 88) + 8) + 24), 1uLL);
  }
  if (add + 1 == [*(id *)(a1 + 64) count])
  {
    unint64_t v26 = atomic_load((unint64_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
    if (v26 >= [*(id *)(a1 + 64) count])
    {
      v27 = (void *)MEMORY[0x263F087E8];
      id v28 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3203 underlyingError:v9];
      id v29 = [v27 hmErrorWithCode:54 description:@"Communication failure." reason:0 suggestion:0 underlyingError:v28];

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
}

- (void)_sendMessage:(id)a3 completionHandler:(id)a4
{
}

- (void)_setSharedUserIDSIdentifierForDevice:(id)a3 idsIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  if (!v7) {
    goto LABEL_12;
  }
  id v9 = [v6 account];
  int v10 = [v9 isCurrentAccount];

  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  v13 = HMFGetOSLogHandle();
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Not updating IDS device identifier for device because it belongs to the current account: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Setting shared user's IDS device identifier for device: %@", (uint8_t *)&v17, 0x16u);
    }
    [v6 setSharedUserIDSIdentifier:v8];
  }
}

- (id)_IDSIdentifierForDestination:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v5 = v3;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    id v7 = 0;
    if (isKindOfClass)
    {
      id v8 = [v3 device];
      id v9 = [v8 idsIdentifier];
      int v10 = v9;
      if (v9)
      {
        id v7 = v9;
      }
      else
      {
        id v11 = [v3 device];
        id v7 = [v11 sharedUserIDSIdentifier];
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_IDSIdentifiersForMessage:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 destination];
    if (v6)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        id v8 = v6;
      }
      else {
        id v8 = 0;
      }
      id v9 = v8;
      if (isKindOfClass)
      {
        uint64_t v10 = [(HMDRapportMessageTransport *)self _IDSIdentifierForDestination:v6];
        id v11 = (id)v10;
        if (v10)
        {
          v21[0] = v10;
          id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
        }
        else
        {
          id v12 = (void *)MEMORY[0x263EFFA68];
        }
      }
      else
      {
        id v13 = v6;
        objc_opt_class();
        char v14 = objc_opt_isKindOfClass();
        if (v14) {
          v15 = v13;
        }
        else {
          v15 = 0;
        }
        id v11 = v15;

        if (v14)
        {
          uint64_t v16 = [v13 devices];
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __56__HMDRapportMessageTransport__IDSIdentifiersForMessage___block_invoke;
          v18[3] = &unk_264A24980;
          v18[4] = self;
          id v19 = v5;
          id v20 = v13;
          id v12 = objc_msgSend(v16, "na_map:", v18);
        }
        else
        {
          id v12 = 0;
        }
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

id __56__HMDRapportMessageTransport__IDSIdentifiersForMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _IDSIdentifierForDevice:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) identifier];
      uint64_t v12 = *(void *)(a1 + 48);
      int v14 = 138543874;
      v15 = v10;
      __int16 v16 = 2114;
      int v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not send message %{public}@ to destination %{public}@: invalid destination or device does not have an IDS DeviceID", (uint8_t *)&v14, 0x20u);
    }
  }

  return v5;
}

- (id)_IDSIdentifierForDevice:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 idsIdentifier];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v4 sharedUserIDSIdentifier];
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_configureHMMMEnergyRapport
{
  id v3 = [(HMDRapportMessageTransport *)self rapportMessaging];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__HMDRapportMessageTransport__configureHMMMEnergyRapport__block_invoke;
  v8[3] = &unk_264A2F7F8;
  v8[4] = self;
  [v3 configureDiscoveryClientWithCompletion:v8];

  objc_initWeak(&location, self);
  id v4 = [(HMDRapportMessageTransport *)self rapportMessaging];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__HMDRapportMessageTransport__configureHMMMEnergyRapport__block_invoke_2;
  v5[3] = &unk_264A24958;
  objc_copyWeak(&v6, &location);
  [v4 registerHMMMEnergyRequestHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__HMDRapportMessageTransport__configureHMMMEnergyRapport__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startPromise];
  v1 = [MEMORY[0x263F42538] futureWithNoValue];
  [v2 resolveWithFuture:v1];
}

void __57__HMDRapportMessageTransport__configureHMMMEnergyRapport__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _didReceiveRequest:v9 options:v8 responseHandler:v7];
}

- (void)_configureHMMMRapport
{
  id v3 = [(HMDRapportMessageTransport *)self rapportMessaging];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__HMDRapportMessageTransport__configureHMMMRapport__block_invoke;
  v8[3] = &unk_264A2F7F8;
  v8[4] = self;
  [v3 configureDiscoveryClientWithCompletion:v8];

  objc_initWeak(&location, self);
  id v4 = [(HMDRapportMessageTransport *)self rapportMessaging];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__HMDRapportMessageTransport__configureHMMMRapport__block_invoke_2;
  v5[3] = &unk_264A24958;
  objc_copyWeak(&v6, &location);
  [v4 registerHMMMRequestHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__HMDRapportMessageTransport__configureHMMMRapport__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startPromise];
  v1 = [MEMORY[0x263F42538] futureWithNoValue];
  [v2 resolveWithFuture:v1];
}

void __51__HMDRapportMessageTransport__configureHMMMRapport__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _didReceiveRequest:v9 options:v8 responseHandler:v7];
}

- (void)_configureRapport
{
  id v3 = [(HMDRapportMessageTransport *)self rapportMessaging];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__HMDRapportMessageTransport__configureRapport__block_invoke;
  v8[3] = &unk_264A2F7F8;
  v8[4] = self;
  [v3 configureDiscoveryClientWithCompletion:v8];

  objc_initWeak(&location, self);
  id v4 = [(HMDRapportMessageTransport *)self rapportMessaging];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__HMDRapportMessageTransport__configureRapport__block_invoke_2;
  v5[3] = &unk_264A24958;
  objc_copyWeak(&v6, &location);
  [v4 registerRequestHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__HMDRapportMessageTransport__configureRapport__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startPromise];
  v1 = [MEMORY[0x263F42538] futureWithNoValue];
  [v2 resolveWithFuture:v1];
}

void __47__HMDRapportMessageTransport__configureRapport__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _didReceiveRequest:v9 options:v8 responseHandler:v7];
}

- (void)rapportMessaging:(id)a3 idsIdentifier:(id)a4 didAppearReachable:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(HMDRemoteMessageTransport *)self reachabilityDelegate];
  [v8 transport:self idsIdentifier:v7 didAppearReachable:v5];
}

- (void)sendHMMMEnergyMessage:(id)a3 completionHandler:(id)a4
{
}

- (void)sendHMMMMessage:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)isValidMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    BOOL v5 = [v3 destination];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_6;
    }
  }
  unint64_t v7 = ((unint64_t)[v3 restriction] >> 3) & 1;
LABEL_6:

  return v7;
}

- (BOOL)canSendMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDRapportMessageTransport *)self isValidMessage:v4])
  {
    BOOL v5 = [(HMDRapportMessageTransport *)self _IDSIdentifiersForMessage:v4];
    uint64_t v6 = [v5 count];
    BOOL v7 = v6 != 0;
    if (!v6)
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = self;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        uint64_t v12 = [v4 identifier];
        int v14 = 138543618;
        v15 = v11;
        __int16 v16 = 2114;
        int v17 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not sending message %{public}@ because no destination devices have an IDS DeviceID", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)startHMMMEnergy
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting Energy HMMM", (uint8_t *)&v9, 0xCu);
  }
  [(HMDRapportMessageTransport *)v4 _configureHMMMEnergyRapport];
  BOOL v7 = [(HMDRemoteMessageTransport *)v4 startFuture];
  return v7;
}

- (id)startHMMM
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HMMM", (uint8_t *)&v9, 0xCu);
  }
  [(HMDRapportMessageTransport *)v4 _configureHMMMRapport];
  BOOL v7 = [(HMDRemoteMessageTransport *)v4 startFuture];
  return v7;
}

- (id)start
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", (uint8_t *)&v9, 0xCu);
  }
  [(HMDRapportMessageTransport *)v4 _configureRapport];
  BOOL v7 = [(HMDRemoteMessageTransport *)v4 startFuture];
  return v7;
}

- (int)transportType
{
  return 6;
}

- (BOOL)isSecure
{
  return 1;
}

- (HMDRapportMessageTransport)initWithAccountRegistry:(id)a3 rapportMessaging:(id)a4 logEventSubmitter:(id)a5 appleAccountManager:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDRapportMessageTransport;
  int v14 = [(HMDRemoteMessageTransport *)&v17 initWithAccountRegistry:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rapportMessaging, a4);
    objc_storeStrong((id *)&v15->_logEventSubmitter, a5);
    objc_storeStrong((id *)&v15->_appleAccountManager, a6);
  }

  return v15;
}

- (HMDRapportMessageTransport)initWithAccountRegistry:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[HMDRapportMessaging sharedInstance];
  uint64_t v6 = +[HMDMetricsManager sharedLogEventSubmitter];
  BOOL v7 = +[HMDAppleAccountManager sharedManager];
  id v8 = [(HMDRapportMessageTransport *)self initWithAccountRegistry:v4 rapportMessaging:v5 logEventSubmitter:v6 appleAccountManager:v7];

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_186686 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_186686, &__block_literal_global_186687);
  }
  id v2 = (void *)logCategory__hmf_once_v25_186688;
  return v2;
}

void __41__HMDRapportMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v25_186688;
  logCategory__hmf_once_v25_186688 = v0;
}

+ (unint64_t)restriction
{
  return 8;
}

@end