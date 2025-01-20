@interface HMDModernRemoteMessageTransport
+ (NSString)requestStartTimeHeaderKey;
+ (NSString)timeToLiveHeaderKey;
+ (id)logCategory;
- (BOOL)_sendOverRemainingTransportForContext:(void *)a1;
- (BOOL)canSendMessage:(id)a3;
- (BOOL)isHMModernMessagingEnergyInstance;
- (BOOL)isHMModernMessagingInstance;
- (BOOL)isRapportLinkSlow;
- (BOOL)isSecure;
- (BOOL)isStarted;
- (BOOL)isWatch;
- (HMDDateProvider)idsDateProvider;
- (HMDDateProvider)systemDateProvider;
- (HMDDeviceResidencyProvider)residencyProvider;
- (HMDModernRemoteMessageTransport)initWithAccountRegistry:(id)a3;
- (HMDModernRemoteMessageTransport)initWithAccountRegistry:(id)a3 rapportTransport:(id)a4 idsTransport:(id)a5;
- (HMDModernRemoteMessageTransport)initWithAccountRegistry:(id)a3 rapportTransport:(id)a4 idsTransport:(id)a5 contextManager:(id)a6 systemDateProvider:(id)a7 idsDateProvider:(id)a8 timerProvider:(id)a9 isWatch:(BOOL)a10;
- (HMDModernTransportMessageContextManager)contextManager;
- (HMDRemoteMessageTransport)idsTransport;
- (HMDRemoteMessageTransport)rapportTransport;
- (HMDTimerProvider)timerProvider;
- (NSMutableOrderedSet)messageIDDedupeBuffer;
- (OS_dispatch_queue)workQueue;
- (__CFString)_transportToString:(void *)a1;
- (id)start;
- (id)startHMMM;
- (id)startHMMMEnergy;
- (int64_t)qualityOfService;
- (uint64_t)_contextUsesAllTransports:(void *)a1;
- (void)_deviceReachabilityForContext:(uint64_t)a3 isReachable:;
- (void)_handleCompletionOnTransport:(void *)a3 context:(void *)a4 error:;
- (void)_notifyDeviceReachabilityForDestination:(uint64_t)a3 isReachable:;
- (void)_receivedMessage:(void *)a3 onTransport:;
- (void)_respondWithError:(void *)a3 completionHandler:(void *)a4 error:;
- (void)_sendMessageOverIDS:(void *)a1;
- (void)configureWithHomeMembershipVerifier:(id)a3;
- (void)configureWithRemoteMessageListener:(id)a3;
- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setIsHMModernMessagingEnergyInstance:(BOOL)a3;
- (void)setIsHMModernMessagingInstance:(BOOL)a3;
- (void)setRapportLinkSlow:(BOOL)a3;
- (void)setResidencyProvider:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)transport:(id)a3 idsIdentifier:(id)a4 didAppearReachable:(BOOL)a5;
@end

@implementation HMDModernRemoteMessageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIDDedupeBuffer, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_idsDateProvider, 0);
  objc_storeStrong((id *)&self->_systemDateProvider, 0);
  objc_storeStrong((id *)&self->_contextManager, 0);
  objc_storeStrong((id *)&self->_idsTransport, 0);
  objc_storeStrong((id *)&self->_rapportTransport, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_residencyProvider);
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (void)setRapportLinkSlow:(BOOL)a3
{
  self->_rapportLinkSlow = a3;
}

- (BOOL)isRapportLinkSlow
{
  return self->_rapportLinkSlow;
}

- (NSMutableOrderedSet)messageIDDedupeBuffer
{
  return self->_messageIDDedupeBuffer;
}

- (HMDTimerProvider)timerProvider
{
  return self->_timerProvider;
}

- (HMDDateProvider)idsDateProvider
{
  return self->_idsDateProvider;
}

- (HMDDateProvider)systemDateProvider
{
  return self->_systemDateProvider;
}

- (HMDModernTransportMessageContextManager)contextManager
{
  return self->_contextManager;
}

- (HMDRemoteMessageTransport)idsTransport
{
  return self->_idsTransport;
}

- (HMDRemoteMessageTransport)rapportTransport
{
  return self->_rapportTransport;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setResidencyProvider:(id)a3
{
}

- (HMDDeviceResidencyProvider)residencyProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_residencyProvider);
  return (HMDDeviceResidencyProvider *)WeakRetained;
}

- (void)setIsHMModernMessagingEnergyInstance:(BOOL)a3
{
  self->_isHMModernMessagingEnergyInstance = a3;
}

- (BOOL)isHMModernMessagingEnergyInstance
{
  return self->_isHMModernMessagingEnergyInstance;
}

- (void)setIsHMModernMessagingInstance:(BOOL)a3
{
  self->_isHMModernMessagingInstance = a3;
}

- (BOOL)isHMModernMessagingInstance
{
  return self->_isHMModernMessagingInstance;
}

- (void)configureWithRemoteMessageListener:(id)a3
{
  id v7 = a3;
  v4 = self->_rapportTransport;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  v6 = v5;

  if (v6) {
    [(HMDRemoteMessageTransport *)v6 setRemoteMessageListener:v7];
  }
}

- (void)configureWithHomeMembershipVerifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDModernRemoteMessageTransport;
  id v4 = a3;
  [(HMDRemoteMessageTransport *)&v5 configureWithHomeMembershipVerifier:v4];
  -[HMDRemoteMessageTransport configureWithHomeMembershipVerifier:](self->_rapportTransport, "configureWithHomeMembershipVerifier:", v4, v5.receiver, v5.super_class);
  [(HMDRemoteMessageTransport *)self->_idsTransport configureWithHomeMembershipVerifier:v4];
}

