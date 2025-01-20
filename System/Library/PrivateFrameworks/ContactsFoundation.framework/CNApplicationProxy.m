@interface CNApplicationProxy
+ (BOOL)supportsSecureCoding;
- (CNApplicationProxy)init;
- (CNApplicationProxy)initWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 localizedName:(id)a5 activityTypes:(id)a6;
- (CNApplicationProxy)initWithCoder:(id)a3;
- (CNApplicationProxy)initWithLSApplicationProxy:(id)a3;
- (CNApplicationProxy)initWithLSApplicationRecord:(id)a3;
- (NSArray)activityTypes;
- (NSString)bundleIdentifier;
- (NSString)localizedName;
- (NSString)teamIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityTypes:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setTeamIdentifier:(id)a3;
@end

@implementation CNApplicationProxy

- (CNApplicationProxy)init
{
  CNInitializerUnavailableException(self, a2, sel_initWithLSApplicationProxy_);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CNApplicationProxy)initWithLSApplicationProxy:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  v6 = [v4 teamID];
  v7 = [v4 localizedName];
  v8 = [v4 activityTypes];

  v9 = [(CNApplicationProxy *)self initWithBundleIdentifier:v5 teamIdentifier:v6 localizedName:v7 activityTypes:v8];
  return v9;
}

- (CNApplicationProxy)initWithLSApplicationRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  v6 = [v4 teamIdentifier];
  v7 = [v4 localizedName];
  v8 = [v4 userActivityTypes];

  v9 = [v8 allObjects];
  v10 = [(CNApplicationProxy *)self initWithBundleIdentifier:v5 teamIdentifier:v6 localizedName:v7 activityTypes:v9];

  return v10;
}

- (CNApplicationProxy)initWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 localizedName:(id)a5 activityTypes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)CNApplicationProxy;
  v14 = [(CNApplicationProxy *)&v27 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    teamIdentifier = v14->_teamIdentifier;
    v14->_teamIdentifier = (NSString *)v17;

    v19 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\u200E"];
    v20 = [v12 stringByTrimmingCharactersInSet:v19];

    uint64_t v21 = [v20 copy];
    localizedName = v14->_localizedName;
    v14->_localizedName = (NSString *)v21;

    uint64_t v23 = [v13 copy];
    activityTypes = v14->_activityTypes;
    v14->_activityTypes = (NSArray *)v23;

    v25 = v14;
    id v12 = v20;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNApplicationProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNApplicationProxy;
  v5 = [(CNApplicationProxy *)&v23 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    uint64_t v7 = [v6 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_teamIdentifier"];
    uint64_t v10 = [v9 copy];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localizedName"];
    uint64_t v13 = [v12 copy];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v13;

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_activityTypes"];
    uint64_t v19 = [v18 copy];
    activityTypes = v5->_activityTypes;
    v5->_activityTypes = (NSArray *)v19;

    uint64_t v21 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"_bundleIdentifier"];
  [v5 encodeObject:self->_teamIdentifier forKey:@"_teamIdentifier"];
  [v5 encodeObject:self->_localizedName forKey:@"_localizedName"];
  [v5 encodeObject:self->_activityTypes forKey:@"_activityTypes"];
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  uint64_t v4 = CNApplicationProxyApplicationIdentifierKey;
  id v5 = [(CNApplicationProxy *)self bundleIdentifier];
  id v6 = (id)[v3 appendName:v4 object:v5];

  uint64_t v7 = CNApplicationProxyTeamIdentifierKey;
  v8 = [(CNApplicationProxy *)self teamIdentifier];
  id v9 = (id)[v3 appendName:v7 object:v8];

  uint64_t v10 = CNApplicationProxyLocalizedNameKey;
  id v11 = [(CNApplicationProxy *)self localizedName];
  id v12 = (id)[v3 appendName:v10 object:v11];

  uint64_t v13 = CNApplicationProxyActivityTypesKey;
  v14 = [(CNApplicationProxy *)self activityTypes];
  id v15 = (id)[v3 appendName:v13 object:v14];

  uint64_t v16 = [v3 build];

  return v16;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSArray)activityTypes
{
  return self->_activityTypes;
}

- (void)setActivityTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypes, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end