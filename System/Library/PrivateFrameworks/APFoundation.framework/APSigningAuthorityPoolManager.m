@interface APSigningAuthorityPoolManager
- (APBackoffTimer)backoffTimer;
- (APSigningAuthority)currentSigningAuthority;
- (APSigningAuthorityPoolManager)initWithName:(id)a3 poolSize:(unint64_t)a4 numberToStash:(unint64_t)a5;
- (APSigningAuthorityPoolManager)initWithName:(id)a3 poolSize:(unint64_t)a4 numberToStash:(unint64_t)a5 setupCompletion:(id)a6;
- (APUnfairRecursiveLock)lock;
- (BOOL)_rotateWithError:(id *)a3;
- (BOOL)rotateWithError:(id *)a3;
- (NSMutableArray)signingAuthorityPool;
- (NSString)name;
- (double)lastStateChangeTime;
- (double)refillStartTime;
- (id)setupCompletion;
- (id)signatureForData:(id)a3 error:(id *)a4;
- (id)signatureForRawData:(id)a3 error:(id *)a4;
- (int64_t)state;
- (unint64_t)_numSigningAuthoritiesToCreate;
- (unint64_t)numberToStash;
- (unint64_t)poolSize;
- (void)_addSigningAuthorityToPool:(id)a3;
- (void)_callSetupCompletionHandler;
- (void)_clearStashedContextsIfIndicated;
- (void)_evaluateRotationEntitlement;
- (void)_handleCompletedSigningAuthority:(id)a3;
- (void)_refillSigningAuthorityPool;
- (void)_removeAllSigningAuthorities;
- (void)_removeSigningAuthority:(id)a3 shouldRefill:(BOOL)a4;
- (void)backoffTimerFired;
- (void)cancelBackoff;
- (void)enterBackoff;
- (void)setBackoffTimer:(id)a3;
- (void)setCurrentSigningAuthority:(id)a3;
- (void)setLastStateChangeTime:(double)a3;
- (void)setLock:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberToStash:(unint64_t)a3;
- (void)setPoolSize:(unint64_t)a3;
- (void)setRefillStartTime:(double)a3;
- (void)setSetupCompletion:(id)a3;
- (void)setSigningAuthorityPool:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setupWithCompletion:(id)a3;
- (void)setupWithTimeout:(double)a3 completion:(id)a4;
@end

@implementation APSigningAuthorityPoolManager

- (APSigningAuthorityPoolManager)initWithName:(id)a3 poolSize:(unint64_t)a4 numberToStash:(unint64_t)a5 setupCompletion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (+[APSigningClientValidator isAllowedClient])
  {
    v28.receiver = self;
    v28.super_class = (Class)APSigningAuthorityPoolManager;
    v13 = [(APSigningAuthorityPoolManager *)&v28 init];
    if (v13)
    {
      v13->_lastStateChangeTime = CFAbsoluteTimeGetCurrent();
      [(APSigningAuthorityPoolManager *)v13 _evaluateRotationEntitlement];
      [(APSigningAuthorityPoolManager *)v13 setPoolSize:a4];
      unint64_t v14 = [(APSigningAuthorityPoolManager *)v13 poolSize];
      if (v14 >= a5) {
        unint64_t v15 = a5;
      }
      else {
        unint64_t v15 = v14;
      }
      v13->_numberToStash = v15;
      objc_storeStrong((id *)&v13->_name, a3);
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[APSigningAuthorityPoolManager poolSize](v13, "poolSize"));
      signingAuthorityPool = v13->_signingAuthorityPool;
      v13->_signingAuthorityPool = (NSMutableArray *)v16;

      v18 = objc_alloc_init(APUnfairRecursiveLock);
      lock = v13->_lock;
      v13->_lock = v18;

      [(APSigningAuthorityPoolManager *)v13 _clearStashedContextsIfIndicated];
      v20 = dispatch_queue_create("com.apple.ap.signingAuthorityPoolManager.setup", 0);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_1D70C68D0;
      v25[3] = &unk_1E6A6B608;
      v26 = v13;
      id v27 = v12;
      dispatch_async(v20, v25);
    }
    else
    {
      v23 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D70B2000, v23, OS_LOG_TYPE_ERROR, "Unable to create pool manager, super class initialization failed.", buf, 2u);
      }

      [0 setState:18002];
      if (v12) {
        (*((void (**)(id, uint64_t))v12 + 2))(v12, [0 state]);
      }
    }
    self = v13;
    v22 = self;
  }
  else
  {
    v21 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = @"Unable to create pool manager, not a valid client.";
      _os_log_impl(&dword_1D70B2000, v21, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    APSimulateCrash(5, @"Unable to create pool manager, not a valid client.", 0);
    [(APSigningAuthorityPoolManager *)self setState:18002];
    if (v12) {
      (*((void (**)(id, int64_t))v12 + 2))(v12, [(APSigningAuthorityPoolManager *)self state]);
    }
    v22 = 0;
  }

  return v22;
}