- (void)transport:(id)a3 idsIdentifier:(id)a4 didAppearReachable:(BOOL)a5
{
  if (a5)
  {
    id v6 = a4;
    id v7 = [(HMDRemoteMessageTransport *)self reachabilityDelegate];
    [v7 transport:self idsIdentifier:v6 didAppearReachable:1];
  }
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDModernRemoteMessageTransport *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMDModernRemoteMessageTransport_messageTransport_didReceiveMessage___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __70__HMDModernRemoteMessageTransport_messageTransport_didReceiveMessage___block_invoke(void **a1)
{
}

- (void)_receivedMessage:(void *)a3 onTransport:
{
  uint64_t v183 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 workQueue];
    dispatch_assert_queue_V2(v7);

    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    v175 = v10;
    if (!v10)
    {
      v160 = (void *)MEMORY[0x230FBD990]();
      id v161 = a1;
      v162 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v162, OS_LOG_TYPE_FAULT))
      {
        v163 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v163;
        _os_log_impl(&dword_22F52A000, v162, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Received message that is not HMDRemoteMessage.", buf, 0xCu);
      }
      v11 = [[HMDAssertionLogEvent alloc] initWithReason:@"Received message that is not HMDRemoteMessage."];
      id v12 = +[HMDMetricsManager sharedLogEventSubmitter];
      [(HMDAssertionLogEvent *)v12 submitLogEvent:v11];
      goto LABEL_50;
    }
    v11 = (HMDAssertionLogEvent *)v8;
    id v12 = (HMDAssertionLogEvent *)v6;
    id v13 = [(HMDAssertionLogEvent *)v11 headers];
    v14 = [(id)objc_opt_class() timeToLiveHeaderKey];
    v15 = objc_msgSend(v13, "hmf_numberForKey:", v14);
    [v15 doubleValue];
    v17 = v16;

    if (*(double *)&v17 >= 2.22044605e-16)
    {
      v18 = [(id)objc_opt_class() requestStartTimeHeaderKey];
      v19 = objc_msgSend(v13, "hmf_numberForKey:", v18);
      [v19 doubleValue];
      double v21 = v20;

      v22 = [a1 idsDateProvider];
      [v22 timeIntervalSince1970];
      double v24 = v23;

      double v25 = vabdd_f64(v24, v21);
      if (v25 >= *(double *)&v17)
      {
        v26 = [a1 systemDateProvider];
        [v26 timeIntervalSince1970];
        double v28 = v27;

        if (vabdd_f64(v28, v21) >= *(double *)&v17)
        {
          v29 = (void *)MEMORY[0x230FBD990]();
          id v30 = a1;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v32 = id v172 = v5;
            [(HMDAssertionLogEvent *)v11 identifier];
            v34 = id v33 = v6;
            -[HMDModernRemoteMessageTransport _transportToString:](v30, v12);
            v35 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138545410;
            *(void *)&buf[4] = v32;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v34;
            *(_WORD *)&buf[22] = 2114;
            v178 = v35;
            *(_WORD *)v179 = 2050;
            *(double *)&v179[2] = v24;
            *(_WORD *)&v179[10] = 2050;
            *(double *)&v179[12] = v28;
            *(_WORD *)&v179[20] = 2050;
            *(double *)&v179[22] = v21;
            *(_WORD *)&v179[30] = 2050;
            id v180 = v17;
            __int16 v181 = 2050;
            *(double *)v182 = v25;
            *(_WORD *)&v182[8] = 2050;
            *(double *)&v182[10] = v24 - v28;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message %{public}@ received on %{public}@ outside its TTL: IDS time now = %{public}f, system time now = %{public}f, sent = %{public}f, ttl = %{public}f, IDS time delta = %{public}f, drift = %{public}f", buf, 0x5Cu);

            id v6 = v33;
            id v5 = v172;
          }

          goto LABEL_50;
        }
      }
    }

    uint64_t v36 = [(HMDAssertionLogEvent *)v11 identifier];
    if (!v36)
    {
      id v49 = v6;
      v50 = (void *)MEMORY[0x230FBD990]();
      id v51 = a1;
      v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        v53 = HMFGetLogIdentifier();
        v54 = -[HMDModernRemoteMessageTransport _transportToString:](v51, v12);
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v54;
        *(_WORD *)&buf[22] = 2112;
        v178 = v11;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Received invalid %@ message %@, No Identifier", buf, 0x20u);
      }
      v55 = [HMDAssertionLogEvent alloc];
      v56 = -[HMDModernRemoteMessageTransport _transportToString:](v51, v12);
      id v12 = [(HMDAssertionLogEvent *)v55 initWithReason:@"Received invalid %@ message %@, No Identifier", v56, v11];

      v57 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v57 submitLogEvent:v12];

      v11 = 0;
      id v6 = v49;
      goto LABEL_50;
    }
    v37 = (HMDAssertionLogEvent *)v36;
    id v174 = v6;
    v38 = [(HMDAssertionLogEvent *)v11 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v39 = v38;
    }
    else {
      v39 = 0;
    }
    v40 = v39;

    v41 = [(HMDAssertionLogEvent *)v40 device];
    int v42 = [v41 isCurrentDevice];

    if (v42)
    {
      v43 = v40;
      v44 = (void *)MEMORY[0x230FBD990]();
      id v45 = a1;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        v47 = HMFGetLogIdentifier();
        v48 = -[HMDModernRemoteMessageTransport _transportToString:](v45, v12);
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v48;
        *(_WORD *)&buf[22] = 2112;
        v178 = v11;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_FAULT, "%{public}@Received invalid %{public}@ message %@, message is from ourselves", buf, 0x20u);
      }
      id v12 = v43;
      v11 = v37;
      goto LABEL_49;
    }
    v58 = v37;
    v59 = [a1 messageIDDedupeBuffer];
    int v60 = [v59 containsObject:v58];

    if ((v60 & 1) == 0)
    {
      v61 = [a1 messageIDDedupeBuffer];
      unint64_t v62 = [v61 count];

      if (v62 >= 0x64)
      {
        v63 = [a1 messageIDDedupeBuffer];
        [v63 removeObjectAtIndex:0];
      }
      v64 = [a1 messageIDDedupeBuffer];
      [v64 addObject:v58];
    }
    id v173 = v5;

    v65 = (void *)MEMORY[0x230FBD990]();
    id v66 = a1;
    v67 = HMFGetOSLogHandle();
    v68 = v67;
    if (v60)
    {
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        v69 = HMFGetLogIdentifier();
        v70 = [(HMDAssertionLogEvent *)v11 identifier];
        -[HMDModernRemoteMessageTransport _transportToString:](v66, v12);
        v71 = v58;
        v72 = v40;
        v73 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v69;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v70;
        *(_WORD *)&buf[22] = 2114;
        v178 = v73;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Dropping duplicate message %{public}@ received on %{public}@", buf, 0x20u);

        v40 = v72;
        v58 = v71;
      }
    }
    else
    {
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v74 = HMFGetLogIdentifier();
        v75 = -[HMDModernRemoteMessageTransport _transportToString:](v66, v12);
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v75;
        *(_WORD *)&buf[22] = 2112;
        v178 = v11;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@Received message over %{public}@: %@", buf, 0x20u);
      }
      v76 = (void *)MEMORY[0x230FBD990]();
      id v77 = v66;
      v78 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        v79 = HMFGetLogIdentifier();
        v80 = [(HMDAssertionLogEvent *)v11 shortDescription];
        [(HMDAssertionLogEvent *)v11 messagePayload];
        v81 = v58;
        v82 = v40;
        v83 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        *(void *)&buf[4] = v79;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v80;
        *(_WORD *)&buf[22] = 2113;
        v178 = v83;
        _os_log_impl(&dword_22F52A000, v78, OS_LOG_TYPE_DEBUG, "%{public}@Received message %{public}@ with payload: %{private}@", buf, 0x20u);

        v40 = v82;
        v58 = v81;
      }
      v84 = [v175 destination];
      -[HMDModernRemoteMessageTransport _notifyDeviceReachabilityForDestination:isReachable:](v77, v84, 1);

      if (![v175 type])
      {
        id v103 = v175;
        v104 = [v103 name];
        v105 = [v103 identifier];
        v106 = [v103 destination];
        [v103 transactionIdentifier];
        v107 = v170 = v40;
        v108 = [v103 toID];
        uint64_t v109 = [v103 qualityOfService];
        uint64_t v110 = [v103 responseRestriction];

        objc_initWeak(&location, v77);
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __69__HMDModernRemoteMessageTransport__responseHandlerForRequestMessage___block_invoke;
        v178 = (HMDAssertionLogEvent *)&unk_264A23F28;
        objc_copyWeak((id *)&v181, &location);
        *(void *)v179 = v104;
        *(void *)&v179[8] = v106;
        *(void *)&v182[6] = v109;
        *(void *)&v182[14] = v110;
        *(void *)&v179[16] = v107;
        *(void *)&v179[24] = v108;
        id v180 = v105;
        id v111 = v105;
        id v112 = v108;
        id v113 = v107;
        id v114 = v106;
        id v115 = v104;
        v116 = _Block_copy(buf);

        objc_destroyWeak((id *)&v181);
        objc_destroyWeak(&location);
        [v103 setInternalResponseHandler:v116];

        v117 = [v77 delegate];
        [v117 messageTransport:v77 didReceiveMessage:v103];

        id v12 = v170;
LABEL_48:
        v11 = v58;
        id v5 = v173;
LABEL_49:
        id v6 = v174;
LABEL_50:

        goto LABEL_51;
      }
      if ([v175 type] == 1)
      {
        v171 = v77;
        id v85 = v175;
        v86 = v12;
        v87 = [v85 transactionIdentifier];
        id v5 = v173;
        v169 = v40;
        if (v87)
        {
          v88 = [v171 contextManager];
          v89 = [v88 contextForIdentifier:v87];

          v168 = v89;
          if (v89)
          {
            id v165 = v85;
            v166 = v58;
            id v90 = v85;
            v91 = [v90 userInfo];
            v92 = [v91 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

            v167 = v86;
            if (v92)
            {
              v93 = v87;
              v94 = (void *)MEMORY[0x263F08928];
              v95 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
              id location = 0;
              v96 = [v94 _strictlyUnarchivedObjectOfClasses:v95 fromData:v92 error:&location];
              v97 = (HMDAssertionLogEvent *)location;

              if (!v96)
              {
                v98 = (void *)MEMORY[0x230FBD990]();
                id v99 = v171;
                v100 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                {
                  v101 = HMFGetLogIdentifier();
                  v102 = [v90 identifier];
                  *(_DWORD *)buf = 138543874;
                  *(void *)&buf[4] = v101;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v102;
                  *(_WORD *)&buf[22] = 2112;
                  v178 = v97;
                  _os_log_impl(&dword_22F52A000, v100, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize response error for message %{public}@ with error: %@", buf, 0x20u);
                }
                v96 = [MEMORY[0x263F087E8] hmErrorWithCode:52 description:@"Generic error." reason:@"Failed to deserialize remote error." suggestion:0 underlyingError:v97];
                v89 = v168;
              }

              v87 = v93;
            }
            else
            {
              v96 = 0;
            }

            v130 = (HMDAssertionLogEvent *)v90;
            v131 = v96;
            id v132 = v89;
            if ([(HMDAssertionLogEvent *)v131 isHMFError]
              && [(HMDAssertionLogEvent *)v131 code] == 14
              && ([v132 destination],
                  v133 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  char isKindOfClass = objc_opt_isKindOfClass(),
                  v133,
                  (isKindOfClass & 1) != 0)
              && v133)
            {
              v135 = (void *)MEMORY[0x230FBD990]();
              id v136 = v171;
              v137 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
              {
                v138 = HMFGetLogIdentifier();
                [(HMDAssertionLogEvent *)v130 identifier];
                v140 = v139 = v87;
                v141 = [v132 messageID];
                *(_DWORD *)buf = 138544130;
                *(void *)&buf[4] = v138;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v140;
                *(_WORD *)&buf[22] = 2112;
                v178 = v131;
                *(_WORD *)v179 = 2114;
                *(void *)&v179[2] = v141;
                _os_log_impl(&dword_22F52A000, v137, OS_LOG_TYPE_INFO, "%{public}@Ignoring response message %{public}@ with error: %@, for request %{public}@", buf, 0x2Au);

                v87 = v139;
              }

              v142 = v131;
            }
            else
            {
              v164 = v87;

              v143 = v167;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v144 = v143;
              }
              else {
                v144 = 0;
              }
              v145 = v144;

              v146 = v145;
              v147 = (void *)MEMORY[0x230FBD990]([v132 receivedResponseOverTransport:v145 withError:v131]);
              id v148 = v171;
              v149 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
              {
                v150 = HMFGetLogIdentifier();
                v151 = [v132 messageID];
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v150;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v151;
                _os_log_impl(&dword_22F52A000, v149, OS_LOG_TYPE_DEFAULT, "%{public}@Received response for message %{public}@", buf, 0x16u);
              }
              v152 = (void *)MEMORY[0x263EFF9A0];
              v153 = [(HMDAssertionLogEvent *)v130 messagePayload];
              v142 = [v152 dictionaryWithDictionary:v153];

              v154 = [(HMDAssertionLogEvent *)v130 userInfo];
              v155 = [v154 objectForKeyedSubscript:@"kIDSMessageSourceIDKey"];
              [v142 setObject:v155 forKeyedSubscript:@"kIDSMessageSourceIDKey"];

              [v142 setObject:v131 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
              v156 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDAssertionLogEvent transportType](v146, "transportType"));
              [v142 setObject:v156 forKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];

              [v142 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kRemoteMessageIsModernTransportUsedKey"];
              v157 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v148, "isRapportLinkSlow"));
              [v142 setObject:v157 forKeyedSubscript:@"kRemoteMessageIsRapportLinkSlowKey"];

              v158 = [v148 contextManager];
              v159 = [v132 options];
              objc_msgSend(v158, "completeContext:withPayload:error:isFinal:", v132, v142, v131, objc_msgSend(v159, "expectsMultipleResponses") ^ 1);

              id v132 = v158;
              v130 = v146;
              v87 = v164;
            }

            id v5 = v173;
            id v6 = v174;
            id v12 = v169;
            id v85 = v165;
            v58 = v166;
            v86 = v167;
          }
          else
          {
            v124 = (void *)MEMORY[0x230FBD990]();
            id v125 = v171;
            v126 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
            {
              v127 = HMFGetLogIdentifier();
              [v85 identifier];
              v129 = v128 = v87;
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v127;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v129;
              _os_log_impl(&dword_22F52A000, v126, OS_LOG_TYPE_INFO, "%{public}@Could not find the context and dropping message %{public}@", buf, 0x16u);

              v87 = v128;
            }

            id v6 = v174;
            id v12 = v169;
          }
        }
        else
        {
          v119 = (void *)MEMORY[0x230FBD990]();
          id v120 = v171;
          v121 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
          {
            v122 = HMFGetLogIdentifier();
            v123 = [v85 identifier];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v122;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v123;
            _os_log_impl(&dword_22F52A000, v121, OS_LOG_TYPE_ERROR, "%{public}@Received a response message %{public}@ without a transaction identifier", buf, 0x16u);

            v87 = 0;
          }

          id v6 = v174;
          id v12 = v169;
        }

        v11 = v58;
        goto LABEL_50;
      }
      v118 = [v77 delegate];
      [v118 messageTransport:v77 didReceiveMessage:v175];
    }
    id v12 = v40;
    goto LABEL_48;
  }
