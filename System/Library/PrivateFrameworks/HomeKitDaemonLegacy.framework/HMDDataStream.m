@interface HMDDataStream
- (BOOL)firstMessageReceived;
- (BOOL)isActive;
- (HAPSecuritySessionEncryption)sessionEncryption;
- (HMDDataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6;
- (HMDDataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6 connectionTimer:(id)a7 helloMessageResponseTimer:(id)a8;
- (HMDDataStreamControlProtocol)controlProtocol;
- (HMDDataStreamDelegate)delegate;
- (HMDDataStreamTransport)transport;
- (HMFTimer)connectionTimer;
- (HMFTimer)helloMessageResponseTimer;
- (NSMapTable)protocols;
- (NSMutableArray)pendingEvents;
- (NSMutableSet)pendingRequests;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)protocolWithName:(id)a3;
- (unint64_t)nextRequestIdentifier;
- (void)_evaluateActiveStatusChange;
- (void)_failPendingMessagesWithError:(void *)a1;
- (void)_sendMessageWithHeader:(void *)a3 payload:(void *)a4 completion:;
- (void)addProtocol:(id)a3 name:(id)a4;
- (void)close;
- (void)connect;
- (void)fulfillPendingRequestWithResponseHeader:(void *)a3 payload:;
- (void)sendEventForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6;
- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 identifier:(unint64_t)a5 payload:(id)a6 completion:(id)a7;
- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6;
- (void)sendResponseForRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5 completion:(id)a6;
- (void)setActive:(BOOL)a3;
- (void)setConnectionTimer:(id)a3;
- (void)setControlProtocol:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstMessageReceived:(BOOL)a3;
- (void)setHelloMessageResponseTimer:(id)a3;
- (void)setNextRequestIdentifier:(unint64_t)a3;
- (void)setProtocols:(id)a3;
- (void)setSessionEncryption:(id)a3;
- (void)setTrafficClass:(unint64_t)a3;
- (void)setTransport:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)transport:(id)a3 didFailWithError:(id)a4;
- (void)transport:(id)a3 didReceiveRawFrame:(id)a4;
- (void)transportDidClose:(id)a3;
- (void)transportDidOpen:(id)a3;
@end

@implementation HMDDataStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_helloMessageResponseTimer, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_controlProtocol, 0);
  objc_storeStrong((id *)&self->_protocols, 0);
  objc_storeStrong((id *)&self->_sessionEncryption, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSMutableArray)pendingEvents
{
  return self->_pendingEvents;
}

- (NSMutableSet)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setNextRequestIdentifier:(unint64_t)a3
{
  self->_nextRequestIdentifier = a3;
}

- (unint64_t)nextRequestIdentifier
{
  return self->_nextRequestIdentifier;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setHelloMessageResponseTimer:(id)a3
{
}

- (HMFTimer)helloMessageResponseTimer
{
  return self->_helloMessageResponseTimer;
}

- (void)setConnectionTimer:(id)a3
{
}

- (HMFTimer)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setFirstMessageReceived:(BOOL)a3
{
  self->_firstMessageReceived = a3;
}

- (BOOL)firstMessageReceived
{
  return self->_firstMessageReceived;
}

- (void)setControlProtocol:(id)a3
{
}

- (HMDDataStreamControlProtocol)controlProtocol
{
  return self->_controlProtocol;
}

- (void)setProtocols:(id)a3
{
}

- (NSMapTable)protocols
{
  return self->_protocols;
}

- (void)setSessionEncryption:(id)a3
{
}

- (HAPSecuritySessionEncryption)sessionEncryption
{
  return self->_sessionEncryption;
}

- (void)setTransport:(id)a3
{
}

- (HMDDataStreamTransport)transport
{
  return self->_transport;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDDataStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDDataStreamDelegate *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDDataStream *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDDataStream *)self connectionTimer];

  if (v6 == v4)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v11;
      v12 = "%{public}@Data stream failed to connect in time; closing!";
      goto LABEL_7;
    }
