@interface WFQuantityValue
+ (BOOL)supportsSecureCoding;
- (NSDecimalNumber)magnitude;
- (NSString)unitString;
- (WFQuantityValue)initWithCoder:(id)a3;
- (WFQuantityValue)initWithMagnitude:(id)a3 unitString:(id)a4;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFQuantityValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_magnitude, 0);
}

- (NSString)unitString
{
  return self->_unitString;
}

- (NSDecimalNumber)magnitude
{
  return self->_magnitude;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(WFQuantityValue *)self magnitude];
  v5 = [(WFQuantityValue *)self unitString];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFQuantityValue *)self magnitude];
  [v4 encodeObject:v5 forKey:@"Magnitude"];

  id v6 = [(WFQuantityValue *)self unitString];
  [v4 encodeObject:v6 forKey:@"Unit"];
}

- (WFQuantityValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Magnitude"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Unit"];

  if (v5)
  {
    self = [(WFQuantityValue *)self initWithMagnitude:v5 unitString:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (WFQuantityValue)initWithMagnitude:(id)a3 unitString:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFQuantityValue.m", 19, @"Invalid parameter not satisfying: %@", @"magnitude" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFQuantityValue;
  v10 = [(WFQuantityValue *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_magnitude, a3);
    uint64_t v12 = [v9 copy];
    unitString = v11->_unitString;
    v11->_unitString = (NSString *)v12;

    v14 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end