@interface DEDConfiguration
+ (id)sharedInstance;
- (NSXPCListener)anonymousListener;
- (const)loggingSubsystem;
- (id)dedDirectory;
- (id)errorDomain;
- (id)identifier;
- (id)machServiceName;
- (id)sharedAnonymousListener;
- (unint64_t)connectionType;
- (void)dedDirectory;
- (void)invalidateTestListeners;
- (void)setAnonymousListener:(id)a3;
- (void)sharedAnonymousListener;
@end

@implementation DEDConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_shared_0;
  return v2;
}

uint64_t __34__DEDConfiguration_sharedInstance__block_invoke()
{
  sharedInstance_shared_0 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)errorDomain
{
  v2 = NSString;
  v3 = [(DEDConfiguration *)self identifier];
  v4 = [v2 stringWithFormat:@"%@-error", v3];

  return v4;
}

- (const)loggingSubsystem
{
  id v2 = [(DEDConfiguration *)self identifier];
  v3 = (const char *)[v2 cStringUsingEncoding:4];

  return v3;
}

- (id)machServiceName
{
  return @"com.apple.diagnosticextensionsd.session";
}

- (unint64_t)connectionType
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  v3 = [v2 environment];
  v4 = [v3 objectForKeyedSubscript:@"DED_CONNECTION"];

  unint64_t v5 = v4
    && ([v4 isEqualToString:&stru_26D197018] & 1) == 0
    && ([v4 isEqualToString:@"privileged"] & 1) == 0
    && ([v4 isEqualToString:@"anonymous"] & 1) != 0;

  return v5;
}

- (id)identifier
{
  return @"com.apple.diagnosticextensionsd";
}

- (id)dedDirectory
{
  v3 = [MEMORY[0x263F3A0A0] userLibraryDirectoryForApp:@"Logs"];
  v4 = [(DEDConfiguration *)self identifier];
  unint64_t v5 = [v3 URLByAppendingPathComponent:v4];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v7 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[DEDConfiguration dedDirectory](v7);
    }

    v8 = NSURL;
    v9 = NSHomeDirectory();
    id v6 = [v8 fileURLWithPath:v9 isDirectory:1];
  }
  return v6;
}

- (id)sharedAnonymousListener
{
  v3 = [(DEDConfiguration *)self anonymousListener];

  if (!v3)
  {
    v4 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[DEDConfiguration sharedAnonymousListener](v4);
    }

    unint64_t v5 = [MEMORY[0x263F08D88] anonymousListener];
    [(DEDConfiguration *)self setAnonymousListener:v5];
  }
  id v6 = [(DEDConfiguration *)self anonymousListener];
  return v6;
}

- (void)invalidateTestListeners
{
}

- (NSXPCListener)anonymousListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAnonymousListener:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)dedDirectory
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21FE04000, log, OS_LOG_TYPE_FAULT, "could not build working directory url", v1, 2u);
}

- (void)sharedAnonymousListener
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "creating new sharedAnonymousListener", v1, 2u);
}

@end