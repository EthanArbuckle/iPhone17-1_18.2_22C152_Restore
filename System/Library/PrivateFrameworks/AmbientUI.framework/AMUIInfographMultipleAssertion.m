@interface AMUIInfographMultipleAssertion
- (AMUIInfographMultipleAssertion)initWithAssertions:(id)a3;
- (NSArray)assertions;
- (void)invalidate;
@end

@implementation AMUIInfographMultipleAssertion

- (AMUIInfographMultipleAssertion)initWithAssertions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMUIInfographMultipleAssertion;
  v5 = [(AMUIInfographMultipleAssertion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assertions = v5->_assertions;
    v5->_assertions = (NSArray *)v6;
  }
  return v5;
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(AMUIInfographMultipleAssertion *)self assertions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) invalidate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (void).cxx_destruct
{
}

@end