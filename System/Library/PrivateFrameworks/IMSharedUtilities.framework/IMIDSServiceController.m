@interface IMIDSServiceController
+ (id)sharedInstance;
- (IMIDSServiceController)init;
- (NSString)debuggingService;
- (void)logIfDebuggingService:(id)a3 method:(const char *)a4;
- (void)setDebuggingService:(id)a3;
@end

@implementation IMIDSServiceController

+ (id)sharedInstance
{
  if (qword_1EB4A6740 != -1) {
    dispatch_once(&qword_1EB4A6740, &unk_1EF2BFA20);
  }
  v2 = (void *)qword_1EB4A66A8;

  return v2;
}

- (IMIDSServiceController)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMIDSServiceController;
  v2 = [(IMIDSServiceController *)&v7 init];
  if (v2)
  {
    v3 = +[IMDefaults sharedInstance];
    uint64_t v4 = [v3 getValueFromDomain:@"com.apple.MobileSMS" forKey:@"debuggingIDSService"];
    debuggingService = v2->_debuggingService;
    v2->_debuggingService = (NSString *)v4;
  }
  return v2;
}

- (void)logIfDebuggingService:(id)a3 method:(const char *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = [(IMIDSServiceController *)self debuggingService];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = IMLogHandleForCategory("IMIDSServiceController");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v11 = 138412802;
      id v12 = v6;
      __int16 v13 = 2080;
      v14 = a4;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Call IDS service [%@], method: [%s], callstack: [%@]", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (NSString)debuggingService
{
  return self->_debuggingService;
}

- (void)setDebuggingService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end