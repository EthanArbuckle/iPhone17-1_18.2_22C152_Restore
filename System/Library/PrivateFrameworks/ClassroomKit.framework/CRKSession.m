@interface CRKSession
- (BOOL)requiresBeacon;
- (CATStateMachine)stateMachine;
- (CATTransport)transport;
- (CRKGrowthFunction)backoffGrowthFunction;
- (CRKRemoteEndpoint)endpoint;
- (CRKSession)initWithEndpoint:(id)a3;
- (CRKSessionDelegate)delegate;
- (CRKTransportPreflightOperation)transportPreflightOperation;
- (NSDictionary)stateDictionary;
- (double)lostBeaconTimeout;
- (double)willLoseBeaconWarningTimeout;
- (id)studentSocketOptions;
- (void)backoffDidFinish;
- (void)connect;
- (void)delegateConnected;
- (void)delegateDidBecomeConnectable;
- (void)delegateDidBecomeNotConnectable;
- (void)delegateDidBecomeNotConnectableAndDidLoseBeacon;
- (void)delegateDidLoseBeacon;
- (void)delegateDisconnected;
- (void)delegateInvalidated;
- (void)delegateWillLoseBeacon;
- (void)didConnect;
- (void)enterBackoffCanConnect;
- (void)exitBackoffCanConnect;
- (void)failedToConnect;
- (void)foundBeacon;
- (void)invalidate;
- (void)localWiFiBecameAvailable;
- (void)localWiFiBecameUnavailable;
- (void)lostBeacon;
- (void)lostConnection;
- (void)processFinishedTransportPreflightOperation:(id)a3;
- (void)registerDefaults;
- (void)rejected;
- (void)resetBackoff;
- (void)setDelegate:(id)a3;
- (void)setLostBeaconTimeout:(double)a3;
- (void)setRequiresBeacon:(BOOL)a3;
- (void)setStateMachine:(id)a3;
- (void)setTransport:(id)a3;
- (void)setTransportPreflightOperation:(id)a3;
- (void)setWillLoseBeaconWarningTimeout:(double)a3;
- (void)startPreflightingTransport:(id)a3;
- (void)stopPreflightingTransport;
- (void)transportPreflightOperationDidFinish:(id)a3;
- (void)tryConnecting;
@end

@implementation CRKSession

