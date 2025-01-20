@interface ECAppleToken2AuthScheme
+ (ECAppleToken2AuthScheme)appleToken2AuthScheme;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)requiresPassword;
- (BOOL)requiresUsername;
- (id)humanReadableName;
- (id)name;
- (id)supportedSASLMechanisms;
- (unsigned)applescriptScheme;
- (void)dealloc;
@end

@implementation ECAppleToken2AuthScheme

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    [NSString stringWithFormat:@"Cannot directly allocate a %@ object, use +sharedInstance instead.", a1];
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ECAppleToken2AuthScheme;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (ECAppleToken2AuthScheme)appleToken2AuthScheme
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ECAppleToken2AuthScheme_appleToken2AuthScheme__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (appleToken2AuthScheme_predicate != -1) {
    dispatch_once(&appleToken2AuthScheme_predicate, block);
  }
  v2 = (void *)appleToken2AuthScheme_sharedInstance;
  return (ECAppleToken2AuthScheme *)v2;
}

void __48__ECAppleToken2AuthScheme_appleToken2AuthScheme__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___ECAppleToken2AuthScheme;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)appleToken2AuthScheme_sharedInstance;
  appleToken2AuthScheme_sharedInstance = v1;
}

- (void)dealloc
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    [NSString stringWithFormat:@"Cannot deallocate a %@ object.", objc_opt_class()];
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)ECAppleToken2AuthScheme;
  [(ECAppleToken2AuthScheme *)&v5 dealloc];
}

- (id)name
{
  return @"ATOKEN2";
}

- (id)humanReadableName
{
  return 0;
}

- (unsigned)applescriptScheme
{
  return 1635020594;
}

- (BOOL)requiresUsername
{
  return 0;
}

- (BOOL)requiresPassword
{
  return 0;
}

- (id)supportedSASLMechanisms
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"ATOKEN2"];
}

@end