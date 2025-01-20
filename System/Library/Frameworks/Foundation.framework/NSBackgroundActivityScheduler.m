@interface NSBackgroundActivityScheduler
- (BOOL)_isAppRefresh;
- (BOOL)isPreregistered;
- (BOOL)repeats;
- (BOOL)shouldDefer;
- (NSBackgroundActivityScheduler)init;
- (NSBackgroundActivityScheduler)initWithIdentifier:(NSString *)identifier;
- (NSQualityOfService)qualityOfService;
- (NSString)identifier;
- (NSTimeInterval)interval;
- (NSTimeInterval)tolerance;
- (double)delay;
- (id)checkInHandler;
- (id)currentActivity;
- (void)_setAdditionalXPCActivityProperties:(id)a3;
- (void)_updateCriteria:(id)a3;
- (void)_updateCriteriaForCompletedActivity:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)scheduleWithBlock:(void *)block;
- (void)setCheckInHandler:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setDelay:(double)a3;
- (void)setInterval:(NSTimeInterval)interval;
- (void)setPreregistered:(BOOL)a3;
- (void)setQualityOfService:(NSQualityOfService)qualityOfService;
- (void)setRepeats:(BOOL)repeats;
- (void)setTolerance:(NSTimeInterval)tolerance;
- (void)set_appRefresh:(BOOL)a3;
@end

@implementation NSBackgroundActivityScheduler

- (NSTimeInterval)interval
{
  return self->_interval;
}

- (NSBackgroundActivityScheduler)init
{
}

- (NSBackgroundActivityScheduler)initWithIdentifier:(NSString *)identifier
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!identifier || ![(NSString *)identifier length]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], @"The identifier should be a reverse-DNS style string, for example com.mycompany.myapp.activity_name", 0 reason userInfo]);
  }
  v7.receiver = self;
  v7.super_class = (Class)NSBackgroundActivityScheduler;
  v5 = [(NSBackgroundActivityScheduler *)&v7 init];
  v5->_qualityOfService = 9;
  v5->_identifier = (NSString *)[(NSString *)identifier copy];
  v5->_invalidateLock._os_unfair_lock_opaque = 0;
  return v5;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];

  currentActivity = self->_currentActivity;
  if (currentActivity) {
    xpc_release(currentActivity);
  }
  additionalProperties = self->_additionalProperties;
  if (additionalProperties) {
    xpc_release(additionalProperties);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSBackgroundActivityScheduler;
  [(NSBackgroundActivityScheduler *)&v5 dealloc];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSQualityOfService)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  self->_qualityOfService = qualityOfService;
  atomic_fetch_or_explicit((atomic_uchar *volatile)&self->_flags, 0x20u, memory_order_relaxed);
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)repeats
{
  self->_repeats = repeats;
  atomic_fetch_or_explicit((atomic_uchar *volatile)&self->_flags, 0x20u, memory_order_relaxed);
}

- (BOOL)_isAppRefresh
{
  return self->_appRefresh;
}

- (void)set_appRefresh:(BOOL)a3
{
  self->_appRefresh = a3;
  atomic_fetch_or_explicit((atomic_uchar *volatile)&self->_flags, 0x20u, memory_order_relaxed);
}

- (void)setInterval:(NSTimeInterval)interval
{
  if (interval < 1.0)
  {
    v3 = +[NSString stringWithFormat:@"%@: Invalid value for interval (%f). The value must be >= 1.", self, *(void *)&interval];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v3 userInfo:0]);
  }
  self->_interval = interval;
  atomic_fetch_or_explicit((atomic_uchar *volatile)&self->_flags, 0x20u, memory_order_relaxed);
}

- (NSTimeInterval)tolerance
{
  return self->_tolerance;
}

- (void)setTolerance:(NSTimeInterval)tolerance
{
  if (tolerance < 0.0)
  {
    v3 = +[NSString stringWithFormat:@"%@: Invalid value for tolerance (%f). The value must be >= 0.", self, *(void *)&tolerance];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v3 userInfo:0]);
  }
  self->_tolerance = tolerance;
  atomic_fetch_or_explicit((atomic_uchar *volatile)&self->_flags, 0x20u, memory_order_relaxed);
}

- (BOOL)isPreregistered
{
  return self->_preregistered;
}

- (void)setPreregistered:(BOOL)a3
{
  self->_preregistered = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
  atomic_fetch_or_explicit((atomic_uchar *volatile)&self->_flags, 0x20u, memory_order_relaxed);
}

