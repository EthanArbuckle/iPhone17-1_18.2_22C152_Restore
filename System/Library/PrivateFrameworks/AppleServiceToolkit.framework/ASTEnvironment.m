@interface ASTEnvironment
+ (BOOL)isInternalBuild;
+ (id)currentEnvironment;
+ (id)environmentWithEnvironmentType:(unint64_t)a3;
+ (void)resetEnvironment;
- (ASTEnvironment)init;
- (ASTEnvironment)initWithEnvironmentType:(unint64_t)a3;
- (NSNumber)SOCKSProxyPort;
- (NSString)SOCKSProxyServer;
- (NSString)configCode;
- (NSString)diagsChannel;
- (NSURL)assetURL;
- (NSURL)serverURL;
- (id)_defaultServerURL;
- (id)_generateServerURL;
- (id)environmentServerString;
- (unint64_t)_defaultServerSelection;
- (unint64_t)environmentType;
- (unint64_t)server;
- (void)_generateServerURL;
- (void)setAssetURL:(id)a3;
- (void)setConfigCode:(id)a3;
- (void)setDiagsChannel:(id)a3;
- (void)setEnvironmentType:(unint64_t)a3;
- (void)setSOCKSProxyPort:(id)a3;
- (void)setSOCKSProxyServer:(id)a3;
- (void)setServer:(unint64_t)a3;
- (void)setServerURL:(id)a3;
@end

@implementation ASTEnvironment

- (ASTEnvironment)init
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    v6 = self;
    __int16 v7 = 2080;
    v8 = "-[ASTEnvironment init]";
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v5, 0x16u);
  }

  return [(ASTEnvironment *)self initWithEnvironmentType:0];
}

- (ASTEnvironment)initWithEnvironmentType:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2080;
    v15 = "-[ASTEnvironment initWithEnvironmentType:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[%@] %s", buf, 0x16u);
  }

  v11.receiver = self;
  v11.super_class = (Class)ASTEnvironment;
  v6 = [(ASTEnvironment *)&v11 init];
  __int16 v7 = v6;
  if (v6)
  {
    v6->_environmentType = a3;
    v6->_server = [(ASTEnvironment *)v6 _defaultServerSelection];
    uint64_t v8 = [(ASTEnvironment *)v7 _generateServerURL];
    serverURL = v7->_serverURL;
    v7->_serverURL = (NSURL *)v8;
  }
  return v7;
}

+ (id)environmentWithEnvironmentType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = a1;
    __int16 v10 = 2080;
    objc_super v11 = "+[ASTEnvironment environmentWithEnvironmentType:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v8, 0x16u);
  }

  v6 = (void *)[objc_alloc((Class)a1) initWithEnvironmentType:a3];

  return v6;
}

+ (id)currentEnvironment
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = a1;
    __int16 v8 = 2080;
    id v9 = "+[ASTEnvironment currentEnvironment]";
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v6, 0x16u);
  }

  if (currentEnvironment_onceToken != -1) {
    dispatch_once(&currentEnvironment_onceToken, &__block_literal_global_6);
  }
  dispatch_sync((dispatch_queue_t)ASTEnvironmentSyncQueue, &__block_literal_global_63);
  v4 = (void *)ASTCurrentEnvironment;

  return v4;
}

uint64_t __36__ASTEnvironment_currentEnvironment__block_invoke()
{
  ASTEnvironmentSyncQueue = (uint64_t)dispatch_queue_create("com.apple.ASTEnvironmentSyncQueue", 0);

  return MEMORY[0x270F9A758]();
}

void __36__ASTEnvironment_currentEnvironment__block_invoke_2()
{
  if (!ASTCurrentEnvironment)
  {
    ASTCurrentEnvironment = [[ASTEnvironment alloc] initWithEnvironmentType:3];
    MEMORY[0x270F9A758]();
  }
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_65);
  }
  return isInternalBuild_isInternal;
}

uint64_t __33__ASTEnvironment_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  if (result) {
    isInternalBuild_isInternal = 1;
  }
  return result;
}

+ (void)resetEnvironment
{
}

uint64_t __34__ASTEnvironment_resetEnvironment__block_invoke()
{
  [(id)ASTCurrentEnvironment setEnvironmentType:3];
  v0 = [(id)ASTCurrentEnvironment _generateServerURL];
  [(id)ASTCurrentEnvironment setServerURL:v0];

  uint64_t v1 = [(id)ASTCurrentEnvironment _defaultServerSelection];
  v2 = (void *)ASTCurrentEnvironment;

  return [v2 setServer:v1];
}

- (void)setServerURL:(id)a3
{
  id v5 = a3;
  if ([(id)objc_opt_class() isInternalBuild])
  {
    self->_server = 5;
    objc_storeStrong((id *)&self->_serverURL, a3);
  }
}

