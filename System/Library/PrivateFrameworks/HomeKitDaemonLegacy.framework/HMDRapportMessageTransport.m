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
- (HMMLogEventSubmitting)logEventSubmitter;
- (id)_IDSIdentifierForDestination:(id)a3;
- (id)_IDSIdentifierForDevice:(id)a3;
- (id)_IDSIdentifiersForMessage:(id)a3;
- (id)_rpOptions:(id)a3 stringForKey:(id)a4;
- (id)_serializeRemoteMessage:(id)a3 withResponseErrorData:(id)a4 serializationError:(id *)a5;
- (id)start;
- (int)transportType;
- (void)_configureRapport;
- (void)_didReceiveRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_sendMessage:(id)a3 completionHandler:(id)a4;
- (void)_sendMessage:(id)a3 completionHandler:(id)a4 requestID:(id)a5;
- (void)_setSharedUserIDSIdentifierForDevice:(id)a3 idsIdentifier:(id)a4;
- (void)rapportMessaging:(id)a3 idsIdentifier:(id)a4 didAppearReachable:(BOOL)a5;
@end

@implementation HMDRapportMessageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_rapportMessaging, 0);
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
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__HMDRapportMessageTransport__didReceiveRequest_options_responseHandler___block_invoke;
  aBlock[3] = &unk_1E6A19358;
  id v11 = v10;
  id v102 = v11;
  v98 = (void (**)(void *, void))_Block_copy(aBlock);
  v99 = v9;
  v12 = [(HMDRapportMessageTransport *)self _rpOptions:v9 stringForKey:*MEMORY[0x1E4F947A8]];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
  v14 = (void *)MEMORY[0x1D9452090]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    v104 = v17;
    __int16 v105 = 2112;
    uint64_t v106 = (uint64_t)v8;
    __int16 v107 = 2160;
    uint64_t v108 = 1752392040;
    __int16 v109 = 2112;
    v110 = v13;
    __int16 v111 = 2112;
    id v112 = v9;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Received message: %@, from: %{mask.hash}@, with options: %@", buf, 0x34u);
  }
  id v100 = 0;
  v18 = +[HMDRemoteMessageSerialization remoteMessageWithDictionary:v8 error:&v100];
  id v19 = v100;
  v20 = v19;
  if (v18)
  {
    if (v12)
    {
      if (v13)
      {
        uint64_t v94 = [(HMDRapportMessageTransport *)v15 _rpOptions:v9 stringForKey:*MEMORY[0x1E4F94798]];
        if (v94)
        {
          id v95 = v11;
          v21 = [(HMDRemoteMessageTransport *)v15 accountRegistry];
          v22 = [v21 deviceForIDSIdentifier:v13];

          v93 = v22;
          if (v22)
          {
            uint64_t v23 = [v22 remoteDestinationString];
            uint64_t v92 = v23;
            if (v23)
            {
              uint64_t v24 = v23;
              v91 = v20;
              v98[2](v98, 0);
              v25 = [v18 userInfo];
              v26 = (void *)[v25 mutableCopy];

              [v26 setObject:v24 forKeyedSubscript:@"kIDSMessageSourceIDKey"];
              v27 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDRapportMessageTransport transportType](v15, "transportType"));
              [v26 setObject:v27 forKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];

              v28 = objc_msgSend(v8, "hmf_dataForKey:", @"kIDSMessageResponseErrorDataKey");
              [v26 setObject:v28 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

              v29 = [v18 internal];
              [v29 setUserInfo:v26];

              v30 = [HMDRemoteDeviceMessageDestination alloc];
              v31 = [v18 destination];
              v32 = [v31 target];
              v33 = [(HMDRemoteDeviceMessageDestination *)v30 initWithTarget:v32 device:v22];

              [v18 setDestination:v33];
              objc_msgSend(v18, "setRestriction:", objc_msgSend((id)objc_opt_class(), "restriction"));
              objc_msgSend(v18, "setSecure:", -[HMDRapportMessageTransport isSecure](v15, "isSecure"));
              v90 = +[HMDDeviceHandle deviceHandleForDeviceIdentifier:v13];
              v34 = (void *)v94;
              v35 = [[HMDRemoteMessageSenderContext alloc] initWithDeviceHandle:v90 accountHandle:0 accountIdentifier:0 deviceVersion:0 pairingIdentityIdentifier:v94];
              [v18 setSenderContext:v35];

              v36 = [(HMDRapportMessageTransport *)v15 logEventSubmitter];
              v37 = +[HMDRemoteMessageLogEvent receivedRemoteMessage:v18 transportType:6];
              [v36 submitLogEvent:v37];

              v38 = v26;
              v39 = [(HMFMessageTransport *)v15 delegate];
              v40 = v15;
              v41 = v98;
              v20 = v91;
              [v39 messageTransport:v40 didReceiveMessage:v18];
            }
            else
            {
              v85 = (void *)MEMORY[0x1D9452090]();
              v86 = v15;
              v87 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
              {
                v88 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v104 = v88;
                __int16 v105 = 2112;
                uint64_t v106 = (uint64_t)v18;
                _os_log_impl(&dword_1D49D5000, v87, OS_LOG_TYPE_ERROR, "%{public}@Could not find remote destination for incoming message: %@", buf, 0x16u);
              }
              v89 = (void *)MEMORY[0x1E4F28C58];
              v38 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3210];
              v33 = [v89 hmErrorWithCode:2 description:0 reason:0 suggestion:0 underlyingError:v38];
              v41 = v98;
              ((void (**)(void *, HMDRemoteDeviceMessageDestination *))v98)[2](v98, v33);
              v34 = (void *)v94;
            }

            id v11 = v95;
          }
          else
          {
            v80 = (void *)MEMORY[0x1D9452090]();
            v81 = v15;
            v82 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              v83 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138544130;
              v104 = v83;
              __int16 v105 = 2160;
              uint64_t v106 = 1752392040;
              __int16 v107 = 2112;
              uint64_t v108 = (uint64_t)v12;
              __int16 v109 = 2112;
              v110 = v18;
              _os_log_impl(&dword_1D49D5000, v82, OS_LOG_TYPE_ERROR, "%{public}@Could not find source device for sender IDS DeviceID: %{mask.hash}@ message: %@", buf, 0x2Au);
            }
            v84 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v92 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3209];
            v38 = objc_msgSend(v84, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, 0, 0, 0);
            v41 = v98;
            ((void (**)(void *, void *))v98)[2](v98, v38);
            v34 = (void *)v94;
            id v11 = v95;
          }

          v79 = (void *)v92;
          v78 = v93;
        }
        else
        {
          v97 = v12;
          id v69 = v8;
          v70 = v13;
          v71 = v20;
          id v72 = v11;
          v73 = (void *)MEMORY[0x1D9452090]();
          v74 = v15;
          v75 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            v76 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v104 = v76;
            __int16 v105 = 2112;
            uint64_t v106 = (uint64_t)v18;
            __int16 v107 = 2112;
            uint64_t v108 = (uint64_t)v9;
            _os_log_impl(&dword_1D49D5000, v75, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because pairing identity identifier is missing in options: %@", buf, 0x20u);
          }
          v77 = (void *)MEMORY[0x1E4F28C58];
          v78 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3208];
          v79 = [v77 hmErrorWithCode:2 description:0 reason:0 suggestion:0 underlyingError:v78];
          v41 = v98;
          ((void (**)(void *, void *))v98)[2](v98, v79);
          id v11 = v72;
          v20 = v71;
          v13 = v70;
          id v8 = v69;
          v34 = 0;
          v12 = v97;
        }

        goto LABEL_32;
      }
      v96 = v12;
      id v51 = v8;
      v52 = 0;
      id v53 = v19;
      id v54 = v11;
      v63 = (void *)MEMORY[0x1D9452090]();
      v64 = v15;
      v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v104 = v66;
        __int16 v105 = 2112;
        uint64_t v106 = (uint64_t)v18;
        __int16 v107 = 2112;
        uint64_t v108 = (uint64_t)v9;
        _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because IDS Device ID is an invalid UUID in options: %@", buf, 0x20u);
      }
      v67 = (void *)MEMORY[0x1E4F28C58];
      v60 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3207];
      v61 = v67;
      uint64_t v62 = -1;
    }
    else
    {
      v96 = 0;
      id v51 = v8;
      v52 = v13;
      id v53 = v19;
      id v54 = v11;
      v55 = (void *)MEMORY[0x1D9452090]();
      v56 = v15;
      v57 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v58 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v104 = v58;
        __int16 v105 = 2112;
        uint64_t v106 = (uint64_t)v18;
        __int16 v107 = 2112;
        uint64_t v108 = (uint64_t)v9;
        _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because IDS Device ID is missing in options: %@", buf, 0x20u);
      }
      v59 = (void *)MEMORY[0x1E4F28C58];
      v60 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3206];
      v61 = v59;
      uint64_t v62 = 2;
    }
    v68 = [v61 hmErrorWithCode:v62 description:0 reason:0 suggestion:0 underlyingError:v60];
    v41 = v98;
    ((void (**)(void *, void *))v98)[2](v98, v68);

    id v11 = v54;
    v20 = v53;
    v13 = v52;
    id v8 = v51;
    v12 = v96;
    goto LABEL_32;
  }
  v42 = (void *)MEMORY[0x1D9452090]();
  v43 = v15;
  v44 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v45 = v12;
    id v46 = v8;
    v47 = v13;
    v48 = v20;
    v50 = id v49 = v11;
    *(_DWORD *)buf = 138544386;
    v104 = v50;
    __int16 v105 = 2112;
    uint64_t v106 = (uint64_t)v46;
    __int16 v107 = 2160;
    uint64_t v108 = 1752392040;
    __int16 v109 = 2112;
    v110 = v47;
    __int16 v111 = 2112;
    id v112 = v48;
    _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Dropping invalid message, %@, from: %{mask.hash}@, error: %@", buf, 0x34u);

    id v11 = v49;
    v20 = v48;
    v13 = v47;
    id v8 = v46;
    v12 = v45;
  }

  v41 = v98;
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
  id v9 = +[HMDRemoteMessageSerialization dictionaryForMessage:v7 error:a5];
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
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v38 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke;
  aBlock[3] = &unk_1E6A17D78;
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
        [v18 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F947C0]];
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

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_21;
      v39[3] = &unk_1E6A11338;
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
      id v49 = buf;
      v50 = v51;
      id v47 = v13;
      id v48 = v12;
      objc_msgSend(v47, "na_each:", v39);

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(buf, 8);

      id v11 = 0;
    }
    else
    {
      context = (void *)MEMORY[0x1D9452090]();
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
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not send message: failed to serialize message %{public}@ with error: %@", buf, 0x20u);
      }
      (*((void (**)(void *, id))v12 + 2))(v12, v37);
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not send message %{public}@: No valid destinations", buf, 0x16u);
    }
    v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Invalid parameter." reason:@"No destinations have a valid IDS DeviceID." suggestion:0];
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

