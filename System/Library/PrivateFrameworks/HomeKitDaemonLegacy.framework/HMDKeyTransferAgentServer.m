@interface HMDKeyTransferAgentServer
+ (BOOL)isPeerAvailable;
+ (id)logCategory;
- (BOOL)_endAdvertiseUUIDWithError:(id *)a3;
- (BOOL)_startAdvertiseUUIDWithError:(id *)a3;
- (BOOL)broadcastFailure;
- (HMDKeyTransferAgentServer)initWithHomeManager:(id)a3;
- (HMFExponentialBackoffTimer)broadcastUUIDTimer;
- (NSMutableSet)broadcastNotifiedDevices;
- (NSUUID)currentKeyUUID;
- (OS_dispatch_group)broadcastGroup;
- (id)_httpMessageTransport;
- (id)finalCompletionHandler;
- (void)__deviceAddedToAccount:(id)a3;
- (void)__deviceRemovedFromAccount:(id)a3;
- (void)__deviceUpdated:(id)a3;
- (void)__resetTimer:(id)a3;
- (void)_device:(id)a3 addedToAccount:(id)a4;
- (void)_device:(id)a3 removedFromAccount:(id)a4;
- (void)_endPairingWithError:(id)a3;
- (void)_handleKeyTransferAgentMessage:(id)a3;
- (void)beginPairingWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)resetConfig;
- (void)setBroadcastFailure:(BOOL)a3;
- (void)setBroadcastGroup:(id)a3;
- (void)setBroadcastNotifiedDevices:(id)a3;
- (void)setBroadcastUUIDTimer:(id)a3;
- (void)setCurrentKeyUUID:(id)a3;
- (void)setFinalCompletionHandler:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDKeyTransferAgentServer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finalCompletionHandler, 0);
  objc_storeStrong((id *)&self->_broadcastUUIDTimer, 0);
  objc_storeStrong((id *)&self->_broadcastNotifiedDevices, 0);
  objc_storeStrong((id *)&self->_broadcastGroup, 0);
  objc_storeStrong((id *)&self->_currentKeyUUID, 0);
}

- (void)setFinalCompletionHandler:(id)a3
{
}

- (id)finalCompletionHandler
{
  return self->_finalCompletionHandler;
}

- (void)setBroadcastFailure:(BOOL)a3
{
  self->_broadcastFailure = a3;
}

- (BOOL)broadcastFailure
{
  return self->_broadcastFailure;
}

- (void)setBroadcastUUIDTimer:(id)a3
{
}

- (HMFExponentialBackoffTimer)broadcastUUIDTimer
{
  return self->_broadcastUUIDTimer;
}

- (void)setBroadcastNotifiedDevices:(id)a3
{
}

- (NSMutableSet)broadcastNotifiedDevices
{
  return self->_broadcastNotifiedDevices;
}

- (void)setBroadcastGroup:(id)a3
{
}

- (OS_dispatch_group)broadcastGroup
{
  return self->_broadcastGroup;
}

- (void)setCurrentKeyUUID:(id)a3
{
}

- (NSUUID)currentKeyUUID
{
  return self->_currentKeyUUID;
}