- (CRKSession)initWithEndpoint:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"CRKSession.m", 62, @"Invalid parameter not satisfying: %@", @"endpoint" object file lineNumber description];
  }
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  int v11 = [v8 isEqualToString:v10];

  if (v11)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"CRKSession.m" lineNumber:63 description:@"CRKSession is an abstract class. Please do not initialize it directly."];
  }
  v33.receiver = self;
  v33.super_class = (Class)CRKSession;
  v12 = [(CRKSession *)&v33 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpoint, a3);
    *(_OWORD *)&v13->_lostBeaconTimeout = xmmword_224CC0D60;
    v13->_requiresBeacon = 1;
    v31 = [[CRKExponentialGrowthFunction alloc] initWithGrowthRate:2.0];
    v14 = [[CRKBoundedGrowthFunction alloc] initWithGrowthFunction:v31 lowerBound:1.0 upperBound:64.0];
    backoffGrowthFunction = v13->_backoffGrowthFunction;
    v13->_backoffGrowthFunction = (CRKGrowthFunction *)v14;

    [(CRKSession *)v13 registerDefaults];
    uint64_t v16 = [objc_alloc(MEMORY[0x263F39CC0]) initWithTarget:v13];
    mFSM = v13->mFSM;
    v13->mFSM = (CATStateMachine *)v16;

    v18 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v19 = [v18 objectForKey:@"CRKClassSessionLogLevel"];
    -[CATStateMachine setLogLevel:](v13->mFSM, "setLogLevel:", [v19 integerValue]);

    v20 = [(CATStateMachine *)v13->mFSM addStateWithName:@"Out of Range"];
    v21 = [(CATStateMachine *)v13->mFSM addStateWithName:@"No Network and Not in Range"];
    v22 = [(CATStateMachine *)v13->mFSM addStateWithName:@"No Network"];
    [(CATStateMachine *)v13->mFSM addStateWithName:@"Backoff Can Connect"];
    v23 = id v32 = v6;
    v30 = [(CATStateMachine *)v13->mFSM addStateWithName:@"Should Connect?"];
    v24 = [(CATStateMachine *)v13->mFSM addStateWithName:@"Connecting"];
    v25 = [(CATStateMachine *)v13->mFSM addStateWithName:@"Connected"];
    v26 = [(CATStateMachine *)v13->mFSM addStateWithName:@"Invalidated"];
    [v20 setEnterAction:sel_enterOutOfRange];
    [v20 addTransitionToState:v23 triggeringEvent:@"foundBeacon"];
    [v20 addTransitionToState:0 triggeringEvent:@"lostBeacon"];
    [v20 addTransitionToState:0 triggeringEvent:@"localWiFiBecameAvailable"];
    [v20 addTransitionToState:v21 triggeringEvent:@"localWiFiBecameUnavailable"];
    [v20 addTransitionToState:0 triggeringEvent:@"connect"];
    [v20 addTransitionToState:0 triggeringEvent:@"lostConnection"];
    [v20 addTransitionToState:0 triggeringEvent:@"rejected"];
    [v20 addTransitionToState:v26 triggeringEvent:@"invalidate"];
    [v21 addTransitionToState:v22 triggeringEvent:@"foundBeacon"];
    [v21 addTransitionToState:0 triggeringEvent:@"lostBeacon"];
    [v21 addTransitionToState:v20 triggeringEvent:@"localWiFiBecameAvailable"];
    [v21 addTransitionToState:0 triggeringEvent:@"localWiFiBecameUnavailable"];
    [v21 addTransitionToState:0 triggeringEvent:@"connect"];
    [v21 addTransitionToState:0 triggeringEvent:@"lostConnection"];
    [v21 addTransitionToState:0 triggeringEvent:@"rejected"];
    [v21 addTransitionToState:v26 triggeringEvent:@"invalidate"];
    [v22 setEnterAction:sel_enterNoNetwork];
    [v22 addTransitionToState:0 triggeringEvent:@"foundBeacon"];
    [v22 addTransitionToState:v21 triggeringEvent:@"lostBeacon" action:sel_delegateDidLoseBeacon];
    [v22 addTransitionToState:v23 triggeringEvent:@"localWiFiBecameAvailable"];
    [v22 addTransitionToState:0 triggeringEvent:@"localWiFiBecameUnavailable"];
    [v22 addTransitionToState:0 triggeringEvent:@"connect"];
    [v22 addTransitionToState:0 triggeringEvent:@"lostConnection"];
    [v22 addTransitionToState:0 triggeringEvent:@"rejected"];
    [v22 addTransitionToState:v26 triggeringEvent:@"invalidate"];
    [v23 setEnterAction:sel_enterBackoffCanConnect];
    [v23 addTransitionToState:0 triggeringEvent:@"foundBeacon"];
    [v23 addTransitionToState:v20 triggeringEvent:@"lostBeacon" action:sel_delegateDidLoseBeacon];
    [v23 addTransitionToState:0 triggeringEvent:@"localWiFiBecameAvailable"];
    [v23 addTransitionToState:v22 triggeringEvent:@"localWiFiBecameUnavailable"];
    [v23 addTransitionToState:0 triggeringEvent:@"lostConnection"];
    [v23 addTransitionToState:0 triggeringEvent:@"rejected"];
    [v23 addTransitionToState:v30 triggeringEvent:@"backoffDidFinish"];
    [v23 addTransitionToState:v26 triggeringEvent:@"invalidate"];
    [v23 setExitAction:sel_exitBackoffCanConnect];
    [v30 setEnterAction:sel_delegateDidBecomeConnectable];
    [v30 addTransitionToState:v24 triggeringEvent:@"connect"];
    [v30 addTransitionToState:v30 triggeringEvent:@"foundBeacon"];
    [v30 addTransitionToState:v20 triggeringEvent:@"lostBeacon" action:sel_delegateDidBecomeNotConnectableAndDidLoseBeacon];
    [v30 addTransitionToState:0 triggeringEvent:@"localWiFiBecameAvailable"];
    [v30 addTransitionToState:v22 triggeringEvent:@"localWiFiBecameUnavailable" action:sel_delegateDidBecomeNotConnectable];
    [v30 addTransitionToState:0 triggeringEvent:@"lostConnection"];
    [v30 addTransitionToState:0 triggeringEvent:@"rejected"];
    [v30 addTransitionToState:v26 triggeringEvent:@"invalidate" action:sel_delegateDidBecomeNotConnectable];
    [v24 setEnterAction:sel_tryConnecting];
    [v24 addTransitionToState:0 triggeringEvent:@"foundBeacon"];
    [v24 addTransitionToState:v20 triggeringEvent:@"lostBeacon" action:sel_delegateDidLoseBeacon];
    [v24 addTransitionToState:0 triggeringEvent:@"localWiFiBecameAvailable"];
    [v24 addTransitionToState:v22 triggeringEvent:@"localWiFiBecameUnavailable"];
    [v24 addTransitionToState:v25 triggeringEvent:@"didConnect"];
    [v24 addTransitionToState:v23 triggeringEvent:@"failedToConnect"];
    [v24 addTransitionToState:0 triggeringEvent:@"connect"];
    [v24 addTransitionToState:0 triggeringEvent:@"lostConnection"];
    [v24 addTransitionToState:0 triggeringEvent:@"rejected"];
    [v24 addTransitionToState:v26 triggeringEvent:@"invalidate"];
    [v24 setExitAction:sel_cancelConnectionAttempt];
    [v25 setEnterAction:sel_delegateConnected];
    [v25 addTransitionToState:0 triggeringEvent:@"foundBeacon"];
    [v25 addTransitionToState:v20 triggeringEvent:@"lostBeacon" action:sel_delegateDidLoseBeacon];
    [v25 addTransitionToState:0 triggeringEvent:@"localWiFiBecameAvailable"];
    [v25 addTransitionToState:v22 triggeringEvent:@"localWiFiBecameUnavailable"];
    [v25 addTransitionToState:0 triggeringEvent:@"connect"];
    [v25 addTransitionToState:v23 triggeringEvent:@"rejected"];
    [v25 addTransitionToState:v23 triggeringEvent:@"lostConnection" action:sel_resetBackoff];
    [v25 addTransitionToState:v26 triggeringEvent:@"invalidate"];
    [v25 setExitAction:sel_delegateDisconnected];
    [v26 setEnterAction:sel_delegateInvalidated];
    [v26 addTransitionToState:0 triggeringEvent:@"invalidate"];
    [(CATStateMachine *)v13->mFSM start];

    id v6 = v32;
  }

  return v13;
}

