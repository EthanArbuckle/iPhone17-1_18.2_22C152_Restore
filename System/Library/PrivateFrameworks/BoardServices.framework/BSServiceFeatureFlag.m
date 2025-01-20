@interface BSServiceFeatureFlag
- (BOOL)isEnabled;
- (BSServiceFeatureFlag)initWithDomain:(id)a3 featureName:(id)a4;
- (NSString)domain;
- (NSString)featureName;
- (id)description;
@end

@implementation BSServiceFeatureFlag

- (BSServiceFeatureFlag)initWithDomain:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BSServiceFeatureFlag;
  v8 = [(BSServiceFeatureFlag *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEnabled
{
  if (__explicitResolver)
  {
    v3 = *(uint64_t (**)(void))(__explicitResolver + 16);
    return v3();
  }
  else
  {
    v5 = [(NSString *)self->_domain UTF8String];
    id v6 = [(NSString *)self->_featureName UTF8String];
    return MEMORY[0x1F40C9FB0](v5, v6);
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_domain withName:@"domain"];
  [v3 appendString:self->_featureName withName:@"featureName"];
  v4 = [v3 build];

  return v4;
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