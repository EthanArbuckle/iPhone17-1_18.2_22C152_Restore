@interface BLSHAggregatedProcessAssertion
- (BLSHAggregatedProcessAssertion)initWithExplanation:(id)a3 processIdentity:(id)a4 duration:(double)a5;
- (BOOL)shouldFaultOnFailureToAcquire;
- (NSString)description;
- (NSString)explanation;
- (RBSProcessIdentity)processIdentity;
- (double)duration;
- (id)createRBSAssertion;
- (void)acquireWithCompletion:(id)a3;
- (void)createRBSAssertion;
- (void)dealloc;
- (void)invalidate;
- (void)setShouldFaultOnFailureToAcquire:(BOOL)a3;
@end

@implementation BLSHAggregatedProcessAssertion

- (BLSHAggregatedProcessAssertion)initWithExplanation:(id)a3 processIdentity:(id)a4 duration:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLSHAggregatedProcessAssertion;
  v11 = [(BLSHAggregatedProcessAssertion *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_processIdentity, a4);
    objc_storeStrong((id *)&v12->_explanation, a3);
    v12->_duration = a5;
  }

  return v12;
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

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_explanation withName:@"explanation"];
  id v4 = (id)[v3 appendObject:self->_processIdentity withName:@"processIdentity"];
  if (self->_duration != 1.79769313e308) {
    id v5 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"duration", 3);
  }
  uint64_t v6 = [v3 build];

  return (NSString *)v6;
}

- (void)acquireWithCompletion:(id)a3
{
}

- (void)invalidate
{
  self->_invalidated = 1;
}

- (id)createRBSAssertion
{
  v14[4] = *MEMORY[0x263EF8340];
  v3 = bls_scenes_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(BLSHAggregatedProcessAssertion *)(uint64_t)self createRBSAssertion];
  }

  id v4 = [MEMORY[0x263F64630] targetWithProcessIdentity:self->_processIdentity];
  double duration = self->_duration;
  if (duration == 1.79769313e308)
  {
    uint64_t v6 = [MEMORY[0x263F644A0] grant];
    uint64_t v7 = objc_msgSend(MEMORY[0x263F64438], "grantUserInitiated", v6);
    v13[1] = v7;
    uint64_t v8 = [MEMORY[0x263F644D8] grantWithBackgroundPriority];
    v13[2] = v8;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F64488] attributeWithDuration:1 warningDuration:1 startPolicy:duration endPolicy:0.0];
    v14[0] = v6;
    uint64_t v7 = [MEMORY[0x263F644A0] grant];
    v14[1] = v7;
    uint64_t v8 = [MEMORY[0x263F64438] grantUserInitiated];
    v14[2] = v8;
    uint8_t v9 = [MEMORY[0x263F644D8] grantWithBackgroundPriority];
    v14[3] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
  }
  v11 = (void *)[objc_alloc(MEMORY[0x263F64408]) initWithExplanation:self->_explanation target:v4 attributes:v10];

  return v11;
}

- (BOOL)shouldFaultOnFailureToAcquire
{
  return self->_shouldFaultOnFailureToAcquire;
}

- (void)setShouldFaultOnFailureToAcquire:(BOOL)a3
{
  self->_shouldFaultOnFailureToAcquire = a3;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);

  objc_storeStrong((id *)&self->_aggregate, 0);
}

- (void)createRBSAssertion
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "%p:createRBSAssertion, creating new RBS assertion for %{public}@", (uint8_t *)&v3, 0x16u);
}

@end