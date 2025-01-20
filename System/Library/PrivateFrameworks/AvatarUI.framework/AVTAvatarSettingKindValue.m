@interface AVTAvatarSettingKindValue
+ (id)valueWithSettingKind:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)settingKind;
- (AVTAvatarSettingKindValue)initWithSettingKind:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation AVTAvatarSettingKindValue

- (AVTAvatarSettingKindValue)initWithSettingKind:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)AVTAvatarSettingKindValue;
  result = [(AVTAvatarSettingKindValue *)&v6 init];
  if (result)
  {
    result->_settingKind.destination = var0;
    result->_settingKind.category = var1;
  }
  return result;
}

+ (id)valueWithSettingKind:(id)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithSettingKind:", a3.var0, a3.var1);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AVTAvatarSettingKindValue *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(AVTAvatarSettingKindValue *)self settingKind];
      uint64_t v7 = v6;
      uint64_t v8 = [(AVTAvatarSettingKindValue *)v4 settingKind];
      BOOL v11 = v7 == v9 && v5 == v8;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v2 = [(AVTAvatarSettingKindValue *)self settingKind];
  return v2 ^ __ROR8__(v3, 32);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AVTAvatarSettingKindValue alloc];
  uint64_t v6 = [(AVTAvatarSettingKindValue *)self settingKind];
  return -[AVTAvatarSettingKindValue initWithSettingKind:](v4, "initWithSettingKind:", v6, v5);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)settingKind
{
  int64_t category = self->_settingKind.category;
  int64_t destination = self->_settingKind.destination;
  result.int64_t var1 = category;
  result.int64_t var0 = destination;
  return result;
}

@end