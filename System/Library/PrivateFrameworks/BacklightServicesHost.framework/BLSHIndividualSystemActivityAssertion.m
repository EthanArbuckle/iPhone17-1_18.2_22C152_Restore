@interface BLSHIndividualSystemActivityAssertion
- (BLSHIndividualSystemActivityAssertion)initWithWithIdentifier:(id)a3 aggregator:(id)a4;
- (BOOL)isActive;
- (NSString)identifier;
- (void)acquireWithTimeout:(double)a3 handler:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BLSHIndividualSystemActivityAssertion

- (BLSHIndividualSystemActivityAssertion)initWithWithIdentifier:(id)a3 aggregator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHIndividualSystemActivityAssertion;
  v9 = [(BLSHIndividualSystemActivityAssertion *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_lock_aggregator, a4);
  }

  return v10;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (BOOL)isActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(BLSHIndividualSystemActivityAssertionAggregator *)v2->_lock_aggregator isActive];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)acquireWithTimeout:(double)a3 handler:(id)a4
{
  id v6 = a4;
  if (a3 == 0.0)
  {
    id v9 = v6;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v7 = self->_lock_aggregator;
    os_unfair_lock_unlock(&self->_lock);
    [(BLSHIndividualSystemActivityAssertionAggregator *)v7 acquireIndividualAssertion:self handler:v9];
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"timeout must be 0 to use BLSHAggregatedSystemActivityAssertionFactory timeout:%lf", *(void *)&a3);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHIndividualSystemActivityAssertion acquireWithTimeout:handler:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_aggregator = self->_lock_aggregator;
  self->_lock_aggregator = 0;
  uint64_t v5 = lock_aggregator;

  os_unfair_lock_unlock(p_lock);
  [(BLSHIndividualSystemActivityAssertionAggregator *)v5 invalidateIndividualAssertion:self];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_lock_aggregator, 0);
}

- (void)acquireWithTimeout:handler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end