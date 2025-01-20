@interface JEHLSVideoPlaylist
- (JEHLSVideoPlaylist)initWithMainFeatureMetricsData:(id)a3;
- (JEHLSVideoPlaylist)initWithStartPosition:(unint64_t)a3 mainFeatureMetricsData:(id)a4;
- (NSArray)mainFeatureMetricsData;
- (NSMutableArray)rollItems;
- (id)itemAtOverallPosition:(unint64_t)a3 rangeOptions:(int64_t)a4;
- (id)itemsBetweenStartOverallPosition:(unint64_t)a3 endOverallPosition:(unint64_t)a4;
- (id)mainFeatureItemWithStartOverallPosition:(unint64_t)a3;
- (int64_t)indexOfLastRollItemWithStartBeforePosition:(unint64_t)a3;
- (unint64_t)startPosition;
- (void)addItemStartAtMilliseconds:(unint64_t)a3 durationMilliseconds:(unint64_t)a4 metricsData:(id)a5;
- (void)addItemStartAtMilliseconds:(unint64_t)a3 endAtMilliseconds:(unint64_t)a4 metricsData:(id)a5;
- (void)addItemStartAtSeconds:(double)a3 durationSeconds:(double)a4 metricsData:(id)a5;
- (void)addRollInfoItem:(id)a3;
- (void)addRollInfoItems:(id)a3;
- (void)addRollItem:(id)a3;
- (void)setMainFeatureMetricsData:(id)a3;
- (void)setRollItems:(id)a3;
- (void)setStartPosition:(unint64_t)a3;
@end

@implementation JEHLSVideoPlaylist

- (JEHLSVideoPlaylist)initWithStartPosition:(unint64_t)a3 mainFeatureMetricsData:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)JEHLSVideoPlaylist;
  v7 = [(JEHLSVideoPlaylist *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(JEHLSVideoPlaylist *)v7 setStartPosition:a3];
    [(JEHLSVideoPlaylist *)v8 setMainFeatureMetricsData:v6];
  }

  return v8;
}

- (JEHLSVideoPlaylist)initWithMainFeatureMetricsData:(id)a3
{
  return [(JEHLSVideoPlaylist *)self initWithStartPosition:0 mainFeatureMetricsData:a3];
}

- (void)addRollInfoItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(JEHLSVideoPlaylist *)self addRollInfoItem:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addRollInfoItem:(id)a3
{
  id v8 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v8 metricsData];
  }
  else
  {
    id v4 = 0;
  }
  [v8 start];
  double v6 = v5;
  [v8 duration];
  [(JEHLSVideoPlaylist *)self addItemStartAtSeconds:v4 durationSeconds:v6 metricsData:v7];
}

- (void)addItemStartAtSeconds:(double)a3 durationSeconds:(double)a4 metricsData:(id)a5
{
  id v8 = a5;
  long long v9 = [[JEHLSRollItem alloc] initWithStartOverallPosition:(unint64_t)(a3 * 1000.0) duration:(unint64_t)(a4 * 1000.0) metricsData:v8];

  [(JEHLSVideoPlaylist *)self addRollItem:v9];
}

- (void)addItemStartAtMilliseconds:(unint64_t)a3 durationMilliseconds:(unint64_t)a4 metricsData:(id)a5
{
  id v8 = a5;
  long long v9 = [[JEHLSRollItem alloc] initWithStartOverallPosition:a3 duration:a4 metricsData:v8];

  [(JEHLSVideoPlaylist *)self addRollItem:v9];
}

- (void)addItemStartAtMilliseconds:(unint64_t)a3 endAtMilliseconds:(unint64_t)a4 metricsData:(id)a5
{
}

- (id)itemAtOverallPosition:(unint64_t)a3 rangeOptions:(int64_t)a4
{
  char v4 = a4;
  int64_t v7 = -[JEHLSVideoPlaylist indexOfLastRollItemWithStartBeforePosition:](self, "indexOfLastRollItemWithStartBeforePosition:");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(JEHLSVideoPlaylist *)self mainFeatureItemWithStartOverallPosition:0];
  }
  else
  {
    int64_t v9 = v7;
    if ((v4 & 1) == 0)
    {
      do
      {
        long long v10 = [(JEHLSVideoPlaylist *)self rollItems];
        long long v11 = [v10 objectAtIndexedSubscript:v9];
        uint64_t v12 = [v11 startOverallPosition];

        int64_t v13 = v9 - 1;
        if (v12 != a3) {
          break;
        }
      }
      while (v9-- > 0);
      int64_t v9 = v13 + 1;
    }
    v15 = [(JEHLSVideoPlaylist *)self rollItems];
    v16 = [v15 objectAtIndexedSubscript:v9];

    if (([v16 containsOverallPosition:a3] & 1) != 0
      || (v4 & 2) != 0 && [v16 endOverallPosition] == a3)
    {
      id v17 = v16;
    }
    else
    {
      -[JEHLSVideoPlaylist mainFeatureItemWithStartOverallPosition:](self, "mainFeatureItemWithStartOverallPosition:", [v16 endOverallPosition]);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = v17;
  }
  return v8;
}