LABEL_8:

    [(HMDDataStream *)self close];
    goto LABEL_9;
  }
  id v7 = [(HMDDataStream *)self helloMessageResponseTimer];

  if (v7 == v4)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v11;
      v12 = "%{public}@Data stream failed to receive first message in time; closing!";
LABEL_7:
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)transport:(id)a3 didReceiveRawFrame:(id)a4
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDDataStream *)self delegate];
  v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v146 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Data stream received frame", buf, 0xCu);
    }
    [v8 dataStreamDidReceiveRawFrame:v10];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v146 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Data stream received frame; but no delegate",
        buf,
        0xCu);
    }
  }
  if ([v7 length])
  {
    id v15 = v7;
    int v16 = *(unsigned __int8 *)[v15 bytes];
    switch(v16)
    {
      case 0:
      case 2:
        v17 = (void *)MEMORY[0x1D9452090]();
        v18 = v10;
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v146 = v20;
          __int16 v147 = 1024;
          LODWORD(v148) = v16;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Data stream failed due to unrecognized frame type 0x%02x", buf, 0x12u);
        }
        goto LABEL_25;
      case 1:
        v25 = [(HMDDataStream *)v10 sessionEncryption];

        if (v25)
        {
          v26 = [(HMDDataStream *)v10 sessionEncryption];
          id v139 = 0;
          id v140 = 0;
          id v138 = 0;
          BOOL v27 = +[HMDDataStreamMessageCoder decryptEncryptedOPACKFrame:v15 sessionEncryption:v26 receivedHeader:&v140 receivedPayload:&v139 error:&v138];
          id v28 = v140;
          id v29 = v139;
          v30 = (__CFString *)v138;

          if (!v30) {
            goto LABEL_32;
          }
          goto LABEL_26;
        }
        v17 = (void *)MEMORY[0x1D9452090]();
        v35 = v10;
        v19 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v146 = v33;
        v34 = "%{public}@Data stream failed due to receiving unencrypted frame";
        goto LABEL_24;
      case 3:
        v31 = [(HMDDataStream *)v10 sessionEncryption];

        if (v31)
        {
          v17 = (void *)MEMORY[0x1D9452090]();
          v32 = v10;
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v146 = v33;
            v34 = "%{public}@Data stream failed due to receiving encrypted frame";
LABEL_24:
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, v34, buf, 0xCu);
          }
LABEL_25:

          v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
          id v28 = 0;
          id v29 = 0;
          goto LABEL_26;
        }
        id v136 = 0;
        id v137 = 0;
        id v135 = 0;
        BOOL v27 = +[HMDDataStreamMessageCoder unpackUnencryptedOPACKFrame:v15 receivedHeader:&v137 receivedPayload:&v136 error:&v135];
        id v28 = v137;
        id v29 = v136;
        v30 = (__CFString *)v135;
        if (v30) {
          goto LABEL_26;
        }
LABEL_32:
        if (!v27)
        {
LABEL_26:
          v36 = (void *)MEMORY[0x1D9452090]();
          v37 = v10;
          v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v39 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v146 = v39;
            __int16 v147 = 2112;
            v148 = v30;
            _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@DataStream dropping incoming message (%@)", buf, 0x16u);
          }

