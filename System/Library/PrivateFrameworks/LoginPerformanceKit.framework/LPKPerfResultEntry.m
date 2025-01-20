@interface LPKPerfResultEntry
- (BOOL)needsReCalculation;
- (LPKPerfResultEntry)init;
- (NSMutableArray)entryValues;
- (NSString)entryName;
- (double)meanValue;
- (double)medianValue;
- (void)_reCalculateValuesIfNeeded;
- (void)addEntryValue:(double)a3;
- (void)setEntryName:(id)a3;
- (void)setEntryValues:(id)a3;
- (void)setNeedsReCalculation:(BOOL)a3;
@end

@implementation LPKPerfResultEntry

- (LPKPerfResultEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPKPerfResultEntry;
  v2 = [(LPKPerfResultEntry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    entryValues = v2->_entryValues;
    v2->_entryValues = (NSMutableArray *)v3;

    v2->_needsReCalculation = 1;
  }
  return v2;
}

- (void)addEntryValue:(double)a3
{
  entryValues = self->_entryValues;
  v5 = [NSNumber numberWithDouble:a3];
  [(NSMutableArray *)entryValues addObject:v5];

  [(LPKPerfResultEntry *)self setNeedsReCalculation:1];
}

- (double)meanValue
{
  return self->_meanValue;
}

- (double)medianValue
{
  return self->_medianValue;
}

- (void)_reCalculateValuesIfNeeded
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(LPKPerfResultEntry *)self needsReCalculation])
  {
    [(NSMutableArray *)self->_entryValues sortUsingComparator:&__block_literal_global];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v3 = self->_entryValues;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      double v7 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "doubleValue", (void)v19);
          double v7 = v7 + v9;
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v5);
    }
    else
    {
      double v7 = 0.0;
    }

    self->_meanValue = v7 / (double)(unint64_t)[(NSMutableArray *)self->_entryValues count];
    char v10 = [(NSMutableArray *)self->_entryValues count];
    entryValues = self->_entryValues;
    unint64_t v12 = [(NSMutableArray *)entryValues count];
    if (v10)
    {
      v13 = [(NSMutableArray *)entryValues objectAtIndexedSubscript:v12 >> 1];
      [v13 doubleValue];
      self->_medianValue = v18;
    }
    else
    {
      v13 = [(NSMutableArray *)entryValues objectAtIndexedSubscript:(v12 - 1) >> 1];
      [v13 doubleValue];
      double v15 = v14;
      v16 = [(NSMutableArray *)self->_entryValues objectAtIndexedSubscript:((unint64_t)([(NSMutableArray *)self->_entryValues count] - 1) >> 1) + 1];
      [v16 doubleValue];
      self->_medianValue = (v15 + v17) * 0.5;
    }
    [(LPKPerfResultEntry *)self setNeedsReCalculation:0];
  }
}

uint64_t __48__LPKPerfResultEntry__reCalculateValuesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSString)entryName
{
  return self->_entryName;
}

- (void)setEntryName:(id)a3
{
}

- (NSMutableArray)entryValues
{
  return self->_entryValues;
}

- (void)setEntryValues:(id)a3
{
}

- (BOOL)needsReCalculation
{
  return self->_needsReCalculation;
}

- (void)setNeedsReCalculation:(BOOL)a3
{
  self->_needsReCalculation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryValues, 0);

  objc_storeStrong((id *)&self->_entryName, 0);
}

@end