LABEL_51:
}

- (__CFString)_transportToString:(void *)a1
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1 rapportTransport];

  if (v4 == v3)
  {
    id v12 = @"Rapport";
  }
  else
  {
    id v5 = [a1 idsTransport];

    if (v5 == v3)
    {
      id v12 = @"IDS";
    }
    else
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = a1;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = objc_opt_class();
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Unexpected transport class: %@", buf, 0x16u);
      }
      id v10 = [[HMDAssertionLogEvent alloc] initWithReason:@"Unexpected transport class: %@", objc_opt_class()];
      v11 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v11 submitLogEvent:v10];

      id v12 = @"Unknown";
    }
  }

  return v12;
}

- (void)_notifyDeviceReachabilityForDestination:(uint64_t)a3 isReachable:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = HMFGetLogIdentifier();
      id v12 = HMFBooleanToString();
      id v13 = [v7 device];
      int v17 = 138543874;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      double v20 = v12;
      __int16 v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Reachability update - isReachable: %@, device: %@", (uint8_t *)&v17, 0x20u);
    }
    v14 = [v9 reachabilityDelegate];
    v15 = [v7 device];
    __int16 v16 = [v15 idsIdentifier];
    [v14 transport:v9 idsIdentifier:v16 didAppearReachable:a3];
  }
}