LABEL_29:
          goto LABEL_30;
        }
        if ([(HMDDataStream *)v10 firstMessageReceived])
        {
          v133 = v29;
          v40 = [v28 objectForKeyedSubscript:@"response"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v41 = v40;
          }
          else {
            v41 = 0;
          }
          id v42 = v41;

          if (v42)
          {
            id v29 = v133;
            -[HMDDataStream fulfillPendingRequestWithResponseHeader:payload:](v10, v28, v133);
LABEL_117:

            goto LABEL_29;
          }
          v59 = [v28 objectForKeyedSubscript:@"protocol"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v60 = v59;
          }
          else {
            v60 = 0;
          }
          v61 = v60;

          if (!v61)
          {
            v109 = (void *)MEMORY[0x1D9452090]();
            v110 = v10;
            v111 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
            {
LABEL_94:

              v40 = 0;
LABEL_115:
              id v29 = v133;
              goto LABEL_116;
            }
            v112 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v146 = v112;
            v113 = "%{public}@DataStream dropping incoming message (header missing protocol)";
LABEL_93:
            _os_log_impl(&dword_1D49D5000, v111, OS_LOG_TYPE_INFO, v113, buf, 0xCu);

            goto LABEL_94;
          }
          if ([(__CFString *)v61 isEqual:@"control"])
          {
            v40 = [v28 objectForKeyedSubscript:@"event"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v62 = v40;
            }
            else {
              v62 = 0;
            }
            id v63 = v62;

            if (v63)
            {
              v64 = [(HMDDataStream *)v10 controlProtocol];
              [v64 dataStream:v10 didReceiveEvent:v63 header:v28 payload:v133];

              id v29 = v133;
LABEL_116:

              goto LABEL_117;
            }
            v40 = [v28 objectForKeyedSubscript:@"request"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v118 = v40;
            }
            else {
              v118 = 0;
            }
            id v119 = v118;

            if (v119)
            {
              v120 = [(HMDDataStream *)v10 controlProtocol];
              [v120 dataStream:v10 didReceiveRequest:v119 header:v28 payload:v133];

              id v29 = v133;
              goto LABEL_116;
            }
            goto LABEL_119;
          }
          v114 = [(HMDDataStream *)v10 protocols];
          v115 = [v114 objectForKey:v61];

          if (v115)
          {
            v40 = [v28 objectForKeyedSubscript:@"event"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v116 = v40;
            }
            else {
              v116 = 0;
            }
            id v117 = v116;

            if (v117)
            {
              [v115 dataStream:v10 didReceiveEvent:v117 header:v28 payload:v133];
            }
            else
            {
              v40 = [v28 objectForKeyedSubscript:@"request"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v125 = v40;
              }
              else {
                v125 = 0;
              }
              id v126 = v125;

              if (!v126)
              {

LABEL_119:
                v109 = (void *)MEMORY[0x1D9452090]();
                v110 = v10;
                v111 = HMFGetOSLogHandle();
                if (!os_log_type_enabled(v111, OS_LOG_TYPE_INFO)) {
                  goto LABEL_94;
                }
                v112 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v146 = v112;
                v113 = "%{public}@Message received but no protocol accepted it; dropped!";
                goto LABEL_93;
              }
              [v115 dataStream:v10 didReceiveRequest:v126 header:v28 payload:v133];
            }
          }
          else
          {
            v121 = (void *)MEMORY[0x1D9452090]();
            v122 = v10;
            v123 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
            {
              v124 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v146 = v124;
              __int16 v147 = 2112;
              v148 = v61;
              _os_log_impl(&dword_1D49D5000, v123, OS_LOG_TYPE_INFO, "%{public}@DataStream dropping incoming message (no protocol named %@)", buf, 0x16u);
            }
            v40 = 0;
          }

          goto LABEL_115;
        }
        id v28 = v28;
        id v29 = v29;
        id v131 = v7;
        id v132 = v6;
        v134 = v29;
        if (!v10) {
          goto LABEL_67;
        }
        id v43 = [v28 objectForKeyedSubscript:@"protocol"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v44 = v43;
        }
        else {
          v44 = 0;
        }
        id v45 = v44;

        if ([v45 isEqualToString:@"control"])
        {
          id v46 = [v28 objectForKeyedSubscript:@"response"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v47 = v46;
          }
          else {
            v47 = 0;
          }
          id v48 = v47;

          if (v48)
          {
            v49 = [(HMDDataStream *)v10 controlProtocol];
            v50 = v48;
            id v29 = v134;
            [v49 dataStream:v10 didReceiveResponse:v46 header:v28 payload:v134];

            v51 = [(HMDDataStream *)v10 controlProtocol];
            v52 = v45;
            char v53 = [v51 helloMessageResponseReceived];

            id v7 = v131;
            id v6 = v132;
            if (v53)
            {
LABEL_71:
              -[HMDDataStream setFirstMessageReceived:](v10, "setFirstMessageReceived:", 1, v127);
              v71 = [(HMDDataStream *)v10 helloMessageResponseTimer];
              [v71 suspend];

              [(HMDDataStream *)v10 setHelloMessageResponseTimer:0];
              if (v10)
              {
                v72 = [(HMDDataStream *)v10 pendingRequests];
                v73 = (void *)[v72 copy];

                v74 = (void *)MEMORY[0x1D9452090]();
                v75 = v10;
                v76 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v78 = v77 = v73;
                  contexta = v74;
                  v79 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v77, "count"));
                  *(_DWORD *)v151 = 138543618;
                  v152 = v78;
                  __int16 v153 = 2112;
                  v154 = v79;
                  _os_log_impl(&dword_1D49D5000, v76, OS_LOG_TYPE_INFO, "%{public}@Sending out all pending requests [%@]", v151, 0x16u);

                  v74 = contexta;
                  v73 = v77;
                }

                v80 = [(HMDDataStream *)v75 pendingRequests];
                [v80 removeAllObjects];

                long long v143 = 0u;
                long long v144 = 0u;
                long long v141 = 0u;
                long long v142 = 0u;
                id v81 = v73;
                uint64_t v82 = [v81 countByEnumeratingWithState:&v141 objects:buf count:16];
                id v130 = v28;
                if (v82)
                {
                  uint64_t v83 = v82;
                  uint64_t v84 = *(void *)v142;
                  do
                  {
                    for (uint64_t i = 0; i != v83; ++i)
                    {
                      if (*(void *)v142 != v84) {
                        objc_enumerationMutation(v81);
                      }
                      v86 = *(void **)(*((void *)&v141 + 1) + 8 * i);
                      v87 = [v86 protocol];
                      v88 = [v86 topic];
                      v89 = [v86 payload];
                      v90 = [v86 callback];
                      [(HMDDataStream *)v75 sendRequestForProtocol:v87 topic:v88 payload:v89 completion:v90];
                    }
                    uint64_t v83 = [v81 countByEnumeratingWithState:&v141 objects:buf count:16];
                  }
                  while (v83);
                }

                v91 = [(HMDDataStream *)v75 pendingEvents];
                v92 = (void *)[v91 copy];

                v93 = (void *)MEMORY[0x1D9452090]();
                v94 = v75;
                v95 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
                {
                  v96 = HMFGetLogIdentifier();
                  v97 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v92, "count"));
                  *(_DWORD *)v151 = 138543618;
                  v152 = v96;
                  __int16 v153 = 2112;
                  v154 = v97;
                  _os_log_impl(&dword_1D49D5000, v95, OS_LOG_TYPE_INFO, "%{public}@Sending out all pending events [%@]", v151, 0x16u);
                }
                v98 = [(HMDDataStream *)v94 pendingEvents];
                [v98 removeAllObjects];

                long long v143 = 0u;
                long long v144 = 0u;
                long long v141 = 0u;
                long long v142 = 0u;
                id v99 = v92;
                uint64_t v100 = [v99 countByEnumeratingWithState:&v141 objects:buf count:16];
                if (v100)
                {
                  uint64_t v101 = v100;
                  uint64_t v102 = *(void *)v142;
                  do
                  {
                    for (uint64_t j = 0; j != v101; ++j)
                    {
                      if (*(void *)v142 != v102) {
                        objc_enumerationMutation(v99);
                      }
                      v104 = *(void **)(*((void *)&v141 + 1) + 8 * j);
                      v105 = [v104 protocol];
                      v106 = [v104 topic];
                      v107 = [v104 payload];
                      v108 = [v104 completion];
                      [(HMDDataStream *)v94 sendEventForProtocol:v105 topic:v106 payload:v107 completion:v108];
                    }
                    uint64_t v101 = [v99 countByEnumeratingWithState:&v141 objects:buf count:16];
                  }
                  while (v101);
                }

                id v7 = v131;
                id v6 = v132;
                id v28 = v130;
                id v29 = v134;
              }
              goto LABEL_29;
            }
