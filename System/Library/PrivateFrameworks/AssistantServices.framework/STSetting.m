@interface STSetting
+ (BOOL)supportsSecureCoding;
- (STSetting)initWithCoder:(id)a3;
- (id)value;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation STSetting

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (STSetting)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSetting;
  v5 = [(STSiriModelObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"Type"];
    uint64_t v6 = [v4 decodePropertyListForKey:@"Value"];
    id value = v5->_value;
    v5->_id value = (id)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSetting;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"Type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_value forKey:@"Value"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end