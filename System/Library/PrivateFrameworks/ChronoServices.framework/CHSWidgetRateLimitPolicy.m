@interface CHSWidgetRateLimitPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSWidgetRateLimitPolicy)initWithCoder:(id)a3;
- (CHSWidgetRateLimitPolicy)initWithIdentifier:(id)a3 rateLimits:(id)a4;
- (NSSet)rateLimits;
- (NSString)description;
- (NSString)identifier;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetRateLimitPolicy

- (CHSWidgetRateLimitPolicy)initWithIdentifier:(id)a3 rateLimits:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CHSWidgetRateLimitPolicy.m", 23, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  if (![v8 count])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CHSWidgetRateLimitPolicy.m", 24, @"Invalid parameter not satisfying: %@", @"[rateLimits count] > 0" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)CHSWidgetRateLimitPolicy;
  v9 = [(CHSWidgetRateLimitPolicy *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    rateLimits = v9->_rateLimits;
    v9->_rateLimits = (NSSet *)v12;
  }
  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSSet *)self->_rateLimits count] + 13 * v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CHSWidgetRateLimitPolicy *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (BSEqualObjects()) {
        char v6 = BSEqualObjects();
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CHSWidgetRateLimitPolicy_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E56C81F0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __57__CHSWidgetRateLimitPolicy_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"identifier"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"rateLimits"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  id v4 = [(NSSet *)self->_rateLimits allObjects];
  [v5 encodeObject:v4 forKey:@"rateLimits"];
}

- (CHSWidgetRateLimitPolicy)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  char v6 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"rateLimits"];

  if ([v9 count])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    self = [(CHSWidgetRateLimitPolicy *)self initWithIdentifier:v5 rateLimits:v10];

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)rateLimits
{
  return self->_rateLimits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimits, 0);
  objc_storeStrong((id *)&self->rateLimits, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end