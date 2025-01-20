@interface BLSHDefaultHandler
+ (id)handlerForKey:(id)a3 attributes:(id)a4;
- (BLSHDefaultHandler)initWithKey:(id)a3 attributes:(id)a4;
- (NSString)description;
- (void)dealloc;
- (void)invalidate;
- (void)updateForNewValue:(BOOL)a3;
@end

@implementation BLSHDefaultHandler

+ (id)handlerForKey:(id)a3 attributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithKey:v7 attributes:v6];

  return v8;
}

- (BLSHDefaultHandler)initWithKey:(id)a3 attributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHDefaultHandler;
  v9 = [(BLSHDefaultHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  v9 = @"BLSHDefaultsObserver.m";
  __int16 v10 = 1024;
  int v11 = 130;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_key withName:@"key"];
  v4 = [v3 build];

  return (NSString *)v4;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  v4 = self->_lock_assertion;
  os_unfair_lock_unlock(p_lock);
  [(BLSAssertion *)v4 invalidate];
}

- (void)updateForNewValue:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL invalidated = self->_invalidated;
  os_unfair_lock_unlock(p_lock);
  if (!invalidated)
  {
    os_unfair_lock_lock(p_lock);
    lock_assertion = self->_lock_assertion;
    if (v3)
    {
      if (lock_assertion)
      {
        __int16 v10 = 0;
      }
      else
      {
        id v8 = objc_alloc(MEMORY[0x263F29960]);
        v9 = [NSString stringWithFormat:@"%@ default set", self->_key];
        __int16 v10 = (BLSAssertion *)[v8 initWithExplanation:v9 attributes:self->_attributes];
        objc_storeStrong((id *)&self->_lock_assertion, v10);
      }
      os_unfair_lock_unlock(p_lock);
      [(BLSAssertion *)v10 acquireWithObserver:0];
    }
    else
    {
      self->_lock_assertion = 0;
      __int16 v10 = lock_assertion;

      os_unfair_lock_unlock(p_lock);
      [(BLSAssertion *)v10 invalidate];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_assertion, 0);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end