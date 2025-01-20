@interface DMCPowerAssertion
- (BOOL)isParked;
- (DMCPowerAssertion)initWithReason:(id)a3;
- (void)dealloc;
- (void)park;
- (void)unpark;
@end

@implementation DMCPowerAssertion

- (void)dealloc
{
  v3 = _assertionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__DMCPowerAssertion_dealloc__block_invoke;
  block[3] = &unk_1E5CFD920;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)DMCPowerAssertion;
  [(DMCProcessAssertion *)&v4 dealloc];
}

- (DMCPowerAssertion)initWithReason:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMCPowerAssertion;
  v3 = [(DMCProcessAssertion *)&v7 initWithReason:a3];
  objc_super v4 = v3;
  if (v3)
  {
    v3->_parked = 0;
    v5 = _assertionQueue();
    dispatch_sync(v5, &__block_literal_global_17);
  }
  return v4;
}

void __28__DMCPowerAssertion_dealloc__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24)) {
    _releasePowerAssertion();
  }
}

- (void)park
{
  v3 = _assertionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__DMCPowerAssertion_park__block_invoke;
  block[3] = &unk_1E5CFD920;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __25__DMCPowerAssertion_park__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 24))
  {
    id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Trying to park a power assertion that's already parked." userInfo:0];
    objc_exception_throw(v2);
  }
  *(unsigned char *)(v1 + 24) = 1;
  _releasePowerAssertion();
}

- (void)unpark
{
  v3 = _assertionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__DMCPowerAssertion_unpark__block_invoke;
  block[3] = &unk_1E5CFD920;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __27__DMCPowerAssertion_unpark__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Trying to unpark a power assertion that's not parked." userInfo:0];
    objc_exception_throw(v2);
  }
  *(unsigned char *)(v1 + 24) = 0;
  _retainPowerAssertion();
}

- (BOOL)isParked
{
  return self->_parked;
}

@end