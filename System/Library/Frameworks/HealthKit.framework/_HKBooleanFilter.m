@interface _HKBooleanFilter
+ (BOOL)supportsSecureCoding;
+ (_HKBooleanFilter)falseFilter;
+ (_HKBooleanFilter)trueFilter;
- (BOOL)acceptsDataObject:(id)a3;
- (BOOL)acceptsWorkoutActivity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)value;
- (_HKBooleanFilter)init;
- (_HKBooleanFilter)initWithCoder:(id)a3;
- (_HKBooleanFilter)initWithValue:(BOOL)a3;
- (id)description;
- (int64_t)acceptsActivitySummary:(id)a3;
- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKBooleanFilter

- (_HKBooleanFilter)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (_HKBooleanFilter)initWithValue:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKBooleanFilter;
  result = [(_HKBooleanFilter *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (_HKBooleanFilter)trueFilter
{
  v2 = [[_HKBooleanFilter alloc] initWithValue:1];

  return v2;
}

+ (_HKBooleanFilter)falseFilter
{
  v2 = [[_HKBooleanFilter alloc] initWithValue:0];

  return v2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = HKStringFromBool(self->_value);
  v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  return self->_value;
}

- (int64_t)acceptsActivitySummary:(id)a3
{
  return self->_value;
}

- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5
{
  return self->_value;
}

- (BOOL)acceptsWorkoutActivity:(id)a3
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_HKBooleanFilter *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_value == v4->_value;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_value;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKBooleanFilter)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"value"];

  return [(_HKBooleanFilter *)self initWithValue:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKBooleanFilter;
  id v4 = a3;
  [(_HKFilter *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_value, @"value", v5.receiver, v5.super_class);
}

- (BOOL)value
{
  return self->_value;
}

@end