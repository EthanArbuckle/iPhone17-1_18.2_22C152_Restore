@interface DRSCKConfig
+ (id)_configWithConfigMO_ON_MOC_QUEUE:(id)a3;
+ (id)defaultConfig;
- (BOOL)isEqual:(id)a3;
- (BOOL)overridesDefault;
- (DRSCKConfig)init;
- (DRSCKConfig)initWithContainerEnvironment:(unsigned __int8)a3 rapidEnvironment:(unsigned __int8)a4 overridesDefault:(BOOL)a5;
- (id)debugDescription;
- (id)newConfigMOInContext_ON_MOC_QUEUE:(id)a3;
- (int64_t)ckContainerEnvironment;
- (int64_t)ckRapidEnvironment;
- (unsigned)containerEnvironment;
- (unsigned)rapidEnvironment;
@end

@implementation DRSCKConfig

- (int64_t)ckRapidEnvironment
{
  if ([(DRSCKConfig *)self rapidEnvironment] == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)ckContainerEnvironment
{
  if ([(DRSCKConfig *)self containerEnvironment] == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (id)_configWithConfigMO_ON_MOC_QUEUE:(id)a3
{
  id v3 = a3;
  v4 = [DRSCKConfig alloc];
  unsigned __int8 v5 = [v3 containerEnvironment];
  unsigned __int8 v6 = [v3 rapidEnvironment];
  uint64_t v7 = [v3 overridesDefault];

  v8 = [(DRSCKConfig *)v4 initWithContainerEnvironment:v5 rapidEnvironment:v6 overridesDefault:v7];

  return v8;
}

- (id)newConfigMOInContext_ON_MOC_QUEUE:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [[DRSCKConfigMO alloc] initWithContext:v4];

  [(DRSCKConfigMO *)v5 setContainerEnvironment:[(DRSCKConfig *)self containerEnvironment]];
  [(DRSCKConfigMO *)v5 setRapidEnvironment:[(DRSCKConfig *)self rapidEnvironment]];
  [(DRSCKConfigMO *)v5 setOverridesDefault:[(DRSCKConfig *)self overridesDefault]];
  return v5;
}

+ (id)defaultConfig
{
  if (defaultConfig_onceToken != -1) {
    dispatch_once(&defaultConfig_onceToken, &__block_literal_global_374);
  }
  v2 = (void *)defaultConfig_defaultConfig;

  return v2;
}

void __28__DRSCKConfig_defaultConfig__block_invoke()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v0 = objc_alloc_init(DRSCKConfig);
  v1 = (void *)defaultConfig_defaultConfig;
  defaultConfig_defaultConfig = (uint64_t)v0;

  v2 = DPLogHandle_CKConfig();
  if (os_signpost_enabled(v2))
  {
    id v3 = +[DRSSystemProfile sharedInstance];
    if ([v3 isInternal]) {
      id v4 = "Internal";
    }
    else {
      id v4 = "Customer";
    }
    uint64_t v5 = [(id)defaultConfig_defaultConfig debugDescription];
    unsigned __int8 v6 = (void *)v5;
    uint64_t v7 = @"Unknown";
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    int v8 = 136315394;
    v9 = v4;
    __int16 v10 = 2114;
    v11 = v7;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DefaultConfigInitialized", "Default config (%s): %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (DRSCKConfig)initWithContainerEnvironment:(unsigned __int8)a3 rapidEnvironment:(unsigned __int8)a4 overridesDefault:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)DRSCKConfig;
  result = [(DRSCKConfig *)&v9 init];
  if (result)
  {
    result->_containerEnvironment = a3;
    result->_rapidEnvironment = a4;
    result->_overridesDefault = a5;
  }
  return result;
}

- (DRSCKConfig)init
{
  id v3 = +[DRSSystemProfile sharedInstance];
  int v4 = [v3 isInternal];

  if (v4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }

  return [(DRSCKConfig *)self initWithContainerEnvironment:1 rapidEnvironment:v5 overridesDefault:0];
}

- (id)debugDescription
{
  id v3 = NSString;
  int v4 = [(DRSCKConfig *)self containerEnvironment];
  if (v4 == 1) {
    uint64_t v5 = @"Production";
  }
  else {
    uint64_t v5 = @"Unknown";
  }
  if (v4 == 2) {
    uint64_t v5 = @"Sandbox";
  }
  unsigned __int8 v6 = v5;
  int v7 = [(DRSCKConfig *)self rapidEnvironment];
  if (v7 == 1) {
    int v8 = @"Production";
  }
  else {
    int v8 = @"Unknown";
  }
  if (v7 == 2) {
    int v8 = @"Sandbox";
  }
  objc_super v9 = v8;
  BOOL v10 = [(DRSCKConfig *)self overridesDefault];
  v11 = @"(Default)";
  if (v10) {
    v11 = @"(Overrides default)";
  }
  uint64_t v12 = [v3 stringWithFormat:@"Container Environment: %@, RAPID Environment: %@ %@", v6, v9, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (DRSCKConfig *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v6 = v5;
    int v7 = [(DRSCKConfig *)self containerEnvironment];
    if (v7 == [(DRSCKConfig *)v6 containerEnvironment]
      && (int v8 = [(DRSCKConfig *)self rapidEnvironment],
          v8 == [(DRSCKConfig *)v6 rapidEnvironment]))
    {
      BOOL v9 = [(DRSCKConfig *)self overridesDefault];
      BOOL v10 = v9 ^ [(DRSCKConfig *)v6 overridesDefault] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
LABEL_7:
    LOBYTE(v10) = 0;
  }
LABEL_11:

  return v10;
}

- (unsigned)rapidEnvironment
{
  return self->_rapidEnvironment;
}

- (unsigned)containerEnvironment
{
  return self->_containerEnvironment;
}

- (BOOL)overridesDefault
{
  return self->_overridesDefault;
}

@end