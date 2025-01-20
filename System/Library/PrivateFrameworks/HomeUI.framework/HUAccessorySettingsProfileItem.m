@interface HUAccessorySettingsProfileItem
- (HMSetting)setting;
- (HUAccessorySettingsProfileItem)initWithProfile:(id)a3 setting:(id)a4;
- (MCProfile)profile;
- (NSUUID)uniqueIdentifier;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUAccessorySettingsProfileItem

- (HUAccessorySettingsProfileItem)initWithProfile:(id)a3 setting:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUAccessorySettingsProfileItem.m", 23, @"Invalid parameter not satisfying: %@", @"setting" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySettingsProfileItem;
  v10 = [(HUAccessorySettingsProfileItem *)&v14 init];
  if (v10)
  {
    if (!v8)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v10, @"HUAccessorySettingsProfileItem.m", 27, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_profile, a3);
    objc_storeStrong((id *)&v10->_setting, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HUAccessorySettingsProfileItem *)self profile];
  v6 = [(HUAccessorySettingsProfileItem *)self setting];
  v7 = (void *)[v4 initWithProfile:v5 setting:v6];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (NSUUID)uniqueIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  v4 = [(HUAccessorySettingsProfileItem *)self profile];
  v5 = [v4 UUID];
  v6 = (void *)[v3 initWithUUIDString:v5];

  return (NSUUID *)v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F692F0]);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [(HUAccessorySettingsProfileItem *)self setting];
  v7 = objc_msgSend(v5, "setWithObjects:", v6, 0);
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  v11 = [(HUAccessorySettingsProfileItem *)self profile];
  v12 = [v11 displayName];

  if (v12)
  {
    v13 = [(HUAccessorySettingsProfileItem *)self profile];
    objc_super v14 = [v13 displayName];
    [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  }
  v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v15;
}

- (MCProfile)profile
{
  return self->_profile;
}

- (HMSetting)setting
{
  return self->_setting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setting, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end