- (APSigningAuthorityPoolManager)initWithName:(id)a3 poolSize:(unint64_t)a4 numberToStash:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!+[APSigningClientValidator isAllowedClient])
  {
    v18 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = @"Unable to create pool manager, not a valid client.";
      _os_log_impl(&dword_1D70B2000, v18, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    APSimulateCrash(5, @"Unable to create pool manager, not a valid client.", 0);
    goto LABEL_10;
  }
  v20.receiver = self;
  v20.super_class = (Class)APSigningAuthorityPoolManager;
  v10 = [(APSigningAuthorityPoolManager *)&v20 init];
  if (!v10)
  {
    APLogForCategory(0x2BuLL);
    self = (APSigningAuthorityPoolManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D70B2000, &self->super, OS_LOG_TYPE_ERROR, "Unable to create pool manager, super class initialization failed.", buf, 2u);
    }
LABEL_10:

    id v11 = 0;
    goto LABEL_11;
  }
  id v11 = v10;
  v10->_lastStateChangeTime = CFAbsoluteTimeGetCurrent();
  [(APSigningAuthorityPoolManager *)v11 _evaluateRotationEntitlement];
  [(APSigningAuthorityPoolManager *)v11 setPoolSize:a4];
  unint64_t v12 = [(APSigningAuthorityPoolManager *)v11 poolSize];
  if (v12 >= a5) {
    unint64_t v13 = a5;
  }
  else {
    unint64_t v13 = v12;
  }
  v11->_numberToStash = v13;
  objc_storeStrong((id *)&v11->_name, a3);
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[APSigningAuthorityPoolManager poolSize](v11, "poolSize"));
  signingAuthorityPool = v11->_signingAuthorityPool;
  v11->_signingAuthorityPool = (NSMutableArray *)v14;

  uint64_t v16 = objc_alloc_init(APUnfairRecursiveLock);
  lock = v11->_lock;
  v11->_lock = v16;

  v11->_state = 18004;
  [(APSigningAuthorityPoolManager *)v11 _clearStashedContextsIfIndicated];
LABEL_11:

  return v11;
}

- (void)setupWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(APSigningAuthorityPoolManager *)self setState:18000];
  v7 = [[APUnfairLock alloc] initWithOptions:1];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v8 = dispatch_queue_create("com.apple.ap.signingAuthorityPoolManager.setupWatchDog", 0);
  id v9 = dispatch_queue_create("com.apple.ap.signingAuthorityPoolManager.setup", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D70C6CC4;
  block[3] = &unk_1E6A6B658;
  block[4] = self;
  v10 = v7;
  objc_super v20 = v10;
  v22 = v23;
  id v11 = v6;
  id v21 = v11;
  dispatch_async(v9, block);
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D70C6E00;
  v15[3] = &unk_1E6A6B680;
  id v17 = v11;
  v18 = v23;
  uint64_t v16 = v10;
  id v13 = v11;
  uint64_t v14 = v10;
  dispatch_after(v12, v8, v15);

  _Block_object_dispose(v23, 8);
}

- (void)setupWithCompletion:(id)a3
{
  id v4 = a3;
  [(APSigningAuthorityPoolManager *)self setState:18000];
  v5 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "Pool manager is being setup", v6, 2u);
  }

  [(APSigningAuthorityPoolManager *)self setSetupCompletion:v4];
  [(APSigningAuthorityPoolManager *)self _refillSigningAuthorityPool];
}

