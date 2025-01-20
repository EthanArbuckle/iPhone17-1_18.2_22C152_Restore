@interface CRKTransportPreflightOperation
- (BOOL)anyCommonNameInArrayHasLeaderPrefix:(id)a3;
- (BOOL)cancellationRequested;
- (BOOL)commonNameHasLeaderPrefix:(id)a3;
- (BOOL)connectionInterruptedDueToDecisionHandler;
- (BOOL)decisionHandlerWantsBackoffReset;
- (BOOL)errorIndicatesThatInterruptionWasCausedByDecisionHandler:(id)a3;
- (BOOL)invalidationTriggered;
- (BOOL)isAsynchronous;
- (BOOL)isCommonNamePrefixValidForRemoteTransport:(id)a3;
- (BOOL)isCommonNamePrefixValidForTransport:(id)a3;
- (BOOL)isInsecureConnectionError:(id)a3;
- (CATTransport)transport;
- (CRKSession)session;
- (CRKTransportPreflightOperation)initWithTransport:(id)a3 session:(id)a4;
- (NSDictionary)stateDictionary;
- (id)ASMUserIdentifierFromTrustDecision:(id)a3;
- (void)cancel;
- (void)clearDelegatesOnTransport:(id)a3;
- (void)finishWithShouldResetBackoff:(BOOL)a3;
- (void)finishWithTransport:(id)a3;
- (void)handleContinuationDecision:(unint64_t)a3 forTrustDecision:(id)a4;
- (void)invalidateTransport;
- (void)main;
- (void)respondToTrustDecision:(id)a3 withAllowUntrustedConnections:(BOOL)a4;
- (void)setCancellationRequested:(BOOL)a3;
- (void)setConnectionInterruptedDueToDecisionHandler:(BOOL)a3;
- (void)setDecisionHandlerWantsBackoffReset:(BOOL)a3;
- (void)setDelegatesOnTransport:(id)a3;
- (void)setInvalidationTriggered:(BOOL)a3;
- (void)transport:(id)a3 didInterruptWithError:(id)a4;
- (void)transport:(id)a3 encounteredTrustDecisionWhileTryingToSecure:(id)a4;
- (void)transportDidConnect:(id)a3;
- (void)transportDidInvalidate:(id)a3;
@end

@implementation CRKTransportPreflightOperation

- (CRKTransportPreflightOperation)initWithTransport:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKTransportPreflightOperation;
  v9 = [(CRKTransportPreflightOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transport, a3);
    objc_storeWeak((id *)&v10->_session, v8);
  }

  return v10;
}

- (NSDictionary)stateDictionary
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"transport";
  v2 = [(CRKTransportPreflightOperation *)self transport];
  v3 = [v2 description];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

- (void)cancel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CRKTransportPreflightOperation_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __40__CRKTransportPreflightOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) phase] != 3
    && ([*(id *)(a1 + 32) cancellationRequested] & 1) == 0)
  {
    v2 = _CRKLogSession_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = [*(id *)(a1 + 32) session];
      v4 = [*(id *)(a1 + 32) session];
      v5 = [v4 endpoint];
      v6 = [v5 stringValue];
      id v7 = [*(id *)(a1 + 32) transport];
      int v10 = 138543874;
      v11 = v3;
      __int16 v12 = 2114;
      v13 = v6;
      __int16 v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_224C00000, v2, OS_LOG_TYPE_DEFAULT, "SESSION:%{public}@. IP:%{public}@. Transport preflight cancellation requested for transport %{public}@", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 32) setCancellationRequested:1];
    id v8 = [*(id *)(a1 + 32) transport];
    v9 = [v8 delegate];

    if (v9) {
      [*(id *)(a1 + 32) invalidateTransport];
    }
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CRKTransportPreflightOperation_main__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __38__CRKTransportPreflightOperation_main__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 transport];
  [v2 setDelegatesOnTransport:v3];

  int v4 = [*(id *)(a1 + 32) cancellationRequested];
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 invalidateTransport];
  }
  else
  {
    id v6 = [v5 transport];
    [v6 resume];
  }
}

- (void)setDelegatesOnTransport:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  id v7 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v7;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  [v6 setRemoteTransportDelegate:self];
}

- (void)clearDelegatesOnTransport:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v6 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v6;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  [v5 setRemoteTransportDelegate:0];
}

