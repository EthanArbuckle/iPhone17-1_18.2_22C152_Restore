@interface _HMEventTriggerBuilder
+ (void)initialize;
- (BOOL)_with:(id)a3 addEvent:(id)a4;
- (BOOL)_with:(id)a3 removeEvent:(id)a4;
- (BOOL)executeOnce;
- (Class)class;
- (NSArray)endEvents;
- (NSArray)events;
- (NSPredicate)predicate;
- (_HMEventTriggerBuilder)initWithContext:(id)a3 home:(id)a4;
- (_HMEventTriggerBuilder)initWithEventTrigger:(id)a3;
- (id)copyAsBuilder;
- (unint64_t)triggerActivationState;
- (void)_with:(id)a3 addEvent:(id)a4 completion:(id)a5;
- (void)_with:(id)a3 removeEvent:(id)a4 completion:(id)a5;
- (void)_with:(id)a3 setEvents:(id)a4;
- (void)_with:(id)a3 updateEvents:(id)a4 completion:(id)a5;
- (void)addEndEvent:(id)a3;
- (void)addEndEvent:(id)a3 completionHandler:(id)a4;
- (void)addEvent:(id)a3;
- (void)addEvent:(id)a3 completionHandler:(id)a4;
- (void)removeEndEvent:(id)a3;
- (void)removeEndEvent:(id)a3 completionHandler:(id)a4;
- (void)removeEvent:(id)a3;
- (void)removeEvent:(id)a3 completionHandler:(id)a4;
- (void)setEndEvents:(id)a3;
- (void)setEvents:(id)a3;
- (void)setExecuteOnce:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)updateEndEvents:(id)a3 completionHandler:(id)a4;
- (void)updateEvents:(id)a3 completionHandler:(id)a4;
- (void)updateExecuteOnce:(BOOL)a3 completionHandler:(id)a4;
- (void)updatePredicate:(id)a3 completionHandler:(id)a4;
@end

@implementation _HMEventTriggerBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvents, 0);
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)_with:(id)a3 updateEvents:(id)a4 completion:(id)a5
{
  id v8 = a5;
  [(_HMEventTriggerBuilder *)self _with:a3 setEvents:a4];
  if (self) {
    context = self->super.super.super._context;
  }
  else {
    context = 0;
  }
  v11 = context;
  v10 = [(_HMContext *)v11 delegateCaller];
  [v10 callCompletion:v8 error:0];
}

- (void)_with:(id)a3 removeEvent:(id)a4 completion:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    BOOL v10 = [(_HMEventTriggerBuilder *)self _with:v19 removeEvent:v8];
    if (self) {
      context = self->super.super.super._context;
    }
    else {
      context = 0;
    }
    v12 = context;
    v13 = [(_HMContext *)v12 delegateCaller];
    v14 = v13;
    if (v10)
    {
      [v13 callCompletion:v9 error:0];
      goto LABEL_11;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 2;
  }
  else
  {
    if (self) {
      v15 = self->super.super.super._context;
    }
    else {
      v15 = 0;
    }
    v12 = v15;
    v14 = [(_HMContext *)v12 delegateCaller];
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 20;
  }
  v18 = [v16 hmErrorWithCode:v17];
  [v14 callCompletion:v9 error:v18];

LABEL_11:
}

- (void)_with:(id)a3 addEvent:(id)a4 completion:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    BOOL v10 = [(_HMEventTriggerBuilder *)self _with:v19 addEvent:v8];
    if (self) {
      context = self->super.super.super._context;
    }
    else {
      context = 0;
    }
    v12 = context;
    v13 = [(_HMContext *)v12 delegateCaller];
    v14 = v13;
    if (v10)
    {
      [v13 callCompletion:v9 error:0];
      goto LABEL_11;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 1;
  }
  else
  {
    if (self) {
      v15 = self->super.super.super._context;
    }
    else {
      v15 = 0;
    }
    v12 = v15;
    v14 = [(_HMContext *)v12 delegateCaller];
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 20;
  }
  v18 = [v16 hmErrorWithCode:v17];
  [v14 callCompletion:v9 error:v18];

LABEL_11:
}

- (void)updateEndEvents:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder updateEndEvents:completionHandler:]", @"completion"];
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0];
    objc_exception_throw(v13);
  }
  v7 = v6;
  [(_HMEventTriggerBuilder *)self _with:self->_endEvents updateEvents:v14 completion:v6];
}

- (void)updateEvents:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder updateEvents:completionHandler:]", @"completion"];
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0];
    objc_exception_throw(v13);
  }
  v7 = v6;
  [(_HMEventTriggerBuilder *)self _with:self->_events updateEvents:v14 completion:v6];
}

