@interface HPIntegerSettingValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HPIntegerSettingValue)initWithCoder:(id)a3;
- (HPIntegerSettingValue)initWithKeyPath:(id)a3 numberValue:(id)a4;
- (NSNumber)numberValue;
- (double)doubleValue;
- (float)floatValue;
- (id)description;
- (int64_t)integerValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setNumberValue:(id)a3;
@end

@implementation HPIntegerSettingValue

- (HPIntegerSettingValue)initWithKeyPath:(id)a3 numberValue:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HPIntegerSettingValue;
  v8 = [(HPSettingValue *)&v11 initWithKeyPath:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_numberValue, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HPIntegerSettingValue *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(HPIntegerSettingValue *)v5 integerValue];
      id v7 = [(HPIntegerSettingValue *)self numberValue];
      if (v6 == [v7 integerValue])
      {
        BOOL v8 = 1;
      }
      else
      {
        [(HPIntegerSettingValue *)v5 floatValue];
        float v10 = v9;
        objc_super v11 = [(HPIntegerSettingValue *)self numberValue];
        [v11 floatValue];
        if (v10 == v12)
        {
          BOOL v8 = 1;
        }
        else
        {
          [(HPIntegerSettingValue *)v5 doubleValue];
          double v14 = v13;
          v15 = [(HPIntegerSettingValue *)self numberValue];
          [v15 doubleValue];
          BOOL v8 = v14 == v16;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", -[HPIntegerSettingValue integerValue](self, "integerValue"));
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HPIntegerSettingValue *)self numberValue];
  [v4 encodeObject:v5 forKey:@"setting.integerkey"];

  id v6 = [(HPSettingValue *)self keyPath];
  [v4 encodeObject:v6 forKey:@"setting.keypath"];
}

- (HPIntegerSettingValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HPSettingValue *)self keyPath];
  v12.receiver = self;
  v12.super_class = (Class)HPIntegerSettingValue;
  id v6 = [(HPSettingValue *)&v12 initWithKeyPath:v5];

  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setting.integerkey"];
    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setting.keypath"];
    [(HPSettingValue *)v6 setKeyPath:v8];

    v6->_integerValue = [v7 integerValue];
    [v7 floatValue];
    v6->_floatValue = v9;
    [v7 doubleValue];
    v6->_doubleValue = v10;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(HPSettingValue *)self keyPath];
  int64_t v5 = [(HPIntegerSettingValue *)self integerValue];
  [(HPIntegerSettingValue *)self floatValue];
  double v7 = v6;
  [(HPIntegerSettingValue *)self doubleValue];
  float v9 = [v3 stringWithFormat:@"\n KeyPath %@ \n IntegerValue %ld Float Value %f Double Value %f", v4, v5, *(void *)&v7, v8];

  return v9;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (void)setNumberValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end