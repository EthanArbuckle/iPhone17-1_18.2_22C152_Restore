@interface HMAccessorySelectionSettingItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMAccessorySelectionSetting)setting;
- (HMAccessorySelectionSettingItem)init;
- (HMAccessorySelectionSettingItem)initWithCoder:(id)a3;
- (HMAccessorySelectionSettingItem)initWithTitle:(id)a3;
- (NSString)keyPath;
- (NSString)localizedTitle;
- (NSString)title;
- (NSUUID)identifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSetting:(id)a3;
@end

@implementation HMAccessorySelectionSettingItem

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setting);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setSetting:(id)a3
{
}

- (HMAccessorySelectionSetting)setting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setting);

  return (HMAccessorySelectionSetting *)WeakRetained;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessorySelectionSettingItem *)self identifier];
  [v4 encodeObject:v5 forKey:@"HM.identifier"];

  id v6 = [(HMAccessorySelectionSettingItem *)self title];
  [v4 encodeObject:v6 forKey:@"HM.title"];
}

- (HMAccessorySelectionSettingItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.title"];
  id v6 = [(HMAccessorySelectionSettingItem *)self initWithTitle:v5];
  if (v6)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    [v7 getUUIDBytes:v6->_identifierUUIDBytes];
  }
  return v6;
}

- (NSString)localizedTitle
{
  v3 = [(HMAccessorySelectionSettingItem *)self keyPath];
  id v4 = +[HMAccessorySettings localizationKeyForKeyPath:v3];

  v5 = +[HMLocalization sharedManager];
  id v6 = [v5 getLocalizedString:v4];

  if ([v6 isEqualToString:v4])
  {
    id v7 = [(HMAccessorySelectionSettingItem *)self title];
  }
  else
  {
    id v7 = v6;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (NSString)keyPath
{
  v3 = [(HMAccessorySelectionSettingItem *)self setting];
  id v4 = [v3 keyPath];

  uint64_t v5 = [(HMAccessorySelectionSettingItem *)self title];
  id v6 = (void *)v5;
  if (v4)
  {
    uint64_t v7 = [v4 stringByAppendingFormat:@".%@", v5];

    id v6 = (void *)v7;
  }

  return (NSString *)v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(HMAccessorySelectionSettingItem *)self localizedTitle];
  uint64_t v5 = [(HMAccessorySelectionSettingItem *)self identifier];
  id v6 = [v5 UUIDString];
  uint64_t v7 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessorySelectionSettingItem *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(HMAccessorySelectionSettingItem *)self title];
      v8 = [(HMAccessorySelectionSettingItem *)v6 title];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMAccessorySelectionSettingItem *)self title];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)identifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:self->_identifierUUIDBytes];

  return (NSUUID *)v2;
}

- (HMAccessorySelectionSettingItem)initWithTitle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)HMAccessorySelectionSettingItem;
    uint64_t v5 = [(HMAccessorySelectionSettingItem *)&v13 init];
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F29128] UUID];
      [v6 getUUIDBytes:v5->_identifierUUIDBytes];

      uint64_t v7 = (void *)MEMORY[0x1E4F654E8];
      v8 = (void *)[v4 copy];
      uint64_t v9 = objc_msgSend(v7, "hmf_cachedInstanceForString:", v8);
      title = v5->_title;
      v5->_title = (NSString *)v9;
    }
    self = v5;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (HMAccessorySelectionSettingItem)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end