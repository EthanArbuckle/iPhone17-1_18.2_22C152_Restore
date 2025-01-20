@interface CSLPRFTwoWaySyncSetting
- (CSLPRFTwoWaySyncSetting)initWithKey:(id)a3 defaultValue:(id)a4 notification:(const char *)a5;
- (CSLPRFTwoWaySyncSettingDelegate)delegate;
- (NSString)key;
- (id)defaultValue;
- (id)description;
- (id)domainAccessor;
- (id)safeValueOfType:(Class)a3;
- (id)syncManager;
- (id)value;
- (void)dealloc;
- (void)didUpdate;
- (void)handleDidUnpair;
- (void)migrate:(id)a3 withMapping:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CSLPRFTwoWaySyncSetting

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (NSString)key
{
  return self->_key;
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFTwoWaySyncSettingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFTwoWaySyncSettingDelegate *)WeakRetained;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  v5 = [(CSLPRFTwoWaySyncSetting *)self domainAccessor];
  [v5 setObject:v4 forKey:self->_key];

  v6 = [(CSLPRFTwoWaySyncSetting *)self domainAccessor];
  id v7 = (id)[v6 synchronize];

  v8 = [(CSLPRFTwoWaySyncSetting *)self syncManager];
  v9 = [MEMORY[0x263EFFA08] setWithObject:self->_key];
  [v8 synchronizeNanoDomain:@"com.apple.Carousel" keys:v9];

  notificationName = self->_notificationName;
  if (notificationName)
  {
    notify_post(notificationName);
  }
}

- (id)safeValueOfType:(Class)a3
{
  v5 = [(CSLPRFTwoWaySyncSetting *)self domainAccessor];
  id v6 = (id)[v5 synchronize];

  id v7 = [(CSLPRFTwoWaySyncSetting *)self domainAccessor];
  v8 = [v7 objectForKey:self->_key];

  if (a3 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v8 = 0;
    id defaultValue = self->_defaultValue;
    goto LABEL_7;
  }
  id defaultValue = v8;
  if (!v8) {
    goto LABEL_6;
  }
LABEL_7:
  id v10 = defaultValue;

  return v10;
}

- (id)value
{
  v3 = [(CSLPRFTwoWaySyncSetting *)self domainAccessor];
  id v4 = (id)[v3 synchronize];

  v5 = [(CSLPRFTwoWaySyncSetting *)self domainAccessor];
  id v6 = [v5 objectForKey:self->_key];

  id defaultValue = v6;
  if (!v6) {
    id defaultValue = self->_defaultValue;
  }
  id v8 = defaultValue;

  return v8;
}

- (void)handleDidUnpair
{
  domainAccessor = self->_domainAccessor;
  self->_domainAccessor = 0;

  syncManager = self->_syncManager;
  self->_syncManager = 0;
}

- (id)syncManager
{
  syncManager = self->_syncManager;
  if (!syncManager)
  {
    id v4 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    v5 = self->_syncManager;
    self->_syncManager = v4;

    syncManager = self->_syncManager;
  }
  return syncManager;
}

- (id)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    id v4 = (NPSDomainAccessor *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.Carousel"];
    v5 = self->_domainAccessor;
    self->_domainAccessor = v4;

    domainAccessor = self->_domainAccessor;
  }
  return domainAccessor;
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 removeObserver:self forKeyPath:self->_key];

  notificationName = self->_notificationName;
  if (notificationName) {
    free(notificationName);
  }
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFTwoWaySyncSetting;
  [(CSLPRFTwoWaySyncSetting *)&v6 dealloc];
}

- (void)migrate:(id)a3 withMapping:(id)a4
{
  id v14 = a3;
  objc_super v6 = (void (**)(id, void *))a4;
  id v7 = [(CSLPRFTwoWaySyncSetting *)self domainAccessor];
  id v8 = (id)[v7 synchronize];

  v9 = [(CSLPRFTwoWaySyncSetting *)self domainAccessor];
  id v10 = [v9 objectForKey:self->_key];

  if (!v10)
  {
    v11 = [(CSLPRFTwoWaySyncSetting *)self domainAccessor];
    v12 = [v11 objectForKey:v14];

    if (v12)
    {
      v13 = v6[2](v6, v12);
      [(CSLPRFTwoWaySyncSetting *)self setValue:v13];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  id v8 = [(CSLPRFTwoWaySyncSetting *)self key];
  int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    [(CSLPRFTwoWaySyncSetting *)self didUpdate];
  }
}

- (void)didUpdate
{
  id v3 = [(CSLPRFTwoWaySyncSetting *)self delegate];
  [v3 twoWaySyncSettingDidUpdate:self];
}

- (id)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(CSLPRFTwoWaySyncSetting *)self key];
  [v3 appendString:v4 withName:@"key"];

  v5 = [(CSLPRFTwoWaySyncSetting *)self value];
  id v6 = (id)[v3 appendObject:v5 withName:@"value"];

  id v7 = [(CSLPRFTwoWaySyncSetting *)self defaultValue];
  id v8 = (id)[v3 appendObject:v7 withName:@"default"];

  int v9 = [v3 build];

  return v9;
}

- (CSLPRFTwoWaySyncSetting)initWithKey:(id)a3 defaultValue:(id)a4 notification:(const char *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CSLPRFTwoWaySyncSetting;
  v11 = [(CSLPRFTwoWaySyncSetting *)&v27 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_key, a3);
    objc_storeStrong(&v12->_defaultValue, a4);
    v12->_int notifyToken = -1;
    if (a5)
    {
      size_t v13 = strnlen(a5, 0x3FFuLL) + 1;
      id v14 = (char *)malloc_type_calloc(v13, 1uLL, 0x100004077774924uLL);
      v12->_notificationName = v14;
      strlcpy(v14, a5, v13);
      objc_initWeak(&location, v12);
      v15 = cslprf_settings_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        notificationName = v12->_notificationName;
        *(_DWORD *)buf = 138412546;
        v29 = v12;
        __int16 v30 = 2080;
        v31 = notificationName;
        _os_log_impl(&dword_22F4EA000, v15, OS_LOG_TYPE_INFO, "%@ registering to receive %s", buf, 0x16u);
      }

      id v17 = MEMORY[0x263EF83A0];
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      v23 = __65__CSLPRFTwoWaySyncSetting_initWithKey_defaultValue_notification___block_invoke;
      v24 = &unk_264A0B010;
      objc_copyWeak(&v25, &location);
      notify_register_dispatch(a5, &v12->_notifyToken, MEMORY[0x263EF83A0], &v21);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    v18 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", v21, v22, v23, v24);
    [v18 addObserver:v12 forKeyPath:v9 options:1 context:0];

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v12 selector:sel_handleDidUnpair name:*MEMORY[0x263F576B8] object:0];
  }
  return v12;
}

void __65__CSLPRFTwoWaySyncSetting_initWithKey_defaultValue_notification___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = cslprf_settings_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = WeakRetained[2];
      int v4 = 138412546;
      v5 = WeakRetained;
      __int16 v6 = 2080;
      uint64_t v7 = v3;
      _os_log_impl(&dword_22F4EA000, v2, OS_LOG_TYPE_INFO, "%@ received %s", (uint8_t *)&v4, 0x16u);
    }

    [WeakRetained didUpdate];
  }
}

@end