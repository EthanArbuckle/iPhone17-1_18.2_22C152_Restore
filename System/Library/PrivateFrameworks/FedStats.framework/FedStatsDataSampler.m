@interface FedStatsDataSampler
+ (id)pickSamplesFrom:(id)a3 length:(unint64_t)a4;
+ (id)samplerWithCount:(unint64_t)a3;
- (NSMutableArray)results;
- (unint64_t)count;
- (unint64_t)total;
- (void)addItem:(id)a3;
- (void)addItems:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setResults:(id)a3;
- (void)setTotal:(unint64_t)a3;
@end

@implementation FedStatsDataSampler

+ (id)samplerWithCount:(unint64_t)a3
{
  v4 = objc_alloc_init(FedStatsDataSampler);
  [(FedStatsDataSampler *)v4 setTotal:0];
  [(FedStatsDataSampler *)v4 setCount:a3];
  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
  [(FedStatsDataSampler *)v4 setResults:v5];

  return v4;
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    unint64_t v5 = [(FedStatsDataSampler *)self total] + 1;
    [(FedStatsDataSampler *)self setTotal:v5];
    if (v5 <= [(FedStatsDataSampler *)self count])
    {
      v8 = [(FedStatsDataSampler *)self results];
      [v8 addObject:v9];
    }
    else
    {
      signed int v6 = arc4random_uniform([(FedStatsDataSampler *)self total]);
      BOOL v7 = [(FedStatsDataSampler *)self count] > v6;
      id v4 = v9;
      if (!v7) {
        goto LABEL_8;
      }
      v8 = [(FedStatsDataSampler *)self results];
      [v8 replaceObjectAtIndex:v6 withObject:v9];
    }

    id v4 = v9;
  }
LABEL_8:
}

- (void)addItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
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
        [(FedStatsDataSampler *)self addItem:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (id)pickSamplesFrom:(id)a3 length:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = +[FedStatsDataSampler samplerWithCount:a4];
  [v6 addItems:v5];

  uint64_t v7 = [v6 getResults];

  return v7;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)total
{
  return self->_total;
}

- (void)setTotal:(unint64_t)a3
{
  self->_total = a3;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end