- (void)setState:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  id v6 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int64_t v7 = [(APSigningAuthorityPoolManager *)self state];
    if ((unint64_t)(v7 - 18001) > 4) {
      v8 = @"setup started";
    }
    else {
      v8 = off_1E6A6B718[v7 - 18001];
    }
    if ((unint64_t)(a3 - 18001) > 4) {
      id v9 = @"setup started";
    }
    else {
      id v9 = off_1E6A6B718[a3 - 18001];
    }
    [(APSigningAuthorityPoolManager *)self lastStateChangeTime];
    double v11 = Current - v10;
    double v12 = CFAbsoluteTimeGetCurrent();
    [(APSigningAuthorityPoolManager *)self refillStartTime];
    int v15 = 134219010;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    int64_t v18 = (int64_t)v8;
    __int16 v19 = 2112;
    objc_super v20 = v9;
    __int16 v21 = 2048;
    double v22 = v11;
    __int16 v23 = 2048;
    double v24 = v12 - v13;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "Signing pool manager %p state %@ -> %@ (%.6f) (%.6f)", (uint8_t *)&v15, 0x34u);
  }

  [(APSigningAuthorityPoolManager *)self setLastStateChangeTime:Current];
  uint64_t v14 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = 134218240;
    uint64_t v16 = self;
    __int16 v17 = 2050;
    int64_t v18 = a3;
    _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_INFO, "Pool manager %p state changed to %{public}ld", (uint8_t *)&v15, 0x16u);
  }

  self->_state = a3;
}

- (void)setPoolSize:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 >= 5)
  {
    id v4 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = @"Requested pool size is greater than max allowed pool size, setting poolSize to max pool size.";
      _os_log_impl(&dword_1D70B2000, v4, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
    }

    a3 = 4;
  }
  self->_poolSize = a3;
}

- (void)_evaluateRotationEntitlement
{
  if (qword_1EB788FE8 == -1)
  {
    v2 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D70B2000, v2, OS_LOG_TYPE_INFO, "Setting the signing entitlement value.", v3, 2u);
    }

    qword_1EB788FE8 = +[APSigningClientValidator hasEntitlement:@"com.apple.ap.promotedcontent.signing.client"];
  }
}

- (void)setCurrentSigningAuthority:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = (APSigningAuthority *)a3;
  id v6 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 134218240;
    double v10 = self;
    __int16 v11 = 2048;
    double v12 = v5;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "Pool manager %p setting current authority %p", (uint8_t *)&v9, 0x16u);
  }

  if (self->_currentSigningAuthority != v5)
  {
    uint64_t v7 = [(APSigningAuthorityPoolManager *)self lock];
    [v7 lock];

    objc_storeStrong((id *)&self->_currentSigningAuthority, a3);
    v8 = [(APSigningAuthorityPoolManager *)self lock];
    [v8 unlock];
  }
}

- (void)_refillSigningAuthorityPool
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(APSigningAuthorityPoolManager *)self state] == 18002)
  {
    v3 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v29 = self;
      _os_log_impl(&dword_1D70B2000, v3, OS_LOG_TYPE_INFO, "Pool manager %p is in a permanent failure state. Cannot refill.", buf, 0xCu);
    }
  }
  else
  {
    id v4 = [(APSigningAuthorityPoolManager *)self lock];
    [v4 lock];

    int v5 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v29 = self;
      _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "Pool manager %p refilling", buf, 0xCu);
    }

    if ([(APSigningAuthorityPoolManager *)self _numSigningAuthoritiesToCreate])
    {
      [(APSigningAuthorityPoolManager *)self setRefillStartTime:CFAbsoluteTimeGetCurrent()];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v6 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = 0;
        uint64_t v10 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v6);
            }
            v9 += [*(id *)(*((void *)&v23 + 1) + 8 * i) usingStashedContext];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v8);
      }
      else
      {
        uint64_t v9 = 0;
      }

      unint64_t v13 = [(APSigningAuthorityPoolManager *)self numberToStash];
      uint64_t v14 = [APSigningAuthority alloc];
      int v15 = [(APSigningAuthorityPoolManager *)self name];
      v3 = [(APSigningAuthority *)v14 initWithPoolName:v15];

      if (v3 && [v3 state] != 7203)
      {
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        __int16 v19 = sub_1D70C76D8;
        objc_super v20 = &unk_1E6A6B6A8;
        __int16 v21 = self;
        double v22 = v3;
        [v22 setupWithCompletion:v13 != v9 completion:&v17];
      }
      else
      {
        [(APSigningAuthorityPoolManager *)self setState:18002];
      }
      uint64_t v16 = [(APSigningAuthorityPoolManager *)self lock];
      [v16 unlock];
    }
    else
    {
      double v12 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v29 = self;
        _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_INFO, "No need to refill signing authority pool %p, it's full.", buf, 0xCu);
      }

      v3 = [(APSigningAuthorityPoolManager *)self lock];
      [v3 unlock];
    }
  }
}

