@interface HANanoSettings
+ (id)sharedInstance;
- (BOOL)shouldUseiCloud;
- (HANanoSettings)init;
- (NPSDomainAccessor)domainAccessor;
- (NPSDomainAccessor)globalDomainAccessor;
- (id)_valueForPreferenceKey:(id)a3;
- (id)currentLocale;
- (id)nanoDomainAccessor;
- (void)dealloc;
- (void)pairedWatchDidChange:(id)a3;
- (void)setDomainAccessor:(id)a3;
- (void)setGlobalDomainAccessor:(id)a3;
- (void)setValue:(id)a3 forPreferenceKey:(id)a4;
@end

@implementation HANanoSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_409 != -1) {
    dispatch_once(&sharedInstance_onceToken_409, &__block_literal_global_411);
  }
  v2 = (void *)sharedInstance_Settings_408;

  return v2;
}

uint64_t __32__HANanoSettings_sharedInstance__block_invoke()
{
  sharedInstance_Settings_408 = objc_alloc_init(HANanoSettings);

  return MEMORY[0x270F9A758]();
}

- (HANanoSettings)init
{
  v8.receiver = self;
  v8.super_class = (Class)HANanoSettings;
  v2 = [(HUHearingAidSettings *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@".GlobalPreferences"];
    globalDomainAccessor = v2->_globalDomainAccessor;
    v2->_globalDomainAccessor = (NPSDomainAccessor *)v3;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_pairedWatchDidChange_ name:*MEMORY[0x263F576B8] object:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_pairedWatchDidChange_ name:*MEMORY[0x263F57688] object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HANanoSettings;
  [(HUHearingAidSettings *)&v4 dealloc];
}

- (void)pairedWatchDidChange:(id)a3
{
  self->_domainAccessor = 0;
  MEMORY[0x270F9A758]();
}

- (id)nanoDomainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    id v4 = objc_alloc(MEMORY[0x263F57520]);
    v5 = (NPSDomainAccessor *)[v4 initWithDomain:*MEMORY[0x263F8B1E8]];
    v6 = self->_domainAccessor;
    self->_domainAccessor = v5;

    domainAccessor = self->_domainAccessor;
  }

  return domainAccessor;
}

- (id)currentLocale
{
  id v3 = (id)[(NPSDomainAccessor *)self->_globalDomainAccessor synchronize];
  globalDomainAccessor = self->_globalDomainAccessor;

  return (id)[(NPSDomainAccessor *)globalDomainAccessor objectForKey:@"AppleLocale"];
}

- (BOOL)shouldUseiCloud
{
  return 0;
}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  HAInitializeLogging();
  objc_super v8 = [NSString stringWithFormat:@"Setting nano value %@ - %@", v7, v6];
  v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HANanoSettings setValue:forPreferenceKey:]", 1232, v8];
  v10 = (os_log_t *)MEMORY[0x263F47290];
  v11 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v9;
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    uint64_t v29 = [v12 UTF8String];
    _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v14 = [(HANanoSettings *)self nanoDomainAccessor];
  [v14 setObject:v6 forKey:v7];
  v15 = [v14 synchronize];
  if (v15)
  {
    HAInitializeLogging();
    v16 = [NSString stringWithFormat:@"Error synchronizing accessor %@", v15];
    v17 = [NSString stringWithFormat:@"%s:%d %@", "-[HANanoSettings setValue:forPreferenceKey:]", 1238, v16];
    os_log_t v18 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v17;
      v20 = v18;
      uint64_t v21 = [v19 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v29 = v21;
      _os_log_impl(&dword_20CC86000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  v22 = objc_opt_new();
  uint64_t v23 = *MEMORY[0x263F8B1E8];
  v24 = (void *)MEMORY[0x263EFFA08];
  id v27 = v7;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  v26 = [v24 setWithArray:v25];
  [v22 synchronizeNanoDomain:v23 keys:v26];
}

- (id)_valueForPreferenceKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HANanoSettings *)self nanoDomainAccessor];
  id v6 = [v5 synchronize];
  if (v6)
  {
    HAInitializeLogging();
    id v7 = [NSString stringWithFormat:@"Error synchronizing accessor %@", v6];
    objc_super v8 = [NSString stringWithFormat:@"%s:%d %@", "-[HANanoSettings _valueForPreferenceKey:]", 1251, v7];
    v9 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      v11 = v9;
      *(_DWORD *)buf = 136446210;
      uint64_t v15 = [v10 UTF8String];
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  id v12 = [v5 objectForKey:v4];

  return v12;
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (NPSDomainAccessor)globalDomainAccessor
{
  return self->_globalDomainAccessor;
}

- (void)setGlobalDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalDomainAccessor, 0);

  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end