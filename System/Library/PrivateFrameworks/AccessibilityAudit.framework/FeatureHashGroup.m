@interface FeatureHashGroup
- (FeatureHash)aggregateHash;
- (FeatureHashGroup)initWithHash:(id)a3 andIssues:(id)a4;
- (NSMutableArray)issues;
- (double)computeMeanHashDistance:(id)a3;
- (double)count;
- (void)addHash:(id)a3;
- (void)setAggregateHash:(id)a3;
- (void)setCount:(double)a3;
- (void)setIssues:(id)a3;
- (void)setScreenGroupID:(id)a3;
@end

@implementation FeatureHashGroup

- (FeatureHashGroup)initWithHash:(id)a3 andIssues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FeatureHashGroup;
  v8 = [(FeatureHashGroup *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(FeatureHashGroup *)v8 setAggregateHash:v6];
    v10 = (void *)[v7 mutableCopy];
    [(FeatureHashGroup *)v9 setIssues:v10];

    [(FeatureHashGroup *)v9 setCount:1.0];
    v11 = [(FeatureHashGroup *)v9 issues];
    [(FeatureHashGroup *)v9 setScreenGroupID:v11];
  }
  return v9;
}

- (void)addHash:(id)a3
{
  id v18 = a3;
  for (uint64_t i = 0; i != 768; ++i)
  {
    v5 = [(FeatureHashGroup *)self aggregateHash];
    id v6 = [v5 values];
    id v7 = [v6 objectAtIndexedSubscript:i];
    [v7 doubleValue];
    double v9 = v8;
    v10 = [v18 values];
    v11 = [v10 objectAtIndexedSubscript:i];
    [v11 doubleValue];
    double v13 = v9 + v12;

    v14 = [NSNumber numberWithDouble:v13];
    v15 = [(FeatureHashGroup *)self aggregateHash];
    v16 = [v15 values];
    [v16 setObject:v14 atIndexedSubscript:i];
  }
  [(FeatureHashGroup *)self count];
  [(FeatureHashGroup *)self setCount:v17 + 1.0];
}

- (void)setScreenGroupID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = [(FeatureHashGroup *)self aggregateHash];
        v11 = [v10 hashID];
        [v9 setScreenGroupId:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (double)computeMeanHashDistance:(id)a3
{
  id v4 = a3;
  [(FeatureHashGroup *)self count];
  double v6 = -1.0;
  if (fabs(v5) >= 1.0)
  {
    uint64_t v7 = [(FeatureHashGroup *)self aggregateHash];
    uint64_t v8 = [v7 values];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      double v11 = 0.0;
      do
      {
        long long v12 = [(FeatureHashGroup *)self aggregateHash];
        long long v13 = [v12 values];
        long long v14 = [v13 objectAtIndexedSubscript:v10];
        [v14 doubleValue];
        double v16 = v15;
        [(FeatureHashGroup *)self count];
        double v18 = v16 / v17;

        v19 = [v4 values];
        v20 = [v19 objectAtIndexedSubscript:v10];
        [v20 doubleValue];
        double v22 = v21;

        double v11 = v11 + (v18 - v22) * (v18 - v22);
        ++v10;
        v23 = [(FeatureHashGroup *)self aggregateHash];
        v24 = [v23 values];
        unint64_t v25 = [v24 count];
      }
      while (v25 > v10);
    }
    else
    {
      double v11 = 0.0;
    }
    double v6 = sqrt(v11);
  }

  return v6;
}

- (FeatureHash)aggregateHash
{
  return (FeatureHash *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAggregateHash:(id)a3
{
}

- (NSMutableArray)issues
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIssues:(id)a3
{
}

- (double)count
{
  return self->_count;
}

- (void)setCount:(double)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issues, 0);

  objc_storeStrong((id *)&self->_aggregateHash, 0);
}

@end