LABEL_68:
            v67 = (void *)MEMORY[0x1D9452090]();
            v68 = v10;
            v69 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              v70 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v146 = v70;
              _os_log_impl(&dword_1D49D5000, v69, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected first message on the data stream", buf, 0xCu);
            }
            [(HMDDataStream *)v68 close];
            goto LABEL_71;
          }
          context = (void *)MEMORY[0x1D9452090]();
          v65 = v10;
          v66 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v127 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v146 = v127;
            __int16 v147 = 2112;
            v148 = @"response";
            __int16 v149 = 2112;
            id v150 = v46;
            _os_log_impl(&dword_1D49D5000, v66, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected %@ key value: %@", buf, 0x20u);
          }

          id v7 = v131;
        }
        else
        {
          id v54 = v45;
          v55 = (void *)MEMORY[0x1D9452090]();
          v56 = v10;
          v57 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v58 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v146 = v58;
            __int16 v147 = 2112;
            v148 = @"control";
            __int16 v149 = 2112;
            id v150 = v43;
            _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, "%{public}@Expected protocol name: %@ received: %@", buf, 0x20u);
          }
          id v7 = v131;
          id v6 = v132;
          id v45 = v54;
        }

        id v29 = v134;
LABEL_67:

        goto LABEL_68;
      default:
        id v28 = 0;
        id v29 = 0;
        v30 = 0;
        goto LABEL_26;
    }
  }
  v21 = (void *)MEMORY[0x1D9452090]();
  v22 = v10;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v146 = v24;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@DataStream dropping truncated frame of zero-length", buf, 0xCu);
  }
