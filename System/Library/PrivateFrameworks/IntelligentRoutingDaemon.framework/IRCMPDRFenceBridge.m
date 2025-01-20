@interface IRCMPDRFenceBridge
+ (BOOL)isAvailable;
- (BOOL)isFenceActive;
- (BOOL)isSessionStarted;
- (CMPedestrianFenceManager)fenceManager;
- (IRCMPDRFenceBridge)initWithFenceIdentifier:(id)a3;
- (NSString)fenceIdentifier;
- (id)completionHandler;
- (os_unfair_lock_s)lock;
- (void)_handleFenceCompletionWithError:(id)a3;
- (void)_startSession;
- (void)clearFence;
- (void)dealloc;
- (void)endSession;
- (void)setCompletionHandler:(id)a3;
- (void)setFence:(float)a3 withCompletion:(id)a4;
- (void)setFenceIdentifier:(id)a3;
- (void)setFenceManager:(id)a3;
- (void)setIsFenceActive:(BOOL)a3;
- (void)setIsSessionStarted:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)startSession;
@end

@implementation IRCMPDRFenceBridge

- (IRCMPDRFenceBridge)initWithFenceIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRCMPDRFenceBridge;
  v5 = [(IRCMPDRFenceBridge *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(IRCMPDRFenceBridge *)v5 setLock:0];
    v7 = [@"com.apple.intelligentrouting.fence." stringByAppendingString:v4];
    [(IRCMPDRFenceBridge *)v6 setFenceIdentifier:v7];

    id v8 = objc_alloc_init(MEMORY[0x263F01798]);
    [(IRCMPDRFenceBridge *)v6 setFenceManager:v8];
  }
  return v6;
}

- (void)dealloc
{
  if ([(IRCMPDRFenceBridge *)self isFenceActive])
  {
    v3 = [(IRCMPDRFenceBridge *)self fenceManager];
    id v4 = [(IRCMPDRFenceBridge *)self fenceIdentifier];
    [v3 clearFence:v4];
  }
  if ([(IRCMPDRFenceBridge *)self isSessionStarted])
  {
    v5 = [(IRCMPDRFenceBridge *)self fenceManager];
    [v5 endSession];
  }
  v6.receiver = self;
  v6.super_class = (Class)IRCMPDRFenceBridge;
  [(IRCMPDRFenceBridge *)&v6 dealloc];
}

- (void)startSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(IRCMPDRFenceBridge *)self _startSession];

  os_unfair_lock_unlock(p_lock);
}

- (void)endSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (+[IRCMPDRFenceBridge isAvailable]
    && [(IRCMPDRFenceBridge *)self isSessionStarted])
  {
    id v4 = [(IRCMPDRFenceBridge *)self fenceManager];
    [v4 endSession];

    [(IRCMPDRFenceBridge *)self setIsSessionStarted:0];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setFence:(float)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_super v6 = (void (**)(void))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (+[IRCMPDRFenceBridge isAvailable]
    && [(IRCMPDRFenceBridge *)self isSessionStarted])
  {
    if ([(IRCMPDRFenceBridge *)self isFenceActive])
    {
      id v8 = [(IRCMPDRFenceBridge *)self fenceManager];
      v9 = [(IRCMPDRFenceBridge *)self fenceIdentifier];
      [v8 clearFence:v9];
    }
    objc_super v10 = (id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [(IRCMPDRFenceBridge *)self fenceIdentifier];
      *(float *)&double v12 = a3;
      v13 = [NSNumber numberWithFloat:v12];
      *(_DWORD *)buf = 138412546;
      v23 = v11;
      __int16 v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_25418E000, v10, OS_LOG_TYPE_INFO, "#pdr-fence-bridge, Setting PDR fence (%@) with radius %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v14 = [(IRCMPDRFenceBridge *)self fenceManager];
    v15 = [(IRCMPDRFenceBridge *)self fenceIdentifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __46__IRCMPDRFenceBridge_setFence_withCompletion___block_invoke;
    v20[3] = &unk_2653A1198;
    objc_copyWeak(&v21, (id *)buf);
    *(float *)&double v16 = a3;
    [v14 setFence:v15 withRadius:v20 withCompletion:v16];

    [(IRCMPDRFenceBridge *)self setIsFenceActive:1];
    [(IRCMPDRFenceBridge *)self setCompletionHandler:v6];
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v17 = (id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSNumber, "numberWithBool:", +[IRCMPDRFenceBridge isAvailable](IRCMPDRFenceBridge, "isAvailable"));
      v19 = objc_msgSend(NSNumber, "numberWithBool:", -[IRCMPDRFenceBridge isSessionStarted](self, "isSessionStarted"));
      *(_DWORD *)buf = 138412546;
      v23 = v18;
      __int16 v24 = 2112;
      v25 = v19;
      _os_log_error_impl(&dword_25418E000, v17, OS_LOG_TYPE_ERROR, "#pdr-fence-bridge, [ErrorId - Pedestrian fence set fail] Failed to set pedestrian fence, isAvailable:%@, isSessionStarted:%@", buf, 0x16u);
    }
    v6[2](v6);
  }
  os_unfair_lock_unlock(p_lock);
}

void __46__IRCMPDRFenceBridge_setFence_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleFenceCompletionWithError:v6];
  }
}