- (void)_setAdditionalXPCActivityProperties:(id)a3
{
  additionalProperties = self->_additionalProperties;
  if (additionalProperties != a3)
  {
    if (additionalProperties)
    {
      xpc_release(additionalProperties);
      self->_additionalProperties = 0;
    }
    if (a3) {
      self->_additionalProperties = (OS_xpc_object *)xpc_retain(a3);
    }
  }
}

- (void)_updateCriteria:(id)a3
{
  applier[5] = *MEMORY[0x1E4F143B8];
  [(NSBackgroundActivityScheduler *)self tolerance];
  double v6 = v5;
  [(NSBackgroundActivityScheduler *)self interval];
  double v8 = v7;
  if (v6 == 0.0 && v7 != 0.0)
  {
    double v6 = v7 * 0.5;
    if (v7 * 0.5 < 1.0) {
      double v6 = 0.0;
    }
  }
  if (v7 > 0.0)
  {
    [(NSBackgroundActivityScheduler *)self delay];
    int64_t v10 = llround(v9);
    if (!v10)
    {
      int64_t v10 = llround(v8 - v6);
      if (v10 <= 0)
      {
        v15 = +[NSString stringWithFormat:@"%@: Invalid value for tolerance (%f). The value must be less than the interval.", self, *(void *)&v6];
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0]);
      }
    }
    xpc_dictionary_set_int64(a3, (const char *)*MEMORY[0x1E4F14170], v10);
    xpc_dictionary_set_BOOL(a3, (const char *)*MEMORY[0x1E4F142F8], [(NSBackgroundActivityScheduler *)self repeats]);
    xpc_dictionary_set_int64(a3, (const char *)*MEMORY[0x1E4F141C8], llround(v8));
  }
  if ([(NSBackgroundActivityScheduler *)self _isAppRefresh])
  {
    xpc_dictionary_set_BOOL(a3, (const char *)*MEMORY[0x1E4F14148], 1);
    xpc_dictionary_set_BOOL(a3, (const char *)*MEMORY[0x1E4F142F8], [(NSBackgroundActivityScheduler *)self repeats]);
  }
  if (v6 != 0.0) {
    xpc_dictionary_set_int64(a3, (const char *)*MEMORY[0x1E4F141A8], llround(v6));
  }
  v11 = (const char *)*MEMORY[0x1E4F142C8];
  unint64_t v12 = __ROR8__([(NSBackgroundActivityScheduler *)self qualityOfService] - 9, 3);
  if (v12 > 3) {
    v13 = (const char **)MEMORY[0x1E4F142D0];
  }
  else {
    v13 = (const char **)qword_1E51FA4E0[v12];
  }
  xpc_dictionary_set_string(a3, v11, *v13);
  additionalProperties = self->_additionalProperties;
  if (additionalProperties)
  {
    if (object_getClass(additionalProperties) == (Class)MEMORY[0x1E4F14590])
    {
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __49__NSBackgroundActivityScheduler__updateCriteria___block_invoke;
      applier[3] = &unk_1E51FA498;
      applier[4] = a3;
      xpc_dictionary_apply(additionalProperties, applier);
    }
  }
}

uint64_t __49__NSBackgroundActivityScheduler__updateCriteria___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

- (void)_updateCriteriaForCompletedActivity:(id)a3
{
  if ((atomic_fetch_and_explicit((atomic_uchar *volatile)&self->_flags, 0xDFu, memory_order_relaxed) & 0x20) != 0)
  {
    xpc_object_t v5 = xpc_activity_copy_criteria((xpc_activity_t)a3);
    [(NSBackgroundActivityScheduler *)self _updateCriteria:v5];
    xpc_activity_set_criteria((xpc_activity_t)a3, v5);
    xpc_release(v5);
  }
}

- (id)currentActivity
{
  return self->_currentActivity;
}

- (void)setCurrentActivity:(id)a3
{
  currentActivity = self->_currentActivity;
  if (currentActivity != a3)
  {
    if (currentActivity)
    {
      xpc_release(currentActivity);
      self->_currentActivity = 0;
    }
    if (a3) {
      self->_currentActivity = (OS_xpc_object *)xpc_retain(a3);
    }
  }
}

