@interface AMSFailingMockBagBuilder
- (NSError)error;
- (double)delay;
- (id)createMockBag;
- (void)setDelay:(double)a3;
- (void)setError:(id)a3;
@end

@implementation AMSFailingMockBagBuilder

- (id)createMockBag
{
  v3 = [AMSBagFailingDataSource alloc];
  uint64_t v4 = [(AMSMockBagBuilder *)self profile];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"AMSFailingMockBag";
  }
  uint64_t v7 = [(AMSMockBagBuilder *)self profileVersion];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"@";
  }
  v10 = [(AMSFailingMockBagBuilder *)self error];
  [(AMSFailingMockBagBuilder *)self delay];
  v11 = -[AMSBagFailingDataSource initWithProfile:profileVersion:error:delay:](v3, "initWithProfile:profileVersion:error:delay:", v6, v9, v10);

  v12 = [[AMSBag alloc] initWithDataSource:v11];
  return v12;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end