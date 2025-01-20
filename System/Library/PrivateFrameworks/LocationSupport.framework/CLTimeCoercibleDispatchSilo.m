@interface CLTimeCoercibleDispatchSilo
- (CLTimeCoercibleDispatchSilo)initWithIdentifier:(id)a3;
- (CLTimeCoercibleDispatchSilo)initWithUnderlyingQueue:(id)a3;
- (NSMutableArray)timerHolders;
- (id)newTimer;
- (void)afterInterval:(double)a3 async:(id)a4;
- (void)heartBeat:(id)a3;
- (void)prepareAndRunBlock:(id)a3;
- (void)setLatchedAbsoluteTimestamp:(double)a3;
@end

@implementation CLTimeCoercibleDispatchSilo

- (CLTimeCoercibleDispatchSilo)initWithIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLTimeCoercibleDispatchSilo;
  v3 = [(CLDispatchSilo *)&v7 initWithIdentifier:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    timerHolders = v3->_timerHolders;
    v3->_timerHolders = (NSMutableArray *)v4;
  }
  return v3;
}

- (CLTimeCoercibleDispatchSilo)initWithUnderlyingQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLTimeCoercibleDispatchSilo;
  v3 = [(CLDispatchSilo *)&v7 initWithUnderlyingQueue:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    timerHolders = v3->_timerHolders;
    v3->_timerHolders = (NSMutableArray *)v4;
  }
  return v3;
}

- (void)setLatchedAbsoluteTimestamp:(double)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self currentLatchedAbsoluteTimestamp];
  double v6 = a3 - v5;
  [(CLDispatchSilo *)self _setLatchedAbsoluteTimestamp:a3];
  objc_super v7 = self->_timerHolders;
  v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [MEMORY[0x1E4F1CA48] array];
  timerHolders = self->_timerHolders;
  self->_timerHolders = v9;

  v11 = (void *)MEMORY[0x1E4F28F60];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1A455FB98;
  v23[3] = &unk_1E5B3EAF8;
  double v25 = v6;
  id v12 = v8;
  id v24 = v12;
  v13 = [v11 predicateWithBlock:v23];
  [(NSMutableArray *)v7 filterUsingPredicate:v13];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "shouldFire", (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v16);
  }

  [(NSMutableArray *)self->_timerHolders addObjectsFromArray:v7];
}

- (void)prepareAndRunBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)afterInterval:(double)a3 async:(id)a4
{
  id v6 = a4;
  id v7 = [(CLTimeCoercibleDispatchSilo *)self newTimer];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = sub_1A455FD40;
  v13 = &unk_1E5B3EB20;
  id v14 = v7;
  id v15 = v6;
  id v8 = v7;
  id v9 = v6;
  [v8 setHandler:&v10];
  objc_msgSend(v8, "setNextFireDelay:", a3, v10, v11, v12, v13);
}

- (void)heartBeat:(id)a3
{
  id v4 = a3;
  double v5 = [(CLDispatchSilo *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A455FE34;
  block[3] = &unk_1E5B3EB48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (id)newTimer
{
  id v3 = [[CLTimer alloc] initInSilo:self withScheduler:0];
  timerHolders = self->_timerHolders;
  double v5 = +[CLTimerWeakHolder holderWithTimer:v3];
  [(NSMutableArray *)timerHolders addObject:v5];

  return v3;
}

- (NSMutableArray)timerHolders
{
  return self->_timerHolders;
}

- (void).cxx_destruct
{
}

@end