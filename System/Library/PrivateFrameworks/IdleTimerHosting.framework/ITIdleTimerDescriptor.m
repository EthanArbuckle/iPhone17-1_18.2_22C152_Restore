@interface ITIdleTimerDescriptor
- (NSArray)timeouts;
- (double)attentionSamplingPeriod;
- (double)attentionSamplingStartBeforeFirstTimeout;
- (double)attentionSamplingStartDelay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)attentionMaintenanceEventMask;
- (unint64_t)attentionRecoveryEventMask;
- (void)setAttentionEventMaintenanceMask:(unint64_t)a3 recoveryMask:(unint64_t)a4;
- (void)setAttentionEventMask:(unint64_t)a3;
- (void)setAttentionSamplingPeriod:(double)a3;
- (void)setAttentionSamplingStartBeforeFirstTimeout:(double)a3;
- (void)setAttentionSamplingStartDelay:(double)a3;
- (void)setTimeouts:(id)a3;
@end

@implementation ITIdleTimerDescriptor

- (void)setTimeouts:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![v5 count])
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ITIdleTimerDescriptor.m", 38, @"<%p> - timeouts must have at least one timeout.", v5);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v10;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v11) duration];
        uint64_t v10 = v13;
        if (!BSFloatGreaterThanFloat() || BSFloatEqualToFloat())
        {
          v14 = [MEMORY[0x263F08690] currentHandler];
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ITIdleTimerDescriptor.m", 43, @"<%g> - timeout must be positive and valid", v10);
        }
        if ((BSFloatGreaterThanFloat() & 1) == 0)
        {
          v15 = [MEMORY[0x263F08690] currentHandler];
          [v15 handleFailureInMethod:a2, self, @"ITIdleTimerDescriptor.m", 44, @"<%g>, <%g> - timeouts must be strictly increasing", v12, v10, (void)v20 object file lineNumber description];
        }
        ++v11;
        uint64_t v12 = v10;
      }
      while (v8 != v11);
      uint64_t v16 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v8 = v16;
    }
    while (v16);
  }

  v17 = (NSArray *)[v6 copy];
  timeouts = self->_timeouts;
  self->_timeouts = v17;
}

- (void)setAttentionSamplingStartDelay:(double)a3
{
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ITIdleTimerDescriptor.m" lineNumber:52 description:@"Attention sample start delay must be nonnegative."];
  }
  self->_attentionSamplingStartDelay = a3;
}

- (double)attentionSamplingStartBeforeFirstTimeout
{
  if (![(NSArray *)self->_timeouts count])
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ITIdleTimerDescriptor.m", 58, @"<%p> - timeouts must have at least one timeout.", self->_timeouts);
  }
  v4 = [(NSArray *)self->_timeouts firstObject];
  [v4 duration];
  double v6 = v5;

  return v6 - self->_attentionSamplingStartDelay;
}

- (void)setAttentionSamplingStartBeforeFirstTimeout:(double)a3
{
  if (![(NSArray *)self->_timeouts count])
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ITIdleTimerDescriptor.m", 66, @"<%p> - timeouts must have at least one timeout.", self->_timeouts);
  }
  double v6 = [(NSArray *)self->_timeouts firstObject];
  [v6 duration];
  double v8 = v7;

  double v9 = v8 - a3;
  if (v8 - a3 < 0.0) {
    double v9 = 0.0;
  }

  [(ITIdleTimerDescriptor *)self setAttentionSamplingStartDelay:v9];
}

- (void)setAttentionEventMaintenanceMask:(unint64_t)a3 recoveryMask:(unint64_t)a4
{
  self->_attentionMaintenanceEventMask = a3;
  self->_attentionRecoveryEventMask = a4;
}

- (void)setAttentionEventMask:(unint64_t)a3
{
}

- (id)succinctDescription
{
  v2 = [(ITIdleTimerDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendUInt64:self->_attentionMaintenanceEventMask withName:@"attentionMaintenanceEventMask"];
  id v5 = (id)[v3 appendUInt64:self->_attentionRecoveryEventMask withName:@"attentionRecoveryEventMask"];
  objc_msgSend(v3, "itidletimerdescriptor_appendTimeInterval:withName:", @"attentionSamplingPeriod", self->_attentionSamplingPeriod);
  objc_msgSend(v3, "itidletimerdescriptor_appendTimeInterval:withName:", @"attentionSamplingStartDelay", self->_attentionSamplingStartDelay);
  [v3 appendArraySection:self->_timeouts withName:@"timeouts" skipIfEmpty:0];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(ITIdleTimerDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ITIdleTimerDescriptor allocWithZone:](ITIdleTimerDescriptor, "allocWithZone:") init];
  v5->_attentionMaintenanceEventMask = self->_attentionMaintenanceEventMask;
  v5->_attentionRecoveryEventMask = self->_attentionRecoveryEventMask;
  v5->_attentionSamplingPeriod = self->_attentionSamplingPeriod;
  v5->_attentionSamplingStartDelay = self->_attentionSamplingStartDelay;
  uint64_t v6 = [(NSArray *)self->_timeouts copyWithZone:a3];
  timeouts = v5->_timeouts;
  v5->_timeouts = (NSArray *)v6;

  return v5;
}

- (unint64_t)attentionMaintenanceEventMask
{
  return self->_attentionMaintenanceEventMask;
}

- (unint64_t)attentionRecoveryEventMask
{
  return self->_attentionRecoveryEventMask;
}

- (double)attentionSamplingPeriod
{
  return self->_attentionSamplingPeriod;
}

- (void)setAttentionSamplingPeriod:(double)a3
{
  self->_attentionSamplingPeriod = a3;
}

- (double)attentionSamplingStartDelay
{
  return self->_attentionSamplingStartDelay;
}

- (NSArray)timeouts
{
  return self->_timeouts;
}

- (void).cxx_destruct
{
}

@end