- (void)_handleKeyTransferAgentMessage:(id)a3
{
  uint64_t v221 = *MEMORY[0x1E4F143B8];
  id v184 = a3;
  v4 = (void *)MEMORY[0x1D9452090]();
  v183 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    v7 = [v184 stringForKey:@"phase"];
    *(_DWORD *)buf = 138543874;
    v216 = v6;
    __int16 v217 = 2112;
    id v218 = v184;
    __int16 v219 = 2112;
    v220 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Got Message: %@ / %@", buf, 0x20u);
  }
  v8 = [MEMORY[0x1E4F65520] sharedPowerLogger];
  v9 = [v184 stringForKey:@"phase"];
  [v8 reportIncomingLoxyMessage:v9];

  v10 = [v184 stringForKey:@"phase"];
  int v11 = [v10 isEqualToString:@"request_uuid"];

  v12 = [(HMDKeyTransferAgent *)v183 progressState];
  v13 = v12;
  if (v11)
  {

    if (v13)
    {
      v213 = @"uuid";
      v14 = [(HMDKeyTransferAgentServer *)v183 currentKeyUUID];
      v15 = [v14 UUIDString];
      v214 = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v214 forKeys:&v213 count:1];
    }
    else
    {
      id v16 = (id)MEMORY[0x1E4F1CC08];
    }
    v28 = [v184 responseHandler];

    if (v28)
    {
      v29 = [v184 responseHandler];
      ((void (**)(void, void, id))v29)[2](v29, 0, v16);
    }
    goto LABEL_99;
  }
  BOOL v17 = v12 == 0;

  if (!v17)
  {
    v182 = [(HMDKeyTransferAgent *)v183 homeManager];
    v18 = [v184 stringForKey:@"phase"];
    int v19 = [v18 isEqualToString:@"ping"];

    if (v19)
    {
      v20 = [(HMDKeyTransferAgent *)v183 progressState];
      v21 = [v184 stringForKey:@"phase"];
      char v22 = [v20 isEqual:v21];

      if ((v22 & 1) == 0)
      {
        v52 = (void *)MEMORY[0x1D9452090]();
        v53 = v183;
        v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v216 = v55;
          _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (A0)", buf, 0xCu);
        }
        v56 = [v184 responseHandler];

        if (v56) {
          goto LABEL_96;
        }
        goto LABEL_97;
      }
      if (([v184 remoteRestriction] & 2) == 0)
      {
        v23 = (void *)MEMORY[0x1D9452090]();
        v24 = v183;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v216 = v26;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (A1)", buf, 0xCu);
        }
        v27 = [v184 responseHandler];

        if (v27)
        {
LABEL_96:
          id v188 = [v184 responseHandler];
          (*((void (**)(id, void, void))v188 + 2))(v188, 0, MEMORY[0x1E4F1CC08]);
LABEL_80:
          id v16 = 0;
          goto LABEL_81;
        }
LABEL_97:
        id v16 = 0;
        goto LABEL_98;
      }
      long long v203 = 0u;
      long long v204 = 0u;
      long long v201 = 0u;
      long long v202 = 0u;
      id obj = [v182 homes];
      uint64_t v57 = [obj countByEnumeratingWithState:&v201 objects:v212 count:16];
      if (v57)
      {
        id v188 = 0;
        uint64_t v58 = *(void *)v202;
        do
        {
          for (uint64_t i = 0; i != v57; ++i)
          {
            if (*(void *)v202 != v58) {
              objc_enumerationMutation(obj);
            }
            v60 = *(void **)(*((void *)&v201 + 1) + 8 * i);
            v61 = [v60 primaryResident];
            v62 = [v61 device];
            v63 = +[HMDAppleAccountManager sharedManager];
            v64 = [v63 device];
            int v65 = [v62 isEqual:v64];

            if (v65)
            {
              v66 = [v60 primaryResident];
              uint64_t v67 = [v66 device];

              id v188 = (id)v67;
            }
          }
          uint64_t v57 = [obj countByEnumeratingWithState:&v201 objects:v212 count:16];
        }
        while (v57);

        v68 = NSNumber;
        if (v188)
        {
          v69 = [NSNumber numberWithBool:1];
LABEL_77:
          v107 = [v184 responseHandler];

          if (v107)
          {
            v108 = [v184 responseHandler];
            v210[0] = @"phase";
            v210[1] = @"data";
            v211[0] = @"ping";
            v211[1] = v69;
            v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v211 forKeys:v210 count:2];
            ((void (**)(void, void, void *))v108)[2](v108, 0, v109);
          }
          [(HMDKeyTransferAgent *)v183 setProgressState:@"send_public"];

          goto LABEL_80;
        }
      }
      else
      {

        v68 = NSNumber;
      }
      v106 = [v182 homes];
      v69 = objc_msgSend(v68, "numberWithBool:", objc_msgSend(v106, "count") == 0);

      id v188 = 0;
      goto LABEL_77;
    }
    v35 = [v184 stringForKey:@"phase"];
    int v36 = [v35 isEqualToString:@"send_public"];

    if (v36)
    {
      v37 = [(HMDKeyTransferAgent *)v183 progressState];
      v38 = [v184 stringForKey:@"phase"];
      char v39 = [v37 isEqual:v38];

      if ((v39 & 1) == 0)
      {
        v78 = (void *)MEMORY[0x1D9452090]();
        v79 = v183;
        v80 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          v81 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v216 = v81;
          _os_log_impl(&dword_1D49D5000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (B0)", buf, 0xCu);
        }
        v82 = [v184 responseHandler];

        if (v82) {
          goto LABEL_96;
        }
        goto LABEL_97;
      }
      if (([v184 remoteRestriction] & 1) == 0)
      {
        v40 = (void *)MEMORY[0x1D9452090]();
        v41 = v183;
        v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v216 = v43;
          _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (B1)", buf, 0xCu);
        }
        v44 = [v184 responseHandler];

        if (v44) {
          goto LABEL_96;
        }
        goto LABEL_97;
      }
      v88 = [v184 messagePayload];
      objc_msgSend(v88, "hmf_stringForKey:", @"kControllerPairingNameKey");
      id obja = (id)objc_claimAutoreleasedReturnValue();

      v89 = [v184 messagePayload];
      v180 = objc_msgSend(v89, "hmf_dataForKey:", @"kControllerKeyPairKey");

      id v178 = (id)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v180];
      v90 = (void *)[objc_alloc(MEMORY[0x1E4F5BE00]) initWithIdentifier:obja publicKey:v178 privateKey:0 permissions:0];
      v91 = [v184 destination];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v92 = v91;
      }
      else {
        v92 = 0;
      }
      id v93 = v92;

      if (v90 && v93)
      {
        v94 = +[HMDIdentityRegistry sharedRegistry];
        v95 = [v93 device];
        v96 = [v95 account];
        [v94 registerIdentity:v90 account:v96 object:v183];

        v97 = [MEMORY[0x1E4F5BE48] systemStore];
        id v199 = 0;
        id v200 = 0;
        id v198 = 0;
        char v98 = [v97 getControllerPublicKey:&v200 secretKey:0 username:&v199 allowCreation:1 error:&v198];
        id v99 = v200;
        id v188 = v199;
        id v16 = v198;

        if (v98)
        {
          [(HMDKeyTransferAgent *)v183 setProgressState:@"send_private"];
          v100 = [v184 responseHandler];

          if (!v100)
          {
LABEL_105:

            goto LABEL_81;
          }
          v101 = [v184 responseHandler];
          v208[0] = @"phase";
          v208[1] = @"kControllerKeyPairKey";
          v209[0] = @"reply_public";
          v209[1] = v99;
          v208[2] = @"kControllerPairingNameKey";
          v209[2] = v188;
          v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v209 forKeys:v208 count:3];
          ((void (**)(void, void, void *))v101)[2](v101, 0, v102);
        }
        else
        {
          v128 = (void *)MEMORY[0x1D9452090]();
          v129 = v183;
          v130 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          {
            v131 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v216 = v131;
            __int16 v217 = 2112;
            id v218 = v16;
            _os_log_impl(&dword_1D49D5000, v130, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate ATV public / private key pair: %@", buf, 0x16u);
          }
          [(HMDKeyTransferAgentServer *)v129 _endPairingWithError:v16];
          v101 = [v184 responseHandler];
          ((void (**)(void, id, void))v101)[2](v101, v16, 0);
        }
      }
      else
      {
        v119 = (void *)MEMORY[0x1D9452090]();
        v120 = v183;
        v121 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          v122 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v216 = v122;
          _os_log_impl(&dword_1D49D5000, v121, OS_LOG_TYPE_ERROR, "%{public}@Did not get valid username / public key from IOs device.", buf, 0xCu);
        }
        id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
        [(HMDKeyTransferAgentServer *)v120 _endPairingWithError:v16];
        v101 = [v184 responseHandler];
        ((void (**)(void, id, void))v101)[2](v101, v16, 0);
        id v99 = 0;
        id v188 = 0;
      }

      goto LABEL_105;
    }
    v45 = [v184 stringForKey:@"phase"];
    int v46 = [v45 isEqualToString:@"send_private"];

    if (v46)
    {
      if ([v184 isSecureRemote])
      {
        if (([v184 remoteRestriction] & 2) != 0)
        {
          v110 = [(HMDKeyTransferAgent *)v183 progressState];
          v111 = [v184 stringForKey:@"phase"];
          char v112 = [v110 isEqual:v111];

          if (v112)
          {
            id v188 = [v184 dataForKey:@"kControllerKeyPairKey"];
            v176 = [v184 stringForKey:@"kControllerPairingNameKey"];
            if (v188 && v176)
            {
              [v184 respondWithPayload:0];
              v113 = [MEMORY[0x1E4F5BE48] systemStore];
              id v196 = 0;
              id v197 = 0;
              int v114 = [v113 getControllerPublicKey:0 secretKey:0 keyPair:0 username:&v197 allowCreation:0 error:&v196];
              id v173 = v197;
              id v16 = v196;

              if (v114 && [v173 isEqualToString:v176])
              {
                v115 = (void *)MEMORY[0x1D9452090]();
                v116 = v183;
                v117 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                {
                  v118 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  v216 = v118;
                  _os_log_impl(&dword_1D49D5000, v117, OS_LOG_TYPE_DEFAULT, "%{public}@Already have key, rejecting message and not processing further.", buf, 0xCu);
                }
              }
              else
              {
                char v137 = objc_msgSend(v182, "_removeAndAddKeyPair:userName:eraseReason:", v188, v176, 1, v173);

                v138 = (void *)MEMORY[0x1D9452090]();
                v139 = v183;
                v140 = HMFGetOSLogHandle();
                BOOL v141 = os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT);
                if (v137)
                {
                  if (v141)
                  {
                    v142 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543362;
                    v216 = v142;
                    _os_log_impl(&dword_1D49D5000, v140, OS_LOG_TYPE_DEFAULT, "%{public}@Received new key and successfully added it.", buf, 0xCu);
                  }
                  v143 = [MEMORY[0x1E4F5BE48] systemStore];
                  [v143 updateActiveControllerPairingIdentifier:v176];

                  v144 = +[HMDAppleAccountManager sharedManager];
                  v145 = [v144 device];
                  v146 = [v145 identifier];
                  v177 = [v146 UUIDString];

                  if (v177)
                  {
                    long long v194 = 0u;
                    long long v195 = 0u;
                    long long v192 = 0u;
                    long long v193 = 0u;
                    v147 = +[HMDAppleAccountManager sharedManager];
                    v148 = [v147 account];
                    v149 = [v148 devices];
                    id v179 = (id)[v149 copy];

                    id objb = (id)[v179 countByEnumeratingWithState:&v192 objects:v207 count:16];
                    if (objb)
                    {
                      uint64_t v181 = *(void *)v193;
                      do
                      {
                        for (j = 0; j != objb; j = (char *)j + 1)
                        {
                          if (*(void *)v193 != v181) {
                            objc_enumerationMutation(v179);
                          }
                          v151 = *(void **)(*((void *)&v192 + 1) + 8 * (void)j);
                          if (([v151 isCurrentDevice] & 1) == 0)
                          {
                            v152 = [v151 capabilities];
                            int v153 = [v152 supportsKeyTransferClient];

                            if (v153)
                            {
                              v154 = (void *)MEMORY[0x1D9452090]();
                              v155 = v139;
                              v156 = HMFGetOSLogHandle();
                              if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
                              {
                                v157 = HMFGetLogIdentifier();
                                v158 = [v151 identifier];
                                v159 = [v158 UUIDString];
                                *(_DWORD *)buf = 138543618;
                                v216 = v157;
                                __int16 v217 = 2112;
                                id v218 = v159;
                                _os_log_impl(&dword_1D49D5000, v156, OS_LOG_TYPE_DEFAULT, "%{public}@Broadcasting Completion to %@", buf, 0x16u);
                              }
                              v160 = [HMDRemoteDeviceMessageDestination alloc];
                              v161 = [(HMDKeyTransferAgent *)v155 uuid];
                              v162 = [(HMDRemoteDeviceMessageDestination *)v160 initWithTarget:v161 device:v151];

                              v163 = [HMDRemoteMessage alloc];
                              v205 = @"data";
                              v206 = v177;
                              v164 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v206 forKeys:&v205 count:1];
                              v165 = [(HMDRemoteMessage *)v163 initWithName:@"kResidentProvisioningStatusChangedNotificationKey" destination:v162 payload:v164 type:0 timeout:0 secure:1 restriction:0.0];

                              objc_initWeak((id *)buf, v155);
                              v189[0] = MEMORY[0x1E4F143A8];
                              v189[1] = 3221225472;
                              v189[2] = __60__HMDKeyTransferAgentServer__handleKeyTransferAgentMessage___block_invoke;
                              v189[3] = &unk_1E6A17958;
                              objc_copyWeak(&v191, (id *)buf);
                              v166 = v162;
                              v190 = v166;
                              [(HMDRemoteMessage *)v165 setResponseHandler:v189];
                              v167 = [v182 messageDispatcher];
                              [v167 sendMessage:v165 completionHandler:0];

                              objc_destroyWeak(&v191);
                              objc_destroyWeak((id *)buf);
                            }
                          }
                        }
                        id objb = (id)[v179 countByEnumeratingWithState:&v192 objects:v207 count:16];
                      }
                      while (objb);
                    }
                  }
                  else
                  {
                    v169 = (void *)MEMORY[0x1D9452090]();
                    v170 = v139;
                    v171 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
                    {
                      v172 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543362;
                      v216 = v172;
                      _os_log_impl(&dword_1D49D5000, v171, OS_LOG_TYPE_DEFAULT, "%{public}@We lost our currentDevice (probably just got logged out unexpectedly).", buf, 0xCu);
                    }
                  }
                  [(HMDKeyTransferAgent *)v139 setProgressState:0];
                  [v182 _updateCloudDataSyncWithAccountState:1];

                  id v16 = 0;
                }
                else
                {
                  if (v141)
                  {
                    v168 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543362;
                    v216 = v168;
                    _os_log_impl(&dword_1D49D5000, v140, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to save the key pair to keychain", buf, 0xCu);
                  }
                  id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
                }
              }
              -[HMDKeyTransferAgentServer _endPairingWithError:](v183, "_endPairingWithError:", v16, v173);
            }
            else
            {
              v132 = (void *)MEMORY[0x1D9452090]();
              v133 = v183;
              v134 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
              {
                v135 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v216 = v135;
                _os_log_impl(&dword_1D49D5000, v134, OS_LOG_TYPE_ERROR, "%{public}@Key pair (or username) is missing the resident key sync message", buf, 0xCu);
              }
              id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
              [(HMDKeyTransferAgentServer *)v133 _endPairingWithError:v16];
              v136 = [v184 responseHandler];

              if (v136)
              {
                v174 = [v184 responseHandler];
                ((void (**)(void, id, void))v174)[2](v174, v16, 0);
              }
            }

            goto LABEL_81;
          }
          v123 = (void *)MEMORY[0x1D9452090]();
          v124 = v183;
          v125 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
          {
            v126 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v216 = v126;
            _os_log_impl(&dword_1D49D5000, v125, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (C0)", buf, 0xCu);
          }
          v127 = [v184 responseHandler];

          if (v127) {
            goto LABEL_96;
          }
        }
        else
        {
          v47 = (void *)MEMORY[0x1D9452090]();
          v48 = v183;
          v49 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            v50 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v216 = v50;
            _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (C1)", buf, 0xCu);
          }
          v51 = [v184 responseHandler];

          if (v51) {
            goto LABEL_96;
          }
        }
        goto LABEL_97;
      }
      v83 = (void *)MEMORY[0x1D9452090]();
      v84 = v183;
      v85 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        v86 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v216 = v86;
        _os_log_impl(&dword_1D49D5000, v85, OS_LOG_TYPE_ERROR, "%{public}@Private key not receieved via secure remote message. Failing.", buf, 0xCu);
      }
      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
      [(HMDKeyTransferAgentServer *)v84 _endPairingWithError:v16];
      v87 = [v184 responseHandler];

      if (!v87) {
        goto LABEL_98;
      }
    }
    else
    {
      v70 = [v184 stringForKey:@"phase"];
      int v71 = [v70 isEqualToString:@"broadcast"];

      v72 = (void *)MEMORY[0x1D9452090]();
      v73 = v183;
      v74 = HMFGetOSLogHandle();
      v75 = v74;
      if (!v71)
      {
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          v103 = HMFGetLogIdentifier();
          v104 = [v184 stringForKey:@"phase"];
          *(_DWORD *)buf = 138543618;
          v216 = v103;
          __int16 v217 = 2112;
          id v218 = v104;
          _os_log_impl(&dword_1D49D5000, v75, OS_LOG_TYPE_ERROR, "%{public}@Unknown message key %@", buf, 0x16u);
        }
        v105 = [v184 responseHandler];

        if (!v105) {
          goto LABEL_97;
        }
        id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
        id v188 = [v184 responseHandler];
        (*((void (**)(id, id, void))v188 + 2))(v188, v16, 0);
LABEL_81:

LABEL_98:
        goto LABEL_99;
      }
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        v76 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v216 = v76;
        _os_log_impl(&dword_1D49D5000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring broadcast key on server.", buf, 0xCu);
      }
      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
      v77 = [v184 responseHandler];

      if (!v77) {
        goto LABEL_98;
      }
    }
    id v188 = [v184 responseHandler];
    (*((void (**)(id, id, void))v188 + 2))(v188, v16, 0);
    goto LABEL_81;
  }
  v30 = (void *)MEMORY[0x1D9452090]();
  v31 = v183;
  v32 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v216 = v33;
    _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Key transfer not in progress.", buf, 0xCu);
  }
  v34 = [v184 responseHandler];

  if (v34)
  {
    id v16 = [v184 responseHandler];
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, MEMORY[0x1E4F1CC08]);
LABEL_99:
  }
}

