@interface _HKSampleCountQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (NSArray)queryDescriptors;
- (_HKSampleCountQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setQueryDescriptors:(id)a3;
@end

@implementation _HKSampleCountQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKSampleCountQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setQueryDescriptors:self->_queryDescriptors];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKSampleCountQueryServerConfiguration)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKSampleCountQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"queryDescriptors"];
    queryDescriptors = v5->_queryDescriptors;
    v5->_queryDescriptors = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKSampleCountQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryDescriptors, @"queryDescriptors", v5.receiver, v5.super_class);
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (void)setQueryDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end