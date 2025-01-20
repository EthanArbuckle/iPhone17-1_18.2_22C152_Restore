@interface HKUserDomainConceptQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (HKQueryAnchor)anchor;
- (HKUserDomainConceptQueryConfiguration)initWithCoder:(id)a3;
- (NSArray)sortDescriptors;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation HKUserDomainConceptQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKUserDomainConceptQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v8 copyWithZone:a3];
  v5 = (void *)[(HKQueryAnchor *)self->_anchor copy];
  [v4 setAnchor:v5];

  v6 = (void *)[(NSArray *)self->_sortDescriptors copy];
  [v4 setSortDescriptors:v6];

  [v4 setLimit:self->_limit];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKUserDomainConceptQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKUserDomainConceptQueryConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchor"];
    anchor = v5->_anchor;
    v5->_anchor = (HKQueryAnchor *)v6;

    v5->_limit = [v4 decodeIntegerForKey:@"limit"];
    objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sortDescriptors"];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchor, @"anchor", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_sortDescriptors forKey:@"sortDescriptors"];
  [v4 encodeInteger:self->_limit forKey:@"limit"];
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);

  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end