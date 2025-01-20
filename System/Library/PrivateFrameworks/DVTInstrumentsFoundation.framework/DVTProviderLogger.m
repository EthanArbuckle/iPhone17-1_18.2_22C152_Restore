@interface DVTProviderLogger
- (DVTProviderLogger)initWithProviderName:(id)a3;
- (NSArray)errors;
- (NSArray)warnings;
- (void)failWithReason:(id)a3;
- (void)warnWithMessage:(id)a3;
@end

@implementation DVTProviderLogger

- (DVTProviderLogger)initWithProviderName:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DVTProviderLogger;
  v6 = [(DVTProviderLogger *)&v12 init];
  if (v6)
  {
    if (qword_268707DD0 != -1) {
      dispatch_once(&qword_268707DD0, &unk_26E5159A8);
    }
    objc_storeStrong((id *)&v6->_log, (id)qword_268707DC8);
    objc_storeStrong((id *)&v6->_providerName, a3);
    uint64_t v7 = objc_opt_new();
    errors = v6->_errors;
    v6->_errors = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    warnings = v6->_warnings;
    v6->_warnings = (NSMutableArray *)v9;
  }
  return v6;
}

- (NSArray)errors
{
  v2 = (void *)[(NSMutableArray *)self->_errors copy];
  return (NSArray *)v2;
}

- (NSArray)warnings
{
  v2 = (void *)[(NSMutableArray *)self->_warnings copy];
  return (NSArray *)v2;
}

- (void)failWithReason:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F087E8];
  v10[0] = *MEMORY[0x263F08320];
  v10[1] = @"DVTKtraceSessionProviderName";
  providerName = self->_providerName;
  v11[0] = v4;
  v11[1] = providerName;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v8 = [v5 errorWithDomain:@"com.apple.dt.ktrace_recording.provider" code:1 userInfo:v7];

  [(NSMutableArray *)self->_errors addObject:v8];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    sub_23093C8E8((uint64_t)v4, log);
  }
}

- (void)warnWithMessage:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F087E8];
  v12[0] = *MEMORY[0x263F08320];
  v12[1] = @"DVTKtraceSessionProviderName";
  providerName = self->_providerName;
  v13[0] = v4;
  v13[1] = providerName;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v8 = [v5 errorWithDomain:@"com.apple.dt.ktrace_recording.provider" code:1 userInfo:v7];

  [(NSMutableArray *)self->_warnings addObject:v8];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_23087D000, log, OS_LOG_TYPE_DEFAULT, "Provider warning: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warnings, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end