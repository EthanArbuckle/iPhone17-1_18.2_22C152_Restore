@interface NEFilterProvider
+ (__CFString)descriptionForAction:(uint64_t)a1;
- (NEFilterProviderConfiguration)filterConfiguration;
- (void)handleReport:(NEFilterReport *)report;
- (void)setFilterConfiguration:(id)a3;
- (void)startFilterWithCompletionHandler:(void *)completionHandler;
- (void)stopFilterWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler;
@end

@implementation NEFilterProvider

- (void).cxx_destruct
{
}

- (void)setFilterConfiguration:(id)a3
{
}

- (NEFilterProviderConfiguration)filterConfiguration
{
  return (NEFilterProviderConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)handleReport:(NEFilterReport *)report
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = report;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    v7 = self;
    __int16 v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: handleReport %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)stopFilterWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = completionHandler;
  v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 2048;
    NEProviderStopReason v11 = reason;
    _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "%@: Stop Filter with reason %ld", (uint8_t *)&v8, 0x16u);
  }

  v6[2](v6);
}

- (void)startFilterWithCompletionHandler:(void *)completionHandler
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = completionHandler;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: Start Filter", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, 0);
}

+ (__CFString)descriptionForAction:(uint64_t)a1
{
  self;
  if ((unint64_t)(a2 - 1) >= 4) {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"invalid (%ld)", a2);
  }
  else {
    v3 = off_1E598FBE0[a2 - 1];
  }

  return v3;
}

@end