@interface BPSFilterProducer
- (BPSFilterProducer)initWithDownstream:(id)a3;
- (BPSSubscriber)downstream;
- (BPSSubscription)subscription;
- (id)receiveNewValue:(id)a3;
- (id)upstreamSubscriptions;
- (int64_t)receiveInput:(id)a3;
- (int64_t)state;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSubscription:(id)a3;
@end

@implementation BPSFilterProducer

- (BPSFilterProducer)initWithDownstream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSFilterProducer;
  v6 = [(BPSFilterProducer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downstream, a3);
    v7->_state = 0;
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)receiveNewValue:(id)a3
{
  id v4 = a3;
  id v5 = NSString;
  v6 = NSStringFromSelector(a2);
  uint64_t v7 = [v5 stringWithFormat:@"Override %@ in a subclass", v6];

  id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v7 userInfo:0];
  objc_exception_throw(v8);
}

- (void)receiveCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    uint64_t v11 = objc_opt_class();
    _os_log_impl(&dword_1AD01F000, v6, OS_LOG_TYPE_INFO, "%@ - completion", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_lock(&v5->_lock);
  uint64_t v7 = [(BPSFilterProducer *)v5 state];
  switch(v7)
  {
    case 2:
      goto LABEL_8;
    case 1:
      [(BPSFilterProducer *)v5 setState:2];
      os_unfair_lock_unlock(&v5->_lock);
      objc_super v9 = [(BPSFilterProducer *)v5 downstream];
      [v9 receiveCompletion:v4];

      os_unfair_lock_lock(&v5->_lock);
      [(BPSFilterProducer *)v5 setSubscription:0];
LABEL_8:
      os_unfair_lock_unlock(&v5->_lock);
      break;
    case 0:
      os_unfair_lock_unlock(&v5->_lock);
      id v8 = (id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid State: Received completion before receiving subscription" userInfo:0];
      break;
  }
}

- (int64_t)receiveInput:(id)a3
{
  id v5 = a3;
  v6 = self;
  p_lock = &v6->_lock;
  os_unfair_lock_lock(&v6->_lock);
  uint64_t v8 = [(BPSFilterProducer *)v6 state];
  switch(v8)
  {
    case 2:
      os_unfair_lock_unlock(p_lock);
      break;
    case 1:
      os_unfair_lock_unlock(p_lock);
      uint64_t v11 = [(BPSFilterProducer *)v6 receiveNewValue:v5];
      uint64_t v14 = [v11 state];
      if (v14)
      {
        if (v14 == 2)
        {
          os_unfair_lock_lock(p_lock);
          [(BPSFilterProducer *)v6 setState:2];
          os_unfair_lock_unlock(p_lock);
          v21 = [(BPSFilterProducer *)v6 subscription];
          [v21 cancel];

          v22 = [v11 error];
          v23 = [(BPSFilterProducer *)v6 downstream];
          v24 = +[BPSCompletion failureWithError:v22];
          [v23 receiveCompletion:v24];

          goto LABEL_5;
        }
        if (v14 != 1)
        {
LABEL_5:

          break;
        }
        v15 = [v11 value];

        if (v15)
        {
          v16 = [(BPSFilterProducer *)v6 downstream];
          v17 = [v11 value];
          int64_t v12 = [v16 receiveInput:v17];
        }
        else
        {
          int64_t v12 = 1;
        }
      }
      else
      {
        os_unfair_lock_lock(p_lock);
        [(BPSFilterProducer *)v6 setState:2];
        os_unfair_lock_unlock(p_lock);
        v18 = [(BPSFilterProducer *)v6 subscription];
        [v18 cancel];

        v19 = [(BPSFilterProducer *)v6 downstream];
        v20 = +[BPSCompletion success];
        [v19 receiveCompletion:v20];

        int64_t v12 = 0;
      }

      goto LABEL_8;
    case 0:
      os_unfair_lock_unlock(p_lock);
      objc_super v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = NSStringFromSelector(a2);
      [v9 raise:v10, @"Invalid State: Received value before receiving subscription %@", v11 format];
      goto LABEL_5;
  }
  int64_t v12 = 0;
LABEL_8:

  return v12;
}

- (void)receiveSubscription:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(BPSFilterProducer *)self state];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4) {
      goto LABEL_6;
    }
    [(BPSFilterProducer *)self setState:1];
    [(BPSFilterProducer *)self setSubscription:v6];
    os_unfair_lock_unlock(&self->_lock);
    id v5 = [(BPSFilterProducer *)self downstream];
    [v5 receiveSubscription:self];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v5 = [(BPSFilterProducer *)self subscription];
    [v5 cancel];
  }

LABEL_6:
}

- (void)cancel
{
  v2 = self;
  v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(_BPSHandleEventsInner *)(uint64_t)v2 cancel];
  }

  os_unfair_lock_lock(&v2->_lock);
  uint64_t v4 = [(BPSFilterProducer *)v2 state];
  [(BPSFilterProducer *)v2 setState:2];
  if (v4 == 1)
  {
    id v5 = [(BPSFilterProducer *)v2 subscription];
    [(BPSFilterProducer *)v2 setSubscription:0];
    os_unfair_lock_unlock(&v2->_lock);
    [v5 cancel];
  }
  else
  {
    [(BPSFilterProducer *)v2 setSubscription:0];
    os_unfair_lock_unlock(&v2->_lock);
  }
}

- (void)requestDemand:(int64_t)a3
{
  id v5 = self;
  uint64_t v10 = v5;
  if (a3 <= 0)
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:v10 file:@"BPSFilterProducer.m" lineNumber:168 description:@"Negative or zero demand requested"];

    id v5 = v10;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  uint64_t v7 = [(BPSFilterProducer *)v10 state];
  switch(v7)
  {
    case 2:
      os_unfair_lock_unlock(p_lock);
      break;
    case 1:
      os_unfair_lock_unlock(p_lock);
      uint64_t v8 = [(BPSFilterProducer *)v10 subscription];
      [v8 requestDemand:a3];

      break;
    case 0:
      os_unfair_lock_unlock(p_lock);
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Invalid state: Received request before sending subscription"];
      break;
  }
}

- (id)upstreamSubscriptions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(BPSFilterProducer *)self subscription];

  if (v3)
  {
    uint64_t v4 = [(BPSFilterProducer *)self subscription];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(_BPSHandleEventsInner *)(uint64_t)self upstreamSubscriptions];
    }
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end