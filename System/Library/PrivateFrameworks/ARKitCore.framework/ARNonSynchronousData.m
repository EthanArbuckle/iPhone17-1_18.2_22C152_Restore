@interface ARNonSynchronousData
- (ARNonSynchronousData)initWithGatheredData:(id)a3 timestamp:(double)a4;
- (NSArray)gatheredData;
- (double)timestamp;
- (id)resultDataOfClass:(Class)a3;
- (void)setGatheredData:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARNonSynchronousData

- (ARNonSynchronousData)initWithGatheredData:(id)a3 timestamp:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARNonSynchronousData;
  v8 = [(ARNonSynchronousData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_gatheredData, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

- (id)resultDataOfClass:(Class)a3
{
  v4 = [(ARNonSynchronousData *)self gatheredData];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__ARNonSynchronousData_resultDataOfClass___block_invoke;
  v8[3] = &__block_descriptor_40_e41_B24__0___ARResultData__8__NSDictionary_16lu32l8;
  v8[4] = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:v8];
  v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

uint64_t __42__ARNonSynchronousData_resultDataOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSArray)gatheredData
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGatheredData:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
}

@end