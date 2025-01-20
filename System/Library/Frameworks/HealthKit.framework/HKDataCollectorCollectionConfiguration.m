@interface HKDataCollectorCollectionConfiguration
+ (BOOL)supportsSecureCoding;
+ (HKDataCollectorCollectionConfiguration)new;
- (BOOL)isEqual:(id)a3;
- (HKDataCollectorCollectionConfiguration)init;
- (HKDataCollectorCollectionConfiguration)initWithCoder:(id)a3;
- (HKDataCollectorCollectionConfiguration)initWithCollectionInterval:(double)a3 collectionLatency:(double)a4 collectionType:(unint64_t)a5;
- (double)collectionInterval;
- (double)collectionLatency;
- (id)description;
- (unint64_t)collectionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionInterval:(double)a3;
- (void)setCollectionLatency:(double)a3;
- (void)setCollectionType:(unint64_t)a3;
@end

@implementation HKDataCollectorCollectionConfiguration

- (HKDataCollectorCollectionConfiguration)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (HKDataCollectorCollectionConfiguration)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (HKDataCollectorCollectionConfiguration)initWithCollectionInterval:(double)a3 collectionLatency:(double)a4 collectionType:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HKDataCollectorCollectionConfiguration;
  result = [(HKDataCollectorCollectionConfiguration *)&v9 init];
  if (result)
  {
    result->_collectionInterval = a3;
    result->_collectionLatency = a4;
    result->_collectionType = a5;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(HKDataCollectorCollectionConfiguration *)self collectionInterval];
  uint64_t v6 = v5;
  [(HKDataCollectorCollectionConfiguration *)self collectionLatency];
  uint64_t v8 = v7;
  objc_super v9 = HKDataCollectionTypeToString([(HKDataCollectorCollectionConfiguration *)self collectionType]);
  v10 = [v3 stringWithFormat:@"<%@: interval:%f latency:%f type:%@>", v4, v6, v8, v9];

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)self->_collectionLatency ^ (unint64_t)self->_collectionInterval ^ self->_collectionType;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (double *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_collectionType == *((void *)v4 + 3)
    && self->_collectionInterval == v4[1]
    && self->_collectionLatency == v4[2];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKDataCollectorCollectionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKDataCollectorCollectionConfiguration;
  BOOL v5 = [(HKDataCollectorCollectionConfiguration *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"collection_interval"];
    v5->_collectionInterval = v6;
    [v4 decodeDoubleForKey:@"collection_latency"];
    v5->_collectionLatency = v7;
    [v4 decodeDoubleForKey:@"collection_type"];
    v5->_collectionType = (unint64_t)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double collectionInterval = self->_collectionInterval;
  id v5 = a3;
  [v5 encodeDouble:@"collection_interval" forKey:collectionInterval];
  [v5 encodeDouble:@"collection_latency" forKey:self->_collectionLatency];
  [v5 encodeDouble:@"collection_type" forKey:(double)self->_collectionType];
}

- (double)collectionInterval
{
  return self->_collectionInterval;
}

- (void)setCollectionInterval:(double)a3
{
  self->_double collectionInterval = a3;
}

- (double)collectionLatency
{
  return self->_collectionLatency;
}

- (void)setCollectionLatency:(double)a3
{
  self->_collectionLatency = a3;
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (void)setCollectionType:(unint64_t)a3
{
  self->_collectionType = a3;
}

@end