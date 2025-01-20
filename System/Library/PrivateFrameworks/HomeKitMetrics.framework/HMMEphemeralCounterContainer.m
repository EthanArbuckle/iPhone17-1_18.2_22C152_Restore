@interface HMMEphemeralCounterContainer
- (BOOL)active;
- (BOOL)isActive;
- (BOOL)isEmpty;
- (HMMEphemeralCounterContainer)init;
- (NSDictionary)counters;
- (id)valueForCounter:(id)a3;
- (void)incrementCounter:(id)a3 by:(int64_t)a4;
- (void)setActive:(BOOL)a3;
@end

@implementation HMMEphemeralCounterContainer

- (void).cxx_destruct
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSDictionary)counters
{
  v2 = (void *)[(NSMutableDictionary *)self->_counters copy];
  return (NSDictionary *)v2;
}

- (id)valueForCounter:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_counters objectForKeyedSubscript:a3];
}

- (void)incrementCounter:(id)a3 by:(int64_t)a4
{
  if (self->_active)
  {
    counters = self->_counters;
    id v7 = a3;
    v8 = [(NSMutableDictionary *)counters objectForKeyedSubscript:v7];
    if (v8)
    {
      v9 = v8;
      objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", objc_msgSend(v8, "longValue") + a4);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    }
    [(NSMutableDictionary *)self->_counters setObject:v10 forKeyedSubscript:v7];
  }
}

- (BOOL)isEmpty
{
  return [(NSMutableDictionary *)self->_counters count] == 0;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (HMMEphemeralCounterContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMMEphemeralCounterContainer;
  v2 = [(HMMEphemeralCounterContainer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    counters = v2->_counters;
    v2->_counters = (NSMutableDictionary *)v3;

    v2->_active = 1;
  }
  return v2;
}

@end