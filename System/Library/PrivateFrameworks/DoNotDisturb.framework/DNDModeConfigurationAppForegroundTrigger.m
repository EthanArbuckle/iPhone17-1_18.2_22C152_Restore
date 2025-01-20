@interface DNDModeConfigurationAppForegroundTrigger
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSecureData;
- (BOOL)isEqual:(id)a3;
- (DNDApplicationIdentifier)applicationIdentifier;
- (DNDModeConfigurationAppForegroundTrigger)initWithApplicationIdentifier:(id)a3 enabledSetting:(unint64_t)a4;
- (DNDModeConfigurationAppForegroundTrigger)initWithBundleIdentifier:(id)a3 enabledSetting:(unint64_t)a4;
- (DNDModeConfigurationAppForegroundTrigger)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeConfigurationAppForegroundTrigger

- (DNDModeConfigurationAppForegroundTrigger)initWithBundleIdentifier:(id)a3 enabledSetting:(unint64_t)a4
{
  id v6 = a3;
  v7 = [[DNDApplicationIdentifier alloc] initWithBundleID:v6];

  v8 = [(DNDModeConfigurationAppForegroundTrigger *)self initWithApplicationIdentifier:v7 enabledSetting:a4];
  return v8;
}

- (DNDModeConfigurationAppForegroundTrigger)initWithApplicationIdentifier:(id)a3 enabledSetting:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDModeConfigurationAppForegroundTrigger;
  v7 = [(DNDModeConfigurationTrigger *)&v11 initWithEnabledSetting:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    applicationIdentifier = v7->_applicationIdentifier;
    v7->_applicationIdentifier = (DNDApplicationIdentifier *)v8;
  }
  return v7;
}

- (NSString)bundleIdentifier
{
  return [(DNDApplicationIdentifier *)self->_applicationIdentifier bundleID];
}

- (BOOL)hasSecureData
{
  return 1;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)DNDModeConfigurationAppForegroundTrigger;
  unint64_t v3 = [(DNDModeConfigurationTrigger *)&v5 hash];
  return [(DNDApplicationIdentifier *)self->_applicationIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DNDModeConfigurationAppForegroundTrigger *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)DNDModeConfigurationAppForegroundTrigger;
      if ([(DNDModeConfigurationTrigger *)&v14 isEqual:v5])
      {
        id v6 = [(DNDModeConfigurationAppForegroundTrigger *)self applicationIdentifier];
        v7 = [(DNDModeConfigurationAppForegroundTrigger *)v5 applicationIdentifier];
        if (v6 == v7)
        {
          char v12 = 1;
        }
        else
        {
          uint64_t v8 = [(DNDModeConfigurationAppForegroundTrigger *)self applicationIdentifier];
          if (v8)
          {
            v9 = [(DNDModeConfigurationAppForegroundTrigger *)v5 applicationIdentifier];
            if (v9)
            {
              v10 = [(DNDModeConfigurationAppForegroundTrigger *)self applicationIdentifier];
              objc_super v11 = [(DNDModeConfigurationAppForegroundTrigger *)v5 applicationIdentifier];
              char v12 = [v10 isEqual:v11];
            }
            else
            {
              char v12 = 0;
            }
          }
          else
          {
            char v12 = 0;
          }
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(DNDModeConfigurationTrigger *)self enabledSetting];
  id v6 = [(DNDModeConfigurationAppForegroundTrigger *)self applicationIdentifier];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; enabledSetting: %llu; applicationIdentifier: %@>",
    v4,
    self,
    v5,
  v7 = v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeConfigurationAppForegroundTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDModeConfigurationAppForegroundTrigger;
  unint64_t v5 = [(DNDModeConfigurationTrigger *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (DNDApplicationIdentifier *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DNDModeConfigurationAppForegroundTrigger;
  id v4 = a3;
  [(DNDModeConfigurationTrigger *)&v6 encodeWithCoder:v4];
  unint64_t v5 = [(DNDModeConfigurationAppForegroundTrigger *)self applicationIdentifier];
  [v4 encodeObject:v5 forKey:@"applicationIdentifier"];
}

- (DNDApplicationIdentifier)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void).cxx_destruct
{
}

@end