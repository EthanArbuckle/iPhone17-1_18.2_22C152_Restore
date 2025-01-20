@interface NEProvider
+ (BOOL)isNEProviderBundle:(id)a3 forExtensionPoint:(id)a4;
+ (BOOL)isRunningInProvider;
+ (void)startSystemExtensionMode;
- (NEExtensionProviderContext)context;
- (NEProvider)init;
- (NSString)appName;
- (NWPath)defaultPath;
- (NWTCPConnection)createTCPConnectionToEndpoint:(NWEndpoint *)remoteEndpoint enableTLS:(BOOL)enableTLS TLSParameters:(NWTLSParameters *)TLSParameters delegate:(id)delegate;
- (NWUDPSession)createUDPSessionToEndpoint:(NWEndpoint *)remoteEndpoint fromEndpoint:(NWHostEndpoint *)localEndpoint;
- (id)initAllowUnentitled:(BOOL)a3;
- (int64_t)_callSwiftHandleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)dealloc;
- (void)displayMessage:(NSString *)message completionHandler:(void *)completionHandler;
- (void)observerHelperHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppName:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefaultPath:(id)a3;
- (void)setdefaultPathObserver:(id)a3;
- (void)sleepWithCompletionHandler:(void *)completionHandler;
- (void)wake;
@end

@implementation NEProvider

- (int64_t)_callSwiftHandleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  int64_t v7 = sub_19DDC35D8((uint64_t)v5);

  swift_unknownObjectRelease();
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultPathEvaluator, 0);

  objc_storeStrong((id *)&self->_defaultPath, 0);
}

- (void)setAppName:(id)a3
{
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContext:(id)a3
{
}

- (NEExtensionProviderContext)context
{
  return (NEExtensionProviderContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDefaultPath:(id)a3
{
}

- (NWPath)defaultPath
{
  return (NWPath *)objc_getProperty(self, a2, 8, 1);
}

- (void)displayMessage:(NSString *)message completionHandler:(void *)completionHandler
{
  v11 = message;
  v6 = completionHandler;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v11
    && (isKindOfClass & 1) == 0
    && ([(NEProvider *)self appName], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    v9 = [(NEProvider *)self context];
    v10 = [(NEProvider *)self appName];
    [v9 displayMessage:v10 message:v11 completionHandler:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (NWUDPSession)createUDPSessionToEndpoint:(NWEndpoint *)remoteEndpoint fromEndpoint:(NWHostEndpoint *)localEndpoint
{
  id v5 = localEndpoint;
  v6 = (objc_class *)MEMORY[0x1E4F38C10];
  int64_t v7 = remoteEndpoint;
  id v8 = objc_alloc_init(v6);
  if (v5)
  {
    v9 = (void *)MEMORY[0x1E4F38BC8];
    v10 = [(NWHostEndpoint *)v5 hostname];
    v11 = [(NWHostEndpoint *)v5 port];
    v12 = [v9 endpointWithHostname:v10 port:v11];
    [v8 setLocalAddress:v12];
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F38C48]) initWithEndpoint:v7 parameters:v8];

  return (NWUDPSession *)v13;
}

- (NWTCPConnection)createTCPConnectionToEndpoint:(NWEndpoint *)remoteEndpoint enableTLS:(BOOL)enableTLS TLSParameters:(NWTLSParameters *)TLSParameters delegate:(id)delegate
{
  BOOL v7 = enableTLS;
  v9 = TLSParameters;
  v10 = (objc_class *)MEMORY[0x1E4F38C10];
  id v11 = delegate;
  v12 = remoteEndpoint;
  id v13 = objc_alloc_init(v10);
  [v13 setEnableTLS:v7];
  if (v9 && v7)
  {
    v14 = [(NWTLSParameters *)v9 TLSSessionID];
    [v13 setTLSSessionID:v14];

    v15 = [(NWTLSParameters *)v9 SSLCipherSuites];
    [v13 setSSLCipherSuites:v15];

    objc_msgSend(v13, "setMinimumSSLProtocolVersion:", -[NWTLSParameters minimumSSLProtocolVersion](v9, "minimumSSLProtocolVersion"));
    objc_msgSend(v13, "setMaximumSSLProtocolVersion:", -[NWTLSParameters maximumSSLProtocolVersion](v9, "maximumSSLProtocolVersion"));
  }
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F38C40]) initWithEndpoint:v12 parameters:v13 delegate:v11];

  return (NWTCPConnection *)v16;
}

- (void)wake
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@: Waking", (uint8_t *)&v4, 0xCu);
  }
}

- (void)sleepWithCompletionHandler:(void *)completionHandler
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = completionHandler;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    BOOL v7 = self;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: Sleeping", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4);
}

