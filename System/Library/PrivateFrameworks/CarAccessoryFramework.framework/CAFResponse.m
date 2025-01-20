@interface CAFResponse
+ (BOOL)supportsSecureCoding;
- (CAFResponse)initWithCoder:(id)a3;
- (CAFResponse)initWithError:(id)a3;
- (CAFResponse)initWithValues:(id)a3;
- (CAFResponse)initWithValuesAndError:(id)a3 error:(id)a4;
- (NSDictionary)values;
- (NSError)error;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAFResponse

- (CAFResponse)initWithError:(id)a3
{
  return [(CAFResponse *)self initWithValuesAndError:0 error:a3];
}

- (CAFResponse)initWithValues:(id)a3
{
  return [(CAFResponse *)self initWithValuesAndError:a3 error:0];
}

- (CAFResponse)initWithValuesAndError:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAFResponse;
  v9 = [(CAFResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong((id *)&v10->_values, a3);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAFResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAFResponse;
  v5 = [(CAFResponse *)&v16 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"CAFResponseValuesKey"])
    {
      v6 = (void *)MEMORY[0x263EFFA08];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
      uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"CAFResponseValuesKey"];
      values = v5->_values;
      v5->_values = (NSDictionary *)v11;
    }
    if ([v4 containsValueForKey:@"CAFResponseErrorKey"])
    {
      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAFResponseErrorKey"];
      error = v5->_error;
      v5->_error = (NSError *)v13;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  values = self->_values;
  id v7 = v4;
  if (values)
  {
    [v4 encodeObject:values forKey:@"CAFResponseValuesKey"];
    id v4 = v7;
  }
  error = self->_error;
  if (error)
  {
    [v7 encodeObject:error forKey:@"CAFResponseErrorKey"];
    id v4 = v7;
  }
}

- (NSDictionary)values
{
  return self->_values;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end