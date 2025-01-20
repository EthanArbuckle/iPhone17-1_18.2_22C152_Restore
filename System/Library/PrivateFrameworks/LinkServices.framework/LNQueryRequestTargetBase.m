@interface LNQueryRequestTargetBase
+ (BOOL)supportsSecureCoding;
- (id)_init;
@end

@implementation LNQueryRequestTargetBase

- (id)_init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    id result = (id)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"LNQueryRequestTargetBase cannot be initialized directly"];
    __break(1u);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)LNQueryRequestTargetBase;
    return [(LNQueryRequestTargetBase *)&v5 init];
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end