- (void)observerHelperHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v17 = a3;
  id v9 = a4;
  id v11 = a5;
  if (self) {
    id Property = objc_getProperty(self, v10, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v13 = Property;
  if (v13 == v9)
  {
    int v14 = [v17 isEqualToString:@"path"];

    if (!v14) {
      goto LABEL_9;
    }
    if (self) {
      id v16 = objc_getProperty(self, v15, 16, 1);
    }
    else {
      id v16 = 0;
    }
    id v13 = [v16 path];
    [(NEProvider *)self setDefaultPath:v13];
  }

LABEL_9:
}

- (void)setdefaultPathObserver:(id)a3
{
  id Property = (const char *)a3;
  id v5 = Property;
  if (self)
  {
    int v6 = Property;
    id Property = (const char *)objc_getProperty(self, Property, 16, 1);
    id v5 = v6;
    if (v6)
    {
      if (Property)
      {
        id Property = (const char *)[(NWPathEvaluator *)self->_defaultPathEvaluator addObserver:v6 forKeyPath:@"path" options:5 context:0];
        id v5 = v6;
      }
    }
  }

  MEMORY[0x1F41817F8](Property, v5);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  [(NEProvider *)self setContext:a3];
  if (self)
  {
    id v5 = objc_getProperty(self, v4, 16, 1);
    if (v5)
    {
      int v6 = v5;
      BOOL v7 = [(NEProvider *)self context];

      if (v7)
      {
        defaultPathEvaluator = self->_defaultPathEvaluator;
        id v9 = [(NEProvider *)self context];
        [(NWPathEvaluator *)defaultPathEvaluator addObserver:v9 forKeyPath:@"path" options:5 context:0];
      }
    }
  }
}

- (void)dealloc
{
  [(NEProvider *)self setDefaultPath:0];
  if (self && objc_getProperty(self, v3, 16, 1))
  {
    int v4 = [(NEProvider *)self context];

    if (v4)
    {
      id v6 = objc_getProperty(self, v5, 16, 1);
      BOOL v7 = [(NEProvider *)self context];
      [v6 removeObserver:v7 forKeyPath:@"path"];
    }
    objc_setProperty_atomic(self, v5, 0, 16);
  }
  v8.receiver = self;
  v8.super_class = (Class)NEProvider;
  [(NEProvider *)&v8 dealloc];
}

- (id)initAllowUnentitled:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = SecTaskCreateFromSelf(0);
  if (!v5)
  {
    if (!a3) {
      goto LABEL_11;
    }
LABEL_14:
    if (!+[NEProvider isRunningInProvider])
    {
      id v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v12 = "NEProvider objects cannot be instantiated from non-extension processes";
        id v13 = v11;
        uint32_t v14 = 2;
        goto LABEL_24;
      }
LABEL_18:

LABEL_19:
      id v16 = 0;
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  id v6 = v5;
  CFTypeRef v7 = SecTaskCopyValueForEntitlement(v5, @"com.apple.developer.networking.networkextension", 0);
  CFTypeRef v8 = v7;
  if (v7) {
    CFRelease(v7);
  }
  id v9 = (void *)SecTaskCopyValueForEntitlement(v6, @"com.apple.private.neagent", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v10 = [v9 BOOLValue];
  }
  else {
    char v10 = 0;
  }
  CFRelease(v6);

  if (!v8 && !a3)
  {
LABEL_11:
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "com.apple.developer.networking.networkextension";
      v12 = "NEProvider creation failed, caller does not have the %s entitlement";
      id v13 = v11;
      uint32_t v14 = 12;
LABEL_24:
      _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if ((v10 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  v19.receiver = self;
  v19.super_class = (Class)NEProvider;
  v15 = [(NEProvider *)&v19 init];
  if (!v15)
  {
    ne_log_obj();
    self = (NEProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, &self->super, OS_LOG_TYPE_INFO, "Failed to init NEProvider", buf, 2u);
    }
    goto LABEL_19;
  }
  id v16 = (NEProvider **)v15;
  uint64_t v17 = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
  self = v16[2];
  v16[2] = (NEProvider *)v17;
LABEL_20:

  return v16;
}

- (NEProvider)init
{
  return (NEProvider *)[(NEProvider *)self initAllowUnentitled:0];
}

+ (BOOL)isNEProviderBundle:(id)a3 forExtensionPoint:(id)a4
{
  id v5 = a4;
  id v6 = [a3 infoDictionary];
  if (isa_nsdictionary(v6))
  {
    CFTypeRef v7 = [v6 objectForKeyedSubscript:@"CFBundlePackageType"];
    if (!isa_nsstring(v7) || ![v7 isEqualToString:@"XPC!"])
    {
      BOOL v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
    CFTypeRef v8 = [v6 objectForKeyedSubscript:@"NSExtension"];
    if (!isa_nsdictionary(v8))
    {
      BOOL v10 = 0;
LABEL_15:

      goto LABEL_16;
    }
    id v9 = [v8 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
    if (isa_nsstring(v9))
    {
      if (v5)
      {
        if ([v9 isEqualToString:v5])
        {
LABEL_8:
          BOOL v10 = 1;
LABEL_14:

          goto LABEL_15;
        }
      }
      else if ([v9 hasPrefix:@"com.apple.networkextension."])
      {
        goto LABEL_8;
      }
    }
    BOOL v10 = 0;
    goto LABEL_14;
  }
  BOOL v10 = 0;
LABEL_17:

  return v10;
}

+ (BOOL)isRunningInProvider
{
  if (isRunningInProvider_check_init != -1) {
    dispatch_once(&isRunningInProvider_check_init, &__block_literal_global_21599);
  }
  return isRunningInProvider_callerIsProvider;
}

void __33__NEProvider_isRunningInProvider__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  isRunningInProvider_callerIsProvider = +[NEProvider isNEProviderBundle:v0 forExtensionPoint:0];
}

+ (void)startSystemExtensionMode
{
  id v2 = +[NEProviderServer sharedServer];
  [v2 start];
}

@end