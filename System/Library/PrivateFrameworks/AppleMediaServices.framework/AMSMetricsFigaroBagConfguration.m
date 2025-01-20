@interface AMSMetricsFigaroBagConfguration
+ (id)configurationPromiseWithBag:(id)a3;
- (AMSMetricsFigaroBagConfguration)initWithMetricsDictionary:(id)a3;
- (AMSMetricsFigaroEventModifier)defaultModifier;
- (NSArray)overrides;
- (NSDictionary)metricsDictionary;
- (OS_dispatch_queue)queue;
- (id)_generateModifiersIfNeeded;
- (id)modifierForEvent:(id)a3;
- (void)prepareForFlush;
@end

@implementation AMSMetricsFigaroBagConfguration

+ (id)configurationPromiseWithBag:(id)a3
{
  v3 = [a3 dictionaryForKey:@"metrics"];
  v4 = [v3 valuePromise];
  v5 = [v4 continueWithBlock:&__block_literal_global_89];

  return v5;
}

uint64_t __44__AMSMetricsFigaroBagConfguration_overrides__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _generateModifiersIfNeeded];
  return MEMORY[0x1F41817F8]();
}

id __63__AMSMetricsFigaroBagConfguration_configurationPromiseWithBag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  if (v4)
  {
    v5 = [[AMSMetricsFigaroBagConfguration alloc] initWithMetricsDictionary:v4];
    +[AMSPromise promiseWithResult:v5];
  }
  else
  {
    AMSError(7, @"Figaro Bag Failure", @"Failed to locate the figaro bag configuration", a3);
    v5 = (AMSMetricsFigaroBagConfguration *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:v5];
  v6 = };

  return v6;
}

- (id)_generateModifiersIfNeeded
{
  v2 = self;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSMetricsFigaroBagConfguration *)self queue];
  dispatch_assert_queue_V2(v3);

  overrides = v2->_overrides;
  if (overrides)
  {
    v5 = overrides;
    goto LABEL_23;
  }
  v24 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [(AMSMetricsFigaroBagConfguration *)v2 metricsDictionary];
  v7 = [v6 objectForKeyedSubscript:@"overrides"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;

          if (!v15) {
            goto LABEL_20;
          }
          v16 = [v15 objectForKeyedSubscript:@"fieldFilters"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v14 = v16;
          }
          else {
            id v14 = 0;
          }

          if ([v14 count])
          {
            v17 = [AMSMetricsFigaroEventModifier alloc];
            [(AMSMetricsFigaroBagConfguration *)v2 metricsDictionary];
            v19 = v18 = v2;
            v20 = [(AMSMetricsFigaroEventModifier *)v17 initWithMetricsDictionary:v19 overrideDictionary:v15];

            v2 = v18;
            [(NSArray *)v24 addObject:v20];
          }
        }
        else
        {
          id v15 = 0;
        }

LABEL_20:
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  v21 = v2->_overrides;
  v2->_overrides = v24;
  v22 = v24;

  v5 = v2->_overrides;
LABEL_23:
  return v5;
}

- (NSDictionary)metricsDictionary
{
  return self->_metricsDictionary;
}

- (AMSMetricsFigaroBagConfguration)initWithMetricsDictionary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSMetricsFigaroBagConfguration;
  v6 = [(AMSMetricsFigaroBagConfguration *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metricsDictionary, a3);
    id v8 = [[AMSMetricsFigaroEventModifier alloc] initWithMetricsDictionary:v5 overrideDictionary:0];
    defaultModifier = v7->_defaultModifier;
    v7->_defaultModifier = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.AMSMetricsFigaroBagConfguration", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (id)modifierForEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(AMSMetricsFigaroBagConfguration *)self overrides];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_queue_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if ([v10 fieldFiltersMatchEvent:v4]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v11 = v10;

      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
  }
  id v11 = [(AMSMetricsFigaroBagConfguration *)self defaultModifier];
LABEL_13:

  return v11;
}

- (NSArray)overrides
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy__45;
  id v11 = __Block_byref_object_dispose__45;
  id v12 = 0;
  v3 = [(AMSMetricsFigaroBagConfguration *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AMSMetricsFigaroBagConfguration_overrides__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (AMSMetricsFigaroEventModifier)defaultModifier
{
  return self->_defaultModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaultModifier, 0);
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

- (void)prepareForFlush
{
  v3 = [(AMSMetricsFigaroBagConfguration *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AMSMetricsFigaroBagConfguration_prepareForFlush__block_invoke;
  v7[3] = &unk_1E559EA90;
  v7[4] = self;
  id v4 = v7;
  id v5 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_5;
  block[3] = &unk_1E559EAE0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  dispatch_async(v3, block);
}

id __50__AMSMetricsFigaroBagConfguration_prepareForFlush__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _generateModifiersIfNeeded];
}

@end