void __60__HMDKeyTransferAgentServer__handleKeyTransferAgentMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v11)
    {
      v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 32);
      int v16 = 138543618;
      BOOL v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      v14 = "%{public}@Unable to notify iOS device %@ that we have completed.";
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x16u);
    }
  }
  else if (v11)
  {
    v12 = HMFGetLogIdentifier();
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = 138543618;
    BOOL v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    v14 = "%{public}@Notified iOS device %@ that we have completed.";
    goto LABEL_6;
  }
}

- (void)_endPairingWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDKeyTransferAgent *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HMDKeyTransferAgentServer__endPairingWithError___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__HMDKeyTransferAgentServer__endPairingWithError___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 32);
    int v21 = 138543618;
    char v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    id v9 = "%{public}@Key transfer ended with error: %@";
    v10 = v5;
    uint32_t v11 = 22;
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = HMFGetLogIdentifier();
    int v21 = 138543362;
    char v22 = v7;
    id v9 = "%{public}@Key transfer ended with no issues.";
    v10 = v5;
    uint32_t v11 = 12;
  }
  _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v21, v11);

LABEL_7:
  [*(id *)(a1 + 40) _endAdvertiseUUIDWithError:0];
  v12 = [*(id *)(a1 + 40) finalCompletionHandler];

  if (v12)
  {
    int v16 = [*(id *)(a1 + 40) finalCompletionHandler];
    v16[2](v16, *(void *)(a1 + 32));
  }
  else
  {
    BOOL v17 = (void *)MEMORY[0x1D9452090](v13, v14, v15);
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      char v22 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Hit nil completion handler (this should not happen).", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)beginPairingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDKeyTransferAgent *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HMDKeyTransferAgentServer_beginPairingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A19530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__HMDKeyTransferAgentServer_beginPairingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) progressState];

  if (!v2)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__HMDKeyTransferAgentServer_beginPairingWithCompletionHandler___block_invoke_32;
    aBlock[3] = &unk_1E6A17D78;
    id v9 = *(id *)(a1 + 40);
    aBlock[4] = *(void *)(a1 + 32);
    id v17 = v9;
    v10 = _Block_copy(aBlock);
    [*(id *)(a1 + 32) setProgressState:@"ping"];
    uint32_t v11 = *(void **)(a1 + 32);
    id v15 = 0;
    char v12 = [v11 _startAdvertiseUUIDWithError:&v15];
    id v13 = v15;
    if (v12)
    {
      uint64_t v14 = (void *)[v10 copy];
      [*(id *)(a1 + 32) setFinalCompletionHandler:v14];
    }
    else
    {
      (*((void (**)(void *, id))v10 + 2))(v10, v13);
    }

    id v8 = v17;
    goto LABEL_10;
  }
  v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@Unable to submit pairing requests. One is already in progress", buf, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
