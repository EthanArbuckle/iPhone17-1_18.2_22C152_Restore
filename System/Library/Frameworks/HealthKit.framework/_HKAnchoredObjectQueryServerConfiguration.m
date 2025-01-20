@interface _HKAnchoredObjectQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)includeAutomaticTimeZones;
- (BOOL)includeContributorInformation;
- (BOOL)includeDeletedObjects;
- (HKQueryAnchor)anchor;
- (NSArray)queryDescriptors;
- (_HKAnchoredObjectQueryServerConfiguration)initWithCoder:(id)a3;
- (double)collectionInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setCollectionInterval:(double)a3;
- (void)setIncludeAutomaticTimeZones:(BOOL)a3;
- (void)setIncludeContributorInformation:(BOOL)a3;
- (void)setIncludeDeletedObjects:(BOOL)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setQueryDescriptors:(id)a3;
@end

@implementation _HKAnchoredObjectQueryServerConfiguration

- (_HKAnchoredObjectQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_HKAnchoredObjectQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v18 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query_anchor"];
    if (!v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchor"];
      v8 = v7;
      if (v7)
      {
        +[HKQueryAnchor anchorFromValue:](HKQueryAnchor, "anchorFromValue:", [v7 unsignedIntegerValue]);
        v6 = (HKQueryAnchor *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
    anchor = v5->_anchor;
    v5->_anchor = v6;
    v10 = v6;

    v5->_limit = [v4 decodeIntegerForKey:@"limit"];
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"queryDescriptors"];
    queryDescriptors = v5->_queryDescriptors;
    v5->_queryDescriptors = (NSArray *)v14;

    v5->_includeDeletedObjects = [v4 decodeBoolForKey:@"includeDeleted"];
    v5->_includeAutomaticTimeZones = [v4 decodeBoolForKey:@"includeAutomaticTimeZones"];
    [v4 decodeDoubleForKey:@"collectionInterval"];
    v5->_collectionInterval = v16;
    v5->_includeContributorInformation = [v4 decodeBoolForKey:@"includeContributor"];
  }
  return v5;
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (BOOL)includeDeletedObjects
{
  return self->_includeDeletedObjects;
}

- (double)collectionInterval
{
  return self->_collectionInterval;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptors, 0);

  objc_storeStrong((id *)&self->_anchor, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKAnchoredObjectQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setAnchor:self->_anchor];
  [v4 setLimit:self->_limit];
  [v4 setIncludeDeletedObjects:self->_includeDeletedObjects];
  [v4 setIncludeAutomaticTimeZones:self->_includeAutomaticTimeZones];
  [v4 setCollectionInterval:self->_collectionInterval];
  [v4 setIncludeContributorInformation:self->_includeContributorInformation];
  [v4 setQueryDescriptors:self->_queryDescriptors];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKAnchoredObjectQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchor, @"query_anchor", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_limit forKey:@"limit"];
  [v4 encodeObject:self->_queryDescriptors forKey:@"queryDescriptors"];
  [v4 encodeBool:self->_includeDeletedObjects forKey:@"includeDeleted"];
  [v4 encodeBool:self->_includeAutomaticTimeZones forKey:@"includeAutomaticTimeZones"];
  [v4 encodeDouble:@"collectionInterval" forKey:self->_collectionInterval];
  [v4 encodeBool:self->_includeContributorInformation forKey:@"includeContributor"];
}

- (void)setAnchor:(id)a3
{
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void)setCollectionInterval:(double)a3
{
  self->_collectionInterval = a3;
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (void)setQueryDescriptors:(id)a3
{
}

- (void)setIncludeDeletedObjects:(BOOL)a3
{
  self->_includeDeletedObjects = a3;
}

- (BOOL)includeAutomaticTimeZones
{
  return self->_includeAutomaticTimeZones;
}

- (void)setIncludeAutomaticTimeZones:(BOOL)a3
{
  self->_includeAutomaticTimeZones = a3;
}

- (BOOL)includeContributorInformation
{
  return self->_includeContributorInformation;
}

- (void)setIncludeContributorInformation:(BOOL)a3
{
  self->_includeContributorInformation = a3;
}

@end