@interface EFMutableBloomFilter
- (EFMutableBloomFilter)init;
- (EFMutableBloomFilter)initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4;
- (EFMutableBloomFilter)initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4 seed:(unint64_t)a5;
- (EFMutableBloomFilter)initWithExpectedCount:(unint64_t)a3;
- (EFMutableBloomFilter)initWithFalsePositiveRate:(double)a3 forExpectedCount:(unint64_t)a4;
- (EFMutableBloomFilter)initWithFalsePositiveRate:(double)a3 forExpectedCount:(unint64_t)a4 seed:(unint64_t)a5;
- (id)_initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4 seed:(unint64_t)a5 indexes:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addData:(id)a3;
- (void)addString:(id)a3;
- (void)removeAll;
@end

@implementation EFMutableBloomFilter

- (EFMutableBloomFilter)init
{
  return [(EFMutableBloomFilter *)self initWithExpectedCount:1000];
}

- (EFMutableBloomFilter)initWithExpectedCount:(unint64_t)a3
{
  return [(EFMutableBloomFilter *)self initWithFalsePositiveRate:a3 forExpectedCount:0.05];
}

- (EFMutableBloomFilter)initWithFalsePositiveRate:(double)a3 forExpectedCount:(unint64_t)a4
{
  return [(EFMutableBloomFilter *)self initWithFalsePositiveRate:a4 forExpectedCount:0 seed:a3];
}

- (EFMutableBloomFilter)initWithFalsePositiveRate:(double)a3 forExpectedCount:(unint64_t)a4 seed:(unint64_t)a5
{
  if (a3 <= 0.0)
  {
    v15 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4, a5);
    [v15 handleFailureInMethod:a2, self, @"EFBloomFilter.m", 515, @"Invalid parameter not satisfying: %@", @"falsePositiveRate > 0.0" object file lineNumber description];
  }
  if (a3 >= 1.0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"EFBloomFilter.m", 516, @"Invalid parameter not satisfying: %@", @"falsePositiveRate < 1.0" object file lineNumber description];

    if (a4) {
      goto LABEL_5;
    }
  }
  else if (a4)
  {
    goto LABEL_5;
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"EFBloomFilter.m", 517, @"Invalid parameter not satisfying: %@", @"count > 0" object file lineNumber description];

LABEL_5:
  double v9 = log(a3);
  double v10 = v9 * -1.44269504;
  if (v9 * -1.44269504 < 0.0) {
    double v10 = 0.0;
  }
  unint64_t v11 = vcvtpd_u64_f64(fmin(v10, 100.0));
  double v12 = v9 * -2.08136898;
  if (v12 < 0.0) {
    double v12 = 0.0;
  }
  unint64_t v13 = vcvtpd_u64_f64(fmin(v12 * (double)a4, 9.22337204e18));
  return [(EFMutableBloomFilter *)self initWithBucketCount:v13 hashFunctionCount:v11];
}

- (EFMutableBloomFilter)initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4
{
  return [(EFMutableBloomFilter *)self initWithBucketCount:a3 hashFunctionCount:a4 seed:0];
}

- (EFMutableBloomFilter)initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4 seed:(unint64_t)a5
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  double v10 = [(EFMutableBloomFilter *)self _initWithBucketCount:a3 hashFunctionCount:a4 seed:a5 indexes:v9];

  return v10;
}

- (id)_initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4 seed:(unint64_t)a5 indexes:(id)a6
{
  double v10 = (void *)[a6 mutableCopy];
  v13.receiver = self;
  v13.super_class = (Class)EFMutableBloomFilter;
  id v11 = [(EFBloomFilter *)&v13 _initWithBucketCount:a3 hashFunctionCount:a4 seed:a5 indexes:v10];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [EFBloomFilter alloc];
  unint64_t v5 = [(EFBloomFilter *)self bucketCount];
  unint64_t v6 = [(EFBloomFilter *)self hashFunctionCount];
  unint64_t v7 = [(EFBloomFilter *)self seed];
  v8 = (void *)[(NSIndexSet *)self->super._indexes copy];
  id v9 = [(EFBloomFilter *)v4 _initWithBucketCount:v5 hashFunctionCount:v6 seed:v7 indexes:v8];

  return v9;
}

- (void)addString:(id)a3
{
  id v4 = a3;
  addStringToIndexes(self->super._indexes, v4, [(EFBloomFilter *)self bucketCount], [(EFBloomFilter *)self hashFunctionCount], [(EFBloomFilter *)self seed]);
}

- (void)addData:(id)a3
{
  id v4 = a3;
  addDataToIndexes(self->super._indexes, v4, [(EFBloomFilter *)self bucketCount], [(EFBloomFilter *)self hashFunctionCount], [(EFBloomFilter *)self seed]);
}

- (void)removeAll
{
}

@end