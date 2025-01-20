@interface BSUIVibrancyValues
- (BSUIVibrancyValues)init;
- (BSUIVibrancyValues)initWithConfiguration:(id)a3;
- (NSString)resolvedGroupName;
- (int64_t)resolvedEffectType;
@end

@implementation BSUIVibrancyValues

- (BSUIVibrancyValues)init
{
  v3 = objc_alloc_init(BSUIVibrancyConfiguration);
  v4 = [(BSUIVibrancyValues *)self initWithConfiguration:v3];

  return v4;
}

- (BSUIVibrancyValues)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BSUIVibrancyValues;
  v5 = [(BSUIVibrancyValues *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BSUIVibrancyValues *)v5 calculateValuesForConfiguration:v4];
  }

  return v6;
}

- (int64_t)resolvedEffectType
{
  return self->_resolvedEffectType;
}

- (NSString)resolvedGroupName
{
  return self->_resolvedGroupName;
}

- (void).cxx_destruct
{
}

@end