- (void)setServer:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2080;
    objc_super v11 = "-[ASTEnvironment setServer:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v8, 0x16u);
  }

  self->_server = a3;
  int v6 = [(ASTEnvironment *)self _generateServerURL];
  serverURL = self->_serverURL;
  self->_serverURL = v6;
}

- (void)setEnvironmentType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2080;
    objc_super v11 = "-[ASTEnvironment setEnvironmentType:]";
    _os_log_impl(&dword_23CA80000, v5, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v8, 0x16u);
  }

  self->_environmentType = a3;
  int v6 = [(ASTEnvironment *)self _generateServerURL];
  serverURL = self->_serverURL;
  self->_serverURL = v6;
}

- (NSString)diagsChannel
{
  return (NSString *)(id)ASTCurrentDiagsChannel;
}

- (void)setDiagsChannel:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = (char *)a3;
  int v6 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    objc_super v11 = self;
    __int16 v12 = 2080;
    v13 = "-[ASTEnvironment setDiagsChannel:]";
    _os_log_impl(&dword_23CA80000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v10, 0x16u);
  }

  if (([(id)ASTCurrentDiagsChannel isEqualToString:v5] & 1) == 0)
  {
    id v7 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      objc_super v11 = self;
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Updating diags channel to: %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)&ASTCurrentDiagsChannel, a3);
    int v8 = [(ASTEnvironment *)self _generateServerURL];
    serverURL = self->_serverURL;
    self->_serverURL = v8;
  }
}

- (NSString)configCode
{
  return (NSString *)(id)ASTConfigCode;
}

- (void)setConfigCode:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = (char *)a3;
  int v6 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2080;
    objc_super v11 = "-[ASTEnvironment setConfigCode:]";
    _os_log_impl(&dword_23CA80000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v8, 0x16u);
  }

  if (([(id)ASTConfigCode isEqualToString:v5] & 1) == 0)
  {
    id v7 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = self;
      __int16 v10 = 2112;
      objc_super v11 = v5;
      _os_log_impl(&dword_23CA80000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Updating config code to: %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)&ASTConfigCode, a3);
  }
}

- (NSURL)assetURL
{
  return (NSURL *)(id)ASTAssetURL;
}

- (void)setAssetURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    v13 = self;
    __int16 v14 = 2080;
    v15 = "-[ASTEnvironment setAssetURL:]";
    _os_log_impl(&dword_23CA80000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v12, 0x16u);
  }

  id v7 = [(id)ASTAssetURL absoluteString];
  int v8 = [v5 absoluteString];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    __int16 v10 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v11 = [v5 absoluteString];
      int v12 = 138412546;
      v13 = self;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_23CA80000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Updating asset URL to: %@", (uint8_t *)&v12, 0x16u);
    }
    objc_storeStrong((id *)&ASTAssetURL, a3);
  }
}

- (id)environmentServerString
{
  unint64_t v2 = [(ASTEnvironment *)self environmentType];
  if (v2 - 8 > 2) {
    return @"ios";
  }
  else {
    return off_264E7E000[v2 - 8];
  }
}

