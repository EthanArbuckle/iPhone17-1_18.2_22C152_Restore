@interface STSettingChange
+ (BOOL)supportsSecureCoding;
- (STSettingChange)initWithCoder:(id)a3;
- (STSettingChange)initWithSettingType:(int64_t)a3 valueBeforeUpdate:(id)a4 valueAfterUpdate:(id)a5;
- (id)valueAfterUpdate;
- (id)valueBeforeUpdate;
- (int64_t)settingType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSettingChange

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueAfterUpdate, 0);
  objc_storeStrong(&self->_valueBeforeUpdate, 0);
}

- (STSettingChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSettingChange;
  v5 = [(STSiriModelObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_settingType = [v4 decodeIntegerForKey:@"_settingType"];
    uint64_t v6 = [v4 decodePropertyListForKey:@"_valueBeforeUpdate"];
    id valueBeforeUpdate = v5->_valueBeforeUpdate;
    v5->_id valueBeforeUpdate = (id)v6;

    uint64_t v8 = [v4 decodePropertyListForKey:@"_valueAfterUpdate"];
    id valueAfterUpdate = v5->_valueAfterUpdate;
    v5->_id valueAfterUpdate = (id)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSettingChange;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_settingType, @"_settingType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_valueBeforeUpdate forKey:@"_valueBeforeUpdate"];
  [v4 encodeObject:self->_valueAfterUpdate forKey:@"_valueAfterUpdate"];
}

- (id)valueAfterUpdate
{
  return self->_valueAfterUpdate;
}

- (id)valueBeforeUpdate
{
  return self->_valueBeforeUpdate;
}

- (int64_t)settingType
{
  return self->_settingType;
}

- (STSettingChange)initWithSettingType:(int64_t)a3 valueBeforeUpdate:(id)a4 valueAfterUpdate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)STSettingChange;
  v10 = [(STSettingChange *)&v17 init];
  objc_super v11 = v10;
  if (v10)
  {
    v10->_settingType = a3;
    uint64_t v12 = [v8 copy];
    id valueBeforeUpdate = v11->_valueBeforeUpdate;
    v11->_id valueBeforeUpdate = (id)v12;

    uint64_t v14 = [v9 copy];
    id valueAfterUpdate = v11->_valueAfterUpdate;
    v11->_id valueAfterUpdate = (id)v14;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end