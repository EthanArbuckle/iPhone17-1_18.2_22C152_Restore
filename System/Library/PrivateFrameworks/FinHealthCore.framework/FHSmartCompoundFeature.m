@interface FHSmartCompoundFeature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FHSmartCompoundFeature)initWithCoder:(id)a3;
- (FHSmartCompoundFeature)initWithCompoundFeatureKey:(id)a3 smartCompoundFeatures:(id)a4 locale:(id)a5;
- (NSArray)rankedValues;
- (NSString)compoundFeatureKey;
- (NSString)locale;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FHSmartCompoundFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  compoundFeatureKey = self->_compoundFeatureKey;
  id v5 = a3;
  [v5 encodeObject:compoundFeatureKey forKey:@"compoundFeature"];
  [v5 encodeObject:self->_rankedValues forKey:@"rankedValues"];
  [v5 encodeObject:self->_locale forKey:@"locale"];
}

- (FHSmartCompoundFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FHSmartCompoundFeature;
  id v5 = [(FHSmartCompoundFeature *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compoundFeature"];
    compoundFeatureKey = v5->_compoundFeatureKey;
    v5->_compoundFeatureKey = (NSString *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"rankedValues"];
    rankedValues = v5->_rankedValues;
    v5->_rankedValues = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSString *)v13;
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = [(FHSmartCompoundFeature *)self compoundFeatureKey];
  uint64_t v4 = [v3 hash];

  id v5 = [(FHSmartCompoundFeature *)self rankedValues];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  v7 = [(FHSmartCompoundFeature *)self locale];
  unint64_t v8 = [v7 hash] - v6 + 32 * v6 + 29791;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FHSmartCompoundFeature *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    compoundFeatureKey = self->_compoundFeatureKey;
    v7 = [(FHSmartCompoundFeature *)v5 compoundFeatureKey];
    if ([(NSString *)compoundFeatureKey isEqual:v7])
    {
      rankedValues = self->_rankedValues;
      uint64_t v9 = [(FHSmartCompoundFeature *)v5 rankedValues];
      if ([(NSArray *)rankedValues isEqual:v9])
      {
        locale = self->_locale;
        uint64_t v11 = [(FHSmartCompoundFeature *)v5 locale];
        char v12 = [(NSString *)locale isEqual:v11];
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
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (FHSmartCompoundFeature)initWithCompoundFeatureKey:(id)a3 smartCompoundFeatures:(id)a4 locale:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FHSmartCompoundFeature;
  char v12 = [(FHSmartCompoundFeature *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_compoundFeatureKey, a3);
    objc_storeStrong((id *)&v13->_rankedValues, a4);
    objc_storeStrong((id *)&v13->_locale, a5);
  }

  return v13;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"compoundFeature", self->_compoundFeatureKey];
  [v3 appendFormat:@"%@: '%@'; ", @"locale", self->_locale];
  uint64_t v4 = [(NSArray *)self->_rankedValues description];
  [v3 appendFormat:@"%@: '%@'; ", @"rankedValues", v4];

  [v3 appendFormat:@">"];
  id v5 = [NSString stringWithString:v3];

  return v5;
}

- (NSString)compoundFeatureKey
{
  return self->_compoundFeatureKey;
}

- (NSArray)rankedValues
{
  return self->_rankedValues;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_rankedValues, 0);
  objc_storeStrong((id *)&self->_compoundFeatureKey, 0);
}

@end