- (void)removeEndEvent:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder removeEndEvent:completionHandler:]", @"completion"];
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0];
    objc_exception_throw(v13);
  }
  v7 = v6;
  [(_HMEventTriggerBuilder *)self _with:self->_endEvents removeEvent:v14 completion:v6];
}

- (void)removeEvent:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder removeEvent:completionHandler:]", @"completion"];
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0];
    objc_exception_throw(v13);
  }
  v7 = v6;
  [(_HMEventTriggerBuilder *)self _with:self->_events removeEvent:v14 completion:v6];
}

- (void)addEndEvent:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder addEndEvent:completionHandler:]", @"completion"];
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0];
    objc_exception_throw(v13);
  }
  v7 = v6;
  [(_HMEventTriggerBuilder *)self _with:self->_endEvents addEvent:v14 completion:v6];
}

- (void)addEvent:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder addEvent:completionHandler:]", @"completion"];
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0];
    objc_exception_throw(v13);
  }
  v7 = v6;
  [(_HMEventTriggerBuilder *)self _with:self->_events addEvent:v14 completion:v6];
}

- (void)_with:(id)a3 setEvents:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_t lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v8 = (void *)[v6 mutableCopy];
  [v6 removeAllObjects];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
        uint64_t v13 = objc_opt_class();
        if (v13 == objc_opt_class())
        {
          _HMFPreconditionFailure();
          __break(1u);
        }
        id v14 = objc_msgSend(v12, "copy", lock);
        uint64_t v15 = [v8 indexOfObject:v14];
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (([v6 containsObject:v14] & 1) == 0)
          {
            if (self) {
              context = self->super.super.super._context;
            }
            else {
              context = 0;
            }
            __int16 v17 = context;
            uint64_t v18 = self;
            objc_msgSend(v14, "__configureWithContext:eventTrigger:", v17, v18);

            [v6 addObject:v14];
          }
        }
        else
        {
          uint64_t v19 = [v8 objectAtIndex:v15];
          [v6 addObject:v19];

          [v8 removeObjectAtIndex:v15];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v20 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      uint64_t v9 = v20;
    }
    while (v20);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v21 = v8;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "_unconfigure", lock);
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v22);
  }

  os_unfair_lock_unlock(lock);
}

- (BOOL)_with:(id)a3 removeEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v9 = [v6 indexOfObject:v7];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [v6 objectAtIndex:v9];
    [v10 _unconfigure];

    [v6 removeObjectAtIndex:v9];
  }
  os_unfair_lock_unlock(p_lock);

  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_with:(id)a3 addEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_os_unfair_lock_t lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v10 = objc_opt_class();
  if (v10 == objc_opt_class())
  {
    _HMFPreconditionFailure();
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v10 = (void *)[v8 copy];
  char v4 = [v7 containsObject:v10];
  if ((v4 & 1) == 0)
  {
    if (self)
    {
      context = self->super.super.super._context;
LABEL_5:
      v12 = context;
      uint64_t v13 = self;
      objc_msgSend(v10, "__configureWithContext:eventTrigger:", v12, v13);

      [v7 addObject:v10];
      goto LABEL_6;
    }
LABEL_8:
    context = 0;
    goto LABEL_5;
  }
LABEL_6:

  os_unfair_lock_unlock(p_lock);
  return v4 ^ 1;
}

- (void)removeEndEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder removeEndEvent:]", @"event"];
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v5 userInfo:0];
    objc_exception_throw(v10);
  }
  id v11 = v4;
  [(_HMEventTriggerBuilder *)self _with:self->_endEvents removeEvent:v4];
}

- (void)removeEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder removeEvent:]", @"event"];
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v5 userInfo:0];
    objc_exception_throw(v10);
  }
  id v11 = v4;
  [(_HMEventTriggerBuilder *)self _with:self->_events removeEvent:v4];
}

- (void)addEndEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder addEndEvent:]", @"event"];
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v5 userInfo:0];
    objc_exception_throw(v10);
  }
  id v11 = v4;
  [(_HMEventTriggerBuilder *)self _with:self->_endEvents addEvent:v4];
}

- (void)addEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder addEvent:]", @"event"];
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v5 userInfo:0];
    objc_exception_throw(v10);
  }
  id v11 = v4;
  [(_HMEventTriggerBuilder *)self _with:self->_events addEvent:v4];
}

- (void)setEndEvents:(id)a3
{
}

- (void)setEvents:(id)a3
{
}