- (void)setRequiresBeacon:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_CRKLogBluetooth_onceToken_1 != -1) {
    dispatch_once(&_CRKLogBluetooth_onceToken_1, &__block_literal_global_264);
  }
  v5 = (void *)_CRKLogBluetooth_logObj_1;
  if (os_log_type_enabled((os_log_t)_CRKLogBluetooth_logObj_1, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSNumber;
    v7 = v5;
    v8 = [v6 numberWithBool:v3];
    int v9 = 134218242;
    v10 = self;
    __int16 v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "Setting requiresBeacon for session %p: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  if (self->_requiresBeacon != v3)
  {
    self->_requiresBeacon = v3;
    [(CRKSession *)self foundBeacon];
  }
}

- (void)foundBeacon
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 195, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_lostBeacon object:0];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_delegateWillLoseBeacon object:0];
  if ([(CRKSession *)self requiresBeacon])
  {
    [(CRKSession *)self willLoseBeaconWarningTimeout];
    -[CRKSession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_delegateWillLoseBeacon, 0);
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)localWiFiBecameAvailable
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 206, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)localWiFiBecameUnavailable
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 211, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)lostConnection
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 216, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)connect
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 221, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)invalidate
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 226, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)rejected
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 231, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (NSDictionary)stateDictionary
{
  BOOL v3 = objc_opt_new();
  v4 = [(CRKSession *)self stateMachine];
  v5 = [v4 currentState];
  id v6 = [v5 name];
  [v3 setObject:v6 forKeyedSubscript:@"state"];

  v7 = [(CRKSession *)self transport];
  v8 = [v7 description];
  [v3 setObject:v8 forKeyedSubscript:@"transport"];

  id v9 = [(CRKSession *)self transportPreflightOperation];
  v10 = [v9 stateDictionary];
  [v3 setObject:v10 forKeyedSubscript:@"transportPreflightOperation"];

  if ([(CRKSession *)self requiresBeacon]) {
    __int16 v11 = @"YES";
  }
  else {
    __int16 v11 = @"NO";
  }
  [v3 setObject:v11 forKeyedSubscript:@"requiresBeacon"];
  v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

- (void)lostBeacon
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 247, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)didConnect
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 252, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)failedToConnect
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 257, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)registerDefaults
{
  v5[5] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4[0] = @"CRKStudentAdaptiveWriteTimeout";
  v4[1] = @"CRKStudentKeepAliveEnabled";
  v5[0] = &unk_26D81A240;
  v5[1] = MEMORY[0x263EFFA88];
  v4[2] = @"CRKStudentKeepAliveDelay";
  v4[3] = @"CRKStudentKeepAliveInterval";
  v5[2] = &unk_26D81A258;
  v5[3] = &unk_26D81A258;
  v4[4] = @"CRKStudentKeepAliveCount";
  v5[4] = &unk_26D81A258;
  BOOL v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  [v2 registerDefaults:v3];
}