- (void)_handleCompletedSigningAuthority:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(APSigningAuthorityPoolManager *)self refillStartTime];
    int v27 = 134218498;
    objc_super v28 = self;
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 2048;
    double v32 = Current - v7;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "Pool manager %p received completed signing authority %@ in %.6f seconds since refill started.", (uint8_t *)&v27, 0x20u);
  }

  if (+[APSystemInternal isAppleInternalInstall])
  {
    uint64_t v8 = objc_alloc_init(APSigningAuthoritySettings);
    uint64_t v9 = [(APSigningAuthoritySettings *)v8 maxContextsAllowed];
    if ([v9 integerValue] <= 0)
    {
    }
    else
    {
      uint64_t v10 = [(APSigningAuthoritySettings *)v8 maxContextsAllowed];
      int v11 = [v10 unsignedIntValue];
      double v12 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
      uint64_t v13 = [v12 count];

      if (v13 == v11) {
        [v4 setFailureError:7201];
      }
    }
  }
  switch([v4 failureError])
  {
    case 7200:
    case 7205:
      uint64_t v14 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [v4 failureError];
        int v27 = 134218496;
        objc_super v28 = self;
        __int16 v29 = 2048;
        id v30 = v4;
        __int16 v31 = 2048;
        double v32 = *(double *)&v15;
        _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_ERROR, "Pool manager %p encountered an error setting up authority %p with error %ld. Retrying.", (uint8_t *)&v27, 0x20u);
      }

      [(APSigningAuthorityPoolManager *)self enterBackoff];
      goto LABEL_26;
    case 7201:
      uint64_t v17 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v27 = 134218240;
        objc_super v28 = self;
        __int16 v29 = 2048;
        id v30 = v4;
        _os_log_impl(&dword_1D70B2000, v17, OS_LOG_TYPE_INFO, "Pool manager %p rejecting authority %p due to exceeding max allowed count.", (uint8_t *)&v27, 0x16u);
      }

      uint64_t v18 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
      uint64_t v19 = [v18 count];

      if (!v19) {
        [(APSigningAuthorityPoolManager *)self setState:6101];
      }
      objc_super v20 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
      uint64_t v21 = [v20 count];
      unint64_t v22 = [(APSigningAuthorityPoolManager *)self poolSize];

      if (v21 != v22) {
        [(APSigningAuthorityPoolManager *)self setState:18005];
      }
      [(APSigningAuthorityPoolManager *)self _callSetupCompletionHandler];

      goto LABEL_26;
    case 7202:
      long long v23 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v27 = 134218240;
        objc_super v28 = self;
        __int16 v29 = 2048;
        id v30 = v4;
        _os_log_impl(&dword_1D70B2000, v23, OS_LOG_TYPE_ERROR, "Pool manager %p encountered an error signing with authority %p.", (uint8_t *)&v27, 0x16u);
      }

      [(APSigningAuthorityPoolManager *)self _refillSigningAuthorityPool];
LABEL_26:
      id v4 = 0;
      break;
    case 7203:
    case 7206:
      uint64_t v16 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v27 = 134218240;
        objc_super v28 = self;
        __int16 v29 = 2048;
        id v30 = v4;
        _os_log_impl(&dword_1D70B2000, v16, OS_LOG_TYPE_ERROR, "Pool manager %p: authority %p is either not supported on this platform or the caller does not have sufficient permissions.", (uint8_t *)&v27, 0x16u);
      }

      [(APSigningAuthorityPoolManager *)self setState:18002];
      [(APSigningAuthorityPoolManager *)self _callSetupCompletionHandler];
      break;
    case 7204:
      long long v24 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v27 = 134218240;
        objc_super v28 = self;
        __int16 v29 = 2048;
        id v30 = v4;
        _os_log_impl(&dword_1D70B2000, v24, OS_LOG_TYPE_INFO, "Pool manager %p adding signing authority %p to pool.", (uint8_t *)&v27, 0x16u);
      }

      [(APSigningAuthorityPoolManager *)self _addSigningAuthorityToPool:v4];
      long long v25 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
      uint64_t v26 = [v25 count];

      if (v26 == 1)
      {
        [(APSigningAuthorityPoolManager *)self setState:18001];
        [(APSigningAuthorityPoolManager *)self _callSetupCompletionHandler];
      }
      [(APSigningAuthorityPoolManager *)self _refillSigningAuthorityPool];
      break;
    default:
      break;
  }
}