- (id)_generateServerURL
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2080;
    v24 = "-[ASTEnvironment _generateServerURL]";
    _os_log_impl(&dword_23CA80000, v3, OS_LOG_TYPE_DEFAULT, "[%@] %s", buf, 0x16u);
  }

  switch([(ASTEnvironment *)self server])
  {
    case 1uLL:
      v4 = @"https://idiagnostics-uat.apple.com/%@/v1.6/";
      break;
    case 2uLL:
      v4 = @"https://idiagnostics-it.apple.com/%@/v1.6/";
      break;
    case 3uLL:
      v4 = @"https://idiagnostics-qa.apple.com/%@/v1.6/";
      break;
    case 4uLL:
      v4 = @"https://diagnostics-dev.swe.apple.com";
      break;
    case 5uLL:
      v4 = @"https://idiagnostics.apple.com/%@/v1.6/";
      if ([(id)objc_opt_class() isInternalBuild])
      {
        uint64_t v5 = [(ASTEnvironment *)self _defaultServerURL];
        if (v5) {
          v4 = (__CFString *)v5;
        }
      }
      break;
    case 6uLL:
      v4 = @"https://idiagnostics-reno.apple.com/%@/v1.6/";
      break;
    case 7uLL:
      v4 = @"https://idiagnostics-mdn1.apple.com/%@/v1.6/";
      break;
    case 8uLL:
      v4 = @"https://idiagnostics-nwk1.apple.com/%@/v1.6/";
      break;
    case 9uLL:
      v4 = @"https://idiagnostics-it1.apple.com/%@/v1.6/";
      break;
    case 10uLL:
      v4 = @"https://idiagnostics-it2.apple.com/%@/v1.6/";
      break;
    case 11uLL:
      v4 = @"https://idiagnostics-staging.apple.com/%@/v1.6/";
      break;
    case 12uLL:
      v4 = @"https://idiagnostics-uat1.apple.com/%@/v1.6/";
      break;
    case 13uLL:
      v4 = @" https://idiagnostics-acstage.corp.apple.com/%@/v1.6/";
      break;
    case 14uLL:
      v4 = @"https://idiagnostics-stage1.apple.com/%@/v1.6/";
      break;
    case 15uLL:
      v4 = @"https://idiagnostics-prod2.apple.com/%@/v1.6/";
      break;
    case 16uLL:
      v4 = @"https://idiagnostics-prod2-mdn.apple.com/%@/v1.6/";
      break;
    case 17uLL:
      v4 = @"https://idiagnostics-prod2-rno.apple.com/%@/v1.6/";
      break;
    case 18uLL:
      v4 = @"https://idiagnostics-it4-ause1.apple.com/%@/v1.6/";
      break;
    default:
      v4 = @"https://idiagnostics.apple.com/%@/v1.6/";
      break;
  }
  int v6 = [(ASTEnvironment *)self diagsChannel];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    int v8 = NSString;
    char v9 = [(ASTEnvironment *)self diagsChannel];
    __int16 v10 = [v8 stringWithFormat:@"%@/", v9];
    uint64_t v11 = [(__CFString *)v4 stringByAppendingString:v10];

    v4 = (__CFString *)v11;
  }
  int v12 = NSString;
  id v20 = 0;
  v13 = [(ASTEnvironment *)self environmentServerString];
  __int16 v14 = [v12 stringWithValidatedFormat:v4, @"%@", &v20, v13 validFormatSpecifiers error];
  id v15 = v20;

  if (v15)
  {
    uint64_t v16 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      [(ASTEnvironment *)(uint64_t)v15 _generateServerURL];
    }
  }
  v17 = [NSURL URLWithString:v14];
  v18 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v17;
    _os_log_impl(&dword_23CA80000, v18, OS_LOG_TYPE_DEFAULT, "[%@] New server URL: %@", buf, 0x16u);
  }

  return v17;
}

- (unint64_t)_defaultServerSelection
{
  if (_defaultServerSelection_onceToken != -1) {
    dispatch_once(&_defaultServerSelection_onceToken, &__block_literal_global_78);
  }
  return _defaultServerSelection_server;
}

void __41__ASTEnvironment__defaultServerSelection__block_invoke()
{
  CFPreferencesAppSynchronize(@"com.apple.AppleServiceToolkit");
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"Server", @"com.apple.AppleServiceToolkit");
  if (v0)
  {
    cf = (void *)v0;
    CFTypeID v1 = CFGetTypeID(v0);
    if (v1 == CFNumberGetTypeID())
    {
      _defaultServerSelection_server = [cf unsignedIntegerValue];
    }
    else
    {
      v3 = ASTLogHandleForCategory(0);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __41__ASTEnvironment__defaultServerSelection__block_invoke_cold_2(v3);
      }

      CFRelease(cf);
    }
  }
  else
  {
    unint64_t v2 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __41__ASTEnvironment__defaultServerSelection__block_invoke_cold_1(v2);
    }
  }
}

- (id)_defaultServerURL
{
  if (_defaultServerURL_onceToken != -1) {
    dispatch_once(&_defaultServerURL_onceToken, &__block_literal_global_80);
  }
  unint64_t v2 = (void *)_defaultServerURL_server;

  return v2;
}

uint64_t __35__ASTEnvironment__defaultServerURL__block_invoke()
{
  CFPreferencesAppSynchronize(@"com.apple.AppleServiceToolkit");
  _defaultServerURL_server = (uint64_t)CFPreferencesCopyAppValue(@"CustomServerURL", @"com.apple.AppleServiceToolkit");

  return MEMORY[0x270F9A758]();
}

- (unint64_t)environmentType
{
  return self->_environmentType;
}

- (unint64_t)server
{
  return self->_server;
}

- (NSURL)serverURL
{
  return self->_serverURL;
}

- (NSString)SOCKSProxyServer
{
  return self->_SOCKSProxyServer;
}

- (void)setSOCKSProxyServer:(id)a3
{
}

- (NSNumber)SOCKSProxyPort
{
  return self->_SOCKSProxyPort;
}

- (void)setSOCKSProxyPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SOCKSProxyPort, 0);
  objc_storeStrong((id *)&self->_SOCKSProxyServer, 0);

  objc_storeStrong((id *)&self->_serverURL, 0);
}

- (void)_generateServerURL
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23CA80000, a2, OS_LOG_TYPE_FAULT, "Invalid server format string: %@", (uint8_t *)&v2, 0xCu);
}

void __41__ASTEnvironment__defaultServerSelection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)CFTypeID v1 = 0;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "Service Selection is not available", v1, 2u);
}

void __41__ASTEnvironment__defaultServerSelection__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)CFTypeID v1 = 0;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "Service Selection is not in valid type", v1, 2u);
}

@end