void __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) identifier];
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544386;
    id v26 = v7;
    __int16 v27 = 2114;
    v28 = v8;
    __int16 v29 = 2160;
    uint64_t v30 = 1752392040;
    __int16 v31 = 2112;
    id v32 = v3;
    __int16 v33 = 2114;
    uint64_t v34 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ to IDS DeviceID: %{mask.hash}@, with options: %{public}@", buf, 0x34u);
  }
  id v10 = [*(id *)(a1 + 32) logEventSubmitter];
  id v11 = +[HMDRemoteMessageLogEvent sentRemoteMessage:*(void *)(a1 + 56) transportType:6];
  [v10 submitLogEvent:v11];

  v12 = [*(id *)(a1 + 32) rapportMessaging];
  v13 = (void *)[*(id *)(a1 + 64) copy];
  uint64_t v14 = *(void *)(a1 + 72);
  v15 = [v3 UUIDString];
  v16 = (void *)[*(id *)(a1 + 48) copy];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_23;
  v18[3] = &unk_1E6A11310;
  v18[4] = *(void *)(a1 + 32);
  id v19 = *(id *)(a1 + 80);
  id v20 = *(id *)(a1 + 88);
  id v21 = v3;
  long long v24 = *(_OWORD *)(a1 + 112);
  id v22 = *(id *)(a1 + 96);
  id v23 = *(id *)(a1 + 104);
  id v17 = v3;
  [v12 sendRequest:v13 requestID:v14 destinationID:v15 options:v16 responseHandler:v18];
}

