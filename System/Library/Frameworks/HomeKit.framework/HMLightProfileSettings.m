@interface HMLightProfileSettings
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNaturalLightingEnabled;
- (HMLightProfileSettings)initWithCoder:(id)a3;
- (HMLightProfileSettings)initWithSupportedFeatures:(unint64_t)a3 naturalLightingEnabled:(BOOL)a4;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (unint64_t)hash;
- (unint64_t)supportedFeatures;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMLightProfileSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  if (v6
    && (int v7 = [(HMLightProfileSettings *)self isNaturalLightingEnabled],
        v7 == [v6 isNaturalLightingEnabled]))
  {
    unint64_t v9 = [(HMLightProfileSettings *)self supportedFeatures];
    BOOL v8 = v9 == [v6 supportedFeatures];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMLightProfileSettings supportedFeatures](self, "supportedFeatures"), @"hmlp.sf");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMLightProfileSettings isNaturalLightingEnabled](self, "isNaturalLightingEnabled"), @"hmlp.nle");
}

- (BOOL)isNaturalLightingEnabled
{
  return self->_naturalLightingEnabled;
}

- (HMLightProfileSettings)initWithSupportedFeatures:(unint64_t)a3 naturalLightingEnabled:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMLightProfileSettings;
  result = [(HMLightProfileSettings *)&v7 init];
  if (result)
  {
    result->_naturalLightingEnabled = a4;
    result->_supportedFeatures = a3;
  }
  return result;
}

- (HMLightProfileSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"hmlp.sf"];
  uint64_t v6 = [v4 decodeBoolForKey:@"hmlp.nle"];

  return [(HMLightProfileSettings *)self initWithSupportedFeatures:v5 naturalLightingEnabled:v6];
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMLightProfileSettings *)self isNaturalLightingEnabled];
  id v4 = HMFBooleanToString();
  uint64_t v5 = (void *)[v3 initWithName:@"Natural Lighting Enabled" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  objc_super v7 = HMLightProfileSupportedFeaturesAsString([(HMLightProfileSettings *)self supportedFeatures]);
  BOOL v8 = (void *)[v6 initWithName:@"Supported Features" value:v7];
  v11[1] = v8;
  unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

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
  uint64_t v3 = [(HMLightProfileSettings *)self isNaturalLightingEnabled];
  return [(HMLightProfileSettings *)self supportedFeatures] ^ v3;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end