@interface ACHCurrentActivitySummaryQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (ACHCurrentActivitySummaryQueryServerConfiguration)initWithCoder:(id)a3;
- (NSDictionary)collectionIntervals;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionIntervals:(id)a3;
@end

@implementation ACHCurrentActivitySummaryQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ACHCurrentActivitySummaryQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v8 copyWithZone:a3];
  v5 = [(ACHCurrentActivitySummaryQueryServerConfiguration *)self collectionIntervals];
  v6 = (void *)[v5 copy];
  [v4 setCollectionIntervals:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHCurrentActivitySummaryQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACHCurrentActivitySummaryQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"intervals"];
    collectionIntervals = v5->_collectionIntervals;
    v5->_collectionIntervals = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ACHCurrentActivitySummaryQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v6 encodeWithCoder:v4];
  v5 = [(ACHCurrentActivitySummaryQueryServerConfiguration *)self collectionIntervals];
  [v4 encodeObject:v5 forKey:@"intervals"];
}

- (NSDictionary)collectionIntervals
{
  return self->_collectionIntervals;
}

- (void)setCollectionIntervals:(id)a3
{
}

- (void).cxx_destruct
{
}

@end