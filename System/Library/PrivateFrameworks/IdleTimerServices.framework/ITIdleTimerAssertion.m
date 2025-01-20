@interface ITIdleTimerAssertion
- (ITIdleTimerConfiguration)configuration;
- (NSString)_uniqueReason;
- (id)_initWithConfiguration:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5;
- (id)succinctDescriptionBuilder;
@end

@implementation ITIdleTimerAssertion

- (id)_initWithConfiguration:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  v21 = (id *)&v20;
  uint64_t v22 = 0x3042000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__ITIdleTimerAssertion__initWithConfiguration_forReason_invalidationBlock___block_invoke;
  v17[3] = &unk_2641332D8;
  v19 = &v20;
  id v11 = v10;
  id v18 = v11;
  v16.receiver = self;
  v16.super_class = (Class)ITIdleTimerAssertion;
  v12 = [(BSSimpleAssertion *)&v16 initWithIdentifier:@"IdleTimerConfiguration" forReason:v9 invalidationBlock:v17];
  if (v12)
  {
    objc_storeWeak(v21 + 5, v12);
    uint64_t v13 = [v8 copy];
    configuration = v12->_configuration;
    v12->_configuration = (ITIdleTimerConfiguration *)v13;
  }
  _Block_object_dispose(&v20, 8);
  objc_destroyWeak(&v25);

  return v12;
}

uint64_t __75__ITIdleTimerAssertion__initWithConfiguration_forReason_invalidationBlock___block_invoke(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return MEMORY[0x270F9A758]();
}

- (id)succinctDescriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)ITIdleTimerAssertion;
  v3 = [(BSSimpleAssertion *)&v8 succinctDescriptionBuilder];
  v4 = [(ITIdleTimerAssertion *)self _uniqueReason];
  id v5 = (id)[v3 appendObject:v4 withName:@"uniqueReason"];

  id v6 = (id)[v3 appendObject:self->_configuration withName:@"configuration"];
  return v3;
}

- (NSString)_uniqueReason
{
  configuration = self->_configuration;
  v3 = [(BSSimpleAssertion *)self reason];
  v4 = [(ITIdleTimerConfiguration *)configuration _uniquedReason:v3];

  return (NSString *)v4;
}

- (ITIdleTimerConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end