- (void)tryConnecting
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = [a1 endpoint];
  v5 = [v4 stringValue];
  int v6 = 138543618;
  v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "SESSION:%{public}@. IP:%{public}@. Failed to connect: No Client Identity", (uint8_t *)&v6, 0x16u);
}

uint64_t __27__CRKSession_tryConnecting__block_invoke(int a1, id a2)
{
  id v2 = a2;

  return [v2 underlyingCertificate];
}

- (id)studentSocketOptions
{
  id v2 = objc_opt_new();
  BOOL v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = [v3 valueForKey:@"CRKStudentAdaptiveWriteTimeout"];
  [v2 setAdaptiveWriteTimeout:v4];

  v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v6 = [v5 valueForKey:@"CRKStudentKeepAliveEnabled"];
  [v2 setKeepAliveEnabled:v6];

  v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  __int16 v8 = [v7 valueForKey:@"CRKStudentKeepAliveDelay"];
  [v2 setKeepAliveDelay:v8];

  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v10 = [v9 valueForKey:@"CRKStudentKeepAliveInterval"];
  [v2 setKeepAliveInterval:v10];

  __int16 v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v12 = [v11 valueForKey:@"CRKStudentKeepAliveCount"];
  [v2 setKeepAliveCount:v12];

  return v2;
}

- (void)delegateWillLoseBeacon
{
  [(CRKSession *)self lostBeaconTimeout];
  double v4 = v3;
  [(CRKSession *)self willLoseBeaconWarningTimeout];
  double v6 = v4 - v5;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.0;
  }
  [(CRKSession *)self performSelector:sel_lostBeacon withObject:0 afterDelay:v7];
  __int16 v8 = [(CRKSession *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CRKSession *)self delegate];
    [v10 session:self willLoseBeaconAfterTimeInterval:v7];
  }
}