LABEL_10:
  }
}

uint64_t __63__HMDKeyTransferAgentServer_beginPairingWithCompletionHandler___block_invoke_32(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 setProgressState:0];
}

- (id)_httpMessageTransport
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(HMDKeyTransferAgent *)self homeManager];
  v3 = [v2 messageDispatcher];
  id v4 = [v3 secureRemoteTransport];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = objc_msgSend(v4, "transports", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)__resetTimer:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v12 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting Key Transfer Agent.", buf, 0xCu);
  }
  id v9 = [(HMDKeyTransferAgent *)v6 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HMDKeyTransferAgentServer___resetTimer___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = v6;
  dispatch_async(v9, block);
}

uint64_t __42__HMDKeyTransferAgentServer___resetTimer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) broadcastNotifiedDevices];
  [v2 removeAllObjects];

  [*(id *)(a1 + 32) setProgressState:0];
  v3 = *(void **)(a1 + 32);
  return [v3 _endAdvertiseUUIDWithError:0];
}

- (void)__deviceRemovedFromAccount:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HMDKeyTransferAgent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HMDKeyTransferAgentServer___deviceRemovedFromAccount___block_invoke;
  block[3] = &unk_1E6A16CE0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__HMDKeyTransferAgentServer___deviceRemovedFromAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 valueForKey:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _device:v5 removedFromAccount:v8];
}

