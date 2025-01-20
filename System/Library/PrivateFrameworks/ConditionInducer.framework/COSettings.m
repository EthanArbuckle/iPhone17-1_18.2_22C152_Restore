@interface COSettings
- (BOOL)createSettingsFile;
- (BOOL)readSettings;
- (BOOL)startMonitoringForFileDeletion;
- (BOOL)writeSettings;
- (COSettings)init;
- (COSettings)initWithURL:(id)a3;
- (NSMutableDictionary)settings;
- (NSURL)path;
- (NSURL)url;
- (OS_dispatch_source)source;
- (id)clientCallback;
- (id)objectForKey:(id)a3;
- (void)createSettingsFile;
- (void)removeObjectForKey:(id)a3;
- (void)setClientCallback:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setSettings:(id)a3;
- (void)setSource:(id)a3;
- (void)setUrl:(id)a3;
- (void)startMonitoringForChanges:(id)a3;
- (void)stopMonitoringForFileDeletion;
@end

@implementation COSettings

- (COSettings)init
{
  return [(COSettings *)self initWithURL:0];
}

- (COSettings)initWithURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COSettings;
  v5 = [(COSettings *)&v13 init];
  if (!v5) {
    goto LABEL_6;
  }
  if (v4)
  {
    v6 = (NSURL *)v4;
  }
  else
  {
    v6 = [NSURL fileURLWithFileSystemRepresentation:objc_msgSend(@"/var/mobile/Library/Preferences/com.apple.ConditionInducer.plist", "UTF8String"), 0, 0 isDirectory relativeToURL];
  }
  url = v5->_url;
  v5->_url = v6;

  source = v5->_source;
  v5->_source = 0;

  id clientCallback = v5->_clientCallback;
  v5->_id clientCallback = 0;

  settings = v5->_settings;
  v5->_settings = 0;

  v11 = 0;
  if ([(COSettings *)v5 createSettingsFile]) {
LABEL_6:
  }
    v11 = v5;

  return v11;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(COSettings *)self settings];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(COSettings *)self settings];
  [v8 setObject:v7 forKeyedSubscript:v6];

  [(COSettings *)self writeSettings];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(COSettings *)self settings];
  [v5 removeObjectForKey:v4];

  [(COSettings *)self writeSettings];
}

- (void)startMonitoringForChanges:(id)a3
{
  [(COSettings *)self setClientCallback:a3];

  [(COSettings *)self startMonitoringForFileDeletion];
}

- (BOOL)createSettingsFile
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(COSettings *)self url];
  v5 = [v4 path];
  if ([v3 fileExistsAtPath:v5])
  {
    BOOL v6 = [(COSettings *)self readSettings];

    if (v6)
    {
      BOOL v7 = 1;
      goto LABEL_10;
    }
  }
  else
  {
  }
  v8 = [(COSettings *)self url];
  v9 = [v8 path];
  int v10 = [v3 fileExistsAtPath:v9];

  if (v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COSettings createSettingsFile](self);
    }
    BOOL v7 = 0;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263EFF9A0]);
    v12 = (void *)[v11 initWithDictionary:MEMORY[0x263EFFA78]];
    [(COSettings *)self setSettings:v12];

    BOOL v7 = [(COSettings *)self writeSettings];
  }
LABEL_10:

  return v7;
}

- (BOOL)writeSettings
{
  v3 = dispatch_get_global_queue(-2, 0);
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__COSettings_writeSettings__block_invoke;
  v5[3] = &unk_264935BC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return (char)self;
}

void __27__COSettings_writeSettings__block_invoke(uint64_t a1)
{
  v16[2] = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) settings];
  id v4 = [*v2 url];
  id v14 = 0;
  char v5 = [v3 writeToURL:v4 error:&v14];
  id v6 = v14;

  if (v5)
  {
    BOOL v7 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v8 = *MEMORY[0x263F08028];
    v15[0] = *MEMORY[0x263F08060];
    v15[1] = v8;
    v16[0] = @"mobile";
    v16[1] = @"mobile";
    char v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    int v10 = [*v2 url];
    id v11 = [v10 path];
    id v13 = v6;
    [v7 setAttributes:v9 ofItemAtPath:v11 error:&v13];
    id v12 = v13;

    if (v12)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __27__COSettings_writeSettings__block_invoke_cold_1(v2);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __27__COSettings_writeSettings__block_invoke_cold_2(v2);
    }
  }
}

