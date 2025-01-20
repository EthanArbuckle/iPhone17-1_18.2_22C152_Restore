@interface BLSAssertion
+ (id)acquireWithExplanation:(id)a3 observer:(id)a4 attributes:(id)a5;
+ (id)defaultService;
+ (void)setDefaultService:(id)a3;
- (BLSAssertion)initWithExplanation:(id)a3 attributes:(id)a4;
- (BLSAssertionDescriptor)descriptor;
- (BLSAssertionIdentifier)identifier;
- (BLSAssertionService)service;
- (BOOL)isAcquired;
- (BOOL)isActive;
- (BOOL)isPaused;
- (NSArray)attributes;
- (NSString)description;
- (NSString)explanation;
- (double)_lock_activeDuration;
- (id)lock_description;
- (uint64_t)setLocalState:(uint64_t)a1;
- (unint64_t)acquisitionState;
- (void)acquireWithCompletion:(id)a3;
- (void)acquireWithObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)notifyObserversWithBlock:(uint64_t)a1;
- (void)removeObserver:(id)a3;
- (void)restartTimeoutTimer;
- (void)serviceDidAcquire;
- (void)serviceDidCancelWithError:(id)a3;
- (void)serviceDidPause;
- (void)serviceDidResume;
- (void)serviceFailedToAcquireWithError:(id)a3;
- (void)serviceWillCancel;
- (void)setIdentifier:(id)a3;
- (void)setPaused:(uint64_t)a1;
- (void)setService:(id)a3;
@end

@implementation BLSAssertion

+ (id)acquireWithExplanation:(id)a3 observer:(id)a4 attributes:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[BLSAssertion alloc] initWithExplanation:v9 attributes:v7];

  [(BLSAssertion *)v10 acquireWithObserver:v8];

  return v10;
}

- (BLSAssertion)initWithExplanation:(id)a3 attributes:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BLSAssertion;
  id v8 = [(BLSAssertion *)&v21 init];
  id v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_lock_localState = 0;
    id v10 = v7;
    uint64_t v11 = [v10 count];
    v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];

    id v7 = [v12 allObjects];

    if ([v7 count] != v11)
    {
      v13 = bls_assertions_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218498;
        v23 = v9;
        __int16 v24 = 2114;
        id v25 = v6;
        __int16 v26 = 2114;
        id v27 = v10;
        _os_log_fault_impl(&dword_1B55DE000, v13, OS_LOG_TYPE_FAULT, "%p for assertion with explanation:%{public}@ cannot repeat the same exact attribute:%{public}@", buf, 0x20u);
      }
    }
    v14 = [[BLSAssertionDescriptor alloc] initWithExplanation:v6 attributes:v7];
    descriptor = v9->_descriptor;
    v9->_descriptor = v14;

    uint64_t v16 = +[BLSAssertion defaultService]();
    service = v9->_service;
    v9->_service = (BLSAssertionService *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:2];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v18;
  }
  return v9;
}

+ (id)defaultService
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock);
  id v0 = (id)_defaultService;
  if (!v0)
  {
    BOOL v1 = +[BLSRuntime isHostProcess];
    v2 = off_1E6106D48;
    if (!v1) {
      v2 = off_1E6106DA8;
    }
    id v3 = objc_alloc_init(*v2);
    v4 = (void *)_defaultService;
    _defaultService = (uint64_t)v3;

    id v0 = v3;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock);

  return v0;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = -[BLSAssertion lock_description](a1);
  int v5 = 134218242;
  id v6 = a1;
  __int16 v7 = 2114;
  id v8 = v4;
  _os_log_fault_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_FAULT, "%p BLSAssertion must be invalidated before dealloc:%{public}@", (uint8_t *)&v5, 0x16u);
}

