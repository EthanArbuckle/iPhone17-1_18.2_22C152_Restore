@interface HKChartSummaryTrendModel
- (BOOL)isEqual:(id)a3;
- (BOOL)selectTrendInitially;
- (HKChartSummaryTrendModel)initWithTimeScopeTrends:(id)a3 selectTrendInitially:(BOOL)a4;
- (NSArray)timeScopeTrends;
- (NSMutableArray)observers;
- (unint64_t)hash;
- (void)_notifyObserversTrendModelChanged;
- (void)addObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)updateChartSummaryTrendModel:(id)a3;
@end

@implementation HKChartSummaryTrendModel

- (HKChartSummaryTrendModel)initWithTimeScopeTrends:(id)a3 selectTrendInitially:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKChartSummaryTrendModel;
  v8 = [(HKChartSummaryTrendModel *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_selectTrendInitially = a4;
    objc_storeStrong((id *)&v8->_timeScopeTrends, a3);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v9->_observers;
    v9->_observers = v10;
  }
  return v9;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init(HKChartSummaryTrendModelObserverWrapper);
  [(HKChartSummaryTrendModelObserverWrapper *)v6 setWeakObserver:v4];

  v5 = [(HKChartSummaryTrendModel *)self observers];
  [v5 addObject:v6];
}

- (void)_notifyObserversTrendModelChanged
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(HKChartSummaryTrendModel *)self observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) weakObserver];
        [v7 trendModelChanged];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)updateChartSummaryTrendModel:(id)a3
{
  id v4 = a3;
  self->_selectTrendInitially = [v4 selectTrendInitially];
  uint64_t v5 = [v4 timeScopeTrends];

  uint64_t v6 = (NSArray *)[v5 copy];
  timeScopeTrends = self->_timeScopeTrends;
  self->_timeScopeTrends = v6;

  [(HKChartSummaryTrendModel *)self _notifyObserversTrendModelChanged];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKChartSummaryTrendModel *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_selectTrendInitially == v4->_selectTrendInitially) {
      char v5 = [(NSArray *)self->_timeScopeTrends isEqual:v4->_timeScopeTrends];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  BOOL selectTrendInitially = self->_selectTrendInitially;
  return [(NSArray *)self->_timeScopeTrends hash] ^ selectTrendInitially;
}

- (BOOL)selectTrendInitially
{
  return self->_selectTrendInitially;
}

- (NSArray)timeScopeTrends
{
  return self->_timeScopeTrends;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_timeScopeTrends, 0);
}

@end