LABEL_30:
}

- (void)fulfillPendingRequestWithResponseHeader:(void *)a3 payload:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!a1) {
    goto LABEL_19;
  }
  v30 = a1;
  id v31 = v6;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v8 = [a1 pendingRequests];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v37;
  uint64_t v32 = *(void *)v37;
  v33 = v8;
  do
  {
    uint64_t v12 = 0;
    uint64_t v35 = v10;
    do
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
      id v14 = v5;
      if (v13)
      {
        id v15 = [v13 topic];
        int v16 = [v14 objectForKeyedSubscript:@"response"];
        if (![v15 isEqual:v16]) {
          goto LABEL_13;
        }
        v17 = [v13 identifier];
        v18 = [v14 objectForKeyedSubscript:@"id"];
        if (![v17 isEqual:v18])
        {

          uint64_t v10 = v35;
LABEL_13:

          goto LABEL_14;
        }
        v19 = [v13 protocol];
        [v14 objectForKeyedSubscript:@"protocol"];
        v21 = id v20 = v5;
        char v34 = [v19 isEqual:v21];

        id v5 = v20;
        uint64_t v11 = v32;

        v8 = v33;
        uint64_t v10 = v35;
        if (v34)
        {

          id v27 = v13;
          id v28 = [v27 callback];
          id v7 = v31;
          ((void (**)(void, void, id, id))v28)[2](v28, 0, v14, v31);

          id v29 = [v30 pendingRequests];
          [v29 removeObject:v27];

          goto LABEL_19;
        }
      }
LABEL_14:

      ++v12;
    }
    while (v10 != v12);
    uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
  }
  while (v10);
LABEL_16:

  v22 = (void *)MEMORY[0x1D9452090]();
  id v23 = v30;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = HMFGetLogIdentifier();
    v26 = [v23 pendingRequests];
    *(_DWORD *)buf = 138543874;
    v41 = v25;
    __int16 v42 = 2112;
    id v43 = v5;
    __int16 v44 = 2112;
    id v45 = v26;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@No pending request found for response with header: %@. Pending %@", buf, 0x20u);
  }
  id v7 = v31;
