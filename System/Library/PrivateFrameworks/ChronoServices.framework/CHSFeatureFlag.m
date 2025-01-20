@interface CHSFeatureFlag
+ (BOOL)isFeatureFlagEnabled:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (CHSFeatureFlag)init;
- (CHSFeatureFlag)initWithCoder:(id)a3;
- (CHSFeatureFlag)initWithDomain:(id)a3 featureName:(id)a4;
- (NSString)domain;
- (NSString)featureName;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSFeatureFlag

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CHSFeatureFlag.m" lineNumber:23 description:@"-[CHSFeatureFlag new] is unavailable"];

  return 0;
}

- (CHSFeatureFlag)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSFeatureFlag.m" lineNumber:28 description:@"-[CHSFeatureFlag init] is unavailable"];

  return 0;
}

- (CHSFeatureFlag)initWithDomain:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHSFeatureFlag;
  v8 = [(CHSFeatureFlag *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v11;

    v8->_cDomain = strdup((const char *)[v6 UTF8String]);
    v8->_cFeatureName = strdup((const char *)[v7 UTF8String]);
  }

  return v8;
}

- (void)dealloc
{
  free(self->_cDomain);
  free(self->_cFeatureName);
  v3.receiver = self;
  v3.super_class = (Class)CHSFeatureFlag;
  [(CHSFeatureFlag *)&v3 dealloc];
}

+ (BOOL)isFeatureFlagEnabled:(id)a3
{
  return MEMORY[0x1F40C9FB0](*((void *)a3 + 3), *((void *)a3 + 4));
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  return v3 + [(NSString *)self->_featureName hash] + 17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CHSFeatureFlag *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(NSString *)self->_domain isEqualToString:v5->_domain]) {
        BOOL v6 = [(NSString *)self->_featureName isEqualToString:v5->_featureName];
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  NSUInteger v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __29__CHSFeatureFlag_description__block_invoke;
  v10 = &unk_1E56C81F0;
  id v4 = v3;
  id v11 = v4;
  v12 = self;
  [v4 appendProem:0 block:&v7];
  v5 = objc_msgSend(v4, "build", v7, v8, v9, v10);

  return v5;
}

uint64_t __29__CHSFeatureFlag_description__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 8) withName:@"domain"];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 16);
  return [v2 appendString:v3 withName:@"featureName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_domain forKey:@"domain"];
  [v4 encodeObject:self->_featureName forKey:@"featureName"];
}

- (CHSFeatureFlag)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureName"];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    self = [(CHSFeatureFlag *)self initWithDomain:v5 featureName:v6];
    uint64_t v9 = self;
  }

  return v9;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end