void __69__HMDModernRemoteMessageTransport__responseHandlerForRequestMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v8 = [[HMDRemoteMessage alloc] initWithName:*(void *)(a1 + 32) qualityOfService:*(void *)(a1 + 80) destination:*(void *)(a1 + 40) payload:v6 type:1 timeout:1 secure:0.0 restriction:*(void *)(a1 + 88)];
  [(HMDRemoteMessage *)v8 setTransactionIdentifier:*(void *)(a1 + 48)];
  [(HMDRemoteMessage *)v8 setToID:*(void *)(a1 + 56)];
  id v9 = [(HMDRemoteMessage *)v8 userInfo];
  id v10 = (void *)[v9 mutableCopy];

  if (v5)
  {
    v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    [v10 setObject:v11 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
  }
  id v12 = [(HMDRemoteMessage *)v8 internal];
  [v12 setUserInfo:v10];

  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = WeakRetained;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v18 = [(HMFObject *)v8 shortDescription];
    *(_DWORD *)buf = 138543874;
    double v20 = v16;
    __int16 v21 = 2114;
    uint64_t v22 = v17;
    __int16 v23 = 2114;
    double v24 = v18;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Sending response for message %{public}@ using message: %{public}@", buf, 0x20u);
  }
  [v14 sendMessage:v8 completionHandler:0];
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    if (![(HMDModernRemoteMessageTransport *)self isStarted])
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = self;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        v15 = [v10 identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v14;
        __int16 v23 = 2114;
        double v24 = v15;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Received request to send message %{public}@ before transport was started; message may fail",
          buf,
          0x16u);
      }
    }
    __int16 v16 = [(HMDModernRemoteMessageTransport *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__HMDModernRemoteMessageTransport_sendMessage_completionHandler___block_invoke;
    block[3] = &unk_264A2EE80;
    block[4] = self;
    id v19 = v10;
    id v20 = v7;
    dispatch_async(v16, block);
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Invalid parameter" reason:@"Not a remote message" suggestion:0];
    -[HMDModernRemoteMessageTransport _respondWithError:completionHandler:error:]((uint64_t)self, v8, v7, v17);
  }
}

- (void)_respondWithError:(void *)a3 completionHandler:(void *)a4 error:
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if (v7) {
      v7[2](v7, v8);
    }
    [v9 respondWithError:v8];
  }
}

