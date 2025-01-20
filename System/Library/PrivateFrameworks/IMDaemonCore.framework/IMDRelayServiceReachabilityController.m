@interface IMDRelayServiceReachabilityController
+ (id)sharedInstance;
- (BOOL)_dedupeRequestIfNeeded:(id)a3 responseHandler:(id)a4;
- (IMDRelayServiceReachabilityController)init;
- (NSMutableDictionary)pendingRequests;
- (NSMutableDictionary)signaturesToRequestIDs;
- (NSTimer)cleanupTimer;
- (id)_expiredRequests;
- (void)_handleReachabilityResult:(id)a3 messageID:(id)a4 fromToken:(id)a5;
- (void)_startCleanupTimerIfNeeded;
- (void)_stopCleanupTimerIfNeeded;
- (void)_timeoutPendingRequest:(id)a3;
- (void)_timeoutPendingRequests;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)handler:(id)a3 incomingReachabilityRequest:(id)a4 fromToken:(id)a5 fromIdentifier:(id)a6 toIdentifier:(id)a7 messageGUID:(id)a8;
- (void)handler:(id)a3 incomingReachabilityResponse:(id)a4 fromToken:(id)a5 messageGUID:(id)a6;
- (void)setCleanupTimer:(id)a3;
- (void)setPendingRequests:(id)a3;
- (void)setSignaturesToRequestIDs:(id)a3;
@end

@implementation IMDRelayServiceReachabilityController

+ (id)sharedInstance
{
  if (qword_1EBE2BAB8 != -1) {
    dispatch_once(&qword_1EBE2BAB8, &unk_1F33924C0);
  }
  v2 = (void *)qword_1EBE2BCF8;

  return v2;
}

- (IMDRelayServiceReachabilityController)init
{
  v9.receiver = self;
  v9.super_class = (Class)IMDRelayServiceReachabilityController;
  v2 = [(IMDRelayServiceReachabilityController *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    signaturesToRequestIDs = v2->_signaturesToRequestIDs;
    v2->_signaturesToRequestIDs = v5;

    v7 = +[IMDRelayPushHandler sharedInstance];
    [v7 addListener:v2];
  }
  return v2;
}

- (BOOL)_dedupeRequestIfNeeded:(id)a3 responseHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 _signature];
  objc_super v9 = [(NSMutableDictionary *)self->_signaturesToRequestIDs objectForKeyedSubscript:v8];
  if (v9)
  {
    v10 = [(NSMutableDictionary *)self->_pendingRequests objectForKeyedSubscript:v9];
    BOOL v11 = v10 != 0;
    if (v10)
    {
      if (IMOSLoggingEnabled())
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = [v6 handleIDs];
          v14 = [v6 requestID];
          v15 = [v10 requestID];
          int v20 = 138412802;
          v21 = v13;
          __int16 v22 = 2112;
          v23 = v14;
          __int16 v24 = 2112;
          v25 = v15;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Asked to calculate reachability for %@ with ID %@, found similar in-progress request with ID %@ - will piggyback off of existing request instead of starting a new one.", (uint8_t *)&v20, 0x20u);
        }
      }
      v16 = [v10 lastResult];

      if (v16)
      {
        v17 = [v10 lastResult];
        [v7 reachabilityRequest:v6 updatedWithResult:v17];
      }
      v18 = [v10 responseHandlers];
      [v18 setObject:v7 forKey:v6];
    }
    else
    {
      [(NSMutableDictionary *)self->_signaturesToRequestIDs removeObjectForKey:v8];
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(IMDRelayServiceReachabilityController *)self _dedupeRequestIfNeeded:v6 responseHandler:v7])
  {
    v8 = [[_IMDRelayPendingServiceReachabilityRequest alloc] initWithRequest:v6 responseHandler:v7];
    pendingRequests = self->_pendingRequests;
    v10 = [v6 requestID];
    [(NSMutableDictionary *)pendingRequests setObject:v8 forKeyedSubscript:v10];

    BOOL v11 = [v6 requestID];
    signaturesToRequestIDs = self->_signaturesToRequestIDs;
    v13 = [v6 _signature];
    [(NSMutableDictionary *)signaturesToRequestIDs setObject:v11 forKeyedSubscript:v13];

    v14 = [IMDRelayServiceReachabilityRequest alloc];
    v15 = [v6 handleIDs];
    v16 = [v6 serviceName];
    v17 = [v6 context];
    v18 = [(IMDRelayServiceReachabilityRequest *)v14 initWithHandles:v15 serviceName:v16 context:v17];

    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v20 = [v6 requestID];
        v21 = [v6 serviceName];
        __int16 v22 = [v6 handleIDs];
        int v29 = 138412802;
        v30 = v20;
        __int16 v31 = 2112;
        v32 = v21;
        __int16 v33 = 2112;
        v34 = v22;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Sending reachability request with ID %@ for service %@ for handles %@", (uint8_t *)&v29, 0x20u);
      }
    }
    v23 = +[IMDRelayServiceController sharedInstance];
    __int16 v24 = [v6 requestID];
    v25 = [v23 sendReachabilityRequest:v18 requestID:v24];

    uint64_t v26 = self->_pendingRequests;
    v27 = [v6 requestID];
    v28 = [(NSMutableDictionary *)v26 objectForKeyedSubscript:v27];
    [v28 setSentToDevices:v25];

    [(IMDRelayServiceReachabilityController *)self _startCleanupTimerIfNeeded];
  }
}

