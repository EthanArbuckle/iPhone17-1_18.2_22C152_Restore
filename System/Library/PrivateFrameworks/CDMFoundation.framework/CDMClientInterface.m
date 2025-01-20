@interface CDMClientInterface
- (BOOL)areAssetsAvailable:(id)a3;
- (BOOL)daemonKilled;
- (BOOL)isLighthouseAPIEnabled;
- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4;
- (BOOL)successFromSetup;
- (CDMClientInterface)init;
- (CDMClientInterface)initWithCallingBundleId:(id)a3;
- (CDMClientInterface)initWithDelegate:(id)a3;
- (CDMDataDispatcherContext)dataDispatcherContext;
- (NSError)errorFromSetup;
- (id)createNSError:(id)a3 errorCode:(int64_t)a4;
- (void)doHandleCommand:(id)a3 forCallback:(id)a4;
- (void)doServiceCenterInitWithConfig:(id)a3;
- (void)processCDMNluRequest:(id)a3;
- (void)processCDMNluRequest:(id)a3 completionHandler:(id)a4;
- (void)setDataDispatcherContext:(id)a3;
- (void)setup:(id)a3;
- (void)setup:(id)a3 completionHandler:(id)a4;
- (void)warmupWithCompletionHandler:(id)a3;
@end

@implementation CDMClientInterface

- (BOOL)successFromSetup
{
  return self->successFromSetup;
}

- (NSError)errorFromSetup
{
  return self->errorFromSetup;
}

- (BOOL)daemonKilled
{
  return self->daemonKilled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->errorFromSetup, 0);
}

- (void)setDataDispatcherContext:(id)a3
{
}

- (CDMDataDispatcherContext)dataDispatcherContext
{
  return self->_dataDispatcherContext;
}

- (id)createNSError:(id)a3 errorCode:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CDMClientInterface createNSError:errorCode:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
  }

  v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08320];
  id v12 = v5;
  v8 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v9 = [v7 errorWithDomain:@"CDMClientErrorDomain" code:a4 userInfo:v8];

  return v9;
}

- (BOOL)isLighthouseAPIEnabled
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)doHandleCommand:(id)a3 forCallback:(id)a4
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 raise:v5, @"You must override %@ in a subclass", v6 format];
}

- (void)doServiceCenterInitWithConfig:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"You must override %@ in a subclass", v5 format];
}

- (void)processCDMNluRequest:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"You must override %@ in a subclass", v5 format];
}

- (void)processCDMNluRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 raise:v5, @"You must override %@ in a subclass", v6 format];
}

- (void)warmupWithCompletionHandler:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"You must override %@ in a subclass", v5 format];
}

- (void)setup:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 raise:v5, @"You must override %@ in a subclass", v6 format];
}

- (void)setup:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"You must override %@ in a subclass", v5 format];
}

- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (BOOL)areAssetsAvailable:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CDMClientInterface)initWithCallingBundleId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CDMClientInterface)initWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CDMClientInterface)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end