- (void)delegateDidLoseBeacon
{
  double v3 = [MEMORY[0x263F08A48] mainQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__CRKSession_delegateDidLoseBeacon__block_invoke;
  v5[3] = &unk_2646F35C0;
  v5[4] = self;
  double v4 = [MEMORY[0x263F086D0] blockOperationWithBlock:v5];
  [v3 addOperation:v4];
}

void __35__CRKSession_delegateDidLoseBeacon__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 sessionDidLoseBeacon:*(void *)(a1 + 32)];
  }
}

- (void)delegateDidBecomeConnectable
{
  char v3 = [(CRKSession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CRKSession *)self delegate];
    [v5 sessionDidBecomeConnectable:self];
  }
  else
  {
    [(CRKSession *)self connect];
  }
}

- (void)delegateDidBecomeNotConnectable
{
  char v3 = [MEMORY[0x263F08A48] mainQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__CRKSession_delegateDidBecomeNotConnectable__block_invoke;
  v5[3] = &unk_2646F35C0;
  v5[4] = self;
  char v4 = [MEMORY[0x263F086D0] blockOperationWithBlock:v5];
  [v3 addOperation:v4];
}

void __45__CRKSession_delegateDidBecomeNotConnectable__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 sessionDidBecomeNotConnectable:*(void *)(a1 + 32)];
  }
}

- (void)delegateDidBecomeNotConnectableAndDidLoseBeacon
{
  char v3 = [MEMORY[0x263F08A48] mainQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__CRKSession_delegateDidBecomeNotConnectableAndDidLoseBeacon__block_invoke;
  v5[3] = &unk_2646F35C0;
  v5[4] = self;
  id v4 = [MEMORY[0x263F086D0] blockOperationWithBlock:v5];
  [v3 addOperation:v4];
}

void __61__CRKSession_delegateDidBecomeNotConnectableAndDidLoseBeacon__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 sessionDidBecomeNotConnectable:*(void *)(a1 + 32)];
  }
  id v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 sessionDidLoseBeacon:*(void *)(a1 + 32)];
  }
}

- (void)delegateConnected
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v3 = _CRKLogSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CRKSession *)self endpoint];
    id v5 = [v4 stringValue];
    int v10 = 138543618;
    __int16 v11 = self;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "SESSION:%{public}@. IP:%{public}@. Connected", (uint8_t *)&v10, 0x16u);
  }
  char v6 = [(CRKSession *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    __int16 v8 = [(CRKSession *)self delegate];
    char v9 = [(CRKSession *)self transport];
    [v8 session:self didConnectWithTransport:v9];
  }
}

- (void)delegateDisconnected
{
  char v3 = [MEMORY[0x263F08A48] mainQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__CRKSession_delegateDisconnected__block_invoke;
  v5[3] = &unk_2646F35C0;
  v5[4] = self;
  id v4 = [MEMORY[0x263F086D0] blockOperationWithBlock:v5];
  [v3 addOperation:v4];
}

void __34__CRKSession_delegateDisconnected__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 sessionDidDisconnect:*(void *)(a1 + 32)];
  }
}

- (void)delegateInvalidated
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_lostBeacon object:0];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_delegateWillLoseBeacon object:0];
  char v3 = [(CRKSession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CRKSession *)self delegate];
    [v5 sessionDidInvalidate:self];
  }
}

- (void)enterBackoffCanConnect
{
  double mCurrentBackoffInterval = self->mCurrentBackoffInterval;
  char v4 = [(CRKSession *)self backoffGrowthFunction];
  [v4 evaluateWithValue:self->mCurrentBackoffInterval];
  self->double mCurrentBackoffInterval = v5;

  [(CRKSession *)self performSelector:sel_backoffDidFinish withObject:0 afterDelay:mCurrentBackoffInterval];
}

- (void)exitBackoffCanConnect
{
}

- (void)backoffDidFinish
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    char v7 = [MEMORY[0x263F08690] currentHandler];
    __int16 v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKSession.m", 422, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  mFSM = self->mFSM;
  double v5 = (void *)MEMORY[0x263F39CC8];
  NSStringFromSelector(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  char v6 = [v5 eventWithTrigger:v9 context:0];
  [(CATStateMachine *)mFSM transitionWithTriggeringEvent:v6];
}