- (BOOL)errorIndicatesThatInterruptionWasCausedByDecisionHandler:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F08608]];
  LOBYTE(self) = [(CRKTransportPreflightOperation *)self isInsecureConnectionError:v5];

  return (char)self;
}

- (BOOL)isInsecureConnectionError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F399F0]]) {
    BOOL v5 = [v3 code] == 106;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)invalidateTransport
{
  [(CRKTransportPreflightOperation *)self setInvalidationTriggered:1];
  id v3 = [(CRKTransportPreflightOperation *)self transport];
  [v3 invalidate];
}

- (void)finishWithTransport:(id)a3
{
  id v4 = a3;
  [(CRKTransportPreflightOperation *)self clearDelegatesOnTransport:v4];
  [v4 suspend];
  BOOL v5 = [[CRKTransportPreflightResultObject alloc] initWithTransport:v4 shouldResetBackoff:0];

  [(CRKTransportPreflightOperation *)self endOperationWithResultObject:v5];
}

- (void)finishWithShouldResetBackoff:(BOOL)a3
{
  id v4 = [[CRKTransportPreflightResultObject alloc] initWithTransport:0 shouldResetBackoff:a3];
  [(CRKTransportPreflightOperation *)self endOperationWithResultObject:v4];
}

- (void)transportDidConnect:(id)a3
{
  id v4 = a3;
  if ([(CRKTransportPreflightOperation *)self isExecuting]
    && ![(CRKTransportPreflightOperation *)self invalidationTriggered])
  {
    if ([(CRKTransportPreflightOperation *)self isCommonNamePrefixValidForTransport:v4])
    {
      [(CRKTransportPreflightOperation *)self finishWithTransport:v4];
    }
    else
    {
      BOOL v5 = _CRKLogSession_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(CRKTransportPreflightOperation *)self transportDidConnect:v5];
      }

      [(CRKTransportPreflightOperation *)self invalidateTransport];
    }
  }
}

- (void)transport:(id)a3 didInterruptWithError:(id)a4
{
  id v5 = a4;
  if ([(CRKTransportPreflightOperation *)self isExecuting]
    && ![(CRKTransportPreflightOperation *)self invalidationTriggered])
  {
    id v6 = _CRKLogSession_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CRKTransportPreflightOperation transport:didInterruptWithError:](self, v5, v6);
    }

    [(CRKTransportPreflightOperation *)self setConnectionInterruptedDueToDecisionHandler:[(CRKTransportPreflightOperation *)self errorIndicatesThatInterruptionWasCausedByDecisionHandler:v5]];
    [(CRKTransportPreflightOperation *)self invalidateTransport];
  }
}

- (void)transportDidInvalidate:(id)a3
{
  if ([(CRKTransportPreflightOperation *)self isExecuting])
  {
    if ([(CRKTransportPreflightOperation *)self cancellationRequested])
    {
      CATErrorWithCodeAndUserInfo();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [(CRKTransportPreflightOperation *)self endOperationWithError:v5];
    }
    else
    {
      if ([(CRKTransportPreflightOperation *)self decisionHandlerWantsBackoffReset]) {
        BOOL v4 = [(CRKTransportPreflightOperation *)self connectionInterruptedDueToDecisionHandler];
      }
      else {
        BOOL v4 = 0;
      }
      [(CRKTransportPreflightOperation *)self finishWithShouldResetBackoff:v4];
    }
  }
}

- (void)transport:(id)a3 encounteredTrustDecisionWhileTryingToSecure:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CRKTransportPreflightOperation *)self isExecuting]
    && ![(CRKTransportPreflightOperation *)self invalidationTriggered])
  {
    v9 = [(CRKTransportPreflightOperation *)self ASMUserIdentifierFromTrustDecision:v8];
    int v10 = [(CRKTransportPreflightOperation *)self session];
    v11 = [v10 delegate];
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__CRKTransportPreflightOperation_transport_encounteredTrustDecisionWhileTryingToSecure___block_invoke;
    v12[3] = &unk_2646F50B8;
    v14[1] = (id)a2;
    v12[4] = self;
    objc_copyWeak(v14, &location);
    id v13 = v8;
    [v11 session:v10 encounteredUntrustedConnectionForASMInstructorIdentifier:v9 decisionHandler:v12];

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
}