- (NSArray)endEvents
{
  p_os_unfair_lock_t lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_endEvents copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (NSArray)events
{
  p_os_unfair_lock_t lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_events copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)updatePredicate:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder updatePredicate:completionHandler:]", @"completion"];
    uint64_t v14 = MEMORY[0x19F3A64A0]();
    uint64_t v15 = self;
    uint64_t v16 = (void *)v14;
    __int16 v17 = v15;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v20);
  }
  id v7 = v6;
  if (+[HMPredicateUtilities validatePredicate:v21])
  {
    [(_HMEventTriggerBuilder *)self setPredicate:v21];
    if (self) {
      context = self->super.super.super._context;
    }
    else {
      context = 0;
    }
    uint64_t v9 = context;
    id v10 = [(_HMContext *)v9 delegateCaller];
    [v10 callCompletion:v7 error:0];
  }
  else
  {
    if (self) {
      id v11 = self->super.super.super._context;
    }
    else {
      id v11 = 0;
    }
    uint64_t v9 = v11;
    id v10 = [(_HMContext *)v9 delegateCaller];
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v10 callCompletion:v7 error:v12];
  }
}

- (void)setPredicate:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSPredicate *)[v6 copy];
  predicate = self->_predicate;
  self->_predicate = v4;

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (NSPredicate)predicate
{
  p_os_unfair_lock_t lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_predicate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateExecuteOnce:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  if (!v15)
  {
    uint64_t v9 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMEventTriggerBuilder updateExecuteOnce:completionHandler:]", @"completion"];
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v9 userInfo:0];
    objc_exception_throw(v14);
  }
  [(_HMEventTriggerBuilder *)self setExecuteOnce:v4];
  if (self) {
    context = self->super.super.super._context;
  }
  else {
    context = 0;
  }
  id v7 = context;
  id v8 = [(_HMContext *)v7 delegateCaller];
  [v8 callCompletion:v15 error:0];
}

- (void)setExecuteOnce:(BOOL)a3
{
  p_os_unfair_lock_t lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  self->_executeOnce = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)executeOnce
{
  v2 = self;
  p_os_unfair_lock_t lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_executeOnce;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)copyAsBuilder
{
  v3 = [HMEventTriggerBuilder alloc];
  BOOL v4 = self;
  uint64_t v5 = [(HMEventTriggerBuilder *)v3 initWithEventTrigger:v4];

  return v5;
}

- (_HMEventTriggerBuilder)initWithEventTrigger:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 home];
  uint64_t v6 = [v5 context];
  id v7 = (void *)v6;
  id v8 = 0;
  if (v5 && v6)
  {
    if ([v5 areAutomationBuildersSupported])
    {
      uint64_t v9 = [v5 context];
      v44.receiver = self;
      v44.super_class = (Class)_HMEventTriggerBuilder;
      id v10 = [(_HMTriggerBuilder *)&v44 initWithContext:v9 home:v5];

      if (v10)
      {
        v35 = v7;
        id v11 = [v4 recurrences];
        [(_HMEventOrTimerTriggerBuilder *)v10 setRecurrences:v11];

        v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        events = v10->_events;
        v10->_events = v12;

        id v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        endEvents = v10->_endEvents;
        uint64_t v34 = 112;
        v10->_endEvents = v14;

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v16 = [v4 events];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v41;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v41 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v20), "copy", v34);
              uint64_t v22 = [v5 context];
              objc_msgSend(v21, "__configureWithContext:eventTrigger:", v22, v4);

              [(NSMutableArray *)v10->_events addObject:v21];
              ++v20;
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v46 count:16];
          }
          while (v18);
        }

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v23 = [v4 endEvents];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v45 count:16];
        uint64_t v25 = v34;
        if (v24)
        {
          uint64_t v26 = v24;
          uint64_t v27 = *(void *)v37;
          do
          {
            uint64_t v28 = 0;
            do
            {
              if (*(void *)v37 != v27) {
                objc_enumerationMutation(v23);
              }
              long long v29 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v28), "copy", v34);
              long long v30 = [v5 context];
              objc_msgSend(v29, "__configureWithContext:eventTrigger:", v30, v4);

              [*(id *)((char *)&v10->super.super.super.super.isa + v25) addObject:v29];
              ++v28;
            }
            while (v26 != v28);
            uint64_t v26 = [v23 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v26);
        }

        uint64_t v31 = [v4 predicate];
        predicate = v10->_predicate;
        v10->_predicate = (NSPredicate *)v31;

        id v7 = v35;
      }
      self = v10;
      id v8 = self;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (_HMEventTriggerBuilder)initWithContext:(id)a3 home:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_HMEventTriggerBuilder;
  id v4 = [(_HMTriggerBuilder *)&v10 initWithContext:a3 home:a4];
  if (v4)
  {
    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    events = v4->_events;
    v4->_events = v5;

    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    endEvents = v4->_endEvents;
    v4->_endEvents = v7;
  }
  return v4;
}

- (Class)class
{
  return (Class)objc_opt_class();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = objc_opt_class();
    objc_msgSend(a1, "adoptExternalCategoriesFromClasses:", v3, objc_opt_class(), 0);
  }
}

- (unint64_t)triggerActivationState
{
  return 0;
}

@end