- (id)lock_description
{
  id v1 = a1;
  if (a1)
  {
    v2 = objc_opt_new();
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    __int16 v7 = __32__BLSAssertion_lock_description__block_invoke;
    id v8 = &unk_1E6106FA8;
    id v9 = v2;
    id v10 = v1;
    id v3 = v2;
    [v3 appendProem:v1 block:&v5];
    objc_msgSend(v3, "description", v5, v6, v7, v8);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[BLSAssertion lock_description](self);
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

id __32__BLSAssertion_lock_description__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 40) - 1;
  if (v3 > 4) {
    v4 = @"initialized";
  }
  else {
    v4 = off_1E6107630[v3];
  }
  [v2 appendString:v4 withName:@"state"];
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(void *)(v5 + 40) == 1)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    __int16 v7 = BLSShortLoggingStringForMachTime(*(void *)(v5 + 56));
    [v6 appendString:v7 withName:@"requested"];

    id v8 = *(void **)(a1 + 32);
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    id v9 = (id)objc_msgSend(v8, "appendTimeInterval:withName:decomposeUnits:", @"waited", 1);
    uint64_t v5 = *(void *)(a1 + 40);
  }
  if (*(void *)(v5 + 64))
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = BLSShortLoggingStringForMachTime(*(void *)(v5 + 64));
    [v10 appendString:v11 withName:@"acquired"];

    v13 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v12 + 36) || !*(void *)(v12 + 80)) {
      mach_continuous_time();
    }
    BSTimeDifferenceFromMachTimeToMachTime();
    id v14 = (id)objc_msgSend(v13, "appendTimeInterval:withName:decomposeUnits:", @"duration", 1);
    uint64_t v5 = *(void *)(a1 + 40);
  }
  if (*(unsigned char *)(v5 + 38))
  {
    id v15 = (id)[*(id *)(a1 + 32) appendTimeInterval:@"activeDuration" withName:1 decomposeUnits:-[BLSAssertion _lock_activeDuration](v5)];
    uint64_t v5 = *(void *)(a1 + 40);
  }
  id v16 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(v5 + 37) withName:@"isPaused" ifEqualTo:1];
  id v17 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 88) withName:@"descriptor"];
  id v18 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"identifier" skipIfNil:1];
  v19 = *(void **)(a1 + 32);
  v20 = [*(id *)(a1 + 40) service];
  id v21 = (id)[v19 appendPointer:v20 withName:@"service"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "count"), @"observerCount");
}

- (double)_lock_activeDuration
{
  if (!a1) {
    return 0.0;
  }
  double v1 = *(double *)(a1 + 48);
  if (*(unsigned char *)(a1 + 36) && !*(unsigned char *)(a1 + 37))
  {
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    return v1 + v2;
  }
  return v1;
}

- (NSString)explanation
{
  return [(BLSAssertionDescriptor *)self->_descriptor explanation];
}

- (NSArray)attributes
{
  return [(BLSAssertionDescriptor *)self->_descriptor attributes];
}

- (BOOL)isAcquired
{
  double v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_acquired;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (uint64_t)setLocalState:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v4 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = a2;
  switch(a2)
  {
    case 1:
      uint64_t v6 = 56;
      goto LABEL_6;
    case 2:
      *(unsigned char *)(a1 + 36) = 1;
      *(unsigned char *)(a1 + 38) = 0;
      *(void *)(a1 + 48) = 0;
      uint64_t v9 = mach_continuous_time();
      uint64_t v7 = 0;
      *(void *)(a1 + 64) = v9;
      *(void *)(a1 + 72) = v9;
      uint64_t v6 = 80;
      goto LABEL_7;
    case 3:
    case 5:
      *(unsigned char *)(a1 + 36) = 0;
      goto LABEL_4;
    case 4:
LABEL_4:
      uint64_t v6 = 80;
LABEL_6:
      uint64_t v7 = mach_continuous_time();
LABEL_7:
      *(void *)(a1 + v6) = v7;
      break;
    default:
      break;
  }
  os_unfair_lock_unlock(v4);
  return v5;
}

- (unint64_t)acquisitionState
{
  unint64_t v2 = (unint64_t)self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2)
  {
    uint64_t v4 = *(void *)(v2 + 40);
    if (v4 == 2) {
      unint64_t v2 = 2;
    }
    else {
      unint64_t v2 = v4 == 1;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (BOOL)isPaused
{
  unint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_paused;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPaused:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    int v5 = *(unsigned __int8 *)(a1 + 37);
    *(unsigned char *)(a1 + 37) = a2;
    if (*(unsigned char *)(a1 + 36))
    {
      if (v5 == a2)
      {
        uint64_t v6 = bls_assertions_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          [(BLSAssertion *)(void *)a1 setPaused:v6];
        }
      }
      else if (a2)
      {
        *(unsigned char *)(a1 + 38) = 1;
        mach_continuous_time();
        BSTimeDifferenceFromMachTimeToMachTime();
        *(double *)(a1 + 48) = v7 + *(double *)(a1 + 48);
      }
      else
      {
        *(void *)(a1 + 72) = mach_continuous_time();
      }
    }
    os_unfair_lock_unlock(v4);
  }
}