- (void)_callSetupCompletionHandler
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = [(APSigningAuthorityPoolManager *)self state] - 18001;
    if (v4 > 4) {
      int v5 = @"setup started";
    }
    else {
      int v5 = off_1E6A6B718[v4];
    }
    double Current = CFAbsoluteTimeGetCurrent();
    [(APSigningAuthorityPoolManager *)self refillStartTime];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v5;
    __int16 v19 = 2048;
    double v20 = Current - v7;
    _os_log_impl(&dword_1D70B2000, v3, OS_LOG_TYPE_INFO, "Pool manager calling setup completion handler with state %@ (%.6f)", buf, 0x16u);
  }

  uint64_t v8 = [(APSigningAuthorityPoolManager *)self setupCompletion];

  if (v8)
  {
    if (+[APSystemInternal isAppleInternalInstall])
    {
      uint64_t v9 = objc_alloc_init(APSigningAuthoritySettings);
      uint64_t v10 = [(APSigningAuthoritySettings *)v9 callbackDelay];
      int v11 = [v10 unsignedIntValue];

      if (v11)
      {
        double v12 = dispatch_queue_create("com.apple.ap.signingpoolmanager.delay", 0);
        uint64_t v13 = [(APSigningAuthoritySettings *)v9 callbackDelay];
        dispatch_time_t v14 = dispatch_time(0, 1000000000 * [v13 unsignedIntValue]);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1D70C7E04;
        block[3] = &unk_1E6A6B6D0;
        block[4] = self;
        dispatch_after(v14, v12, block);

        [(APSigningAuthorityPoolManager *)self setSetupCompletion:0];
        return;
      }
    }
    uint64_t v15 = [(APSigningAuthorityPoolManager *)self setupCompletion];
    v15[2](v15, [(APSigningAuthorityPoolManager *)self state]);
  }
  [(APSigningAuthorityPoolManager *)self setSetupCompletion:0];
}

- (unint64_t)_numSigningAuthoritiesToCreate
{
  v3 = [(APSigningAuthorityPoolManager *)self lock];
  [v3 lock];

  unint64_t v4 = [(APSigningAuthorityPoolManager *)self poolSize];
  int v5 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
  unint64_t v6 = v4 - [v5 count];

  double v7 = [(APSigningAuthorityPoolManager *)self lock];
  [v7 unlock];

  return v6;
}

- (void)_addSigningAuthorityToPool:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t v6 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v19 = 134218240;
    double v20 = self;
    __int16 v21 = 2048;
    id v22 = v4;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "Pool manager %p adding signing authority %p", (uint8_t *)&v19, 0x16u);
  }

  double v7 = [(APSigningAuthorityPoolManager *)self lock];
  [v7 lock];

  [(APSigningAuthorityPoolManager *)self cancelBackoff];
  uint64_t v8 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
  uint64_t v9 = v8;
  if (v4)
  {
    if (![v8 count]) {
      [(APSigningAuthorityPoolManager *)self setCurrentSigningAuthority:v4];
    }
    if ([(APSigningAuthorityPoolManager *)self _numSigningAuthoritiesToCreate])
    {
      [v9 addObject:v4];
      uint64_t v10 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent() - Current;
        double v12 = CFAbsoluteTimeGetCurrent();
        [(APSigningAuthorityPoolManager *)self refillStartTime];
        int v19 = 134218752;
        double v20 = self;
        __int16 v21 = 2048;
        id v22 = v4;
        __int16 v23 = 2048;
        CFAbsoluteTime v24 = v11;
        __int16 v25 = 2048;
        double v26 = v12 - v13;
        dispatch_time_t v14 = "Pool manager %p added and validated signing authority %p (%.6f) (%.6f)";
        uint64_t v15 = v10;
        os_log_type_t v16 = OS_LOG_TYPE_INFO;
        uint32_t v17 = 42;
LABEL_13:
        _os_log_impl(&dword_1D70B2000, v15, v16, v14, (uint8_t *)&v19, v17);
      }
    }
    else
    {
      uint64_t v10 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v19 = 134218240;
        double v20 = self;
        __int16 v21 = 2048;
        id v22 = v4;
        dispatch_time_t v14 = "Pool manager %p not adding authority %p to pool, it is already full.";
        uint64_t v15 = v10;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        uint32_t v17 = 22;
        goto LABEL_13;
      }
    }
  }
  else
  {
    uint64_t v10 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      dispatch_time_t v14 = "Signing authority is nil, unable to add to pool";
      uint64_t v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 2;
      goto LABEL_13;
    }
  }

  uint64_t v18 = [(APSigningAuthorityPoolManager *)self lock];
  [v18 unlock];
}

