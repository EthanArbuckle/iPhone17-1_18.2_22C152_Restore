@interface HMDCompositeSettingStringConstraint
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (HMDCompositeSettingStringConstraint)initWithValidValues:(id)a3;
- (NSSet)validValues;
- (void)setValidValues:(id)a3;
@end

@implementation HMDCompositeSettingStringConstraint

- (void).cxx_destruct
{
}

- (void)setValidValues:(id)a3
{
}

- (NSSet)validValues
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCompositeSettingStringConstraint)initWithValidValues:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCompositeSettingStringConstraint;
  v5 = [(HMDCompositeSettingStringConstraint *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    validValues = v5->_validValues;
    v5->_validValues = (NSSet *)v6;
  }
  return v5;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  return 1;
}

@end