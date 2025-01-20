@interface HPStringSettingValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HPStringSettingValue)initWithCoder:(id)a3;
- (HPStringSettingValue)initWithKeyPath:(id)a3 settingStringValue:(id)a4;
- (NSString)stringValue;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HPStringSettingValue

- (HPStringSettingValue)initWithKeyPath:(id)a3 settingStringValue:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HPStringSettingValue;
  v8 = [(HPSettingValue *)&v11 initWithKeyPath:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_stringValue, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HPStringSettingValue *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HPStringSettingValue *)v4 stringValue];
      v6 = [(HPStringSettingValue *)self stringValue];
      BOOL v7 = v5 == v6;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HPStringSettingValue *)self stringValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HPStringSettingValue *)self stringValue];
  [v4 encodeObject:v5 forKey:@"setting.stringkey"];

  id v6 = [(HPSettingValue *)self keyPath];
  [v4 encodeObject:v6 forKey:@"setting.keypath"];
}

- (HPStringSettingValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HPSettingValue *)self keyPath];
  v11.receiver = self;
  v11.super_class = (Class)HPStringSettingValue;
  id v6 = [(HPSettingValue *)&v11 initWithKeyPath:v5];

  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setting.stringkey"];
    stringValue = v6->_stringValue;
    v6->_stringValue = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setting.keypath"];
    [(HPSettingValue *)v6 setKeyPath:v9];
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
  v5 = [(HPStringSettingValue *)self stringValue];
  id v6 = [v3 stringWithFormat:@"\n KeyPath %@ \n StringValue %@", v4, v5];

  return v6;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
}

@end