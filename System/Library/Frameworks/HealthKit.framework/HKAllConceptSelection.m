@interface HKAllConceptSelection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)value;
- (HKAllConceptSelection)initWithCoder:(id)a3;
- (HKAllConceptSelection)initWithValue:(BOOL)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAllConceptSelection

- (HKAllConceptSelection)initWithValue:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKAllConceptSelection;
  v4 = [(HKConceptSelection *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    v6 = v4;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = HKStringFromBool(self->_value);
  v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKAllConceptSelection)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"ValueKey"];

  return [(HKAllConceptSelection *)self initWithValue:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKAllConceptSelection;
  if ([(HKConceptSelection *)&v10 isEqual:v4])
  {
    id v5 = v4;
    BOOL v6 = [(HKAllConceptSelection *)self value];
    char v7 = [v5 value];

    char v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)value
{
  return self->_value;
}

@end