void __65__HMDModernRemoteMessageTransport_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  *(void *)((char *)&v121[1] + 2) = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v114 = *(id *)(a1 + 40);
  id v113 = v2;
  if (v1)
  {
    id v3 = [v1 workQueue];
    dispatch_assert_queue_V2(v3);

    if (([v1 isHMModernMessagingInstance] & 1) != 0
      || ([v1 isHMModernMessagingEnergyInstance] & 1) != 0)
    {
      LOBYTE(v4) = 0;
      id v5 = @"NO";
    }
    else
    {
      id v69 = v114;
      v70 = [v1 residencyProvider];
      v71 = [v69 destination];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v72 = v71;
      }
      else {
        v72 = 0;
      }
      id v73 = v72;

      if (v73 && [v70 isCurrentDeviceResident])
      {
        v74 = [v73 device];
        v75 = [v74 deviceAddress];
        LODWORD(v4) = [v70 deviceAddressBelongsToResidentOfCurrentHome:v75];
      }
      else
      {
        LODWORD(v4) = 0;
      }

      uint64_t v79 = [v69 restriction];
      id v5 = @"NO";
      if (v79 == -1 && v4)
      {
        v80 = (void *)MEMORY[0x230FBD990]([v69 setRestriction:8]);
        id v4 = v1;
        v81 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          v82 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v82;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v69;
          _os_log_impl(&dword_22F52A000, v81, OS_LOG_TYPE_DEBUG, "%{public}@Restricting resident to resident message %@ to Rapport only", buf, 0x16u);
        }
        LOBYTE(v4) = 1;
        id v5 = @"YES";
      }
    }
    id v6 = v5;
    if ([v1 isWatch])
    {
      int v7 = 0;
    }
    else
    {
      id v8 = [v1 rapportTransport];
      int v7 = [v8 canSendMessage:v114];
    }
    id v9 = [v1 idsTransport];
    int v112 = [v9 canSendMessage:v114];

    if ((v7 | v112))
    {
      id v10 = v114;
      v11 = [v10 responseHandler];

      if (v11 && [v10 type])
      {
        v104 = (void *)MEMORY[0x230FBD990]();
        id v105 = v1;
        v106 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
        {
          v107 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v107;
          _os_log_impl(&dword_22F52A000, v106, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Message expects a response but is not a request type. Remove the response handler or change the message type.", buf, 0xCu);
        }
        v108 = [[HMDAssertionLogEvent alloc] initWithReason:@"Message expects a response but is not a request type. Remove the response handler or change the message type."];
        uint64_t v109 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v109 submitLogEvent:v108];
      }
      id v12 = v10;
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __141__HMDModernRemoteMessageTransport__createContextWithRemoteMessage_canSendOverRapport_canSendOverIDS_expectsRapportSuccess_completionHandler___block_invoke;
      v118 = &unk_264A23E88;
      v119[16] = v7;
      *(void *)v119 = v1;
      v119[17] = v112;
      id v110 = v12;
      *(void *)&v119[8] = v110;
      v119[18] = v4 & v7;
      id v13 = v113;
      id v14 = +[HMDModernTransportMessageContextOptions newWithBuilder:buf];
      v15 = [v1 contextManager];
      __int16 v16 = [v1 idsDateProvider];
      uint64_t v17 = [v1 timerProvider];
      uint64_t v18 = [v15 createContextWithMessage:v110 options:v14 completionHandler:v13 dateProvider:v16 timerProvider:v17];

      id v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = v1;
      __int16 v21 = HMFGetOSLogHandle();
      uint64_t v22 = v21;
      if (v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = HMFGetLogIdentifier();
          double v24 = HMFBooleanToString();
          [v20 isRapportLinkSlow];
          uint64_t v25 = HMFBooleanToString();
          v26 = HMFBooleanToString();
          *(_DWORD *)buf = 138544642;
          *(void *)&uint8_t buf[4] = v23;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 2114;
          v118 = v25;
          *(_WORD *)v119 = 2114;
          *(void *)&v119[2] = v26;
          *(_WORD *)&v119[10] = 2114;
          *(void *)&v119[12] = v6;
          __int16 v120 = 2112;
          v121[0] = v110;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Sending message over Rapport = %{public}@ (isSlow = %{public}@), IDS = %{public}@, Resident to Resident = %{public}@: %@", buf, 0x3Eu);
        }
        double v27 = (void *)MEMORY[0x230FBD990]();
        id v28 = v20;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          id v30 = HMFGetLogIdentifier();
          v31 = [v110 shortDescription];
          v32 = [v110 messagePayload];
          *(_DWORD *)buf = 138543875;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2113;
          v118 = v32;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Sending message %{public}@ with payload: %{private}@", buf, 0x20u);
        }
        id v33 = v18;
        if ([v33 expectsResponse])
        {
          v34 = (void *)MEMORY[0x230FBD990]();
          id v35 = v28;
          uint64_t v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v37 = HMFGetLogIdentifier();
            v38 = [v33 messageID];
            [v33 timeout];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v37;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v38;
            *(_WORD *)&buf[22] = 2048;
            v118 = v39;
            _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Starting response timer for message %{public}@. Timeout is %.0f seconds", buf, 0x20u);
          }
          objc_initWeak(&location, v35);
          [v33 timeout];
          double v41 = v40;
          int v42 = [v35 workQueue];
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __65__HMDModernRemoteMessageTransport__startResponseTimerForContext___block_invoke;
          v118 = &unk_264A2C148;
          objc_copyWeak((id *)&v119[8], &location);
          *(void *)v119 = v33;
          [*(id *)v119 startResponseTimerWithTimeInterval:v42 queue:buf completionHandler:v41];

          objc_destroyWeak((id *)&v119[8]);
          objc_destroyWeak(&location);
        }

        if (v7)
        {
          id v33 = v33;
          v43 = (void *)MEMORY[0x230FBD990]();
          v44 = v28;
          id v45 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = HMFGetLogIdentifier();
            v47 = [v33 messageID];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v46;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v47;
            _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ over Rapport", buf, 0x16u);
          }
          v48 = [v33 remainingTransports];
          BOOL v49 = [v48 count] == 1;

          double v50 = 15.0;
          if (v49)
          {
            [v33 timeoutRemaining];
            if (v51 <= 0.0) {
              double v50 = 15.0;
            }
            else {
              double v50 = v51;
            }
          }
          v52 = objc_msgSend(v44, "systemDateProvider", v110);
          [v52 timeIntervalSince1970];
          uint64_t v54 = v53;

          v55 = [v44 rapportTransport];
          [v33 startSendingOverTransport:v55];

          objc_initWeak(&location, v44);
          objc_initWeak(&from, v33);
          v56 = [v33 identifier];
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __59__HMDModernRemoteMessageTransport__sendMessageOverRapport___block_invoke;
          v118 = &unk_264A23ED8;
          objc_copyWeak((id *)&v119[8], &location);
          objc_copyWeak((id *)&v119[16], &from);
          id v57 = v56;
          *(void *)v119 = v57;
          *(void *)((char *)v121 + 2) = v54;
          v58 = _Block_copy(buf);
          v59 = [v44 rapportTransport];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            int v60 = v59;
          }
          else {
            int v60 = 0;
          }
          id v61 = v60;

          if ([v44 isHMModernMessagingInstance])
          {
            unint64_t v62 = [v33 preparedMessageWithTimeout:v50];
            [v61 sendHMMMMessage:v62 completionHandler:v58];
          }
          else if ([v44 isHMModernMessagingEnergyInstance])
          {
            unint64_t v62 = [v33 preparedMessageWithTimeout:v50];
            [v61 sendHMMMEnergyMessage:v62 completionHandler:v58];
          }
          else
          {
            v83 = (void *)v44[12];
            unint64_t v62 = [v33 preparedMessageWithTimeout:v50];
            [v83 sendMessage:v62 completionHandler:v58];
          }

          objc_destroyWeak((id *)&v119[16]);
          objc_destroyWeak((id *)&v119[8]);

          objc_destroyWeak(&from);
          objc_destroyWeak(&location);

          if (v112)
          {
            int v84 = [v44 isRapportLinkSlow];
            int v85 = [v111 remoteDisallowsIDSRacing];
            int v86 = v85;
            if (v84)
            {
              v87 = (void *)MEMORY[0x230FBD990]();
              v88 = v44;
              v89 = HMFGetOSLogHandle();
              BOOL v90 = os_log_type_enabled(v89, OS_LOG_TYPE_INFO);
              if (v86)
              {
                if (v90)
                {
                  v91 = HMFGetLogIdentifier();
                  v92 = [v111 identifier];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v91;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v92;
                  _os_log_impl(&dword_22F52A000, v89, OS_LOG_TYPE_INFO, "%{public}@Not sending message %{public}@ over IDS initially even though Rapport link is slow because message disallows IDS racing", buf, 0x16u);
                }
              }
              else
              {
                if (v90)
                {
                  v102 = HMFGetLogIdentifier();
                  id v103 = [v111 identifier];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v102;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v103;
                  _os_log_impl(&dword_22F52A000, v89, OS_LOG_TYPE_INFO, "%{public}@Also sending message %{public}@ over IDS because Rapport link is slow", buf, 0x16u);
                }
                -[HMDModernRemoteMessageTransport _sendMessageOverIDS:](v88, v33);
              }
            }
            else if (v85)
            {
              v93 = (void *)MEMORY[0x230FBD990]();
              v94 = v44;
              v95 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
              {
                v96 = HMFGetLogIdentifier();
                v97 = [v111 identifier];
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v96;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v97;
                _os_log_impl(&dword_22F52A000, v95, OS_LOG_TYPE_INFO, "%{public}@Not starting fallback timer for message %{public}@ because message disallows IDS racing", buf, 0x16u);
              }
            }
            else
            {
              id v33 = v33;
              v98 = [v33 inProgressTransports];
              id v99 = [v44 rapportTransport];
              int v100 = [v98 containsObject:v99];

              if (v100)
              {
                objc_initWeak(&location, v44);
                v101 = [v44 workQueue];
                *(void *)buf = MEMORY[0x263EF8330];
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = __65__HMDModernRemoteMessageTransport__startFallbackTimerForContext___block_invoke;
                v118 = &unk_264A2C148;
                objc_copyWeak((id *)&v119[8], &location);
                *(void *)v119 = v33;
                [*(id *)v119 startTransportFallbackTimerWithTimeInterval:v101 queue:buf completionHandler:0.2];

                objc_destroyWeak((id *)&v119[8]);
                objc_destroyWeak(&location);
              }
            }
          }
        }
        else if (v112)
        {
          -[HMDModernRemoteMessageTransport _sendMessageOverIDS:](v28, v33);
        }
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v76 = HMFGetLogIdentifier();
          id v77 = [v110 identifier];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v76;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v77;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create context for message %{public}@", buf, 0x16u);
        }
        v78 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        -[HMDModernRemoteMessageTransport _respondWithError:completionHandler:error:]((uint64_t)v20, v110, v13, v78);

        id v33 = 0;
      }
    }
    else
    {
      v63 = (void *)MEMORY[0x230FBD990]();
      id v64 = v1;
      v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        id v66 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v66;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v114;
        _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_ERROR, "%{public}@Message %@ cannot be sent over modern transport", buf, 0x16u);
      }
      v67 = (void *)MEMORY[0x263F087E8];
      id v33 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2031];
      v68 = [v67 hmErrorWithCode:2 description:@"Cannot be sent over Modern Transport" reason:@"Not support by Modern Transport or there is no available transport" suggestion:0 underlyingError:v33];
      -[HMDModernRemoteMessageTransport _respondWithError:completionHandler:error:]((uint64_t)v64, v114, v113, v68);
    }
  }
}