- (void)handler:(id)a3 incomingReachabilityRequest:(id)a4 fromToken:(id)a5 fromIdentifier:(id)a6 toIdentifier:(id)a7 messageGUID:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v13 = a4;
  id v14 = a5;
  id v37 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = +[IMDAccountController sharedAccountController];
  v18 = [v13 serviceName];
  v19 = [v17 anySessionForServiceName:v18];

  if (!v19)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_16;
    }
    __int16 v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = objc_msgSend(v13, "serviceName", v36);
      *(_DWORD *)buf = 138412290;
      v39 = v34;
      _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Dropping incoming reachability request for unknown service name %@", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  int v20 = objc_msgSend(v19, "service", v36);
  char v21 = [v20 supportsCapability:*MEMORY[0x1E4F6E0E0]];

  int v22 = IMOSLoggingEnabled();
  if ((v21 & 1) == 0)
  {
    if (!v22) {
      goto LABEL_16;
    }
    __int16 v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = [v13 serviceName];
      *(_DWORD *)buf = 138412290;
      v39 = v35;
      _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Dropping incoming reachability request for service %@ as it does not support relayed reachability", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (v22)
  {
    v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __int16 v24 = [v13 serviceName];
      v25 = [v13 handles];
      *(_DWORD *)buf = 138412802;
      v39 = v24;
      __int16 v40 = 2112;
      id v41 = v14;
      __int16 v42 = 2112;
      v43 = v25;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Kicking off incoming reachability request for service %@ from token %@ for handles %@", buf, 0x20u);
    }
  }
  id v26 = objc_alloc(MEMORY[0x1E4F6E988]);
  v27 = [v13 handles];
  v28 = [v13 serviceName];
  int v29 = [v19 accountID];
  v30 = [v13 context];
  __int16 v31 = (void *)[v26 initWithHandleIDs:v27 requestID:v16 serviceName:v28 accountID:v29 context:v30];

  v32 = [[_IMDRelayingServiceReachabilityResponseHandler alloc] initWithRequestID:v16 pushToken:v14 fromIdentifier:v37 toIdentifier:v15];
  [v19 calculateReachabilityWithRequest:v31 responseHandler:v32];

LABEL_16:
}