void __88__CRKTransportPreflightOperation_transport_encounteredTrustDecisionWhileTryingToSecure___block_invoke(uint64_t a1, uint64_t a2)
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    BOOL v4 = [MEMORY[0x263F08690] currentHandler];
    id v5 = *(const char **)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = NSStringFromSelector(v5);
    [v4 handleFailureInMethod:v5, v6, @"CRKTransportPreflightOperation.m", 230, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained isExecuting]
    && ([WeakRetained invalidationTriggered] & 1) == 0)
  {
    [WeakRetained handleContinuationDecision:a2 forTrustDecision:*(void *)(a1 + 40)];
  }
}

- (id)ASMUserIdentifierFromTrustDecision:(id)a3
{
  id v3 = a3;
  BOOL v4 = [CRKConcreteTrust alloc];
  id v5 = [v3 trust];

  uint64_t v6 = [(CRKConcreteTrust *)v4 initWithTrust:v5];
  id v7 = [(CRKConcreteTrust *)v6 leafCertificate];
  id v8 = +[CRKASMCertificateUserIdentifierExtractor userIdentifierFromCertificate:v7];

  return v8;
}

- (void)handleContinuationDecision:(unint64_t)a3 forTrustDecision:(id)a4
{
  id v6 = a4;
  if (a3 == 2)
  {
    id v8 = self;
    id v9 = v6;
    uint64_t v10 = 1;
  }
  else
  {
    if (a3 == 1)
    {
      [(CRKTransportPreflightOperation *)self setDecisionHandlerWantsBackoffReset:1];
    }
    else if (a3)
    {
      id v7 = _CRKLogSession_0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CRKTransportPreflightOperation handleContinuationDecision:forTrustDecision:](self, a3, v7);
      }
    }
    id v8 = self;
    id v9 = v6;
    uint64_t v10 = 0;
  }
  [(CRKTransportPreflightOperation *)v8 respondToTrustDecision:v9 withAllowUntrustedConnections:v10];
}

- (void)respondToTrustDecision:(id)a3 withAllowUntrustedConnections:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = _CRKLogSession_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CRKTransportPreflightOperation respondToTrustDecision:withAllowUntrustedConnections:](self, v4, v7);
  }

  id v8 = [CRKConcreteTrust alloc];
  id v9 = [v6 trust];
  uint64_t v10 = [(CRKConcreteTrust *)v8 initWithTrust:v9];

  v11 = _CRKLogSession_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CRKTransportPreflightOperation respondToTrustDecision:withAllowUntrustedConnections:](self, v10, v11);
  }

  [v6 respondWithDecisionToAllowUntrustedConnection:v4];
}

- (BOOL)isCommonNamePrefixValidForTransport:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(CRKTransportPreflightOperation *)self isCommonNamePrefixValidForRemoteTransport:v4];
  }
  else
  {
    id v6 = _CRKLogSession_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(CRKTransportPreflightOperation *)self session];
      id v8 = [(CRKTransportPreflightOperation *)self session];
      id v9 = [v8 endpoint];
      uint64_t v10 = [v9 stringValue];
      int v12 = 138543874;
      id v13 = v7;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "SESSION:%{public}@. IP:%{public}@. Not validating common name prefix of certificate because transport %{public}@ is not remote", (uint8_t *)&v12, 0x20u);
    }
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)isCommonNamePrefixValidForRemoteTransport:(id)a3
{
  id v4 = a3;
  BOOL v5 = [CRKConcreteTrust alloc];
  uint64_t v6 = [v4 peerTrust];

  id v7 = [(CRKConcreteTrust *)v5 initWithTrust:v6];
  id v8 = [(CRKConcreteTrust *)v7 leafCertificate];
  id v9 = _CRKLogSession_0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    [(CRKTransportPreflightOperation *)self isCommonNamePrefixValidForRemoteTransport:v9];
  }

  uint64_t v10 = [v8 commonNames];
  BOOL v11 = [(CRKTransportPreflightOperation *)self anyCommonNameInArrayHasLeaderPrefix:v10];

  return v11;
}