LABEL_19:
}

- (void)transportDidOpen:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HMDDataStream *)self setConnectionTimer:0];
  id v5 = [(HMDDataStream *)self delegate];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream OPEN!", buf, 0xCu);
    }
    [v5 dataStreamDidOpen:v7];
  }
  else
  {
    if (v9)
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v11;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream OPEN (but no delegate!)", buf, 0xCu);
    }
  }
  uint64_t v12 = [(HMDDataStream *)v7 controlProtocol];
  [v12 dataStreamDidOpen:v7];

  if (v7)
  {
    v13 = [(HMDDataStream *)v7 helloMessageResponseTimer];
    [v13 setDelegate:v7];

    id v14 = [(HMDDataStream *)v7 workQueue];
    id v15 = [(HMDDataStream *)v7 helloMessageResponseTimer];
    [v15 setDelegateQueue:v14];

    int v16 = [(HMDDataStream *)v7 helloMessageResponseTimer];
    [v16 resume];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v17 = [(HMDDataStream *)v7 protocols];
  v18 = [v17 objectEnumerator];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v24 + 1) + 8 * v22);
        if (v23) {
          [v23 dataStreamDidOpen:v7];
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v20);
  }
}

- (void)transportDidClose:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDDataStream *)self delegate];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v25 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream closed", buf, 0xCu);
    }
    [v5 dataStreamDidClose:v7];
  }
  else
  {
    if (v9)
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v25 = v11;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream closed (but no delegate!)", buf, 0xCu);
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [(HMDDataStream *)v7 protocols];
  v13 = [v12 objectEnumerator];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v17++) dataStreamDidClose:v7];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  v18 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1061];
  -[HMDDataStream _failPendingMessagesWithError:](v7, v18);
}

- (void)_failPendingMessagesWithError:(void *)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = [a1 pendingRequests];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v9 = [*(id *)(*((void *)&v22 + 1) + 8 * v8) callback];
          ((void (**)(void, id, void, void))v9)[2](v9, v3, 0, 0);

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    uint64_t v10 = [a1 pendingRequests];
    [v10 removeAllObjects];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = objc_msgSend(a1, "pendingEvents", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v18 + 1) + 8 * v15) completion];
          ((void (**)(void, id))v16)[2](v16, v3);

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [a1 pendingEvents];
    [v17 removeAllObjects];
  }
}

- (void)transport:(id)a3 didFailWithError:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDDataStream *)self delegate];
  BOOL v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  uint64_t v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v13;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Data stream failure (%@)", buf, 0x16u);
    }
    [v8 dataStream:v10 didFailWithError:v7];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Data stream failure (%@); but no delegate",
        buf,
        0x16u);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = [(HMDDataStream *)v10 protocols];
  uint64_t v16 = [v15 objectEnumerator];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v22 + 1) + 8 * v20);
        if (v21) {
          [v21 dataStream:v10 didFailWithError:v7];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }

  -[HMDDataStream _failPendingMessagesWithError:](v10, v7);
}

- (void)setTrafficClass:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1D9452090](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting traffic class %lu on transport", (uint8_t *)&v10, 0x16u);
  }
  BOOL v9 = [(HMDDataStream *)v6 transport];
  [v9 setTrafficClass:a3];
}

- (void)_evaluateActiveStatusChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    v2 = [result workQueue];
    dispatch_assert_queue_V2(v2);

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = objc_msgSend(v1, "protocols", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v8 = [v1 protocols];
          BOOL v9 = [v8 objectForKey:v7];
          char v10 = [v9 isActive];

          if (v10)
          {
            uint64_t v4 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    return (void *)[v1 setActive:v4];
  }
  return result;
}

- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self)
  {
    unint64_t v14 = [(HMDDataStream *)self nextRequestIdentifier];
    [(HMDDataStream *)self setNextRequestIdentifier:[(HMDDataStream *)self nextRequestIdentifier] + 1];
    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:v14];
  }
  else
  {
    uint64_t v15 = 0;
  }
  if ([(HMDDataStream *)self firstMessageReceived])
  {
    uint64_t v16 = [(HMDDataStream *)self controlProtocol];
    char v17 = [v16 helloMessageResponseReceived];

    if ((v17 & 1) == 0)
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1062];
      (*((void (**)(id, void *, void, void))v13 + 2))(v13, v20, 0, 0);

      goto LABEL_9;
    }
    uint64_t v18 = +[HMDDataStreamMessageCoder requestHeaderForProtocol:v10 topic:v11 identifier:v15];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__HMDDataStream_sendRequestForProtocol_topic_payload_completion___block_invoke;
    v21[3] = &unk_1E6A098D8;
    id v27 = v13;
    id v22 = v15;
    id v23 = v10;
    id v24 = v11;
    id v25 = v12;
    uint64_t v26 = self;
    -[HMDDataStream _sendMessageWithHeader:payload:completion:](self, v18, v25, v21);
  }
  else
  {
    uint64_t v18 = [[HMDDataStreamPendingRequest alloc] initWithIdentifier:v15 protocol:v10 topic:v11 payload:v12 callback:v13];
    uint64_t v19 = [(HMDDataStream *)self pendingRequests];
    [v19 addObject:v18];
  }
LABEL_9:
}

void __65__HMDDataStream_sendRequestForProtocol_topic_payload_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v4 = [[HMDDataStreamPendingRequest alloc] initWithIdentifier:*(void *)(a1 + 32) protocol:*(void *)(a1 + 40) topic:*(void *)(a1 + 48) payload:*(void *)(a1 + 56) callback:*(void *)(a1 + 72)];
    uint64_t v5 = [*(id *)(a1 + 64) pendingRequests];
    [v5 addObject:v4];

    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 64);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@DataStream pending the request: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_sendMessageWithHeader:(void *)a3 payload:(void *)a4 completion:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  BOOL v9 = a4;
  if (a1)
  {
    int v10 = [a1 sessionEncryption];

    if (v10)
    {
      id v11 = [a1 sessionEncryption];
      id v23 = 0;
      __int16 v12 = +[HMDDataStreamMessageCoder encryptEncryptedOPACKHeader:v7 payload:v8 sessionEncryption:v11 error:&v23];
      id v13 = v23;
    }
    else
    {
      id v22 = 0;
      __int16 v12 = +[HMDDataStreamMessageCoder buildUnencryptedOPACKHeader:v7 payload:v8 error:&v22];
      id v13 = v22;
    }
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = a1;
    uint64_t v16 = HMFGetOSLogHandle();
    char v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v25 = v18;
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@DataStream encoding message failed (%@)", buf, 0x16u);
      }
      v9[2](v9, v13);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        uint64_t v20 = [v15 pendingRequests];
        *(_DWORD *)buf = 138543874;
        id v25 = v19;
        __int16 v26 = 2112;
        id v27 = v7;
        __int16 v28 = 2112;
        __int16 v29 = v20;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@DataStream Sending Message: %@ --> %@", buf, 0x20u);
      }
      long long v21 = [v15 transport];
      [v21 sendRawFrame:v12 completion:v9];
    }
  }
}

- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 identifier:(unint64_t)a5 payload:(id)a6 completion:(id)a7
{
  __int16 v12 = NSNumber;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  char v17 = [v12 numberWithUnsignedInteger:a5];
  id v18 = +[HMDDataStreamMessageCoder requestHeaderForProtocol:v16 topic:v15 identifier:v17];

  -[HMDDataStream _sendMessageWithHeader:payload:completion:](self, v18, v14, v13);
}

- (void)sendResponseForRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5 completion:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = +[HMDDataStreamMessageCoder responseHeaderForRequestHeader:a3 status:v6];
  -[HMDDataStream _sendMessageWithHeader:payload:completion:](self, v12, v11, v10);
}