- (BOOL)readSettings
{
  v3 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__COSettings_readSettings__block_invoke;
  block[3] = &unk_264935B78;
  block[4] = self;
  dispatch_sync(v3, block);
  id v4 = [(COSettings *)self settings];
  LOBYTE(self) = v4 != 0;

  return (char)self;
}

void __26__COSettings_readSettings__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF9A0]);
  v3 = [*(id *)(a1 + 32) url];
  id v4 = (void *)[v2 initWithContentsOfURL:v3];
  [*(id *)(a1 + 32) setSettings:v4];

  char v5 = [*(id *)(a1 + 32) clientCallback];

  if (v5)
  {
    BOOL v7 = [*(id *)(a1 + 32) clientCallback];
    id v6 = [*(id *)(a1 + 32) settings];
    v7[2](v7, v6);
  }
}

- (void)stopMonitoringForFileDeletion
{
  v3 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__COSettings_stopMonitoringForFileDeletion__block_invoke;
  block[3] = &unk_264935B78;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __43__COSettings_stopMonitoringForFileDeletion__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) source];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) source];
    dispatch_source_cancel(v3);
  }
}

- (BOOL)startMonitoringForFileDeletion
{
  v3 = dispatch_get_global_queue(-2, 0);
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__COSettings_startMonitoringForFileDeletion__block_invoke;
  block[3] = &unk_264935C38;
  block[4] = self;
  id v8 = v3;
  char v9 = &v10;
  id v4 = v3;
  dispatch_sync(v4, block);
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __44__COSettings_startMonitoringForFileDeletion__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) url];
  unsigned int v3 = open((const char *)[v2 fileSystemRepresentation], 0x8000);

  if ((v3 & 0x80000000) != 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __44__COSettings_startMonitoringForFileDeletion__block_invoke_cold_1();
    }
  }
  else
  {
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x263EF8410], v3, 1uLL, *(dispatch_queue_t *)(a1 + 40));
    [*(id *)(a1 + 32) setSource:v4];

    char v5 = [*(id *)(a1 + 32) source];

    if (v5)
    {
      objc_initWeak(location, *(id *)(a1 + 32));
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __44__COSettings_startMonitoringForFileDeletion__block_invoke_8;
      v12[3] = &unk_264935BF0;
      objc_copyWeak(&v13, location);
      unsigned int v14 = v3;
      id v6 = (void *)MEMORY[0x230F76E70](v12);
      BOOL v7 = [*(id *)(a1 + 32) source];
      dispatch_source_set_event_handler(v7, v6);

      id v8 = [*(id *)(a1 + 32) source];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __44__COSettings_startMonitoringForFileDeletion__block_invoke_2;
      handler[3] = &__block_descriptor_36_e5_v8__0l;
      unsigned int v11 = v3;
      dispatch_source_set_cancel_handler(v8, handler);

      char v9 = [*(id *)(a1 + 32) source];
      dispatch_resume(v9);

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }
    else
    {
      close(v3);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Could Not Dispatch Source Create", (uint8_t *)location, 2u);
      }
    }
  }
}

void __44__COSettings_startMonitoringForFileDeletion__block_invoke_8(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    close(*(_DWORD *)(a1 + 40));
    id v4 = objc_loadWeakRetained(v2);
    [v4 readSettings];

    id v5 = objc_loadWeakRetained(v2);
    [v5 startMonitoringForFileDeletion];
  }
}

uint64_t __44__COSettings_startMonitoringForFileDeletion__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (NSURL)path
{
  return self->_path;
}

- (NSMutableDictionary)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (id)clientCallback
{
  return self->_clientCallback;
}

- (void)setClientCallback:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_clientCallback, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (void)createSettingsFile
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = [a1 url];
  id v2 = [v1 path];
  int v3 = 138412290;
  id v4 = v2;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to read plist at %@", (uint8_t *)&v3, 0xCu);
}

void __27__COSettings_writeSettings__block_invoke_cold_1(id *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [*a1 url];
  id v2 = [v1 path];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to set attributes on %@: %@", v3, 0x16u);
}

void __27__COSettings_writeSettings__block_invoke_cold_2(id *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [*a1 url];
  id v2 = [v1 path];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to write plist to %@ %@", v3, 0x16u);
}

void __44__COSettings_startMonitoringForFileDeletion__block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could Not Open Settings File", v0, 2u);
}

@end