@interface BPSCorrelationProducer
- (BPSCorrelationProducer)initWithDownstream:(id)a3;
- (BPSSubscriber)downstream;
- (BPSSubscription)subscription;
- (id)receiveNewValue:(id)a3 source:(int64_t)a4;
- (id)upstreamSubscriptions;
- (int64_t)receiveInput:(id)a3;
- (int64_t)receiveInput:(id)a3 source:(int64_t)a4;
- (int64_t)state;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSubscription:(id)a3;
@end

@implementation BPSCorrelationProducer

- (BPSCorrelationProducer)initWithDownstream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSCorrelationProducer;
  v6 = [(BPSCorrelationProducer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downstream, a3);
    v7->_state = 0;
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)receiveNewValue:(id)a3 source:(int64_t)a4
{
  id v5 = a3;
  v6 = NSString;
  v7 = NSStringFromSelector(a2);
  uint64_t v8 = [v6 stringWithFormat:@"Override %@ in a subclass", v7];

  id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v8 userInfo:0];
  objc_exception_throw(v9);
}

- (void)receiveCompletion:(id)a3
{
  id v9 = a3;
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  uint64_t v6 = [(BPSCorrelationProducer *)v4 state];
  switch(v6)
  {
    case 2:
      goto LABEL_6;
    case 1:
      [(BPSCorrelationProducer *)v4 setState:2];
LABEL_6:
      uint64_t v8 = [(BPSCorrelationProducer *)v4 downstream];
      [(BPSCorrelationProducer *)v4 setDownstream:0];
      os_unfair_lock_unlock(p_lock);
      [v8 receiveCompletion:v9];

      break;
    case 0:
      os_unfair_lock_unlock(p_lock);
      id v7 = (id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid State: Received completion before receiving subscription" userInfo:0];
      break;
  }
}

- (int64_t)receiveInput:(id)a3 source:(int64_t)a4
{
  id v7 = a3;
  uint64_t v8 = self;
  p_lock = &v8->_lock;
  os_unfair_lock_lock(&v8->_lock);
  uint64_t v10 = [(BPSCorrelationProducer *)v8 state];
  switch(v10)
  {
    case 2:
      os_unfair_lock_unlock(p_lock);
      break;
    case 1:
      os_unfair_lock_unlock(p_lock);
      v13 = [(BPSCorrelationProducer *)v8 receiveNewValue:v7 source:a4];
      uint64_t v16 = [v13 state];
      if (v16)
      {
        if (v16 == 2)
        {
          os_unfair_lock_lock(p_lock);
          [(BPSCorrelationProducer *)v8 setState:2];
          os_unfair_lock_unlock(p_lock);
          v23 = [(BPSCorrelationProducer *)v8 subscription];
          [v23 cancel];

          v24 = [v13 error];
          v25 = [(BPSCorrelationProducer *)v8 downstream];
          v26 = +[BPSCompletion failureWithError:v24];
          [v25 receiveCompletion:v26];

          goto LABEL_5;
        }
        if (v16 != 1)
        {
LABEL_5:

          break;
        }
        v17 = [v13 value];

        if (v17)
        {
          v18 = [(BPSCorrelationProducer *)v8 downstream];
          v19 = [v13 value];
          int64_t v14 = [v18 receiveInput:v19];
        }
        else
        {
          int64_t v14 = 1;
        }
      }
      else
      {
        os_unfair_lock_lock(p_lock);
        [(BPSCorrelationProducer *)v8 setState:2];
        os_unfair_lock_unlock(p_lock);
        v20 = [(BPSCorrelationProducer *)v8 subscription];
        [v20 cancel];

        v21 = [(BPSCorrelationProducer *)v8 downstream];
        v22 = +[BPSCompletion success];
        [v21 receiveCompletion:v22];

        int64_t v14 = 0;
      }

      goto LABEL_8;
    case 0:
      os_unfair_lock_unlock(p_lock);
      v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3B8];
      v13 = NSStringFromSelector(a2);
      [v11 raise:v12, @"Invalid State: Received value before receiving subscription %@", v13 format];
      goto LABEL_5;
  }
  int64_t v14 = 0;
LABEL_8:

  return v14;
}

- (int64_t)receiveInput:(id)a3
{
  v4 = self;
  int64_t v5 = [(BPSCorrelationProducer *)v4 receiveInput:a3 source:0];

  return v5;
}

- (void)receiveSubscription:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(BPSCorrelationProducer *)self state];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4) {
      goto LABEL_6;
    }
    [(BPSCorrelationProducer *)self setState:1];
    [(BPSCorrelationProducer *)self setSubscription:v6];
    os_unfair_lock_unlock(&self->_lock);
    int64_t v5 = [(BPSCorrelationProducer *)self downstream];
    [v5 receiveSubscription:self];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    int64_t v5 = [(BPSCorrelationProducer *)self subscription];
    [v5 cancel];
  }

LABEL_6:
}

- (void)cancel
{
  int64_t v4 = self;
  os_unfair_lock_lock(&v4->_lock);
  uint64_t v2 = [(BPSCorrelationProducer *)v4 state];
  [(BPSCorrelationProducer *)v4 setState:2];
  os_unfair_lock_unlock(&v4->_lock);
  if (v2 == 1)
  {
    v3 = [(BPSCorrelationProducer *)v4 subscription];
    [v3 cancel];
  }
}

- (void)requestDemand:(int64_t)a3
{
  int64_t v5 = self;
  uint64_t v10 = v5;
  if (a3 <= 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:v10 file:@"BPSCorrelationProducer.m" lineNumber:173 description:@"Negative or zero demand requested"];

    int64_t v5 = v10;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  uint64_t v7 = [(BPSCorrelationProducer *)v10 state];
  switch(v7)
  {
    case 2:
      os_unfair_lock_unlock(p_lock);
      break;
    case 1:
      os_unfair_lock_unlock(p_lock);
      uint64_t v8 = [(BPSCorrelationProducer *)v10 subscription];
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
  v3 = [(BPSCorrelationProducer *)self subscription];
  if (v3)
  {
    int64_t v4 = [(BPSCorrelationProducer *)self subscription];
    v7[0] = v4;
    int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    int64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
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