- (BOOL)isActive
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_lock_acquired && !self->_lock_paused;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BLSAssertionIdentifier)identifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setIdentifier:(id)a3
{
  BOOL v4 = (BLSAssertionIdentifier *)a3;
  os_unfair_lock_lock(&self->_lock);
  identifier = self->_identifier;
  self->_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)acquireWithObserver:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    uint64_t v6 = NSString;
    double v7 = -[BLSAssertion lock_description](self);
    id v8 = [v6 stringWithFormat:@"BLSAssertion cannot be acquired after invalidation:%@", v7];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[BLSAssertion acquireWithObserver:](a2);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    if (v9) {
      [(BLSAssertion *)self addObserver:v9];
    }
    -[BLSAssertion setLocalState:]((uint64_t)self, 1);
    int v5 = [(BLSAssertion *)self service];
    [v5 acquireAssertion:self];
  }
}

- (void)acquireWithCompletion:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v9 = v5;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v6 = +[BLSAssertionAcquisitionObserver observerWithCompletion:v9];
    acquisitionObserver = self->_acquisitionObserver;
    self->_acquisitionObserver = v6;

    os_unfair_lock_unlock(&self->_lock);
    [(BLSAssertion *)self acquireWithObserver:self->_acquisitionObserver];
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[BLSAssertion acquireWithCompletion:](a2);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)cancel
{
  -[BLSAssertion setLocalState:]((uint64_t)self, 4);
  id v3 = [(BLSAssertion *)self service];
  [v3 cancelAssertion:self withError:0];
}

- (void)invalidate
{
  [(BLSAssertion *)self cancel];
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)restartTimeoutTimer
{
  id v3 = [(BLSAssertion *)self service];
  [v3 restartAssertionTimeoutTimer:self];
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

+ (void)setDefaultService:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock);
  id v4 = (id)_defaultService;
  id v5 = (void *)_defaultService;
  _defaultService = (uint64_t)v3;
  id v6 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock);
  if (v6)
  {
    [v4 replaceWithService:v6];
  }
  else
  {
    double v7 = bls_assertions_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1B55DE000, v7, OS_LOG_TYPE_DEFAULT, "BLSAssertionService defaultService reset - should only occur during unit testing", v8, 2u);
    }
  }
}

- (void)serviceDidAcquire
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = -[BLSAssertion setLocalState:]((uint64_t)self, 2);
  if (v3 == 1)
  {
    id v6 = bls_assertions_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v13 = self;
      __int16 v14 = 2114;
      id v15 = self;
      double v7 = "%p did acquire assertion %{public}@";
      id v8 = v6;
      uint32_t v9 = 22;
LABEL_13:
      _os_log_impl(&dword_1B55DE000, v8, OS_LOG_TYPE_INFO, v7, buf, v9);
    }
LABEL_14:

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__BLSAssertion_serviceDidAcquire__block_invoke;
    v11[3] = &unk_1E61075E8;
    v11[4] = self;
    -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v11);
    return;
  }
  uint64_t v4 = v3;
  if (v3 != 2)
  {
    id v6 = bls_assertions_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(v4 - 3) > 2) {
        id v10 = @"initialized";
      }
      else {
        id v10 = off_1E6107658[v4 - 3];
      }
      *(_DWORD *)buf = 134218498;
      v13 = self;
      __int16 v14 = 2114;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v10;
      double v7 = "%p did acquire assertion %{public}@, oldState:%{public}@";
      id v8 = v6;
      uint32_t v9 = 32;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v5 = bls_assertions_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v13 = self;
    __int16 v14 = 2114;
    id v15 = self;
    _os_log_impl(&dword_1B55DE000, v5, OS_LOG_TYPE_INFO, "%p did reacquire assertion %{public}@", buf, 0x16u);
  }
}

void __33__BLSAssertion_serviceDidAcquire__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assertionWasAcquired:*(void *)(a1 + 32)];
  }
}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__BLSAssertion_notifyObserversWithBlock___block_invoke;
    v5[3] = &unk_1E6107250;
    v5[4] = a1;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

- (void)serviceFailedToAcquireWithError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  if (v5 == @"com.apple.BacklightServices" && [v4 code] == 2)
  {
    BOOL v6 = [(BLSAssertion *)self isAcquired];

    if (v6)
    {
      os_unfair_lock_lock(&self->_lock);
      self->_lock_localState = 2;
      os_unfair_lock_unlock(&self->_lock);
      double v7 = bls_assertions_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[BLSAssertion serviceFailedToAcquireWithError:]((uint64_t)self, v4);
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  -[BLSAssertion setLocalState:]((uint64_t)self, 3);
  double v7 = bls_assertions_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[BLSAssertion serviceFailedToAcquireWithError:]((uint64_t)self, v4);
  }
LABEL_9:

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__BLSAssertion_serviceFailedToAcquireWithError___block_invoke;
  v9[3] = &unk_1E6107610;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v9);
}

