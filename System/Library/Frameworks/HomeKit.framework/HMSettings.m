@interface HMSettings
- (BOOL)isControllable;
- (HMSettingGroup)rootGroup;
- (HMSettings)initWithSettingsOwner:(id)a3;
- (HMSettingsDelegate)delegate;
- (HMSettingsOwner)owner;
- (id)description;
- (id)longDescription;
- (void)setDelegate:(id)a3;
@end

@implementation HMSettings

- (HMSettings)initWithSettingsOwner:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMSettings;
  v5 = [(HMSettings *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_owner, v4);
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMSettings *)self owner];
  [v5 setDelegate:v4];
}

- (id)longDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HMSettings *)self rootGroup];
  v6 = [v5 longDescription];
  v7 = [v3 stringWithFormat:@"[%@ root: %@]", v4, v6];

  return v7;
}

- (HMSettingGroup)rootGroup
{
  v2 = [(HMSettings *)self owner];
  v3 = [v2 rootGroup];

  return (HMSettingGroup *)v3;
}

- (HMSettingsOwner)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

  return (HMSettingsOwner *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HMSettings *)self rootGroup];
  v6 = [v3 stringWithFormat:@"[%@ root: %@]", v4, v5];

  return v6;
}

- (HMSettingsDelegate)delegate
{
  v2 = [(HMSettings *)self owner];
  v3 = [v2 delegate];

  return (HMSettingsDelegate *)v3;
}

- (BOOL)isControllable
{
  v2 = [(HMSettings *)self owner];
  v3 = [v2 rootGroup];
  BOOL v4 = v3 != 0;

  return v4;
}

@end