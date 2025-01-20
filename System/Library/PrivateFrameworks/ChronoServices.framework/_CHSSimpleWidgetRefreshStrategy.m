@interface _CHSSimpleWidgetRefreshStrategy
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefaultStrategy;
- (BOOL)isDisabledStrategy;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRateLimited;
- (NSString)description;
- (NSString)rateLimitIdentifier;
- (_CHSSimpleWidgetRefreshStrategy)initWithCoder:(id)a3;
- (_CHSSimpleWidgetRefreshStrategy)initWithDefaultStrategy;
- (_CHSSimpleWidgetRefreshStrategy)initWithDisabledStrategy;
- (_CHSSimpleWidgetRefreshStrategy)initWithRateLimitIdentifier:(id)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CHSSimpleWidgetRefreshStrategy

- (_CHSSimpleWidgetRefreshStrategy)initWithRateLimitIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CHSSimpleWidgetRefreshStrategy;
  v5 = [(_CHSSimpleWidgetRefreshStrategy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rateLimitIdentifier = v5->_rateLimitIdentifier;
    v5->_rateLimitIdentifier = (NSString *)v6;
  }
  return v5;
}

- (_CHSSimpleWidgetRefreshStrategy)initWithDefaultStrategy
{
  v6.receiver = self;
  v6.super_class = (Class)_CHSSimpleWidgetRefreshStrategy;
  v2 = [(_CHSSimpleWidgetRefreshStrategy *)&v6 init];
  v3 = v2;
  if (v2)
  {
    rateLimitIdentifier = v2->_rateLimitIdentifier;
    v2->_rateLimitIdentifier = 0;

    v3->_isDefaultStrategy = 1;
  }
  return v3;
}

- (_CHSSimpleWidgetRefreshStrategy)initWithDisabledStrategy
{
  v6.receiver = self;
  v6.super_class = (Class)_CHSSimpleWidgetRefreshStrategy;
  v2 = [(_CHSSimpleWidgetRefreshStrategy *)&v6 init];
  v3 = v2;
  if (v2)
  {
    rateLimitIdentifier = v2->_rateLimitIdentifier;
    v2->_rateLimitIdentifier = 0;

    v3->_isDisabledStrategy = 1;
  }
  return v3;
}

- (unint64_t)hash
{
  return 17 * [(NSString *)self->_rateLimitIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CHSSimpleWidgetRefreshStrategy *)a3;
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
      BOOL v6 = BSEqualObjects() && self->_isDisabledStrategy == v5[17] && self->_isDefaultStrategy == v5[16];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64___CHSSimpleWidgetRefreshStrategy_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E56C81F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BOOL)isRateLimited
{
  return self->_rateLimitIdentifier != 0;
}

- (NSString)rateLimitIdentifier
{
  return self->_rateLimitIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_rateLimitIdentifier forKey:@"rateLimitIdentifier"];
  [v4 encodeBool:self->_isDefaultStrategy forKey:@"isDefaultStrategy"];
  [v4 encodeBool:self->_isDisabledStrategy forKey:@"isDisabledStrategy"];
}

- (_CHSSimpleWidgetRefreshStrategy)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CHSSimpleWidgetRefreshStrategy;
  id v5 = [(_CHSSimpleWidgetRefreshStrategy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rateLimitIdentifier"];
    rateLimitIdentifier = v5->_rateLimitIdentifier;
    v5->_rateLimitIdentifier = (NSString *)v6;

    v5->_isDefaultStrategy = [v4 decodeBoolForKey:@"isDefaultStrategy"];
    v5->_isDisabledStrategy = [v4 decodeBoolForKey:@"isDisabledStrategy"];
  }

  return v5;
}

- (BOOL)isDefaultStrategy
{
  return self->_isDefaultStrategy;
}

- (BOOL)isDisabledStrategy
{
  return self->_isDisabledStrategy;
}

- (void).cxx_destruct
{
}

@end