- (void)_device:(id)a3 removedFromAccount:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [v8 UUIDString];

  if (v6
    && v7
    && (+[HMDAppleAccountManager sharedManager],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 account],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v7 isEqual:v11],
        v11,
        v10,
        (v12 & 1) != 0))
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    long long v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v23 = 138543618;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Got notification that %@ was removed from the current account", (uint8_t *)&v23, 0x16u);
    }
    id v17 = [(HMDKeyTransferAgentServer *)v14 broadcastNotifiedDevices];
    [v17 addObject:v6];
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    uint64_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = HMFGetLogIdentifier();
      char v22 = [v7 shortDescription];
      int v23 = 138543874;
      uint64_t v24 = v21;
      __int16 v25 = 2112;
      v26 = v9;
      __int16 v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Device %@ not removed from current account %@.", (uint8_t *)&v23, 0x20u);
    }
  }
}

- (void)__deviceUpdated:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HMDKeyTransferAgent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMDKeyTransferAgentServer___deviceUpdated___block_invoke;
  block[3] = &unk_1E6A16CE0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__HMDKeyTransferAgentServer___deviceUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [v4 account];
  [WeakRetained _device:v4 addedToAccount:v5];
}

- (void)__deviceAddedToAccount:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HMDKeyTransferAgent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HMDKeyTransferAgentServer___deviceAddedToAccount___block_invoke;
  block[3] = &unk_1E6A16CE0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__HMDKeyTransferAgentServer___deviceAddedToAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 valueForKey:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _device:v5 addedToAccount:v8];
}

