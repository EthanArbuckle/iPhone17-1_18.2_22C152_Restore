@interface PDCountedFileSyncAgent
- (PDCountedFileSyncAgent)initWithAgent:(id)a3;
- (PDFileSyncAgent)agent;
- (int)counter;
- (int)decrementCounter;
- (int)incrementCounter;
- (void)setAgent:(id)a3;
- (void)setCounter:(int)a3;
@end

@implementation PDCountedFileSyncAgent

- (PDCountedFileSyncAgent)initWithAgent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDCountedFileSyncAgent;
  v6 = [(PDCountedFileSyncAgent *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_agent, a3);
    atomic_store(1u, (unsigned int *)&v7->_counter);
  }

  return v7;
}

- (int)incrementCounter
{
  return atomic_fetch_add(&self->_counter, 1u);
}

- (int)decrementCounter
{
  return atomic_fetch_add(&self->_counter, 0xFFFFFFFF);
}

- (PDFileSyncAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (int)counter
{
  return atomic_load((unsigned int *)&self->_counter);
}

- (void)setCounter:(int)a3
{
}

- (void).cxx_destruct
{
}

@end