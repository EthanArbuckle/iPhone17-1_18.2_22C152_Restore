@interface ODIGestaltHlpr
+ (id)getSharedInstance;
- (BOOL)hasPKASupport;
- (id)copyAnswer:(__CFString *)a3;
- (int64_t)sikaVersion;
@end

@implementation ODIGestaltHlpr

+ (id)getSharedInstance
{
  if (getSharedInstance_once != -1) {
    dispatch_once(&getSharedInstance_once, &__block_literal_global);
  }
  v2 = (void *)getSharedInstance_sharedInstance;

  return v2;
}

uint64_t __35__ODIGestaltHlpr_getSharedInstance__block_invoke()
{
  getSharedInstance_sharedInstance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (BOOL)hasPKASupport
{
  id v2 = [(ODIGestaltHlpr *)self copyAnswer:@"HasPKA"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)copyAnswer:(__CFString *)a3
{
  if (a3) {
    return (id)MGCopyAnswer();
  }
  else {
    return 0;
  }
}

- (int64_t)sikaVersion
{
  id v3 = [(ODIGestaltHlpr *)self copyAnswer:@"ssIPnsZyWHPGC5sg3Pzkiw"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 BOOLValue])
  {
    id v4 = [(ODIGestaltHlpr *)self copyAnswer:@"ssIPnsZyWHPGC5sg3Pzkiw"];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ([v4 isEqualToString:@"t8015"]) {
        int64_t v5 = 1;
      }
      else {
        int64_t v5 = 2;
      }
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

@end