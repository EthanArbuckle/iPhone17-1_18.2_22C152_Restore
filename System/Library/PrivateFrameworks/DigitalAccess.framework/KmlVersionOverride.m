@interface KmlVersionOverride
+ (id)sharedVersionsOverrides;
- (KmlVersionOverride)init;
- (unsigned)keyRoleToShare;
- (unsigned)kmlOverrideVersion;
- (void)setKeyRoleToShare:(unsigned __int16)a3;
- (void)setKmlOverrideVersion:(unsigned __int16)a3;
@end

@implementation KmlVersionOverride

+ (id)sharedVersionsOverrides
{
  if (sharedVersionsOverrides_onceToken != -1) {
    dispatch_once(&sharedVersionsOverrides_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedVersionsOverrides__versionOverride;

  return v2;
}

uint64_t __45__KmlVersionOverride_sharedVersionsOverrides__block_invoke()
{
  sharedVersionsOverrides__versionOverride = objc_alloc_init(KmlVersionOverride);

  return MEMORY[0x270F9A758]();
}

- (KmlVersionOverride)init
{
  v13.receiver = self;
  v13.super_class = (Class)KmlVersionOverride;
  v2 = [(KmlVersionOverride *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_kmlOverrideVersion = 768;
    v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.seserviced"];
    v5 = [v4 stringForKey:@"KmlVersion"];
    int v6 = [v5 isEqualToString:@"SharingInChainTest"];
    if (v6) {
      v3->_kmlOverrideVersion = 256;
    }
    v3->_keyRoleToShare = -1;
    v11 = [v4 objectForKey:@"KeyRole"];
    if (v11)
    {
      v3->_keyRoleToShare = [v4 integerForKey:@"KeyRole"];
    }
    else if (!v6)
    {
LABEL_8:

      return v3;
    }
    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlVersionOverride init]", 63, @"UserDefault: %@", v7, v8, v9, v10, (uint64_t)v4);
    goto LABEL_8;
  }
  return v3;
}

- (unsigned)kmlOverrideVersion
{
  return self->_kmlOverrideVersion;
}

- (void)setKmlOverrideVersion:(unsigned __int16)a3
{
  self->_kmlOverrideVersion = a3;
}

- (unsigned)keyRoleToShare
{
  return self->_keyRoleToShare;
}

- (void)setKeyRoleToShare:(unsigned __int16)a3
{
  self->_keyRoleToShare = a3;
}

@end