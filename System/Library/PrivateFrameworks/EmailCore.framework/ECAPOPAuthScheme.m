@interface ECAPOPAuthScheme
+ (ECAPOPAuthScheme)apopAuthScheme;
+ (id)allocWithZone:(_NSZone *)a3;
- (id)humanReadableName;
- (id)name;
- (unsigned)applescriptScheme;
- (void)dealloc;
@end

@implementation ECAPOPAuthScheme

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    [NSString stringWithFormat:@"Cannot directly allocate a %@ object, use +sharedInstance instead.", a1];
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ECAPOPAuthScheme;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (ECAPOPAuthScheme)apopAuthScheme
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ECAPOPAuthScheme_apopAuthScheme__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (apopAuthScheme_predicate != -1) {
    dispatch_once(&apopAuthScheme_predicate, block);
  }
  v2 = (void *)apopAuthScheme_sharedInstance;
  return (ECAPOPAuthScheme *)v2;
}

void __34__ECAPOPAuthScheme_apopAuthScheme__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___ECAPOPAuthScheme;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)apopAuthScheme_sharedInstance;
  apopAuthScheme_sharedInstance = v1;
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
  v5.super_class = (Class)ECAPOPAuthScheme;
  [(ECAPOPAuthScheme *)&v5 dealloc];
}

- (id)name
{
  return @"X-APOP";
}

- (id)humanReadableName
{
  return (id)_EFLocalizedString();
}

- (unsigned)applescriptScheme
{
  return 1633775727;
}

@end