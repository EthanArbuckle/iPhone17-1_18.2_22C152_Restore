@interface FISimpleHistogram
- (BOOL)isEqual:(id)a3;
- (FISimpleHistogram)initWithNumberOfBuckets:(int64_t)a3;
- (double)valueForBucketAtIndex:(unint64_t)a3;
- (id)debugDescription;
- (id)descriptionArray;
- (int64_t)bucketCount;
- (int64_t)numberOfValuesInBucketAtIndex:(unint64_t)a3;
- (void)addValue:(double)a3 toBucketAtIndex:(unint64_t)a4;
- (void)dealloc;
@end

@implementation FISimpleHistogram

- (FISimpleHistogram)initWithNumberOfBuckets:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FISimpleHistogram;
  v4 = [(FISimpleHistogram *)&v8 init];
  v5 = v4;
  if (a3 < 1)
  {
    v6 = 0;
  }
  else
  {
    if (v4)
    {
      v4->_bucketCount = a3;
      v4->_buckets = ($12FC28267955EE572C1AED5C354322B1 *)malloc_type_calloc(a3, 0x10uLL, 0x1000040451B5BE8uLL);
    }
    v6 = v5;
  }

  return v6;
}

- (void)dealloc
{
  free(self->_buckets);
  v3.receiver = self;
  v3.super_class = (Class)FISimpleHistogram;
  [(FISimpleHistogram *)&v3 dealloc];
}

- (int64_t)bucketCount
{
  return self->_bucketCount;
}

- (double)valueForBucketAtIndex:(unint64_t)a3
{
  double result = 0.0;
  if (self->_bucketCount > a3)
  {
    buckets = self->_buckets;
    uint64_t var0 = buckets[a3].var0;
    if (var0) {
      return buckets[a3].var1 / (double)var0;
    }
  }
  return result;
}

- (void)addValue:(double)a3 toBucketAtIndex:(unint64_t)a4
{
  if (self->_bucketCount > a4)
  {
    v4 = &self->_buckets[a4];
    ++v4->var0;
    v4->var1 = v4->var1 + a3;
  }
}

- (int64_t)numberOfValuesInBucketAtIndex:(unint64_t)a3
{
  if (self->_bucketCount <= a3) {
    return 0;
  }
  else {
    return self->_buckets[a3].var0;
  }
}

- (id)debugDescription
{
  v2 = [(FISimpleHistogram *)self descriptionArray];
  objc_super v3 = [v2 description];

  return v3;
}

- (id)descriptionArray
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_bucketCount)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      buckets = self->_buckets;
      uint64_t var0 = buckets[v4].var0;
      if (var0) {
        double v8 = buckets[v4].var1 / (double)var0;
      }
      else {
        double v8 = 0.0;
      }
      v9 = [&stru_26CD0B5F8 stringByPaddingToLength:(unint64_t)v8 withString:@"*" startingAtIndex:0];
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"[%02d] %06.2f ", v5, *(void *)&v8);
      v11 = [v10 stringByAppendingString:v9];
      [v3 addObject:v11];

      ++v5;
      ++v4;
    }
    while (self->_bucketCount > v5);
  }
  v12 = (void *)[v3 copy];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FISimpleHistogram *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      uint64_t v6 = [v5 bucketCount];
      BOOL v7 = v6 == [(FISimpleHistogram *)self bucketCount]
        && memcmp(v5[2], self->_buckets, 16 * self->_bucketCount) == 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

@end