@interface HKUserTrackedConceptQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (HKUserTrackedConceptQueryConfiguration)initWithCoder:(id)a3;
- (NSArray)sortDescriptors;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation HKUserTrackedConceptQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKUserTrackedConceptQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v7 copyWithZone:a3];
  v5 = (void *)[(NSArray *)self->_sortDescriptors copy];
  [v4 setSortDescriptors:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKUserTrackedConceptQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKUserTrackedConceptQueryConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"sortDescriptors"];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKUserTrackedConceptQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDescriptors, @"sortDescriptors", v5.receiver, v5.super_class);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end