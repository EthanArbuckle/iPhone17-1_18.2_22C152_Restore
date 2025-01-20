@interface _HKSampleQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)includeAutomaticTimeZones;
- (BOOL)includeContributorInformation;
- (NSArray)queryDescriptors;
- (NSArray)sortDescriptors;
- (_HKSampleQueryConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludeAutomaticTimeZones:(BOOL)a3;
- (void)setIncludeContributorInformation:(BOOL)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setQueryDescriptors:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation _HKSampleQueryConfiguration

- (_HKSampleQueryConfiguration)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_HKSampleQueryConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v26 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sortDescriptors"];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"queryDescriptors"];
    queryDescriptors = v5->_queryDescriptors;
    v5->_queryDescriptors = (NSArray *)v14;

    v5->_limit = [v4 decodeIntegerForKey:@"limit"];
    v5->_includeAutomaticTimeZones = [v4 decodeBoolForKey:@"includeAutomaticTimeZones"];
    v5->_includeContributorInformation = [v4 decodeBoolForKey:@"includeContributor"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v16 = v5->_sortDescriptors;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v20++) allowEvaluation];
        }
        while (v18 != v20);
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v18);
    }
  }
  return v5;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptors, 0);

  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKSampleQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setSortDescriptors:self->_sortDescriptors];
  [v4 setLimit:self->_limit];
  [v4 setIncludeAutomaticTimeZones:self->_includeAutomaticTimeZones];
  [v4 setIncludeContributorInformation:self->_includeContributorInformation];
  [v4 setQueryDescriptors:self->_queryDescriptors];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKSampleQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDescriptors, @"sortDescriptors", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_queryDescriptors forKey:@"queryDescriptors"];
  [v4 encodeInteger:self->_limit forKey:@"limit"];
  [v4 encodeBool:self->_includeAutomaticTimeZones forKey:@"includeAutomaticTimeZones"];
  [v4 encodeBool:self->_includeContributorInformation forKey:@"includeContributor"];
}

- (void)setSortDescriptors:(id)a3
{
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (void)setQueryDescriptors:(id)a3
{
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
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