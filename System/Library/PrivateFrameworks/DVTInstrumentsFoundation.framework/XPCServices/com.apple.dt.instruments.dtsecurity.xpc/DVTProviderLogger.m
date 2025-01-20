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
    if (qword_100019638 != -1) {
      dispatch_once(&qword_100019638, &stru_100014B48);
    }
    objc_storeStrong((id *)&v6->_log, (id)qword_100019630);
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
  id v2 = [(NSMutableArray *)self->_errors copy];
  return (NSArray *)v2;
}

- (NSArray)warnings
{
  id v2 = [(NSMutableArray *)self->_warnings copy];
  return (NSArray *)v2;
}

- (void)failWithReason:(id)a3
{
  id v4 = a3;
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = @"DVTKtraceSessionProviderName";
  providerName = self->_providerName;
  v10[0] = v4;
  v10[1] = providerName;
  v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v7 = +[NSError errorWithDomain:@"com.apple.dt.ktrace_recording.provider" code:1 userInfo:v6];

  [(NSMutableArray *)self->_errors addObject:v7];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    sub_10000DFD0((uint64_t)v4, log);
  }
}

- (void)warnWithMessage:(id)a3
{
  id v4 = a3;
  v11[0] = NSLocalizedDescriptionKey;
  v11[1] = @"DVTKtraceSessionProviderName";
  providerName = self->_providerName;
  v12[0] = v4;
  v12[1] = providerName;
  v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v7 = +[NSError errorWithDomain:@"com.apple.dt.ktrace_recording.provider" code:1 userInfo:v6];

  [(NSMutableArray *)self->_warnings addObject:v7];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Provider warning: %@", (uint8_t *)&v9, 0xCu);
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