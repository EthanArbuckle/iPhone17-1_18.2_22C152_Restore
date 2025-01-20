@interface HLPURLSessionACAuthContext
+ (id)defaultContext;
- (HLPURLSessionACAuthContext)initWithAppIdentifier:(id)a3 enviromentIdentifier:(id)a4 interactivity:(id)a5;
- (NSString)appIdentifier;
- (NSString)clientIdentifier;
- (NSString)enviromentIdentifier;
- (NSString)interactivityMode;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setEnviromentIdentifier:(id)a3;
- (void)setInteractivityMode:(id)a3;
@end

@implementation HLPURLSessionACAuthContext

+ (id)defaultContext
{
  if (defaultContext_onceToken != -1) {
    dispatch_once(&defaultContext_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)defaultContext_context;
  return v2;
}

uint64_t __44__HLPURLSessionACAuthContext_defaultContext__block_invoke()
{
  defaultContext_context = [[HLPURLSessionACAuthContext alloc] initWithAppIdentifier:@"170617" enviromentIdentifier:@"APPLECONNECT.APPLE.COM" interactivity:@"0"];
  return MEMORY[0x270F9A758]();
}

- (HLPURLSessionACAuthContext)initWithAppIdentifier:(id)a3 enviromentIdentifier:(id)a4 interactivity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HLPURLSessionACAuthContext;
  v12 = [(HLPURLSessionACAuthContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appIdentifier, a3);
    objc_storeStrong((id *)&v13->_enviromentIdentifier, a4);
    objc_storeStrong((id *)&v13->_interactivityMode, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HLPURLSessionACAuthContext *)self appIdentifier];
  [v4 setAppIdentifier:v5];

  v6 = [(HLPURLSessionACAuthContext *)self enviromentIdentifier];
  [v4 setEnviromentIdentifier:v6];

  v7 = [(HLPURLSessionACAuthContext *)self interactivityMode];
  [v4 setInteractivityMode:v7];

  v8 = [(HLPURLSessionACAuthContext *)self clientIdentifier];
  [v4 setClientIdentifier:v8];

  return v4;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)enviromentIdentifier
{
  return self->_enviromentIdentifier;
}

- (void)setEnviromentIdentifier:(id)a3
{
}

- (NSString)interactivityMode
{
  return self->_interactivityMode;
}

- (void)setInteractivityMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactivityMode, 0);
  objc_storeStrong((id *)&self->_enviromentIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end