- (void)sendEventForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(HMDDataStream *)self firstMessageReceived])
  {
    id v13 = [(HMDDataStream *)self controlProtocol];
    char v14 = [v13 helloMessageResponseReceived];

    if (v14)
    {
      id v15 = +[HMDDataStreamMessageCoder eventHeaderForProtocol:v17 topic:v10];
      -[HMDDataStream _sendMessageWithHeader:payload:completion:](self, v15, v11, v12);
    }
    else
    {
      id v15 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1062];
      (*((void (**)(id, HMDDataStreamPendingEvent *))v12 + 2))(v12, v15);
    }
  }
  else
  {
    id v15 = [[HMDDataStreamPendingEvent alloc] initWithProtocol:v17 topic:v10 payload:v11 completion:v12];
    id v16 = [(HMDDataStream *)self pendingEvents];
    [v16 addObject:v15];
  }
}

- (id)protocolWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDDataStream *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDDataStream *)self protocols];
  id v7 = [v6 objectForKey:v4];

  return v7;
}

- (void)addProtocol:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDDataStream *)self protocols];
  [v8 setObject:v7 forKey:v6];

  -[HMDDataStream _evaluateActiveStatusChange](self);
}

- (void)close
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream closing", buf, 0xCu);
  }
  id v7 = [(HMDDataStream *)v4 transport];
  [v7 close];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(HMDDataStream *)v4 protocols];
  BOOL v9 = [v8 objectEnumerator];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) dataStreamInitiatedClose:v4];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)connect
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v12 = 138543362;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream connecting", (uint8_t *)&v12, 0xCu);
  }
  if (v4)
  {
    id v7 = [(HMDDataStream *)v4 connectionTimer];
    [v7 setDelegate:v4];

    id v8 = [(HMDDataStream *)v4 workQueue];
    BOOL v9 = [(HMDDataStream *)v4 connectionTimer];
    [v9 setDelegateQueue:v8];

    uint64_t v10 = [(HMDDataStream *)v4 connectionTimer];
    [v10 resume];
  }
  uint64_t v11 = [(HMDDataStream *)v4 transport];
  [v11 connect];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMDDataStream *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_active != v3)
  {
    self->_active = v3;
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = HMFGetLogIdentifier();
      uint64_t v10 = HMFBooleanToString();
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      long long v15 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@DataStream changes active to %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v11 = [(HMDDataStream *)v7 delegate];
    [v11 dataStreamDidUpdateActiveStatus:v7];
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (HMDDataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6 connectionTimer:(id)a7 helloMessageResponseTimer:(id)a8
{
  id v33 = a3;
  id v32 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HMDDataStream;
  uint64_t v19 = [(HMDDataStream *)&v34 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_transport, a3);
    objc_storeStrong((id *)&v20->_sessionEncryption, a4);
    objc_storeStrong((id *)&v20->_workQueue, a5);
    uint64_t v21 = objc_msgSend(v16, "copy", v32, v33);
    logIdentifier = v20->_logIdentifier;
    v20->_logIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_connectionTimer, a7);
    objc_storeStrong((id *)&v20->_helloMessageResponseTimer, a8);
    uint64_t v23 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    protocols = v20->_protocols;
    v20->_protocols = (NSMapTable *)v23;

    id v25 = [[HMDDataStreamControlProtocol alloc] initWithLogIdentifier:v16];
    controlProtocol = v20->_controlProtocol;
    v20->_controlProtocol = v25;

    id v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingRequests = v20->_pendingRequests;
    v20->_pendingRequests = v27;

    __int16 v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingEvents = v20->_pendingEvents;
    v20->_pendingEvents = v29;
  }
  return v20;
}

- (HMDDataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6
{
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F65580];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)[[v10 alloc] initWithTimeInterval:0 options:10.0];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:10.0];
  id v17 = [(HMDDataStream *)self initWithTransport:v14 sessionEncryption:v13 workQueue:v12 logIdentifier:v11 connectionTimer:v15 helloMessageResponseTimer:v16];

  return v17;
}

@end