@interface FIUIChartDataGroup
- (FIUIChartDataGroupDataSource)dataSource;
- (NSArray)dataSets;
- (NSString)description;
- (id)_dataSetAtIndexCreateIfNecessary:(unint64_t)a3;
- (id)_labelsForSetAtIndex:(unint64_t)a3;
- (id)_pointForSetAtIndex:(unint64_t)a3 pointIndex:(unint64_t)a4;
- (id)dataSet:(id)a3 chartPointForIndex:(unint64_t)a4;
- (id)dataSetAtIndex:(unint64_t)a3;
- (id)labelsForSet:(id)a3;
- (id)maxXValue;
- (id)maxYValue;
- (id)minXValue;
- (id)minYValue;
- (unint64_t)_numberOfDataPointsInSetAtIndex:(unint64_t)a3;
- (unint64_t)_numberOfDataSets;
- (unint64_t)numberOfDataPointsForDataSet:(id)a3;
- (unint64_t)numberOfDataSets;
- (void)reloadData;
- (void)setDataSets:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation FIUIChartDataGroup

- (id)minYValue
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_dataSets;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "minYValue", (void)v12);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = FUArraySmallestValue(v3);

  return v10;
}

- (id)maxYValue
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_dataSets;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "maxYValue", (void)v12);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = FUArrayLargestValue(v3);

  return v10;
}

- (id)minXValue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_dataSets;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "minXValue", (void)v14);
        if (v10)
        {
          v11 = [v9 minXValue];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  long long v12 = FUArraySmallestValue(v3);

  return v12;
}

- (id)maxXValue
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_dataSets;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "maxXValue", (void)v12);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = FUArrayLargestValue(v3);

  return v10;
}

- (unint64_t)numberOfDataSets
{
  return [(NSArray *)self->_dataSets count];
}

- (id)dataSetAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_dataSets count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSArray *)self->_dataSets objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (void)reloadData
{
  unint64_t v3 = [(FIUIChartDataGroup *)self _numberOfDataSets];
  id v8 = [MEMORY[0x263EFF980] array];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = [(FIUIChartDataGroup *)self _dataSetAtIndexCreateIfNecessary:i];
      [v5 reloadData];
      [v8 addObject:v5];
    }
  }
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
  dataSets = self->_dataSets;
  self->_dataSets = v6;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"Data Sets: %@", self->_dataSets];
}

- (id)_dataSetAtIndexCreateIfNecessary:(unint64_t)a3
{
  -[FIUIChartDataGroup dataSetAtIndex:](self, "dataSetAtIndex:");
  uint64_t v5 = (FIUIChartDataSet *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    uint64_t v5 = objc_alloc_init(FIUIChartDataSet);
    [(FIUIChartDataSet *)v5 setDataSource:self];
    [(FIUIChartDataSet *)v5 setTag:a3];
  }
  return v5;
}

- (unint64_t)numberOfDataPointsForDataSet:(id)a3
{
  uint64_t v4 = [a3 tag];
  return [(FIUIChartDataGroup *)self _numberOfDataPointsInSetAtIndex:v4];
}

- (id)dataSet:(id)a3 chartPointForIndex:(unint64_t)a4
{
  uint64_t v6 = [a3 tag];
  return [(FIUIChartDataGroup *)self _pointForSetAtIndex:v6 pointIndex:a4];
}

- (id)labelsForSet:(id)a3
{
  uint64_t v4 = [a3 tag];
  return [(FIUIChartDataGroup *)self _labelsForSetAtIndex:v4];
}

- (unint64_t)_numberOfDataSets
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unint64_t v4 = [WeakRetained numberOfDataSetsInGroup:self];

  return v4;
}

- (unint64_t)_numberOfDataPointsInSetAtIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unint64_t v6 = [WeakRetained dataGroup:self numberOfPointsInSetAtIndex:a3];

  return v6;
}

- (id)_pointForSetAtIndex:(unint64_t)a3 pointIndex:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = [WeakRetained dataGroup:self pointForSetAtIndex:a3 pointIndex:a4];

  return v8;
}

- (id)_labelsForSetAtIndex:(unint64_t)a3
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_dataSource);
    v9 = [v8 dataGroup:self labelsForSetAtIndex:a3];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (FIUIChartDataGroupDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (FIUIChartDataGroupDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSArray)dataSets
{
  return self->_dataSets;
}

- (void)setDataSets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSets, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end