- (void)_sendMessageOverIDS:(void *)a1
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = a1;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    id v8 = [v3 messageID];
    *(_DWORD *)buf = 138543618;
    v29 = v7;
    __int16 v30 = 2114;
    v31 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ over IDS", buf, 0x16u);
  }
  [v3 timeoutRemaining];
  double v10 = v9;
  v11 = [v5 idsTransport];
  [v3 startSendingOverTransport:v11];

  if (v10 >= 0.0)
  {
    if (v10 <= 0.0) {
      double v10 = 120.0;
    }
    objc_initWeak((id *)buf, v5);
    objc_initWeak(&location, v3);
    id v19 = [v3 identifier];
    id v20 = [v5 idsTransport];
    __int16 v21 = [v3 preparedMessageWithTimeout:v10];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __55__HMDModernRemoteMessageTransport__sendMessageOverIDS___block_invoke;
    v23[3] = &unk_264A23F00;
    objc_copyWeak(&v25, (id *)buf);
    objc_copyWeak(&v26, &location);
    id v22 = v19;
    id v24 = v22;
    [v20 sendMessage:v21 completionHandler:v23];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = v5;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      __int16 v16 = [v3 messageID];
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      __int16 v30 = 2114;
      v31 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot send message %{public}@ over IDS because we exceeded the message timeout", buf, 0x16u);
    }
    uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:8 description:@"Message timed out" reason:@"Message already expired before being able to send" suggestion:0];
    uint64_t v18 = [v13 idsTransport];
    -[HMDModernRemoteMessageTransport _handleCompletionOnTransport:context:error:](v13, v18, v3, v17);
  }
}

void __65__HMDModernRemoteMessageTransport__startFallbackTimerForContext___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = [*(id *)(a1 + 32) inProgressTransports];
    id v6 = [v3 rapportTransport];
    int v7 = [v5 containsObject:v6];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = v3;
      double v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = HMFGetLogIdentifier();
        id v12 = [*(id *)(a1 + 32) messageID];
        int v13 = 138543618;
        id v14 = v11;
        __int16 v15 = 2114;
        __int16 v16 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Rapport is slow, falling back to IDS for message %{public}@", (uint8_t *)&v13, 0x16u);
      }
      -[HMDModernRemoteMessageTransport _sendOverRemainingTransportForContext:](v9, *(void **)(a1 + 32));
    }
  }
}

- (BOOL)_sendOverRemainingTransportForContext:(void *)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 remainingTransports];
  id v5 = [v4 anyObject];

  if (v5)
  {
    id v6 = [a1 idsTransport];

    if (v5 != v6)
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = a1;
      double v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = HMFGetLogIdentifier();
        int v14 = 138543362;
        __int16 v15 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Remaining transport is not IDS", (uint8_t *)&v14, 0xCu);
      }
      id v12 = [[HMDAssertionLogEvent alloc] initWithReason:@"Remaining transport is not IDS"];
      int v13 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v13 submitLogEvent:v12];
    }
    -[HMDModernRemoteMessageTransport _sendMessageOverIDS:](a1, v3);
  }

  return v5 != 0;
}

- (void)_handleCompletionOnTransport:(void *)a3 context:(void *)a4 error:
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_23;
  }
  double v10 = [a1 workQueue];
  dispatch_assert_queue_V2(v10);

  v11 = [a1 contextManager];
  id v12 = [v8 identifier];
  int v13 = [v11 contextForIdentifier:v12];

  int v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = a1;
  uint64_t v16 = HMFGetOSLogHandle();
  uint64_t v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      id v19 = [v8 messageID];
      id v20 = -[HMDModernRemoteMessageTransport _transportToString:](v15, v7);
      int v42 = 138544130;
      v43 = v18;
      __int16 v44 = 2114;
      id v45 = v19;
      __int16 v46 = 2114;
      id v47 = v20;
      __int16 v48 = 2112;
      id v49 = v9;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ over %{public}@ completed with error: %@", (uint8_t *)&v42, 0x2Au);
    }
    if (!v9)
    {
      [v8 completeSendingOverTransport:v7 withError:0];
      if ([v8 expectsResponse]) {
        goto LABEL_23;
      }
      v31 = (void *)MEMORY[0x230FBD990]();
      id v32 = v15;
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = HMFGetLogIdentifier();
        id v35 = [v8 messageID];
        int v42 = 138543618;
        v43 = v34;
        __int16 v44 = 2114;
        id v45 = v35;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully sent message %{public}@ that does not expect a response", (uint8_t *)&v42, 0x16u);
      }
      goto LABEL_22;
    }
    if ([v9 code] != 3204) {
      [v8 completeSendingOverTransport:v7 withError:v9];
    }
    if (([v8 didSucceedSending] & 1) == 0)
    {
      __int16 v21 = [v8 inProgressTransports];
      uint64_t v22 = [v21 count];

      if (!v22 && !-[HMDModernRemoteMessageTransport _sendOverRemainingTransportForContext:](v15, v8))
      {
        if ([v9 code] == 3204)
        {
          __int16 v23 = [v9 localizedFailureReason];
          id v24 = (void *)MEMORY[0x230FBD990]();
          id v25 = v15;
          id v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            double v27 = HMFGetLogIdentifier();
            id v28 = [v8 messageID];
            int v42 = 138543874;
            v43 = v27;
            __int16 v44 = 2114;
            id v45 = v28;
            __int16 v46 = 2114;
            id v47 = v23;
            _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send multicast message %{public}@ to destination %{public}@", (uint8_t *)&v42, 0x20u);
          }

          goto LABEL_23;
        }
        v37 = (void *)MEMORY[0x230FBD990]();
        id v38 = v15;
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          double v40 = HMFGetLogIdentifier();
          double v41 = [v8 messageID];
          int v42 = 138543874;
          v43 = v40;
          __int16 v44 = 2114;
          id v45 = v41;
          __int16 v46 = 2112;
          id v47 = v9;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message %{public}@ with error: %@", (uint8_t *)&v42, 0x20u);
        }
        if (-[HMDModernRemoteMessageTransport _contextUsesAllTransports:](v38, v8)) {
          -[HMDModernRemoteMessageTransport _deviceReachabilityForContext:isReachable:](v38, v8, 0);
        }
LABEL_22:
        uint64_t v36 = [v15 contextManager];
        [v36 completeContext:v8 withPayload:0 error:v9 isFinal:1];
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v29 = HMFGetLogIdentifier();
      __int16 v30 = [v8 identifier];
      int v42 = 138543618;
      v43 = v29;
      __int16 v44 = 2114;
      id v45 = v30;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Context not found for identifier %{public}@", (uint8_t *)&v42, 0x16u);
    }
  }
LABEL_23:
}

void __55__HMDModernRemoteMessageTransport__sendMessageOverIDS___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__HMDModernRemoteMessageTransport__sendMessageOverIDS___block_invoke_2;
    v7[3] = &unk_264A2CB98;
    objc_copyWeak(&v10, a1 + 6);
    v7[4] = v5;
    id v8 = a1[4];
    id v9 = v3;
    dispatch_async(v6, v7);

    objc_destroyWeak(&v10);
  }
}

void __55__HMDModernRemoteMessageTransport__sendMessageOverIDS___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 idsTransport];
    -[HMDModernRemoteMessageTransport _handleCompletionOnTransport:context:error:](v3, v4, WeakRetained, *(void **)(a1 + 48));
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Context was already released for identifier %{public}@ completed on IDS transport", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (uint64_t)_contextUsesAllTransports:(void *)a1
{
  id v3 = a2;
  if ([a1 isWatch]) {
    goto LABEL_3;
  }
  id v4 = [v3 options];
  id v5 = [v4 transports];
  id v6 = [a1 rapportTransport];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
LABEL_3:
    id v8 = [v3 options];
    uint64_t v9 = [v8 transports];
    int v10 = [a1 idsTransport];
    uint64_t v11 = [v9 containsObject:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)_deviceReachabilityForContext:(uint64_t)a3 isReachable:
{
  id v8 = a2;
  if (a1)
  {
    id v5 = [v8 options];
    int v6 = [v5 isTrackingDeviceReachability];

    if (v6)
    {
      if (([v8 didNotifyDeviceReachability] & 1) == 0)
      {
        [v8 setDidNotifyDeviceReachability:1];
        int v7 = [v8 destination];
        -[HMDModernRemoteMessageTransport _notifyDeviceReachabilityForDestination:isReachable:](a1, v7, a3);
      }
    }
  }
}

void __59__HMDModernRemoteMessageTransport__sendMessageOverRapport___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__HMDModernRemoteMessageTransport__sendMessageOverRapport___block_invoke_2;
    block[3] = &unk_264A23EB0;
    objc_copyWeak(v10, a1 + 6);
    block[4] = v5;
    id v8 = a1[4];
    id v9 = v3;
    v10[1] = a1[7];
    dispatch_async(v6, block);

    objc_destroyWeak(v10);
  }
}

