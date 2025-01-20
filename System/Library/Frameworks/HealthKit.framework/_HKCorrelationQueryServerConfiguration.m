@interface _HKCorrelationQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (NSDictionary)filterDictionary;
- (_HKCorrelationQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFilterDictionary:(id)a3;
@end

@implementation _HKCorrelationQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKCorrelationQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setFilterDictionary:self->_filterDictionary];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKCorrelationQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKCorrelationQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"filterDictionary"];
    filterDictionary = v5->_filterDictionary;
    v5->_filterDictionary = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKCorrelationQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_filterDictionary, @"filterDictionary", v5.receiver, v5.super_class);
}

- (NSDictionary)filterDictionary
{
  return self->_filterDictionary;
}

- (void)setFilterDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end