@interface FBPreferences
+ (id)sharedInstance;
- (id)_init;
- (void)_bindAndRegisterDefaults;
@end

@implementation FBPreferences

+ (id)sharedInstance
{
  if (sharedInstance___once_1 != -1) { {
    dispatch_once(&sharedInstance___once_1, &__block_literal_global_29);
  }
  }
  v2 = (void *)sharedInstance___prefs;

  return v2;
}

void __31__FBPreferences_sharedInstance__block_invoke()
{
  id v0 = [[FBPreferences alloc] _init];
  v1 = (void *)sharedInstance___prefs;
  sharedInstance___prefs = (uint64_t)v0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)FBPreferences;
  return [(BSAbstractDefaultDomain *)&v3 _initWithDomain:@"com.apple.frontboard"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"disableXPCServicesEndpointHack"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"disableXPCServicesEndpointHack" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end