- (void)_device:(id)a3 addedToAccount:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [v8 UUIDString];

  if (!v6
    || !v7
    || (+[HMDAppleAccountManager sharedManager],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 account],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v7 isEqual:v11],
        v11,
        v10,
        (v12 & 1) == 0))
  {
    long long v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      goto LABEL_12;
    }
    char v22 = HMFGetLogIdentifier();
    int v23 = [v7 shortDescription];
    int v24 = 138543874;
    __int16 v25 = v22;
    __int16 v26 = 2112;
    __int16 v27 = v9;
    __int16 v28 = 2112;
    uint64_t v29 = v23;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Device %@ not added / updated from current account %@.", (uint8_t *)&v24, 0x20u);

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v13 = [(HMDKeyTransferAgent *)self progressState];

  long long v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (!v17) {
      goto LABEL_11;
    }
    char v22 = HMFGetLogIdentifier();
    int v24 = 138543362;
    __int16 v25 = v22;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Not actively transferring keys. Ignoring device change message.", (uint8_t *)&v24, 0xCu);
    goto LABEL_10;
  }
  if (v17)
  {
    id v18 = HMFGetLogIdentifier();
    int v24 = 138543618;
    __int16 v25 = v18;
    __int16 v26 = 2112;
    __int16 v27 = v9;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Got notification that %@ was added to the current account (restarting broadcast timer)", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v19 = [(HMDKeyTransferAgentServer *)v15 broadcastNotifiedDevices];
  [v19 removeObject:v6];

  uint64_t v20 = [(HMDKeyTransferAgentServer *)v15 broadcastUUIDTimer];
  [v20 reset];

  int v21 = [(HMDKeyTransferAgentServer *)v15 broadcastUUIDTimer];
  [v21 resume];

LABEL_12:
}