- (void)clearFence
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(IRCMPDRFenceBridge *)self isFenceActive])
  {
    id v4 = [(IRCMPDRFenceBridge *)self fenceManager];
    v5 = [(IRCMPDRFenceBridge *)self fenceIdentifier];
    [v4 clearFence:v5];

    [(IRCMPDRFenceBridge *)self setIsFenceActive:0];
    [(IRCMPDRFenceBridge *)self setCompletionHandler:0];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_startSession
{
  if (+[IRCMPDRFenceBridge isAvailable])
  {
    if (![(IRCMPDRFenceBridge *)self isSessionStarted])
    {
      objc_initWeak(&location, self);
      v3 = [(IRCMPDRFenceBridge *)self fenceManager];
      uint64_t v4 = MEMORY[0x263EF8330];
      uint64_t v5 = 3221225472;
      id v6 = __35__IRCMPDRFenceBridge__startSession__block_invoke;
      v7 = &unk_2653A11C0;
      objc_copyWeak(&v8, &location);
      [v3 startSessionWithStatusHandler:&v4];

      -[IRCMPDRFenceBridge setIsSessionStarted:](self, "setIsSessionStarted:", 1, v4, v5, v6, v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __35__IRCMPDRFenceBridge__startSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_INFO, "#pdr-fence-bridge, startSessionWithStatusHandler: %@", (uint8_t *)&v9, 0xCu);
    }
    if (v6) {
      [WeakRetained _handleFenceCompletionWithError:v6];
    }
  }
}

- (void)_handleFenceCompletionWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = *MEMORY[0x263F50090];
  if (v4)
  {
    id v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [v4 localizedDescription];
      id v8 = [(IRCMPDRFenceBridge *)self fenceIdentifier];
      -[IRCMPDRFenceBridge _handleFenceCompletionWithError:](v7, v8, v11, v6);
    }

    [(IRCMPDRFenceBridge *)self setIsSessionStarted:0];
    [(IRCMPDRFenceBridge *)self _startSession];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_INFO, "#pdr-fence-bridge, PDR fence completed sucessfully", v11, 2u);
  }
  int v9 = [(IRCMPDRFenceBridge *)self completionHandler];

  if (v9)
  {
    id v10 = [(IRCMPDRFenceBridge *)self completionHandler];
    v10[2]();

    [(IRCMPDRFenceBridge *)self setCompletionHandler:0];
  }
  [(IRCMPDRFenceBridge *)self setIsFenceActive:0];
  os_unfair_lock_unlock(&self->_lock);
}

+ (BOOL)isAvailable
{
  LODWORD(v2) = [MEMORY[0x263F01798] isAvailable];
  if (v2) {
    return ((unint64_t)[MEMORY[0x263F01798] availableFenceTypes] >> 1) & 1;
  }
  return v2;
}

- (CMPedestrianFenceManager)fenceManager
{
  return self->_fenceManager;
}

- (void)setFenceManager:(id)a3
{
}

- (NSString)fenceIdentifier
{
  return self->_fenceIdentifier;
}

- (void)setFenceIdentifier:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)isFenceActive
{
  return self->_isFenceActive;
}

- (void)setIsFenceActive:(BOOL)a3
{
  self->_isFenceActive = a3;
}

- (BOOL)isSessionStarted
{
  return self->_isSessionStarted;
}

- (void)setIsSessionStarted:(BOOL)a3
{
  self->_isSessionStarted = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_fenceIdentifier, 0);

  objc_storeStrong((id *)&self->_fenceManager, 0);
}

- (void)_handleFenceCompletionWithError:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_25418E000, log, OS_LOG_TYPE_ERROR, "#pdr-fence-bridge, [ErrorId - PDR fence completion error] PDR fence completed with error: %@ and identifier %@", buf, 0x16u);
}

@end