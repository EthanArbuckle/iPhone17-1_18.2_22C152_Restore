@interface FIUIChartDataSet
- (FIUIChartDataSetDataSource)dataSource;
- (id)description;
- (id)labelsForSet;
- (id)maxXValue;
- (id)maxYValue;
- (id)minXValue;
- (id)minYValue;
- (id)points;
- (int64_t)tag;
- (void)reloadData;
- (void)setDataSource:(id)a3;
- (void)setTag:(int64_t)a3;
@end

@implementation FIUIChartDataSet

- (id)description
{
  return [(NSArray *)self->_points description];
}

- (id)maxYValue
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_points;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "maxYValue", (void)v12);
        v9 = v8;
        if (!v5 || [v8 compare:v5] == 1)
        {
          id v10 = v9;

          v5 = v10;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)minYValue
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_points;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "minYValue", (void)v12);
        v9 = v8;
        if (!v5 || [v8 compare:v5] == -1)
        {
          id v10 = v9;

          v5 = v10;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)maxXValue
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_points;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "xValue", (void)v12);
        v9 = v8;
        if (!v5 || objc_msgSend(v8, "hk_isAfterDate:", v5))
        {
          id v10 = v9;

          v5 = v10;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)minXValue
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_points;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "xValue", (void)v12);
        v9 = v8;
        if (!v5 || objc_msgSend(v8, "hk_isBeforeDate:", v5))
        {
          id v10 = v9;

          v5 = v10;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)points
{
  return self->_points;
}

- (id)labelsForSet
{
  return self->_labels;
}

- (void)reloadData
{
  id obj = [MEMORY[0x263EFF980] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v4 = [WeakRetained numberOfDataPointsForDataSet:self];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = objc_loadWeakRetained((id *)&self->_dataSource);
      v7 = [v6 dataSet:self chartPointForIndex:v5];
      [obj addObject:v7];

      ++v5;
      id v8 = objc_loadWeakRetained((id *)&self->_dataSource);
      unint64_t v9 = [v8 numberOfDataPointsForDataSet:self];
    }
    while (v5 < v9);
  }
  objc_storeStrong((id *)&self->_points, obj);
  id v10 = objc_loadWeakRetained((id *)&self->_dataSource);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_dataSource);
    long long v13 = [v12 labelsForSet:self];
    labels = self->_labels;
    self->_labels = v13;
  }
}

- (FIUIChartDataSetDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (FIUIChartDataSetDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_points, 0);
}

@end