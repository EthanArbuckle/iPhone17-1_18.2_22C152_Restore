@interface UnsignedFixedIntervalMapper
- (NSArray)intervals;
- (UnsignedFixedIntervalMapper)initWithBins:(id)a3 intervalCreationBlock:(id)a4 valueComparisonBlock:(id)a5;
- (id)comparisonBlock;
- (id)creationBlock;
- (id)intervalForValue:(unint64_t)a3;
- (id)intervalIndexForValue:(unint64_t)a3;
@end

@implementation UnsignedFixedIntervalMapper

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparisonBlock, 0);
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
}

- (id)comparisonBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (id)creationBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSArray)intervals
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)intervalForValue:(unint64_t)a3
{
  v5 = [(UnsignedFixedIntervalMapper *)self intervals];
  v6 = [(UnsignedFixedIntervalMapper *)self intervalIndexForValue:a3];
  v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedIntValue"));

  return v7;
}

- (id)intervalIndexForValue:(unint64_t)a3
{
  v5 = [(UnsignedFixedIntervalMapper *)self intervals];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(UnsignedFixedIntervalMapper *)self comparisonBlock];
      v9 = [(UnsignedFixedIntervalMapper *)self intervals];
      v10 = [v9 objectAtIndexedSubscript:v7];
      v11 = [v10 end];
      int v12 = ((uint64_t (**)(void, unint64_t, void *))v8)[2](v8, a3, v11);

      if (v12) {
        break;
      }
      ++v7;
      v13 = [(UnsignedFixedIntervalMapper *)self intervals];
      unint64_t v14 = [v13 count] - 1;
    }
    while (v7 < v14);
  }
  v15 = NSNumber;
  return (id)[v15 numberWithInteger:v7];
}

- (UnsignedFixedIntervalMapper)initWithBins:(id)a3 intervalCreationBlock:(id)a4 valueComparisonBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)UnsignedFixedIntervalMapper;
  v11 = [(UnsignedFixedIntervalMapper *)&v29 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x1D944EB70](v9);
    id creationBlock = v11->_creationBlock;
    v11->_id creationBlock = (id)v12;

    uint64_t v14 = MEMORY[0x1D944EB70](v10);
    id comparisonBlock = v11->_comparisonBlock;
    v11->_id comparisonBlock = (id)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count") + 1);
    if ([v8 count])
    {
      unint64_t v17 = 0;
      v18 = &unk_1F2C87718;
      do
      {
        v19 = [(UnsignedFixedIntervalMapper *)v11 creationBlock];
        v20 = [v8 objectAtIndexedSubscript:v17];
        v21 = ((void (**)(void, void *, void *))v19)[2](v19, v18, v20);
        [v16 addObject:v21];

        v22 = [v8 objectAtIndexedSubscript:v17];

        ++v17;
        v18 = v22;
      }
      while ([v8 count] > v17);
    }
    else
    {
      v22 = &unk_1F2C87718;
    }
    v23 = [(UnsignedFixedIntervalMapper *)v11 creationBlock];
    v24 = +[HMMInterval positiveInfinityEnd];
    v25 = ((void (**)(void, void *, void *))v23)[2](v23, v22, v24);
    [v16 addObject:v25];

    uint64_t v26 = [v16 copy];
    intervals = v11->_intervals;
    v11->_intervals = (NSArray *)v26;
  }
  return v11;
}

@end