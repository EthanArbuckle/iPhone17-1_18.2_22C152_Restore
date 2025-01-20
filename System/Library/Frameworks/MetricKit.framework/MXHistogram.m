@interface MXHistogram
+ (BOOL)supportsSecureCoding;
- (MXHistogram)initWithCoder:(id)a3;
- (MXHistogram)initWithHistogramBucketData:(id)a3;
- (NSArray)histogramData;
- (NSEnumerator)bucketEnumerator;
- (NSUInteger)totalBucketCount;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXHistogram

- (MXHistogram)initWithHistogramBucketData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXHistogram;
  v6 = [(MXHistogram *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_histogramData, a3);
    v7->_totalBucketCount = [(NSArray *)v7->_histogramData count];
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (NSEnumerator)bucketEnumerator
{
  return [(NSArray *)self->_histogramData objectEnumerator];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  histogramData = self->_histogramData;
  id v5 = a3;
  [v5 encodeObject:histogramData forKey:@"histogramValue"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_totalBucketCount];
  [v5 encodeObject:v6 forKey:@"histogramNumBuckets"];
}

- (MXHistogram)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MXHistogram;
  id v5 = [(MXHistogram *)&v13 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"histogramValue"];
    histogramData = v5->_histogramData;
    v5->_histogramData = (NSArray *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"histogramNumBuckets"];
    v5->_totalBucketCount = [v11 unsignedIntegerValue];
  }
  return v5;
}

- (id)toDictionary
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = [NSNumber numberWithUnsignedInteger:self->_totalBucketCount];
  v16 = v3;
  [v3 setObject:v5 forKey:@"histogramNumBuckets"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_histogramData;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) toDictionary];
        objc_super v13 = [NSNumber numberWithInt:v9 + i];
        v14 = [v13 stringValue];
        [v4 setObject:v12 forKey:v14];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v9 = (v9 + i);
    }
    while (v8);
  }

  [v16 setObject:v4 forKey:@"histogramValue"];

  return v16;
}

- (NSUInteger)totalBucketCount
{
  return self->_totalBucketCount;
}

- (NSArray)histogramData
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end