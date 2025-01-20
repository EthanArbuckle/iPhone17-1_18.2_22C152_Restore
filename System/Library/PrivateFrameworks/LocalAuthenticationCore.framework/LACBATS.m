@interface LACBATS
+ (BOOL)_isBATSEnvironmentSet;
+ (id)sharedInstance;
- (BOOL)isRunningInBATS;
- (BOOL)wasLaunchedByBATS;
- (LACBATS)init;
@end

@implementation LACBATS

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

uint64_t __25__LACBATS_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (LACBATS)init
{
  v6.receiver = self;
  v6.super_class = (Class)LACBATS;
  v2 = [(LACBATS *)&v6 init];
  if (v2)
  {
    BOOL v3 = +[LACBATS _isBATSEnvironmentSet];
    v2->_wasLaunchedByBATS = v3;
    if (v3)
    {
      v2->_isRunningInBATS = 1;
      +[LACGlobalDomain setRunningInBATS:MEMORY[0x263EFFA88]];
    }
    else
    {
      v4 = +[LACGlobalDomain runningInBATS];
      v2->_isRunningInBATS = [v4 BOOLValue];
    }
  }
  return v2;
}

+ (BOOL)_isBATSEnvironmentSet
{
  int v2 = os_variant_allows_internal_security_policies();
  if (v2)
  {
    BOOL v3 = [MEMORY[0x263F08AB0] processInfo];
    v4 = [v3 environment];

    v5 = [v4 objectForKeyedSubscript:@"BATS"];
    char v6 = [v5 isEqualToString:@"1"];

    LOBYTE(v2) = v6;
  }
  return v2;
}

- (BOOL)wasLaunchedByBATS
{
  return self->_wasLaunchedByBATS;
}

- (BOOL)isRunningInBATS
{
  return self->_isRunningInBATS;
}

@end