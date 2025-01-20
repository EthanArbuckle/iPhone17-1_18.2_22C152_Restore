@interface HPSettingValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HPSettingValue)initWithCoder:(id)a3;
- (HPSettingValue)initWithKeyPath:(id)a3;
- (NSString)keyPath;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyPath:(id)a3;
@end

@implementation HPSettingValue

- (HPSettingValue)initWithKeyPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HPSettingValue;
  v6 = [(HPSettingValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyPath, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HPSettingValue *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(HPSettingValue *)self keyPath];
      v7 = [(HPSettingValue *)v5 keyPath];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(HPSettingValue *)self keyPath];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HPSettingValue *)self keyPath];
  [v4 encodeObject:v5 forKey:@"setting.keypath"];
}

- (HPSettingValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HPSettingValue;
  id v5 = [(HPSettingValue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setting.keypath"];
    keyPath = v5->_keyPath;
    v5->_keyPath = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end