- (void)_removeSigningAuthority:(id)a3 shouldRefill:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v8 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    double v20 = self;
    __int16 v21 = 2048;
    id v22 = v6;
    _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_INFO, "Pool manager %p removing signing authority %p", buf, 0x16u);
  }

  id v9 = [(APSigningAuthorityPoolManager *)self currentSigningAuthority];

  uint64_t v10 = APLogForCategory(0x2BuLL);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9 == v6)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_INFO, "This is the current signing authority, set it to nil and rotate.", buf, 2u);
    }

    [(APSigningAuthorityPoolManager *)self setCurrentSigningAuthority:0];
    id v18 = 0;
    [(APSigningAuthorityPoolManager *)self _rotateWithError:&v18];
    double v12 = (APSigningAuthorityPoolManager *)v18;
    if (v12)
    {
      double v13 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        double v20 = v12;
        _os_log_impl(&dword_1D70B2000, v13, OS_LOG_TYPE_ERROR, "Error encountered while attempting to rotate: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_INFO, "This is a signing authority in the pool, remove it and its observer, and refill the pool.", buf, 2u);
    }

    double v12 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
    [(APSigningAuthorityPoolManager *)v12 removeObject:v6];
  }

  if (v4) {
    [(APSigningAuthorityPoolManager *)self _refillSigningAuthorityPool];
  }
  dispatch_time_t v14 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent() - Current;
    double v16 = CFAbsoluteTimeGetCurrent();
    [(APSigningAuthorityPoolManager *)self refillStartTime];
    *(_DWORD *)buf = 134218752;
    double v20 = self;
    __int16 v21 = 2048;
    id v22 = v6;
    __int16 v23 = 2048;
    CFAbsoluteTime v24 = v15;
    __int16 v25 = 2048;
    double v26 = v16 - v17;
    _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_INFO, "Pool manager %p finished removing signing authority %p (%.6f) (%.6f)", buf, 0x2Au);
  }
}

- (void)_removeAllSigningAuthorities
{
  v3 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D70B2000, v3, OS_LOG_TYPE_DEBUG, "All signing authorities are being removed from the pool.", buf, 2u);
  }

  BOOL v4 = [(APSigningAuthorityPoolManager *)self lock];
  [v4 lock];

  int v5 = [(APSigningAuthorityPoolManager *)self currentSigningAuthority];

  if (v5)
  {
    id v6 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "This is the current signing authority, set it to nil.", v10, 2u);
    }

    [(APSigningAuthorityPoolManager *)self setCurrentSigningAuthority:0];
  }
  double v7 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
  [v7 removeAllObjects];

  uint64_t v8 = [(APSigningAuthorityPoolManager *)self lock];
  [v8 unlock];

  id v9 = [(APSigningAuthorityPoolManager *)self name];
  +[APSigningContextStorage destroyAndClearAllContextsForPool:v9];
}

- (void)_clearStashedContextsIfIndicated
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (+[APSystemInternal isAppleInternalInstall])
  {
    v3 = objc_alloc_init(APSigningAuthoritySettings);
    BOOL v4 = [(APSigningAuthoritySettings *)v3 clearStashedContexts];

    if (v4)
    {
      int v5 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [(APSigningAuthorityPoolManager *)self name];
        int v8 = 138412290;
        id v9 = v6;
        _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "Clearing all contexts for pool '%@'", (uint8_t *)&v8, 0xCu);
      }
      double v7 = [(APSigningAuthorityPoolManager *)self name];
      +[APSigningContextStorage destroyAndClearAllContextsForPool:v7];
    }
  }
}

- (BOOL)rotateWithError:(id *)a3
{
  int v5 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "Rotate the current signing authority.", v10, 2u);
  }

  id v6 = [(APSigningAuthorityPoolManager *)self lock];
  [v6 lock];

  BOOL v7 = [(APSigningAuthorityPoolManager *)self _rotateWithError:a3];
  int v8 = [(APSigningAuthorityPoolManager *)self lock];
  [v8 unlock];

  return v7;
}