- (void)resetBackoff
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v3 = _CRKLogSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(CRKSession *)self endpoint];
    double v5 = [v4 stringValue];
    int v6 = 138543618;
    char v7 = self;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "SESSION:%{public}@. IP:%{public}@. Resetting session backoff.", (uint8_t *)&v6, 0x16u);
  }
  self->double mCurrentBackoffInterval = 0.0;
}

- (void)startPreflightingTransport:(id)a3
{
  id v5 = a3;
  int v6 = [(CRKSession *)self transportPreflightOperation];

  if (v6)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CRKSession.m" lineNumber:434 description:@"Already preflighting a transport"];
  }
  char v7 = [[CRKTransportPreflightOperation alloc] initWithTransport:v5 session:self];

  [(CRKSession *)self setTransportPreflightOperation:v7];
  __int16 v8 = [(CRKSession *)self transportPreflightOperation];
  [v8 addTarget:self selector:sel_transportPreflightOperationDidFinish_ forOperationEvents:6];

  objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [(CRKSession *)self transportPreflightOperation];
  [v11 addOperation:v9];
}

- (void)stopPreflightingTransport
{
  char v3 = [(CRKSession *)self transportPreflightOperation];
  [v3 cancel];

  [(CRKSession *)self setTransportPreflightOperation:0];
}

- (void)transportPreflightOperationDidFinish:(id)a3
{
  id v5 = a3;
  id v4 = [(CRKSession *)self transportPreflightOperation];

  if (v4 == v5)
  {
    [(CRKSession *)self setTransportPreflightOperation:0];
    [(CRKSession *)self processFinishedTransportPreflightOperation:v5];
  }
}

- (void)processFinishedTransportPreflightOperation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 error];
  if (v5)
  {
    int v6 = _CRKLogSession();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(CRKSession *)self processFinishedTransportPreflightOperation:v6];
    }

    [(CRKSession *)self failedToConnect];
  }
  else
  {
    char v7 = [v4 resultObject];
    __int16 v8 = [v7 takeTransport];
    if (v8)
    {
      [(CRKSession *)self setTransport:v8];
      [(CRKSession *)self didConnect];
    }
    else
    {
      if ([v7 shouldResetBackoff]) {
        [(CRKSession *)self resetBackoff];
      }
      [(CRKSession *)self failedToConnect];
    }
  }
}

- (CATStateMachine)stateMachine
{
  return self->mFSM;
}

- (void)setStateMachine:(id)a3
{
}

- (CRKSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CRKRemoteEndpoint)endpoint
{
  return (CRKRemoteEndpoint *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)requiresBeacon
{
  return self->_requiresBeacon;
}

- (CRKGrowthFunction)backoffGrowthFunction
{
  return self->_backoffGrowthFunction;
}

- (CATTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (double)lostBeaconTimeout
{
  return self->_lostBeaconTimeout;
}

- (void)setLostBeaconTimeout:(double)a3
{
  self->_lostBeaconTimeout = a3;
}

- (double)willLoseBeaconWarningTimeout
{
  return self->_willLoseBeaconWarningTimeout;
}

- (void)setWillLoseBeaconWarningTimeout:(double)a3
{
  self->_willLoseBeaconWarningTimeout = a3;
}

- (CRKTransportPreflightOperation)transportPreflightOperation
{
  return self->_transportPreflightOperation;
}

- (void)setTransportPreflightOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportPreflightOperation, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_backoffGrowthFunction, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->mFSM, 0);
}

- (void)processFinishedTransportPreflightOperation:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v6 = [a1 endpoint];
  char v7 = [v6 stringValue];
  __int16 v8 = [a2 verboseDescription];
  int v9 = 138543874;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  __int16 v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_224C00000, a3, OS_LOG_TYPE_ERROR, "SESSION:%{public}@. IP:%{public}@. Transport preflight failed: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end