- (BOOL)anyCommonNameInArrayHasLeaderPrefix:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[CRKTransportPreflightOperation commonNameHasLeaderPrefix:](self, "commonNameHasLeaderPrefix:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)commonNameHasLeaderPrefix:(id)a3
{
  return objc_msgSend(a3, "crk_hasCaseInsensitivePrefix:", @"leader");
}

- (CRKSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (CRKSession *)WeakRetained;
}

- (CATTransport)transport
{
  return self->_transport;
}

- (BOOL)decisionHandlerWantsBackoffReset
{
  return self->_decisionHandlerWantsBackoffReset;
}

- (void)setDecisionHandlerWantsBackoffReset:(BOOL)a3
{
  self->_decisionHandlerWantsBackoffReset = a3;
}

- (BOOL)connectionInterruptedDueToDecisionHandler
{
  return self->_connectionInterruptedDueToDecisionHandler;
}

- (void)setConnectionInterruptedDueToDecisionHandler:(BOOL)a3
{
  self->_connectionInterruptedDueToDecisionHandler = a3;
}

- (BOOL)invalidationTriggered
{
  return self->_invalidationTriggered;
}

- (void)setInvalidationTriggered:(BOOL)a3
{
  self->_invalidationTriggered = a3;
}

- (BOOL)cancellationRequested
{
  return self->_cancellationRequested;
}

- (void)setCancellationRequested:(BOOL)a3
{
  self->_cancellationRequested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);

  objc_destroyWeak((id *)&self->_session);
}

- (void)transportDidConnect:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 session];
  uint64_t v7 = [a1 session];
  id v8 = [v7 endpoint];
  BOOL v9 = [v8 stringValue];
  OUTLINED_FUNCTION_1_3();
  __int16 v13 = v10;
  uint64_t v14 = a2;
  OUTLINED_FUNCTION_2_0(&dword_224C00000, a3, v11, "SESSION:%{public}@. IP:%{public}@. Invaliding transport %{public}@ because its common name prefix is invalid", v12);
}

- (void)transport:(NSObject *)a3 didInterruptWithError:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 session];
  uint64_t v7 = [a1 session];
  id v8 = [v7 endpoint];
  BOOL v9 = [v8 stringValue];
  __int16 v10 = [a1 session];
  uint64_t v11 = [v10 endpoint];
  long long v12 = [v11 stringValue];
  __int16 v13 = [a2 verboseDescription];
  int v14 = 138544130;
  uint64_t v15 = v6;
  __int16 v16 = 2114;
  id v17 = v9;
  __int16 v18 = 2114;
  v19 = v12;
  __int16 v20 = 2114;
  v21 = v13;
  _os_log_error_impl(&dword_224C00000, a3, OS_LOG_TYPE_ERROR, "SESSION:%{public}@. IP:%{public}@. Error connecting to %{public}@: %{public}@", (uint8_t *)&v14, 0x2Au);
}

- (void)handleContinuationDecision:(NSObject *)a3 forTrustDecision:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 session];
  uint64_t v7 = [a1 session];
  id v8 = [v7 endpoint];
  BOOL v9 = [v8 stringValue];
  OUTLINED_FUNCTION_1_3();
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  OUTLINED_FUNCTION_2_0(&dword_224C00000, a3, v10, "SESSION:%{public}@. IP:%{public}@. Invalid CRKSessionContinuationDecision: %lu", v11);
}

- (void)respondToTrustDecision:(NSObject *)a3 withAllowUntrustedConnections:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 session];
  uint64_t v7 = [a1 session];
  id v8 = [v7 endpoint];
  BOOL v9 = [v8 stringValue];
  uint64_t v10 = [a2 leafCertificate];
  uint64_t v11 = [v10 fingerprint];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_224C00000, a3, v12, "SESSION:%{public}@. IP:%{public}@. Fingerprint %{public}@", v13);
}

- (void)respondToTrustDecision:(NSObject *)a3 withAllowUntrustedConnections:.cold.2(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 session];
  uint64_t v7 = [a1 session];
  id v8 = [v7 endpoint];
  BOOL v9 = [v8 stringValue];
  uint64_t v10 = @"NO";
  if (a2) {
    uint64_t v10 = @"YES";
  }
  uint64_t v11 = v10;
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_224C00000, a3, v12, "SESSION:%{public}@. IP:%{public}@. Responding to user trust decision with: %{public}@", v13);
}

- (void)isCommonNamePrefixValidForRemoteTransport:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 session];
  uint64_t v7 = [a1 session];
  id v8 = [v7 endpoint];
  BOOL v9 = [v8 stringValue];
  uint64_t v10 = [a2 fingerprint];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_224C00000, a3, v11, "SESSION:%{public}@. IP:%{public}@. Fingerprint %{public}@", v12);
}

@end