void __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_23(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x1E4F947C8]);
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = *(id *)(a1 + 32);
  v13 = HMFGetOSLogHandle();
  uint64_t v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = *(void **)(a1 + 48);
      uint64_t v18 = *(void *)(a1 + 56);
      int v27 = 138544642;
      v28 = v15;
      __int16 v29 = 2114;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      id v32 = v17;
      __int16 v33 = 2112;
      uint64_t v34 = v10;
      __int16 v35 = 2112;
      uint64_t v36 = v18;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Message failed over rapport, %{public}@ / %@ with rapport xid %@, to IDS DeviceID: %@ with error: %@", (uint8_t *)&v27, 0x3Eu);
    }
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 80) + 8) + 24), 1uLL);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = *(void *)(a1 + 40);
      id v21 = *(void **)(a1 + 56);
      int v27 = 138544130;
      v28 = v19;
      __int16 v29 = 2114;
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      id v32 = v10;
      __int16 v33 = 2112;
      uint64_t v34 = v21;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Message succeeded over rapport, %{public}@ with rapport xid %@, to IDS DeviceID: %@", (uint8_t *)&v27, 0x2Au);
    }
  }
  unint64_t v22 = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 88) + 8) + 24), 1uLL) + 1;
  if (v22 == [*(id *)(a1 + 64) count])
  {
    unint64_t v23 = atomic_load((unint64_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
    if (v23 >= [*(id *)(a1 + 64) count])
    {
      long long v24 = (void *)MEMORY[0x1E4F28C58];
      id v25 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3203 underlyingError:v9];
      id v26 = [v24 hmErrorWithCode:54 description:@"Communication failure." reason:0 suggestion:0 underlyingError:v25];

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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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

  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  v13 = HMFGetOSLogHandle();
  uint64_t v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Not updating IDS device identifier for device because it belongs to the current account: %@", (uint8_t *)&v17, 0x16u);
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
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Setting shared user's IDS device identifier for device: %@", (uint8_t *)&v17, 0x16u);
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
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = [a3 destination];
    if (v4)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        id v6 = v4;
      }
      else {
        id v6 = 0;
      }
      id v7 = v6;
      id v8 = 0;
      if (isKindOfClass)
      {
        uint64_t v9 = [(HMDRapportMessageTransport *)self _IDSIdentifierForDestination:v4];
        int v10 = (void *)v9;
        if (v9)
        {
          v12[0] = v9;
          id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        }
        else
        {
          id v8 = (void *)MEMORY[0x1E4F1CBF0];
        }
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_IDSIdentifierForDevice:(id)a3
{
  id v3 = a3;
  v4 = v3;
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

- (void)_configureRapport
{
  id v3 = [(HMDRapportMessageTransport *)self rapportMessaging];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__HMDRapportMessageTransport__configureRapport__block_invoke;
  v8[3] = &unk_1E6A19B30;
  v8[4] = self;
  [v3 configureDiscoveryClientWithCompletion:v8];

  objc_initWeak(&location, self);
  v4 = [(HMDRapportMessageTransport *)self rapportMessaging];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__HMDRapportMessageTransport__configureRapport__block_invoke_2;
  v5[3] = &unk_1E6A13EB0;
  objc_copyWeak(&v6, &location);
  [v4 registerRequestHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__HMDRapportMessageTransport__configureRapport__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startPromise];
  v1 = [MEMORY[0x1E4F65438] futureWithNoValue];
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

- (BOOL)isValidMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 destination];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    unint64_t v6 = ((unint64_t)[v3 restriction] >> 3) & 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)canSendMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDRapportMessageTransport *)self isValidMessage:v4])
  {
    BOOL v5 = [(HMDRapportMessageTransport *)self _IDSIdentifiersForMessage:v4];
    uint64_t v6 = [v5 count];
    BOOL v7 = v6 != 0;
    if (!v6)
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = self;
      int v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        id v12 = [v4 identifier];
        int v14 = 138543618;
        v15 = v11;
        __int16 v16 = 2114;
        int v17 = v12;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Not sending message %{public}@ because no destination devices have an IDS DeviceID", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)start
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", (uint8_t *)&v9, 0xCu);
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
  if (logCategory__hmf_once_t19_130318 != -1) {
    dispatch_once(&logCategory__hmf_once_t19_130318, &__block_literal_global_130319);
  }
  id v2 = (void *)logCategory__hmf_once_v20_130320;
  return v2;
}

uint64_t __41__HMDRapportMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v20_130320;
  logCategory__hmf_once_v20_130320 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (unint64_t)restriction
{
  return 8;
}

@end