- (void)_handleReachabilityResult:(id)a3 messageID:(id)a4 fromToken:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(IMDRelayServiceReachabilityController *)self pendingRequests];
  BOOL v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    if (v9)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v12 = [v11 sentToDevices];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v28;
        while (2)
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v15), "pushToken", v24);
            char v17 = [v16 isEqualToData:v9];

            if (v17)
            {

              goto LABEL_20;
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v9;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Dropping incoming reachability result from unexpected push token %@", buf, 0xCu);
        }
      }
    }
    else
    {
LABEL_20:
      if (IMOSLoggingEnabled())
      {
        int v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v32 = v8;
          __int16 v33 = 2112;
          id v34 = v24;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Handling reachability result for request ID %@ result %@", buf, 0x16u);
        }
      }
      if (objc_msgSend(v24, "isFinal", v24))
      {
        char v21 = [(IMDRelayServiceReachabilityController *)self pendingRequests];
        [v21 removeObjectForKey:v8];

        int v22 = [(IMDRelayServiceReachabilityController *)self signaturesToRequestIDs];
        [v22 removeObjectForKey:v8];
      }
      [v11 setLastResult:v24];
      v23 = [MEMORY[0x1E4F1C9C8] date];
      [v11 setLastUpdateTime:v23];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_1D9877D2C;
      v25[3] = &unk_1E6B78540;
      id v26 = v24;
      [v11 enumerateResponseHandlersWithBlock:v25];
      [(IMDRelayServiceReachabilityController *)self _stopCleanupTimerIfNeeded];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v8;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Dropping incoming reachability result for untracked request ID %@", buf, 0xCu);
    }
  }
}

- (void)handler:(id)a3 incomingReachabilityResponse:(id)a4 fromToken:(id)a5 messageGUID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = [a4 result];
  [(IMDRelayServiceReachabilityController *)self _handleReachabilityResult:v11 messageID:v9 fromToken:v10];
}

- (NSTimer)cleanupTimer
{
  return self->_cleanupTimer;
}

- (void)setCleanupTimer:(id)a3
{
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
}

- (NSMutableDictionary)signaturesToRequestIDs
{
  return self->_signaturesToRequestIDs;
}

- (void)setSignaturesToRequestIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signaturesToRequestIDs, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);

  objc_storeStrong((id *)&self->_cleanupTimer, 0);
}

- (void)_startCleanupTimerIfNeeded
{
  id v8 = [(IMDRelayServiceReachabilityController *)self pendingRequests];
  if ([v8 count])
  {
    v3 = [(IMDRelayServiceReachabilityController *)self cleanupTimer];

    if (!v3)
    {
      v4 = IMLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1D9905DB0(v4);
      }

      v5 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__timeoutPendingRequests selector:0 userInfo:1 repeats:60.0];
      [(IMDRelayServiceReachabilityController *)self setCleanupTimer:v5];

      id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      id v7 = [(IMDRelayServiceReachabilityController *)self cleanupTimer];
      [v6 addTimer:v7 forMode:*MEMORY[0x1E4F1C4B0]];
    }
  }
  else
  {
  }
}

- (void)_stopCleanupTimerIfNeeded
{
  id v6 = [(IMDRelayServiceReachabilityController *)self pendingRequests];
  if ([v6 count])
  {
  }
  else
  {
    v3 = [(IMDRelayServiceReachabilityController *)self cleanupTimer];

    if (v3)
    {
      v4 = IMLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1D9905DF4(v4);
      }

      v5 = [(IMDRelayServiceReachabilityController *)self cleanupTimer];
      [v5 invalidate];

      [(IMDRelayServiceReachabilityController *)self setCleanupTimer:0];
    }
  }
}

- (void)_timeoutPendingRequest:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 createIncompleteFinalResult];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 requestID];
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Timing out pending reachability request with ID %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id v8 = [v4 requestID];
  [(IMDRelayServiceReachabilityController *)self _handleReachabilityResult:v5 messageID:v8 fromToken:0];
}

- (id)_expiredRequests
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = [(IMDRelayServiceReachabilityController *)self pendingRequests];
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v9 = [v8 lastUpdateTime];
        [v9 timeIntervalSinceNow];
        BOOL v11 = v10 >= 0.0;
        v12 = [v8 lastUpdateTime];
        [v12 timeIntervalSinceNow];
        double v14 = v13;

        if (!v11)
        {
          if (v14 >= -60.0) {
            continue;
          }
LABEL_10:
          [v19 addObject:v8];
          continue;
        }
        if (v14 > 60.0) {
          goto LABEL_10;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v5);
  }

  if ([v19 count] && IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [v19 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v16;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Found %ld expired reachability requests", buf, 0xCu);
    }
  }
  char v17 = (void *)[v19 copy];

  return v17;
}

- (void)_timeoutPendingRequests
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(IMDRelayServiceReachabilityController *)self _expiredRequests];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(IMDRelayServiceReachabilityController *)self _timeoutPendingRequest:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end