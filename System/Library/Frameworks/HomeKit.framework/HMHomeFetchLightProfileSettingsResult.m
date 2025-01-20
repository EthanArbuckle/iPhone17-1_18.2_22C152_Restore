@interface HMHomeFetchLightProfileSettingsResult
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMHomeFetchLightProfileSettingsResult)initWithCoder:(id)a3;
- (HMHomeFetchLightProfileSettingsResult)initWithError:(id)a3;
- (HMHomeFetchLightProfileSettingsResult)initWithSettings:(id)a3;
- (HMLightProfileSettings)settings;
- (NSArray)attributeDescriptions;
- (NSError)error;
- (NSString)description;
- (NSString)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMHomeFetchLightProfileSettingsResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMLightProfileSettings)settings
{
  return (HMLightProfileSettings *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMHomeFetchLightProfileSettingsResult *)self error];
  [v4 encodeObject:v5 forKey:@"HMHomeFetchLightProfileSettingsResultKeyError"];

  id v6 = [(HMHomeFetchLightProfileSettingsResult *)self settings];
  [v4 encodeObject:v6 forKey:@"HMHomeFetchLightProfileSettingsResultKeySettings"];
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (HMHomeFetchLightProfileSettingsResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeFetchLightProfileSettingsResultKeyError"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeFetchLightProfileSettingsResultKeySettings"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    v10 = [(HMHomeFetchLightProfileSettingsResult *)self initWithError:v5];
LABEL_12:
    self = v10;
    v9 = self;
    goto LABEL_13;
  }
  if (v6) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    v10 = [(HMHomeFetchLightProfileSettingsResult *)self initWithSettings:v6];
    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (HMHomeFetchLightProfileSettingsResult)initWithSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMHomeFetchLightProfileSettingsResult;
  v5 = [(HMHomeFetchLightProfileSettingsResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    settings = v5->_settings;
    v5->_settings = (HMLightProfileSettings *)v6;
  }
  return v5;
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMHomeFetchLightProfileSettingsResult *)self settings];
  v5 = (void *)[v3 initWithName:@"Settings" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  BOOL v7 = [(HMHomeFetchLightProfileSettingsResult *)self error];
  BOOL v8 = (void *)[v6 initWithName:@"Error" value:v7];
  v11[1] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (unint64_t)hash
{
  id v3 = [(HMHomeFetchLightProfileSettingsResult *)self error];
  uint64_t v4 = [v3 hash];

  v5 = [(HMHomeFetchLightProfileSettingsResult *)self settings];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  BOOL v7 = v6;
  if (v6
    && ([v6 error],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        [(HMHomeFetchLightProfileSettingsResult *)self error],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = HMFEqualObjects(),
        v9,
        v8,
        v10))
  {
    v11 = [v7 settings];
    v12 = [(HMHomeFetchLightProfileSettingsResult *)self settings];
    char v13 = HMFEqualObjects();
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (HMHomeFetchLightProfileSettingsResult)initWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMHomeFetchLightProfileSettingsResult;
  v5 = [(HMHomeFetchLightProfileSettingsResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end