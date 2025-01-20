@interface INHomeAction
+ (BOOL)supportsSecureCoding;
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (INHomeAction)initWithCoder:(id)a3;
- (INHomeAction)initWithType:(int64_t)a3 BOOLValue:(BOOL)a4;
- (INHomeAction)initWithType:(int64_t)a3 doubleValue:(double)a4;
- (INHomeAction)initWithType:(int64_t)a3 integerValue:(int64_t)a4;
- (INHomeAction)initWithType:(int64_t)a3 stringValue:(id)a4;
- (INHomeAction)initWithType:(int64_t)a3 valueType:(int64_t)a4 BOOLValue:(BOOL)a5 doubleValue:(double)a6 integerValue:(int64_t)a7 stringValue:(id)a8;
- (NSString)stringValue;
- (double)doubleValue;
- (int64_t)integerValue;
- (int64_t)type;
- (int64_t)valueType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHomeAction

- (void).cxx_destruct
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_valueType forKey:@"valueType"];
  [v5 encodeBool:self->_BOOLValue forKey:@"BOOLValue"];
  [v5 encodeDouble:@"doubleValue" forKey:self->_doubleValue];
  [v5 encodeDouble:@"integerValue" forKey:(double)self->_integerValue];
  [v5 encodeObject:self->_stringValue forKey:@"stringValue"];
}

- (INHomeAction)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"valueType"];
  uint64_t v7 = [v4 decodeBoolForKey:@"BOOLValue"];
  [v4 decodeDoubleForKey:@"doubleValue"];
  double v9 = v8;
  uint64_t v10 = [v4 decodeIntegerForKey:@"integerValue"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];

  v12 = [(INHomeAction *)self initWithType:v5 valueType:v6 BOOLValue:v7 doubleValue:v10 integerValue:v11 stringValue:v9];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    uint64_t v6 = v5;
    BOOL v8 = 0;
    if (self->_type == v5[2]
      && self->_valueType == v5[3]
      && self->_BOOLValue == *((unsigned __int8 *)v5 + 8)
      && self->_doubleValue == *((double *)v5 + 4)
      && self->_integerValue == v5[5])
    {
      stringValue = self->_stringValue;
      if (stringValue == (NSString *)v6[6] || -[NSString isEqual:](stringValue, "isEqual:")) {
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t doubleValue = (unint64_t)self->_doubleValue;
  int64_t v3 = self->_valueType ^ self->_type ^ self->_BOOLValue ^ self->_integerValue;
  return v3 ^ [(NSString *)self->_stringValue hash] ^ doubleValue;
}

- (INHomeAction)initWithType:(int64_t)a3 valueType:(int64_t)a4 BOOLValue:(BOOL)a5 doubleValue:(double)a6 integerValue:(int64_t)a7 stringValue:(id)a8
{
  id v14 = a8;
  v20.receiver = self;
  v20.super_class = (Class)INHomeAction;
  v15 = [(INHomeAction *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_int64_t type = a3;
    v15->_valueType = a4;
    v15->_BOOLValue = a5;
    v15->_unint64_t doubleValue = a6;
    v15->_integerValue = a7;
    uint64_t v17 = [v14 copy];
    stringValue = v16->_stringValue;
    v16->_stringValue = (NSString *)v17;
  }
  return v16;
}

- (INHomeAction)initWithType:(int64_t)a3 stringValue:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INHomeAction;
  uint64_t v7 = [(INHomeAction *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    stringValue = v7->_stringValue;
    v7->_stringValue = (NSString *)v8;

    v7->_int64_t type = a3;
    v7->_valueType = 3;
  }

  return v7;
}

- (INHomeAction)initWithType:(int64_t)a3 integerValue:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)INHomeAction;
  result = [(INHomeAction *)&v7 init];
  if (result)
  {
    result->_integerValue = a4;
    result->_int64_t type = a3;
    result->_valueType = 4;
  }
  return result;
}

- (INHomeAction)initWithType:(int64_t)a3 doubleValue:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)INHomeAction;
  result = [(INHomeAction *)&v7 init];
  if (result)
  {
    result->_unint64_t doubleValue = a4;
    result->_int64_t type = a3;
    result->_valueType = 2;
  }
  return result;
}

- (INHomeAction)initWithType:(int64_t)a3 BOOLValue:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)INHomeAction;
  result = [(INHomeAction *)&v7 init];
  if (result)
  {
    result->_BOOLValue = a4;
    result->_int64_t type = a3;
    result->_valueType = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end