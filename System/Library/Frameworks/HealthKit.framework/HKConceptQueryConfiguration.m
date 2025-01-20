@interface HKConceptQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (HKConceptQueryConfiguration)initWithCoder:(id)a3;
- (HKConceptSelection)selection;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSelection:(id)a3;
@end

@implementation HKConceptQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKConceptQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v7 copyWithZone:a3];
  v5 = (void *)[(HKConceptSelection *)self->_selection copy];
  [v4 setSelection:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKConceptQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKConceptQueryConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Selection"];
    selection = v5->_selection;
    v5->_selection = (HKConceptSelection *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKConceptQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_selection, @"Selection", v5.receiver, v5.super_class);
}

- (HKConceptSelection)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end