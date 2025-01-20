@interface DNDSAnyModeAssertionInvalidationPredicate
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)predicateType;
@end

@implementation DNDSAnyModeAssertionInvalidationPredicate

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__DNDSAnyModeAssertionInvalidationPredicate_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __59__DNDSAnyModeAssertionInvalidationPredicate_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v2 = sharedInstance_instance;
  sharedInstance_instance = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (unint64_t)hash
{
  return 64255;
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

- (unint64_t)predicateType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end