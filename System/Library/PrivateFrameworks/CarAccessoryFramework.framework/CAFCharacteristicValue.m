@interface CAFCharacteristicValue
+ (BOOL)supportsSecureCoding;
- (CAFCharacteristicValue)initWithCoder:(id)a3;
- (CAFCharacteristicValue)initWithValue:(id)a3 error:(id)a4;
- (NSError)error;
- (id)value;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CAFCharacteristicValue

- (CAFCharacteristicValue)initWithValue:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAFCharacteristicValue;
  v9 = [(CAFCharacteristicValue *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong(&v10->_value, a3);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAFCharacteristicValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CAFCharacteristicValue;
  v5 = [(CAFCharacteristicValue *)&v17 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"CAFCharacteristicValueValueKey"])
    {
      v6 = (void *)MEMORY[0x263EFFA08];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
      uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"CAFCharacteristicValueValueKey"];
      id value = v5->_value;
      v5->_id value = (id)v12;
    }
    if ([v4 containsValueForKey:@"CAFCharacteristicValueErrorKey"])
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAFCharacteristicValueErrorKey"];
      error = v5->_error;
      v5->_error = (NSError *)v14;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id value = self->_value;
  id v7 = v4;
  if (value)
  {
    [v4 encodeObject:value forKey:@"CAFCharacteristicValueValueKey"];
    id v4 = v7;
  }
  error = self->_error;
  if (error)
  {
    [v7 encodeObject:error forKey:@"CAFCharacteristicValueErrorKey"];
    id v4 = v7;
  }
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
}

@end