void __59__HMDModernRemoteMessageTransport__sendMessageOverRapport___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 48))
    {
      [v3 setRapportLinkSlow:1];
    }
    else
    {
      id v9 = [v3 systemDateProvider];
      [v9 timeIntervalSince1970];
      double v11 = v10 - *(double *)(a1 + 64);

      __int16 v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = HMFGetLogIdentifier();
        uint64_t v16 = [WeakRetained messageID];
        int v19 = 138543874;
        id v20 = v15;
        __int16 v21 = 2114;
        uint64_t v22 = v16;
        __int16 v23 = 2048;
        unint64_t v24 = (unint64_t)(v11 * 1000.0);
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Rapport response for message %{public}@ received in %lu ms", (uint8_t *)&v19, 0x20u);
      }
      [*(id *)(a1 + 32) setRapportLinkSlow:v11 > 0.2];
      -[HMDModernRemoteMessageTransport _deviceReachabilityForContext:isReachable:](*(void **)(a1 + 32), WeakRetained, 1);
    }
    uint64_t v17 = *(void **)(a1 + 32);
    uint64_t v18 = [v17 rapportTransport];
    -[HMDModernRemoteMessageTransport _handleCompletionOnTransport:context:error:](v17, v18, WeakRetained, *(void **)(a1 + 48));
  }
  else
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    int v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = HMFGetLogIdentifier();
      id v8 = *(void **)(a1 + 40);
      int v19 = 138543618;
      id v20 = v7;
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Context was already released for identifier %{public}@ completed on Rapport transport", (uint8_t *)&v19, 0x16u);
    }
  }
}

void __65__HMDModernRemoteMessageTransport__startResponseTimerForContext___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = v3;
    int v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 32) messageID];
      int v14 = 138543618;
      id v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Message %{public}@ timed out", (uint8_t *)&v14, 0x16u);
    }
    double v10 = [v6 contextManager];
    uint64_t v11 = *(void *)(a1 + 32);
    __int16 v12 = [MEMORY[0x263F087E8] hmErrorWithCode:8 description:@"Operation timed out." reason:@"Message timed out waiting for a response." suggestion:0];
    [v10 completeContext:v11 withPayload:0 error:v12 isFinal:1];

    id v13 = [*(id *)(a1 + 32) options];
    LOBYTE(v11) = [v13 expectsMultipleResponses];

    if ((v11 & 1) == 0) {
      -[HMDModernRemoteMessageTransport _deviceReachabilityForContext:isReachable:](v6, *(void **)(a1 + 32), 0);
    }
  }
}

void __141__HMDModernRemoteMessageTransport__createContextWithRemoteMessage_canSendOverRapport_canSendOverIDS_expectsRapportSuccess_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 32) rapportTransport];
    [v4 addObject:v5];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    id v6 = [*(id *)(a1 + 32) idsTransport];
    [v4 addObject:v6];
  }
  [v3 setTransports:v4];
  uint64_t v7 = [*(id *)(a1 + 40) responseHandler];
  if (v7)
  {
    id v8 = (void *)v7;
    [*(id *)(a1 + 40) timeout];
    double v10 = v9;

    if (v10 < 2.22044605e-16)
    {
      uint64_t v11 = (void *)MEMORY[0x230FBD990]([v3 setTimeoutOverride:60.0]);
      id v12 = *(id *)(a1 + 32);
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v14 = HMFGetLogIdentifier();
        id v15 = [*(id *)(a1 + 40) identifier];
        [v3 timeoutOverride];
        int v40 = 138543874;
        double v41 = v14;
        __int16 v42 = 2114;
        id v43 = v15;
        __int16 v44 = 2048;
        uint64_t v45 = v16;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Message %{public}@ expects a response but timeout is not set. Setting timeout to %.0f seconds", (uint8_t *)&v40, 0x20u);
      }
    }
  }
  if (*(void *)(a1 + 32)) {
    unint64_t v17 = ((unint64_t)[*(id *)(a1 + 40) sendOptions] >> 1) & 1;
  }
  else {
    unint64_t v17 = 0;
  }
  [v3 setExpectsMultipleResponses:v17];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  if (v18)
  {
    if (([(id)v18 isHMModernMessagingInstance] & 1) == 0
      && ([(id)v18 isHMModernMessagingEnergyInstance] & 1) == 0)
    {
      id v20 = [v19 destination];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v22 = [(id)v18 rapportTransport];
        if ([v22 isValidMessage:v19])
        {
          __int16 v23 = [(id)v18 idsTransport];
          char v24 = [v23 isValidMessage:v19];

          if (v24)
          {
            uint64_t v18 = 1;
            goto LABEL_24;
          }
        }
        else
        {
        }
        uint64_t v25 = (void *)MEMORY[0x230FBD990]();
        id v26 = (id)v18;
        double v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v28 = HMFGetLogIdentifier();
          int v40 = 138543618;
          double v41 = v28;
          __int16 v42 = 2112;
          id v43 = v19;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Not tracking reachability for restricted message: %@", (uint8_t *)&v40, 0x16u);
        }
      }
    }
    uint64_t v18 = 0;
  }
LABEL_24:

  [v3 setTrackingDeviceReachability:v18];
  uint64_t v30 = *(void *)(a1 + 32);
  v29 = *(void **)(a1 + 40);
  [v3 timeoutOverride];
  double v32 = v31;
  id v33 = v29;
  v34 = v33;
  double v35 = 0.0;
  if (v30 && [v33 type] != 1 && (objc_msgSend(v34, "sendOptions") & 1) == 0)
  {
    if (v32 < 2.22044605e-16)
    {
      [v34 timeout];
      double v32 = v36;
    }
    double v37 = 15.0;
    if (v32 >= 15.0) {
      double v37 = v32;
    }
    if (v32 >= 2.22044605e-16) {
      double v35 = v37;
    }
    else {
      double v35 = 60.0;
    }
  }

  [v3 setTimeToLive:v35];
  id v38 = [(id)objc_opt_class() requestStartTimeHeaderKey];
  [v3 setRequestStartTimeHeaderKey:v38];

  v39 = [(id)objc_opt_class() timeToLiveHeaderKey];
  [v3 setTimeToLiveHeaderKey:v39];

  [v3 setExpectRapportSuccess:*(unsigned __int8 *)(a1 + 50)];
}

- (BOOL)canSendMessage:(id)a3
{
  id v4 = a3;
  if ([v4 restriction] != -1 && (objc_msgSend(v4, "restriction") & 0x10) != 0)
  {
    char v6 = 0;
  }
  else
  {
    id v5 = [(HMDModernRemoteMessageTransport *)self rapportTransport];
    if ([v5 isValidMessage:v4])
    {
      char v6 = 1;
    }
    else
    {
      uint64_t v7 = [(HMDModernRemoteMessageTransport *)self idsTransport];
      char v6 = [v7 isValidMessage:v4];
    }
  }

  return v6;
}

