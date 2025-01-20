@interface INUserActivityDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INUserActivityDescriptor)descriptorWithAppDescriptor:(id)a3;
- (INUserActivityDescriptor)initWithCoder:(id)a3;
- (INUserActivityDescriptor)initWithUserActivityType:(id)a3 bundleIdentifier:(id)a4;
- (INUserActivityDescriptor)initWithUserActivityType:(id)a3 localizedName:(id)a4 bundleIdentifier:(id)a5 extensionBundleIdentifier:(id)a6 counterpartIdentifiers:(id)a7 teamIdentifier:(id)a8 supportedIntents:(id)a9 bundleURL:(id)a10;
- (NSString)userActivityType;
- (id)appDescriptor;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INUserActivityDescriptor

- (void).cxx_destruct
{
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)INUserActivityDescriptor;
  id v4 = a3;
  [(INAppDescriptor *)&v6 encodeWithCoder:v4];
  v5 = [(INUserActivityDescriptor *)self userActivityType];
  [v4 encodeObject:v5 forKey:@"userActivityType"];
}

- (INUserActivityDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INUserActivityDescriptor;
  v5 = [(INAppDescriptor *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivityType"];
    userActivityType = v5->_userActivityType;
    v5->_userActivityType = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INUserActivityDescriptor *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if ([(INUserActivityDescriptor *)v4 isMemberOfClass:objc_opt_class()])
  {
    v16.receiver = self;
    v16.super_class = (Class)INUserActivityDescriptor;
    unsigned int v5 = [(INAppDescriptor *)&v16 isEqual:v4];
    uint64_t v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v5)
    {
      objc_super v10 = [(INUserActivityDescriptor *)self userActivityType];
      v11 = [(INUserActivityDescriptor *)v9 userActivityType];
      id v12 = v10;
      id v13 = v11;
      v14 = v13;
      if (v12 == v13)
      {
        char v8 = 1;
      }
      else
      {
        char v8 = 0;
        if (v12 && v13) {
          char v8 = [v12 isEqualToString:v13];
        }
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)INUserActivityDescriptor;
  unint64_t v3 = [(INAppDescriptor *)&v7 hash];
  id v4 = [(INUserActivityDescriptor *)self userActivityType];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (INUserActivityDescriptor)descriptorWithAppDescriptor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [INUserActivityDescriptor alloc];
  uint64_t v6 = [(INUserActivityDescriptor *)self userActivityType];
  objc_super v7 = [v4 localizedName];
  char v8 = [v4 bundleIdentifier];
  v9 = [v4 extensionBundleIdentifier];
  objc_super v10 = [v4 counterpartIdentifiers];
  v11 = [v4 teamIdentifier];
  id v12 = [v4 supportedIntents];
  id v13 = [v4 bundleURL];

  v14 = [(INUserActivityDescriptor *)v5 initWithUserActivityType:v6 localizedName:v7 bundleIdentifier:v8 extensionBundleIdentifier:v9 counterpartIdentifiers:v10 teamIdentifier:v11 supportedIntents:v12 bundleURL:v13];
  [(INAppDescriptor *)v14 setRequiresUserConfirmation:[(INAppDescriptor *)self requiresUserConfirmation]];

  return v14;
}

- (id)appDescriptor
{
  unint64_t v3 = [INAppDescriptor alloc];
  id v4 = [(INAppDescriptor *)self localizedName];
  unint64_t v5 = [(INAppDescriptor *)self bundleIdentifier];
  uint64_t v6 = [(INAppDescriptor *)self extensionBundleIdentifier];
  objc_super v7 = [(INAppDescriptor *)self counterpartIdentifiers];
  char v8 = [(INAppDescriptor *)self teamIdentifier];
  v9 = [(INAppDescriptor *)self supportedIntents];
  objc_super v10 = [(INAppDescriptor *)self bundleURL];
  v11 = [(INAppDescriptor *)self documentTypes];
  id v12 = [(INAppDescriptor *)v3 initWithLocalizedName:v4 bundleIdentifier:v5 extensionBundleIdentifier:v6 counterpartIdentifiers:v7 teamIdentifier:v8 supportedIntents:v9 bundleURL:v10 documentTypes:v11];

  [(INAppDescriptor *)v12 setRequiresUserConfirmation:[(INAppDescriptor *)self requiresUserConfirmation]];

  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)INUserActivityDescriptor;
  id v4 = [(INAppDescriptor *)&v8 description];
  unint64_t v5 = [(INUserActivityDescriptor *)self userActivityType];
  uint64_t v6 = [v3 stringWithFormat:@"%@, userActivityType: %@", v4, v5];

  return v6;
}

- (INUserActivityDescriptor)initWithUserActivityType:(id)a3 localizedName:(id)a4 bundleIdentifier:(id)a5 extensionBundleIdentifier:(id)a6 counterpartIdentifiers:(id)a7 teamIdentifier:(id)a8 supportedIntents:(id)a9 bundleURL:(id)a10
{
  id v16 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INUserActivityDescriptor;
  v17 = [(INAppDescriptor *)&v22 initWithLocalizedName:a4 bundleIdentifier:a5 extensionBundleIdentifier:a6 counterpartIdentifiers:a7 teamIdentifier:a8 supportedIntents:a9 bundleURL:a10 documentTypes:0];
  if (v17)
  {
    uint64_t v18 = [v16 copy];
    userActivityType = v17->_userActivityType;
    v17->_userActivityType = (NSString *)v18;

    v20 = v17;
  }

  return v17;
}

- (INUserActivityDescriptor)initWithUserActivityType:(id)a3 bundleIdentifier:(id)a4
{
  return [(INUserActivityDescriptor *)self initWithUserActivityType:a3 localizedName:0 bundleIdentifier:a4 extensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 supportedIntents:0 bundleURL:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end