- (BOOL)_rotateWithError:(id *)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v6 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "Pool manager %p rotating", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if ([(APSigningAuthorityPoolManager *)self state] == 18002)
  {
    BOOL v7 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "Error: Unable to rotate, we are in a permanent failure state.", (uint8_t *)&buf, 2u);
    }

    int v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31[0] = @"Pool manager in permanent error state, unable to rotate.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v10 = [v8 errorWithDomain:@"com.apple.ap.signingAuthorityPoolManagerErrorDomain" code:6101 userInfo:v9];

    if (a3) {
      *a3 = v10;
    }
    int v11 = *((unsigned __int8 *)v22 + 24);
  }
  else
  {
    uint64_t v10 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
    double v12 = objc_msgSend(v10, "AD_validSigningAuthority");
    if (v12)
    {
      double v13 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D70B2000, v13, OS_LOG_TYPE_INFO, "Successfully set up signing authority exists in the pool, set it to the current signing authority.", (uint8_t *)&buf, 2u);
      }

      [v10 removeObject:v12];
    }
    [(APSigningAuthorityPoolManager *)self setCurrentSigningAuthority:v12];
    [(APSigningAuthorityPoolManager *)self _refillSigningAuthorityPool];
    int v11 = 1;
    *((unsigned char *)v22 + 24) = 1;
    if (qword_1EB788FE8 == 1)
    {
      dispatch_time_t v14 = objc_alloc_init(APRotationRequestor);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v26 = 0x3032000000;
      uint64_t v27 = sub_1D70C8B10;
      objc_super v28 = sub_1D70C8B20;
      id v29 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_1D70C8B28;
      v16[3] = &unk_1E6A6B6F8;
      id v18 = &v21;
      p_long long buf = &buf;
      v16[4] = self;
      id v17 = v10;
      CFAbsoluteTime v20 = Current;
      [(APRotationRequestor *)v14 rotate:v16];
      if (a3) {
        *a3 = *(id *)(*((void *)&buf + 1) + 40);
      }

      _Block_object_dispose(&buf, 8);
      int v11 = *((unsigned __int8 *)v22 + 24);
    }
  }
  _Block_object_dispose(&v21, 8);
  return v11 != 0;
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(APSigningAuthorityPoolManager *)self lock];
  [v7 lock];

  int v8 = [(APSigningAuthorityPoolManager *)self currentSigningAuthority];
  int64_t v9 = [(APSigningAuthorityPoolManager *)self state];
  uint64_t v10 = [(APSigningAuthorityPoolManager *)self lock];
  [v10 unlock];

  if (v9 == 18002 || !v8)
  {
    CFAbsoluteTime v15 = @"Pool manager in permanent error state, unable to sign data.";
    if (v9 == 18002)
    {
      uint64_t v16 = 6101;
    }
    else
    {
      CFAbsoluteTime v15 = @"Signing authority not setup, unable to sign data.";
      uint64_t v16 = 6100;
    }
    goto LABEL_13;
  }
  if ([v8 state] != 17002)
  {
    CFAbsoluteTime v15 = @"Signing authority not setup, unable to sign data.";
    uint64_t v16 = 6100;
LABEL_13:
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = v15;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v12 = [v17 errorWithDomain:@"com.apple.ap.signingAuthorityPoolManagerErrorDomain" code:v16 userInfo:v18];

    if (!a4)
    {
      int v11 = 0;
      goto LABEL_19;
    }
    int v19 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      CFAbsoluteTime v20 = [v12 localizedDescription];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v26 = v20;
      _os_log_impl(&dword_1D70B2000, v19, OS_LOG_TYPE_ERROR, "Error: %{public}@", buf, 0xCu);
    }
    id v21 = v12;
    id v12 = v21;
    int v11 = 0;
LABEL_17:
    *a4 = v21;
    goto LABEL_19;
  }
  id v24 = 0;
  int v11 = [v8 signatureForData:v6 error:&v24];
  id v12 = v24;
  double v13 = APLogForCategory(0x2BuLL);
  dispatch_time_t v14 = v13;
  if (!v12 && v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_DEBUG, "Successfully got a signature", buf, 2u);
    }

    id v12 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = [v12 localizedDescription];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v26 = v23;
    _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_ERROR, "Error getting signature: %{public}@", buf, 0xCu);
  }
  if (a4)
  {
    id v21 = v12;
    id v12 = v21;
    goto LABEL_17;
  }
LABEL_19:

  return v11;
}