- (id)startHMMMEnergy
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting Energy HMMM", buf, 0xCu);
  }
  uint64_t v7 = [(HMDModernRemoteMessageTransport *)v4 rapportTransport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  double v10 = [v9 startHMMMEnergy];

  uint64_t v11 = [(HMDModernRemoteMessageTransport *)v4 idsTransport];
  id v12 = [v11 start];

  [(HMDModernRemoteMessageTransport *)v4 setStarted:1];
  id v13 = (void *)MEMORY[0x263F42538];
  v20[0] = v10;
  v20[1] = v12;
  int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  id v15 = [v13 all:v14];

  uint64_t v16 = [(HMDRemoteMessageTransport *)v4 startPromise];
  unint64_t v17 = [v15 ignoreOutcome];
  [v16 resolveWithFuture:v17];

  uint64_t v18 = [(HMDRemoteMessageTransport *)v4 startFuture];

  return v18;
}

- (id)startHMMM
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HMMM", buf, 0xCu);
  }
  uint64_t v7 = [(HMDModernRemoteMessageTransport *)v4 rapportTransport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  double v10 = [v9 startHMMM];

  uint64_t v11 = [(HMDModernRemoteMessageTransport *)v4 idsTransport];
  id v12 = [v11 start];

  [(HMDModernRemoteMessageTransport *)v4 setStarted:1];
  id v13 = (void *)MEMORY[0x263F42538];
  v20[0] = v10;
  v20[1] = v12;
  int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  id v15 = [v13 all:v14];

  uint64_t v16 = [(HMDRemoteMessageTransport *)v4 startPromise];
  unint64_t v17 = [v15 ignoreOutcome];
  [v16 resolveWithFuture:v17];

  uint64_t v18 = [(HMDRemoteMessageTransport *)v4 startFuture];

  return v18;
}

- (id)start
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v20 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", buf, 0xCu);
  }
  uint64_t v7 = [(HMDModernRemoteMessageTransport *)v4 rapportTransport];
  id v8 = [v7 start];

  id v9 = [(HMDModernRemoteMessageTransport *)v4 idsTransport];
  double v10 = [v9 start];

  [(HMDModernRemoteMessageTransport *)v4 setStarted:1];
  uint64_t v11 = (void *)MEMORY[0x263F42538];
  v18[0] = v8;
  v18[1] = v10;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  id v13 = [v11 all:v12];

  int v14 = [(HMDRemoteMessageTransport *)v4 startPromise];
  id v15 = [v13 ignoreOutcome];
  [v14 resolveWithFuture:v15];

  uint64_t v16 = [(HMDRemoteMessageTransport *)v4 startFuture];

  return v16;
}

- (int64_t)qualityOfService
{
  return 1;
}

- (BOOL)isSecure
{
  return 1;
}

- (HMDModernRemoteMessageTransport)initWithAccountRegistry:(id)a3 rapportTransport:(id)a4 idsTransport:(id)a5 contextManager:(id)a6 systemDateProvider:(id)a7 idsDateProvider:(id)a8 timerProvider:(id)a9 isWatch:(BOOL)a10
{
  id v16 = a4;
  id v40 = a5;
  id v17 = a5;
  id v41 = a6;
  id v18 = a6;
  id v42 = a7;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v43.receiver = self;
  v43.super_class = (Class)HMDModernRemoteMessageTransport;
  uint64_t v22 = [(HMDRemoteMessageTransport *)&v43 initWithAccountRegistry:a3];
  if (v22)
  {
    HMDispatchQueueNameString();
    id v23 = objc_claimAutoreleasedReturnValue();
    id v38 = a8;
    id v24 = v18;
    id v25 = v16;
    uint64_t v26 = [v23 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v27 = v21;
    id v28 = v20;
    id v29 = v19;
    v31 = id v30 = v17;
    double v32 = (const char *)v26;
    id v16 = v25;
    id v18 = v24;
    dispatch_queue_t v33 = dispatch_queue_create(v32, v31);
    workQueue = v22->_workQueue;
    v22->_workQueue = (OS_dispatch_queue *)v33;

    id v17 = v30;
    id v19 = v29;
    id v20 = v28;
    id v21 = v27;

    objc_storeStrong((id *)&v22->_rapportTransport, a4);
    [(HMFMessageTransport *)v22->_rapportTransport setDelegate:v22];
    [(HMDRemoteMessageTransport *)v22->_rapportTransport setReachabilityDelegate:v22];
    objc_storeStrong((id *)&v22->_idsTransport, v40);
    [(HMFMessageTransport *)v22->_idsTransport setDelegate:v22];
    objc_storeStrong((id *)&v22->_contextManager, v41);
    objc_storeStrong((id *)&v22->_systemDateProvider, v42);
    objc_storeStrong((id *)&v22->_idsDateProvider, v38);
    objc_storeStrong((id *)&v22->_timerProvider, a9);
    uint64_t v35 = [objc_alloc(MEMORY[0x263EFF9B0]) initWithCapacity:100];
    messageIDDedupeBuffer = v22->_messageIDDedupeBuffer;
    v22->_messageIDDedupeBuffer = (NSMutableOrderedSet *)v35;

    v22->_rapportLinkSlow = 0;
    v22->_isWatch = a10;
    v22->_isHMModernMessagingInstance = 0;
    v22->_isHMModernMessagingEnergyInstance = 0;
  }

  return v22;
}

- (HMDModernRemoteMessageTransport)initWithAccountRegistry:(id)a3 rapportTransport:(id)a4 idsTransport:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(HMDIDSDate);
  id v12 = objc_alloc_init(HMDDate);
  id v13 = objc_alloc_init(HMDModernTransportMessageContextManager);
  int v14 = objc_opt_new();
  LOBYTE(v17) = 0;
  id v15 = [(HMDModernRemoteMessageTransport *)self initWithAccountRegistry:v10 rapportTransport:v9 idsTransport:v8 contextManager:v13 systemDateProvider:v12 idsDateProvider:v11 timerProvider:v14 isWatch:v17];

  return v15;
}

- (HMDModernRemoteMessageTransport)initWithAccountRegistry:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HMDIDSDate);
  char v6 = objc_alloc_init(HMDDate);
  uint64_t v7 = [[HMDRapportMessageTransport alloc] initWithAccountRegistry:v4];
  id v8 = [[HMDIDSMessageTransport alloc] initWithAccountRegistry:v4];
  id v9 = objc_alloc_init(HMDModernTransportMessageContextManager);
  id v10 = objc_opt_new();
  LOBYTE(v13) = 0;
  uint64_t v11 = [(HMDModernRemoteMessageTransport *)self initWithAccountRegistry:v4 rapportTransport:v7 idsTransport:v8 contextManager:v9 systemDateProvider:v6 idsDateProvider:v5 timerProvider:v10 isWatch:v13];

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t57 != -1) {
    dispatch_once(&logCategory__hmf_once_t57, &__block_literal_global_180187);
  }
  v2 = (void *)logCategory__hmf_once_v58;
  return v2;
}

void __46__HMDModernRemoteMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v58;
  logCategory__hmf_once_v58 = v0;
}

+ (NSString)timeToLiveHeaderKey
{
  return (NSString *)@"hmd_mrmttl";
}

+ (NSString)requestStartTimeHeaderKey
{
  return (NSString *)@"hmd_mrmrst";
}

@end