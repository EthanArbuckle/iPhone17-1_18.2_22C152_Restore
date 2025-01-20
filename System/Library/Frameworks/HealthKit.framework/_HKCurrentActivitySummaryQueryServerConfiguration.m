@interface _HKCurrentActivitySummaryQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (NSDictionary)collectionIntervals;
- (_HKCurrentActivitySummaryQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionIntervals:(id)a3;
@end

@implementation _HKCurrentActivitySummaryQueryServerConfiguration

- (_HKCurrentActivitySummaryQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKCurrentActivitySummaryQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"intervals"];
    collectionIntervals = v5->_collectionIntervals;
    v5->_collectionIntervals = (NSDictionary *)v10;
  }
  return v5;
}

- (NSDictionary)collectionIntervals
{
  return self->_collectionIntervals;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_HKCurrentActivitySummaryQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSDictionary *)self->_collectionIntervals copy];
  v6 = (void *)v4[7];
  v4[7] = v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKCurrentActivitySummaryQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionIntervals, @"intervals", v5.receiver, v5.super_class);
}

- (void)setCollectionIntervals:(id)a3
{
}

@end