- (void)timerDidFire:(id)a3
{
  id v4 = [(HMDKeyTransferAgent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setBroadcastFailure:0];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v2 = +[HMDAppleAccountManager sharedManager];
  v3 = [v2 account];
  id v4 = [v3 devices];
  id v5 = (void *)[v4 copy];

  id obj = v5;
  uint64_t v46 = [v5 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v46)
  {
    v43 = v49;
    uint64_t v45 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v52 != v45) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 32), "broadcastNotifiedDevices", v43);
        char v9 = [v8 containsObject:v7];

        if ((v9 & 1) == 0)
        {
          if ([v7 isCurrentDevice])
          {
            v10 = (void *)MEMORY[0x1D9452090]();
            id v11 = *(id *)(a1 + 32);
            char v12 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = HMFGetLogIdentifier();
              long long v14 = [v7 identifier];
              id v15 = [v14 UUIDString];
              *(_DWORD *)buf = 138543618;
              uint64_t v58 = v13;
              __int16 v59 = 2112;
              v60 = v15;
              _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@NOT Broadcasting UUID to %@ (don't broadcast to self (won't retry)).", buf, 0x16u);
            }
            uint64_t v16 = [*(id *)(a1 + 32) broadcastNotifiedDevices];
            [(HMDRemoteDeviceMessageDestination *)v16 addObject:v7];
          }
          else
          {
            BOOL v17 = [v7 capabilities];
            char v18 = [v17 supportsKeyTransferClient];

            uint64_t v19 = (void *)MEMORY[0x1D9452090]();
            id v20 = *(id *)(a1 + 32);
            int v21 = HMFGetOSLogHandle();
            BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
            if (v18)
            {
              if (v22)
              {
                int v23 = HMFGetLogIdentifier();
                int v24 = [v7 identifier];
                __int16 v25 = [v24 UUIDString];
                *(_DWORD *)buf = 138543618;
                uint64_t v58 = v23;
                __int16 v59 = 2112;
                v60 = v25;
                _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Broadcasting UUID to %@", buf, 0x16u);
              }
              __int16 v26 = [HMDRemoteDeviceMessageDestination alloc];
              __int16 v27 = [*(id *)(a1 + 32) uuid];
              uint64_t v16 = [(HMDRemoteDeviceMessageDestination *)v26 initWithTarget:v27 device:v7];

              __int16 v28 = [HMDRemoteMessage alloc];
              v55[0] = @"phase";
              v55[1] = @"data";
              v56[0] = @"broadcast";
              uint64_t v29 = [*(id *)(a1 + 32) currentKeyUUID];
              uint64_t v30 = [v29 UUIDString];
              v56[1] = v30;
              v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
              v32 = [(HMDRemoteMessage *)v28 initWithName:@"kKeyTransferAgentKey" destination:v16 payload:v31 type:0 timeout:0 secure:1 restriction:0.0];

              objc_initWeak((id *)buf, *(id *)(a1 + 32));
              v48[0] = MEMORY[0x1E4F143A8];
              v48[1] = 3221225472;
              v49[0] = __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_24;
              v49[1] = &unk_1E6A19048;
              v49[2] = *(void *)(a1 + 32);
              objc_copyWeak(&v50, (id *)buf);
              v49[3] = v7;
              [(HMDRemoteMessage *)v32 setResponseHandler:v48];
              v33 = [*(id *)(a1 + 32) broadcastGroup];
              dispatch_group_enter(v33);

              v34 = [*(id *)(a1 + 32) homeManager];
              v35 = [v34 messageDispatcher];
              [v35 sendMessage:v32 completionHandler:0];

              objc_destroyWeak(&v50);
              objc_destroyWeak((id *)buf);
            }
            else
            {
              if (v22)
              {
                int v36 = HMFGetLogIdentifier();
                v37 = [v7 identifier];
                v38 = [v37 UUIDString];
                *(_DWORD *)buf = 138543618;
                uint64_t v58 = v36;
                __int16 v59 = 2112;
                v60 = v38;
                _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@NOT Broadcasting UUID to %@ (doesn't support key transfer)", buf, 0x16u);
              }
              uint64_t v16 = [*(id *)(a1 + 32) broadcastNotifiedDevices];
              [(HMDRemoteDeviceMessageDestination *)v16 addObject:v7];
            }
          }
        }
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v46);
  }

  v40 = *(void **)(a1 + 32);
  char v39 = (id *)(a1 + 32);
  v41 = [v40 broadcastGroup];
  v42 = [*v39 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_2_27;
  block[3] = &unk_1E6A19B30;
  void block[4] = *v39;
  dispatch_group_notify(v41, v42, block);
}

void __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_2;
  v6[3] = &unk_1E6A17780;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v9);
}

void __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_2_27(uint64_t a1)
{
  if (([*(id *)(a1 + 32) broadcastFailure] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) broadcastUUIDTimer];
    [v2 reset];
  }
}

void __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_2(id *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v3 = a1[4];
    if (!v3)
    {
      id v6 = [a1[5] workQueue];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_25;
      int v21 = &unk_1E6A197C8;
      id v7 = WeakRetained;
      id v8 = a1[6];
      id v22 = v7;
      id v23 = v8;
      dispatch_async(v6, &v18);

LABEL_12:
      BOOL v17 = objc_msgSend(WeakRetained, "broadcastGroup", v18, v19, v20, v21);
      dispatch_group_leave(v17);

      goto LABEL_13;
    }
    id v4 = [v3 domain];
    id v5 = v4;
    if (v4 == (void *)*MEMORY[0x1E4F2D140])
    {
      uint64_t v9 = [a1[4] code];

      if (v9 == 3)
      {
        uint64_t v10 = 0;
LABEL_9:
        id v11 = (void *)MEMORY[0x1D9452090]([WeakRetained setBroadcastFailure:v10]);
        id v12 = a1[5];
        uint64_t v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          long long v14 = HMFGetLogIdentifier();
          id v15 = [a1[6] remoteDestinationString];
          id v16 = a1[4];
          *(_DWORD *)buf = 138543874;
          __int16 v25 = v14;
          __int16 v26 = 2112;
          __int16 v27 = v15;
          __int16 v28 = 2112;
          id v29 = v16;
          _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Broadcast failed to %@: %@", buf, 0x20u);
        }
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v10 = 1;
    goto LABEL_9;
  }
LABEL_13:
}

void __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_25(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) broadcastNotifiedDevices];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (BOOL)_endAdvertiseUUIDWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDKeyTransferAgentServer *)self _httpMessageTransport];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = [(HMDKeyTransferAgentServer *)v7 currentKeyUUID];
    id v11 = [v10 UUIDString];
    int v15 = 138543618;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Ending UUID Advertisement (%@)", (uint8_t *)&v15, 0x16u);
  }
  [v5 removeTXTRecordValueForKey:@"uuid"];
  id v12 = [(HMDKeyTransferAgentServer *)v7 broadcastUUIDTimer];
  [v12 suspend];

  uint64_t v13 = [(HMDKeyTransferAgentServer *)v7 broadcastUUIDTimer];
  [v13 reset];

  if (a3) {
    *a3 = 0;
  }

  return 1;
}

