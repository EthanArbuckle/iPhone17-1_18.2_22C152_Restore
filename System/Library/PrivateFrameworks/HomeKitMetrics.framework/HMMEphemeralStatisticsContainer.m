@interface HMMEphemeralStatisticsContainer
- (BOOL)active;
- (BOOL)isActive;
- (BOOL)isEmpty;
- (HMMEphemeralStatisticsContainer)init;
- (NSDictionary)statistics;
- (id)statistics:(id)a3;
- (void)addValue:(int64_t)a3 toStatistics:(id)a4;
- (void)setActive:(BOOL)a3;
@end

@implementation HMMEphemeralStatisticsContainer

- (void).cxx_destruct
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSDictionary)statistics
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  statistics = self->_statistics;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__HMMEphemeralStatisticsContainer_statistics__block_invoke;
  v8[3] = &unk_1E69FD590;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)statistics enumerateKeysAndObjectsUsingBlock:v8];
  v6 = (void *)[v5 copy];

  return (NSDictionary *)v6;
}

void __45__HMMEphemeralStatisticsContainer_statistics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 statistics];
  [v4 setObject:v6 forKey:v5];
}

- (id)statistics:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_statistics objectForKeyedSubscript:a3];
  v4 = [v3 statistics];

  return v4;
}

- (void)addValue:(int64_t)a3 toStatistics:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_active)
  {
    id v9 = v6;
    v8 = [(NSMutableDictionary *)self->_statistics objectForKeyedSubscript:v6];
    if (!v8)
    {
      v8 = objc_alloc_init(HMMMutableCounterStatistics);
      [(NSMutableDictionary *)self->_statistics setObject:v8 forKeyedSubscript:v9];
    }
    [(HMMMutableCounterStatistics *)v8 addValue:a3];

    id v7 = v9;
  }
  MEMORY[0x1F41817F8](v6, v7);
}

- (BOOL)isEmpty
{
  return [(NSMutableDictionary *)self->_statistics count] == 0;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (HMMEphemeralStatisticsContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMMEphemeralStatisticsContainer;
  v2 = [(HMMEphemeralStatisticsContainer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    statistics = v2->_statistics;
    v2->_statistics = (NSMutableDictionary *)v3;

    v2->_active = 1;
  }
  return v2;
}

@end