- (id)itemsBetweenStartOverallPosition:(unint64_t)a3 endOverallPosition:(unint64_t)a4
{
  int64_t v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(JEHLSVideoPlaylist *)self rollItems];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    unint64_t v10 = [(JEHLSVideoPlaylist *)self indexOfLastRollItemWithStartBeforePosition:a3];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v11 = [(JEHLSVideoPlaylist *)self mainFeatureItemWithStartOverallPosition:0];
      [v7 addObject:v11];

      unint64_t v10 = 0;
    }
    while (1)
    {
      v20 = [(JEHLSVideoPlaylist *)self rollItems];
      unint64_t v21 = [v20 count];

      if (v10 >= v21) {
        break;
      }
      uint64_t v12 = [(JEHLSVideoPlaylist *)self rollItems];
      int64_t v13 = [v12 objectAtIndexedSubscript:v10];

      if ([v13 startOverallPosition] > a4) {
        goto LABEL_17;
      }
      if ([v13 endOverallPosition] >= a3) {
        [v7 addObject:v13];
      }
      ++v10;
      if ([v13 endOverallPosition] < a4)
      {
        uint64_t v14 = [(JEHLSVideoPlaylist *)self rollItems];
        unint64_t v15 = [v14 count];

        if (v10 >= v15)
        {
          id v17 = -[JEHLSVideoPlaylist mainFeatureItemWithStartOverallPosition:](self, "mainFeatureItemWithStartOverallPosition:", [v13 endOverallPosition]);
          [v7 addObject:v17];
        }
        else
        {
          v16 = [(JEHLSVideoPlaylist *)self rollItems];
          id v17 = [v16 objectAtIndexedSubscript:v10];

          unint64_t v18 = [v17 startOverallPosition];
          if (v18 > [v13 endOverallPosition])
          {
            v19 = -[JEHLSVideoPlaylist mainFeatureItemWithStartOverallPosition:](self, "mainFeatureItemWithStartOverallPosition:", [v13 endOverallPosition]);
            [v7 addObject:v19];
          }
        }
      }
    }
  }
  else
  {
    int64_t v13 = [(JEHLSVideoPlaylist *)self mainFeatureItemWithStartOverallPosition:0];
    [v7 addObject:v13];
LABEL_17:
  }
  return v7;
}

- (NSMutableArray)rollItems
{
  rollItems = self->_rollItems;
  if (!rollItems)
  {
    char v4 = [MEMORY[0x1E4F1CA48] array];
    double v5 = self->_rollItems;
    self->_rollItems = v4;

    rollItems = self->_rollItems;
  }
  return rollItems;
}

- (void)addRollItem:(id)a3
{
  id v4 = a3;
  id v8 = [(JEHLSVideoPlaylist *)self rollItems];
  uint64_t v5 = [v8 count];
  double v6 = +[JEHLSItem comparator];
  uint64_t v7 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v5, 1024, v6);

  [v8 insertObject:v4 atIndex:v7];
}

- (id)mainFeatureItemWithStartOverallPosition:(unint64_t)a3
{
  uint64_t v5 = [JEHLSItem alloc];
  double v6 = [(JEHLSVideoPlaylist *)self mainFeatureMetricsData];
  uint64_t v7 = [(JEHLSItem *)v5 initWithStartOverallPosition:a3 metricsData:v6];

  unint64_t v8 = [(JEHLSVideoPlaylist *)self startPosition];
  unint64_t v9 = [(JEHLSVideoPlaylist *)self indexOfLastRollItemWithStartBeforePosition:a3];
  if (v9 <= 0x7FFFFFFFFFFFFFFELL)
  {
    unint64_t v10 = v9;
    long long v11 = [(JEHLSVideoPlaylist *)self rollItems];
    uint64_t v12 = [v11 objectAtIndexedSubscript:v10];

    if (v10)
    {
      unint64_t v13 = v10 - 1;
      do
      {
        uint64_t v14 = [(JEHLSVideoPlaylist *)self rollItems];
        unint64_t v15 = [v14 objectAtIndexedSubscript:v13];

        uint64_t v16 = [v12 startOverallPosition];
        uint64_t v17 = [v15 startOverallPosition];
        uint64_t v18 = [v15 duration];

        unint64_t v8 = v16 + v8 - (v17 + v18);
        v19 = [(JEHLSVideoPlaylist *)self rollItems];
        uint64_t v12 = [v19 objectAtIndexedSubscript:v13];

        --v13;
      }
      while (v13 != -1);
    }
    v8 += [v12 startOverallPosition];
  }
  [(JEHLSItem *)v7 setStartPosition:v8];
  return v7;
}

- (int64_t)indexOfLastRollItemWithStartBeforePosition:(unint64_t)a3
{
  uint64_t v5 = [(JEHLSVideoPlaylist *)self rollItems];
  double v6 = [v5 firstObject];

  if (v6 && [v6 startOverallPosition] <= a3)
  {
    unint64_t v8 = [(JEHLSVideoPlaylist *)self rollItems];
    uint64_t v9 = [v8 count] - 1;

    if (v9 < 1)
    {
      int64_t v7 = 0;
    }
    else
    {
      int64_t v7 = 0;
      do
      {
        if (v7 + v9 + 1 >= 0) {
          uint64_t v10 = v7 + v9 + 1;
        }
        else {
          uint64_t v10 = v7 + v9 + 2;
        }
        uint64_t v11 = v10 >> 1;
        uint64_t v12 = [(JEHLSVideoPlaylist *)self rollItems];
        unint64_t v13 = [v12 objectAtIndexedSubscript:v11];

        if ([v13 startOverallPosition] > a3) {
          uint64_t v9 = v11 - 1;
        }
        else {
          int64_t v7 = v11;
        }
      }
      while (v7 < v9);
    }
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (unint64_t)startPosition
{
  return self->_startPosition;
}

- (void)setStartPosition:(unint64_t)a3
{
  self->_startPosition = a3;
}

- (void)setRollItems:(id)a3
{
}

- (NSArray)mainFeatureMetricsData
{
  return self->_mainFeatureMetricsData;
}

- (void)setMainFeatureMetricsData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainFeatureMetricsData, 0);
  objc_storeStrong((id *)&self->_rollItems, 0);
}

@end