- (BOOL)_startAdvertiseUUIDWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDKeyTransferAgentServer *)self _httpMessageTransport];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = [(HMDKeyTransferAgentServer *)v7 currentKeyUUID];
    id v11 = [v10 UUIDString];
    int v21 = 138543618;
    id v22 = v9;
    __int16 v23 = 2112;
    int v24 = v11;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Beginning UUID Advertisement (%@)", (uint8_t *)&v21, 0x16u);
  }
  id v12 = [(HMDKeyTransferAgentServer *)v7 currentKeyUUID];
  uint64_t v13 = [v12 UUIDString];
  long long v14 = [v13 dataUsingEncoding:4];
  [v5 setTXTRecordValue:v14 forKey:@"uuid"];

  int v15 = [(HMDKeyTransferAgent *)v7 homeManager];
  [v15 startLocalTransport];

  id v16 = [(HMDKeyTransferAgentServer *)v7 _httpMessageTransport];
  [v16 setServerEnabled:1];

  __int16 v17 = [(HMDKeyTransferAgentServer *)v7 broadcastNotifiedDevices];
  [v17 removeAllObjects];

  uint64_t v18 = [(HMDKeyTransferAgentServer *)v7 broadcastUUIDTimer];
  [v18 reset];

  uint64_t v19 = [(HMDKeyTransferAgentServer *)v7 broadcastUUIDTimer];
  [v19 resume];

  if (a3) {
    *a3 = 0;
  }

  return 1;
}

- (void)resetConfig
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting Configuration (resetting any hosts we've broadcast keys to).", buf, 0xCu);
  }
  id v7 = [(HMDKeyTransferAgent *)v4 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HMDKeyTransferAgentServer_resetConfig__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = v4;
  dispatch_async(v7, block);
}

uint64_t __40__HMDKeyTransferAgentServer_resetConfig__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) broadcastNotifiedDevices];
  [v2 removeAllObjects];

  id v3 = *(void **)(a1 + 32);
  return [v3 setProgressState:0];
}

- (void)dealloc
{
  id v3 = [(HMDKeyTransferAgent *)self homeManager];
  id v4 = [v3 messageDispatcher];
  [v4 deregisterReceiver:self];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)HMDKeyTransferAgentServer;
  [(HMDKeyTransferAgentServer *)&v6 dealloc];
}

- (HMDKeyTransferAgentServer)initWithHomeManager:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HMDKeyTransferAgentServer;
  id v5 = [(HMDKeyTransferAgent *)&v32 initWithHomeManager:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v5;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Creating KeyTransferAgent", buf, 0xCu);
    }
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    currentKeyUUID = v7->_currentKeyUUID;
    v7->_currentKeyUUID = (NSUUID *)v10;

    id v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    broadcastNotifiedDevices = v7->_broadcastNotifiedDevices;
    v7->_broadcastNotifiedDevices = v12;

    dispatch_group_t v14 = dispatch_group_create();
    broadcastGroup = v7->_broadcastGroup;
    v7->_broadcastGroup = (OS_dispatch_group *)v14;

    v7->_broadcastFailure = 0;
    id v16 = objc_alloc(MEMORY[0x1E4F65428]);
    uint64_t v17 = [v16 initWithMinimumTimeInterval:2 maximumTimeInterval:5 exponentialFactor:30.0 options:*(double *)&keyTransferBroadcastMaximumDelay];
    broadcastUUIDTimer = v7->_broadcastUUIDTimer;
    v7->_broadcastUUIDTimer = (HMFExponentialBackoffTimer *)v17;

    [(HMFExponentialBackoffTimer *)v7->_broadcastUUIDTimer setDelegate:v7];
    uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v7 selector:sel___deviceAddedToAccount_ name:@"HMDAccountAddedDeviceNotification" object:0];

    id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v7 selector:sel___deviceUpdated_ name:@"HMDDeviceUpdatedNotification" object:0];

    int v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v7 selector:sel___deviceRemovedFromAccount_ name:@"HMDAccountRemovedDeviceNotification" object:0];

    id v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v7 selector:sel___resetTimer_ name:@"HMDHomeManagerKeyTransferResetTimerNotification" object:0];

    __int16 v23 = [HMDRemoteAccountMessageFilter alloc];
    int v24 = [(HMDKeyTransferAgent *)v7 messageDestination];
    uint64_t v25 = [(HMDRemoteAccountMessageFilter *)v23 initWithTarget:v24];

    __int16 v26 = [v4 msgFilterChain];
    [v26 addMessageFilter:v25];

    __int16 v27 = +[HMDRemoteMessagePolicy defaultPolicy];
    [v27 setRequiresSecureMessage:0];
    [v27 setRequiresAccountMessage:1];
    [v27 setTransportRestriction:-1];
    __int16 v28 = (void *)[v27 copy];
    id v29 = [v4 messageDispatcher];
    v33 = v28;
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    [v29 registerForMessage:@"kKeyTransferAgentKey" receiver:v7 policies:v30 selector:sel__handleKeyTransferAgentMessage_];
  }
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t45_104152 != -1) {
    dispatch_once(&logCategory__hmf_once_t45_104152, &__block_literal_global_104153);
  }
  id v2 = (void *)logCategory__hmf_once_v46_104154;
  return v2;
}

uint64_t __40__HMDKeyTransferAgentServer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v46_104154;
  logCategory__hmf_once_v46_104154 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isPeerAvailable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v3 = [v2 productClass];

  if (v3 == 4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = +[HMDAppleAccountManager sharedManager];
    id v5 = [v4 account];
    objc_super v6 = [v5 devices];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) capabilities];
          char v11 = [v10 supportsKeyTransferClient];

          if (v11)
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

@end