- (void)scheduleWithBlock:(void *)block
{
  handler[5] = *MEMORY[0x1E4F143B8];
  if (!block)
  {
    double v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: The argument may not be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  id activity = self->_activity;
  if (activity != block)
  {

    self->_id activity = (id)[block copy];
  }
  if ([(NSBackgroundActivityScheduler *)self isPreregistered])
  {
    xpc_object_t v6 = (xpc_object_t)*MEMORY[0x1E4F14158];
    xpc_retain((xpc_object_t)*MEMORY[0x1E4F14158]);
  }
  else
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    [(NSBackgroundActivityScheduler *)self _updateCriteria:v6];
  }
  atomic_fetch_and_explicit((atomic_uchar *volatile)&self->_flags, 0xDFu, memory_order_relaxed);
  double v7 = [(NSString *)[(NSBackgroundActivityScheduler *)self identifier] UTF8String];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __51__NSBackgroundActivityScheduler_scheduleWithBlock___block_invoke;
  handler[3] = &unk_1E51F99C0;
  handler[4] = self;
  xpc_activity_register(v7, v6, handler);
  xpc_release(v6);
}

void __51__NSBackgroundActivityScheduler_scheduleWithBlock___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
    id v14 = *(id *)(*(void *)(a1 + 32) + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
    if (v14)
    {
      [*(id *)(a1 + 32) setCurrentActivity:activity];
      if (!xpc_activity_set_state(activity, 4)) {
        NSLog((NSString *)@"Unknown error: state transition to CONTINUE failed");
      }
      __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)v14);
    }
  }
  else if (!state)
  {
    xpc_object_t v5 = xpc_activity_copy_criteria(activity);
    if (v5)
    {
      xpc_object_t v6 = v5;
      int64_t int64 = xpc_dictionary_get_int64(v5, (const char *)*MEMORY[0x1E4F141C8]);
      BOOL v8 = int64 != 0;
      if (int64) {
        [*(id *)(a1 + 32) setInterval:(double)int64];
      }
      int64_t v9 = xpc_dictionary_get_int64(v6, (const char *)*MEMORY[0x1E4F14170]);
      if (v9) {
        [*(id *)(a1 + 32) setDelay:(double)v9];
      }
      int64_t v10 = xpc_dictionary_get_int64(v6, (const char *)*MEMORY[0x1E4F141A8]);
      if (v10) {
        [*(id *)(a1 + 32) setTolerance:(double)v10];
      }
      v11 = (const char *)*MEMORY[0x1E4F142F8];
      if (xpc_dictionary_get_value(v6, (const char *)*MEMORY[0x1E4F142F8])) {
        BOOL v8 = xpc_dictionary_get_BOOL(v6, v11);
      }
      [*(id *)(a1 + 32) setRepeats:v8];
      string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1E4F142C8]);
      if ((const char *)*MEMORY[0x1E4F142E0] == string || string && !strcmp((const char *)*MEMORY[0x1E4F142E0], string)) {
        uint64_t v13 = 17;
      }
      else {
        uint64_t v13 = 9;
      }
      [*(id *)(a1 + 32) setQualityOfService:v13];
      xpc_release(v6);
      atomic_fetch_and_explicit((atomic_uchar *volatile)(*(void *)(a1 + 32) + 80), 0xDFu, memory_order_relaxed);
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 48);
    if (v15)
    {
      (*(void (**)(void))(v15 + 16))();
      v16 = *(void **)(a1 + 32);
      [v16 _updateCriteriaForCompletedActivity:activity];
    }
  }
}

void __51__NSBackgroundActivityScheduler_scheduleWithBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setCurrentActivity:0];
  if (a2 == 2)
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3)) {
      NSLog((NSString *)@"Unknown error: state transition to DEFER failed");
    }
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _updateCriteriaForCompletedActivity:v5];
  }
  else if (a2 == 1 && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    NSLog((NSString *)@"Unknown error: state transition to DONE failed");
  }
}

- (void)invalidate
{
  p_invalidateLock = &self->_invalidateLock;
  os_unfair_lock_lock(&self->_invalidateLock);
  xpc_activity_unregister([(NSString *)[(NSBackgroundActivityScheduler *)self identifier] UTF8String]);

  self->_id activity = 0;

  os_unfair_lock_unlock(p_invalidateLock);
}

- (BOOL)shouldDefer
{
  v4 = [(NSBackgroundActivityScheduler *)self currentActivity];
  if (!v4)
  {
    xpc_object_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: This method may only be called during the invocation of the activity block or asynchronous activity", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }

  return xpc_activity_should_defer(v4);
}

- (id)checkInHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setCheckInHandler:(id)a3
{
}

@end