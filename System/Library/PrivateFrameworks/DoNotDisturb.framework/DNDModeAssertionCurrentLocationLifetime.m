@interface DNDModeAssertionCurrentLocationLifetime
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)isEqual:(id)a3;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)lifetimeType;
@end

@implementation DNDModeAssertionCurrentLocationLifetime

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__DNDModeAssertionCurrentLocationLifetime_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __57__DNDModeAssertionCurrentLocationLifetime_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v2 = sharedInstance_instance;
  sharedInstance_instance = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (unint64_t)hash
{
  return 64181;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (unint64_t)lifetimeType
{
  return 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  v4 = [(id)objc_opt_class() sharedInstance];

  return v4;
}

@end