void __48__BLSAssertion_serviceFailedToAcquireWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assertion:*(void *)(a1 + 32) didFailToAcquireWithError:*(void *)(a1 + 40)];
  }
}

- (void)serviceDidPause
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  -[BLSAssertion setPaused:]((uint64_t)self, 1);
  id v3 = bls_assertions_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    BOOL v6 = self;
    __int16 v7 = 2114;
    id v8 = self;
    _os_log_impl(&dword_1B55DE000, v3, OS_LOG_TYPE_INFO, "%p did pause assertion %{public}@", buf, 0x16u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__BLSAssertion_serviceDidPause__block_invoke;
  v4[3] = &unk_1E61075E8;
  v4[4] = self;
  -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v4);
}

void __31__BLSAssertion_serviceDidPause__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assertionDidPause:*(void *)(a1 + 32)];
  }
}

- (void)serviceDidResume
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  -[BLSAssertion setPaused:]((uint64_t)self, 0);
  id v3 = bls_assertions_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    BOOL v6 = self;
    __int16 v7 = 2114;
    id v8 = self;
    _os_log_impl(&dword_1B55DE000, v3, OS_LOG_TYPE_INFO, "%p did resume assertion %{public}@", buf, 0x16u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__BLSAssertion_serviceDidResume__block_invoke;
  v4[3] = &unk_1E61075E8;
  v4[4] = self;
  -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v4);
}

void __32__BLSAssertion_serviceDidResume__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assertionDidResume:*(void *)(a1 + 32)];
  }
}

- (void)serviceWillCancel
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = bls_assertions_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    BOOL v6 = self;
    __int16 v7 = 2114;
    id v8 = self;
    _os_log_impl(&dword_1B55DE000, v3, OS_LOG_TYPE_INFO, "%p (warning) will cancel assertion %{public}@", buf, 0x16u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__BLSAssertion_serviceWillCancel__block_invoke;
  v4[3] = &unk_1E61075E8;
  v4[4] = self;
  -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v4);
}

void __33__BLSAssertion_serviceWillCancel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assertionWillCancel:*(void *)(a1 + 32)];
  }
}

- (void)serviceDidCancelWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  -[BLSAssertion setLocalState:]((uint64_t)self, 5);
  id v5 = bls_assertions_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = objc_msgSend(v4, "bls_loggingString");
    *(_DWORD *)buf = 134218498;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    v13 = self;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1B55DE000, v5, OS_LOG_TYPE_INFO, "%p did cancel assertion %{public}@ with error:%{public}@", buf, 0x20u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__BLSAssertion_serviceDidCancelWithError___block_invoke;
  v8[3] = &unk_1E6107610;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v8);
}

void __42__BLSAssertion_serviceDidCancelWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assertion:*(void *)(a1 + 32) didCancelWithError:*(void *)(a1 + 40)];
  }
}

void __41__BLSAssertion_notifyObserversWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
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
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BLSAssertionDescriptor)descriptor
{
  return self->_descriptor;
}

- (BLSAssertionService)service
{
  return (BLSAssertionService *)objc_getProperty(self, a2, 96, 1);
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_acquisitionObserver, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setPaused:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = -[BLSAssertion lock_description](a1);
  int v7 = 134218498;
  long long v8 = a1;
  __int16 v9 = 1024;
  int v10 = a2;
  __int16 v11 = 2114;
  __int16 v12 = v6;
  _os_log_error_impl(&dword_1B55DE000, a3, OS_LOG_TYPE_ERROR, "%p assertion setPaused:%{BOOL}u when not acquired %{public}@", (uint8_t *)&v7, 0x1Cu);
}

- (void)acquireWithObserver:(const char *)a1 .cold.1(const char *a1)
{
  double v1 = NSStringFromSelector(a1);
  unint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1B55DE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireWithCompletion:(const char *)a1 .cold.1(const char *a1)
{
  double v1 = NSStringFromSelector(a1);
  unint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1B55DE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)serviceFailedToAcquireWithError:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  unint64_t v2 = objc_msgSend(a2, "bls_loggingString");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5(&dword_1B55DE000, v3, v4, "%p already acquired assertion %{public}@ with error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)serviceFailedToAcquireWithError:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  unint64_t v2 = objc_msgSend(a2, "bls_loggingString");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5(&dword_1B55DE000, v3, v4, "%p failed to acquire assertion %{public}@ with error:%{public}@", v5, v6, v7, v8, v9);
}

@end