- (id)signatureForRawData:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(APSigningAuthorityPoolManager *)self lock];
  [v7 lock];

  int v8 = [(APSigningAuthorityPoolManager *)self currentSigningAuthority];
  int64_t v9 = [(APSigningAuthorityPoolManager *)self state];
  uint64_t v10 = [(APSigningAuthorityPoolManager *)self lock];
  [v10 unlock];

  if (v9 == 18002 || !v8)
  {
    CFAbsoluteTime v15 = @"Pool manager in permanent error state, unable to sign data.";
    if (v9 == 18002)
    {
      uint64_t v16 = 6101;
    }
    else
    {
      CFAbsoluteTime v15 = @"Signing authority not setup, unable to sign data.";
      uint64_t v16 = 6100;
    }
    goto LABEL_13;
  }
  if ([v8 state] != 17002)
  {
    CFAbsoluteTime v15 = @"Signing authority not setup, unable to sign data.";
    uint64_t v16 = 6100;
LABEL_13:
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = v15;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v12 = [v17 errorWithDomain:@"com.apple.ap.signingAuthorityPoolManagerErrorDomain" code:v16 userInfo:v18];

    if (!a4)
    {
      int v11 = 0;
      goto LABEL_19;
    }
    int v19 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      CFAbsoluteTime v20 = [v12 localizedDescription];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v26 = v20;
      _os_log_impl(&dword_1D70B2000, v19, OS_LOG_TYPE_ERROR, "Error: %{public}@", buf, 0xCu);
    }
    id v21 = v12;
    id v12 = v21;
    int v11 = 0;
LABEL_17:
    *a4 = v21;
    goto LABEL_19;
  }
  id v24 = 0;
  int v11 = [v8 signatureForRawData:v6 error:&v24];
  id v12 = v24;
  double v13 = APLogForCategory(0x2BuLL);
  dispatch_time_t v14 = v13;
  if (!v12 && v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_DEBUG, "Successfully got a signature", buf, 2u);
    }

    id v12 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = [v12 localizedDescription];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v26 = v23;
    _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_ERROR, "Error getting signature: %{public}@", buf, 0xCu);
  }
  if (a4)
  {
    id v21 = v12;
    id v12 = v21;
    goto LABEL_17;
  }
LABEL_19:

  return v11;
}

- (void)enterBackoff
{
  v3 = [(APSigningAuthorityPoolManager *)self backoffTimer];

  if (!v3)
  {
    BOOL v4 = [[APBackoffTimer alloc] initWithSchedule:&unk_1F2EAD7F8 name:@"APSigningAuthorityPoolManager"];
    [(APSigningAuthorityPoolManager *)self setBackoffTimer:v4];

    int v5 = [(APSigningAuthorityPoolManager *)self backoffTimer];
    [v5 setDelegate:self];
  }
  id v6 = [(APSigningAuthorityPoolManager *)self backoffTimer];
  [v6 scheduleNextLevelWithQueue:0];
}

- (void)cancelBackoff
{
  v3 = [(APSigningAuthorityPoolManager *)self backoffTimer];
  [v3 reset];

  [(APSigningAuthorityPoolManager *)self setBackoffTimer:0];
}

- (void)backoffTimerFired
{
  v3 = [(APSigningAuthorityPoolManager *)self backoffTimer];
  int v4 = [v3 scheduleTerminated];

  if (v4)
  {
    int v5 = [(APSigningAuthorityPoolManager *)self signingAuthorityPool];
    uint64_t v6 = [v5 count];

    if (!v6) {
      [(APSigningAuthorityPoolManager *)self setState:18002];
    }
    [(APSigningAuthorityPoolManager *)self _callSetupCompletionHandler];
    [(APSigningAuthorityPoolManager *)self cancelBackoff];
  }
  else
  {
    [(APSigningAuthorityPoolManager *)self _refillSigningAuthorityPool];
    id v7 = [(APSigningAuthorityPoolManager *)self backoffTimer];
    [v7 scheduleNextLevelWithQueue:0];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (APSigningAuthority)currentSigningAuthority
{
  return self->_currentSigningAuthority;
}

- (unint64_t)poolSize
{
  return self->_poolSize;
}

- (unint64_t)numberToStash
{
  return self->_numberToStash;
}

- (void)setNumberToStash:(unint64_t)a3
{
  self->_numberToStash = a3;
}

- (NSMutableArray)signingAuthorityPool
{
  return self->_signingAuthorityPool;
}

- (void)setSigningAuthorityPool:(id)a3
{
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (double)lastStateChangeTime
{
  return self->_lastStateChangeTime;
}

- (void)setLastStateChangeTime:(double)a3
{
  self->_lastStateChangeTime = a3;
}

- (double)refillStartTime
{
  return self->_refillStartTime;
}

- (void)setRefillStartTime:(double)a3
{
  self->_refillStartTime = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (APBackoffTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
{
}

- (id)setupCompletion
{
  return self->_setupCompletion;
}

- (void)setSetupCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setupCompletion, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_signingAuthorityPool, 0);
  objc_storeStrong((id *)&self->_currentSigningAuthority, 0);
}

@end