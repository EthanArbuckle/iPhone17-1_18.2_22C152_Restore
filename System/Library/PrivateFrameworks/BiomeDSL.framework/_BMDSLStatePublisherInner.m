@interface _BMDSLStatePublisherInner
- (BMBookmarkNode)completionBookmark;
- (BMDSLState)DSLState;
- (BMDSLStateValue)state;
- (BOOL)sentInitialState;
- (BPSSubscriber)downstream;
- (BPSSubscriptionStatus)status;
- (_BMDSLStatePublisherInner)initWithDownstream:(id)a3 state:(id)a4 DSLState:(id)a5;
- (id)newBookmark;
- (id)upstreamSubscriptions;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setCompletionBookmark:(id)a3;
- (void)setDSLState:(id)a3;
- (void)setState:(id)a3;
@end

@implementation _BMDSLStatePublisherInner

- (_BMDSLStatePublisherInner)initWithDownstream:(id)a3 state:(id)a4 DSLState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_BMDSLStatePublisherInner;
  v12 = [(_BMDSLStatePublisherInner *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_downstream, a3);
    objc_storeStrong((id *)&v13->_state, a4);
    objc_storeStrong((id *)&v13->_DSLState, a5);
    uint64_t v14 = [MEMORY[0x1E4F50238] awaitingSubscription];
    status = v13->_status;
    v13->_status = (BPSSubscriptionStatus *)v14;
  }
  return v13;
}

- (void)receiveSubscription:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (BPSSubscriptionStatus *)[objc_alloc(MEMORY[0x1E4F50238]) initWithState:1 subscription:v5];

  status = self->_status;
  self->_status = v6;

  id v8 = [(_BMDSLStatePublisherInner *)self downstream];
  os_unfair_lock_unlock(p_lock);
  [v8 receiveSubscription:self];
}

- (int64_t)receiveInput:(id)a3
{
  v4 = (BMDSLStateValue *)a3;
  id v5 = self;
  os_unfair_lock_lock(&v5->_lock);
  state = v5->_state;
  if (!state) {
    state = v4;
  }
  v7 = state;
  id v8 = [(BMDSLState *)v5->_DSLState upstreamCombinedState];
  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v10 = [(BMDSLState *)v5->_DSLState key];
  id v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v7, v10, 0);

  id v12 = v11;
  v13 = v12;
  if (v8)
  {
    v13 = [v8 reduceWithNext:v12];
  }
  [(BMDSLState *)v5->_DSLState setCombinedValue:v13];
  uint64_t v14 = v5->_downstream;
  os_unfair_lock_unlock(&v5->_lock);
  int64_t v15 = [(BPSSubscriber *)v14 receiveInput:v4];

  return v15;
}

- (void)receiveCompletion:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  os_unfair_lock_lock(&v5->_lock);
  if ([(BPSSubscriptionStatus *)v5->_status state] == 1)
  {
    uint64_t v6 = [(BPSSubscriptionStatus *)v5->_status subscription];
    v33 = (void *)v6;
    if (v6)
    {
      v41[0] = v6;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    }
    else
    {
      v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v14 conformsToProtocol:&unk_1F0B390C0])
          {
            uint64_t v15 = [v14 newBookmark];
            if (v15) {
              goto LABEL_18;
            }
          }
          else
          {
            v16 = __biome_log_for_category();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v14;
              _os_log_error_impl(&dword_1B3086000, v16, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
            }
          }
          uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
LABEL_18:
          objc_super v17 = (void *)v15;
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v11);
    }

    v18 = [(BMDSLState *)v5->_DSLState combinedValue];
    uint64_t v19 = [(BMDSLState *)v5->_DSLState value];
    if (v19)
    {
      v20 = (void *)v19;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        DSLState = v5->_DSLState;
        id v23 = v18;
        v24 = [(BMDSLState *)DSLState key];
        v25 = [v23 objectForKeyedSubscript:v24];
      }
      else
      {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
    }
    id v26 = objc_alloc(MEMORY[0x1E4F501D8]);
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = (void *)[v26 initWithValue:v25 upstreams:v8 name:v28];
    [(_BMDSLStatePublisherInner *)v5 setCompletionBookmark:v29];

    uint64_t v30 = [MEMORY[0x1E4F50238] terminal];
    status = v5->_status;
    v5->_status = (BPSSubscriptionStatus *)v30;

    v32 = v5->_downstream;
    os_unfair_lock_unlock(&v5->_lock);
    [(BPSSubscriber *)v32 receiveCompletion:v4];
  }
  else
  {
    os_unfair_lock_unlock(&v5->_lock);
  }
}

- (void)cancel
{
  uint64_t v6 = self;
  p_lock = &v6->_lock;
  os_unfair_lock_lock(&v6->_lock);
  if ([(BPSSubscriptionStatus *)v6->_status state] == 1)
  {
    v3 = [(BPSSubscriptionStatus *)v6->_status subscription];
    uint64_t v4 = [MEMORY[0x1E4F50238] terminal];
    status = v6->_status;
    v6->_status = (BPSSubscriptionStatus *)v4;

    os_unfair_lock_unlock(p_lock);
    [v3 cancel];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (id)upstreamSubscriptions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(BPSSubscriptionStatus *)self->_status subscription];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)requestDemand:(int64_t)a3
{
  uint64_t v6 = self;
  p_lock = &v6->_lock;
  os_unfair_lock_lock(&v6->_lock);
  if ([(BPSSubscriptionStatus *)v6->_status state] == 1)
  {
    id v5 = [(BPSSubscriptionStatus *)v6->_status subscription];
    os_unfair_lock_unlock(p_lock);
    [v5 requestDemand:a3];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (id)newBookmark
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(_BMDSLStatePublisherInner *)self completionBookmark];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (BMDSLStateValue)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (BMDSLState)DSLState
{
  return self->_DSLState;
}

- (void)setDSLState:(id)a3
{
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (BMBookmarkNode)completionBookmark
{
  return self->_completionBookmark;
}

- (void)setCompletionBookmark:(id)a3
{
}

- (BOOL)sentInitialState
{
  return self->_sentInitialState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBookmark, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_DSLState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end