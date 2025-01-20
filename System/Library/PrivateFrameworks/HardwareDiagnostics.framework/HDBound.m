@interface HDBound
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBound:(id)a3;
- (BOOL)open;
- (HDBound)initWithCoder:(id)a3;
- (HDBound)initWithValue:(id)a3 open:(BOOL)a4;
- (NSMeasurement)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setOpen:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation HDBound

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDBound)initWithValue:(id)a3 open:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDBound;
  v7 = [(HDBound *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    value = v7->_value;
    v7->_value = (NSMeasurement *)v8;

    v7->_open = a4;
  }

  return v7;
}

- (HDBound)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDBound;
  v5 = [(HDBound *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDBound.value"];
    value = v5->_value;
    v5->_value = (NSMeasurement *)v6;

    v5->_open = [v4 decodeBoolForKey:@"HDBound.open"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"HDBound.value"];
  [v5 encodeBool:self->_open forKey:@"HDBound.open"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  value = self->_value;
  BOOL open = self->_open;
  return (id)[v4 initWithValue:value open:open];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDBound *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(HDBound *)self isEqualToBound:v4];
  }

  return v5;
}

- (BOOL)isEqualToBound:(id)a3
{
  id v4 = a3;
  if (self->_open == [v4 open]
    && ([v4 value],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [(NSMeasurement *)self->_value unit],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 canBeConvertedToUnit:v6],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [v4 value];
    objc_super v9 = [(NSMeasurement *)self->_value unit];
    v10 = [v8 measurementByConvertingToUnit:v9];

    char v11 = [(NSMeasurement *)self->_value isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  BOOL v5 = NSNumber;
  [(NSMeasurement *)self->_value doubleValue];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v6 forKeyedSubscript:@"value"];

  int v7 = [(NSMeasurement *)self->_value unit];
  uint64_t v8 = [v7 symbol];
  [v4 setObject:v8 forKeyedSubscript:@"units"];

  objc_super v9 = (void *)[v4 copy];
  [v3 setObject:v9 forKeyedSubscript:@"value"];

  if (self->_open) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v3 setObject:v10 forKeyedSubscript:@"open"];
  char v11 = (void *)[v3 copy];

  return v11;
}

- (NSMeasurement)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)open
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_BOOL open = a3;
}

- (void).cxx_destruct
{
}

@end