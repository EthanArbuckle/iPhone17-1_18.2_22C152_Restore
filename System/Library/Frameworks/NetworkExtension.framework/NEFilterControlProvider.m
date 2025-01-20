@interface NEFilterControlProvider
- (NSDictionary)URLAppendStringMap;
- (NSDictionary)remediationMap;
- (void)handleNewFlow:(NEFilterFlow *)flow completionHandler:(void *)completionHandler;
- (void)handleRemediationForFlow:(NEFilterFlow *)flow completionHandler:(void *)completionHandler;
- (void)notifyRulesChanged;
- (void)setRemediationMap:(NSDictionary *)remediationMap;
- (void)setURLAppendStringMap:(NSDictionary *)URLAppendStringMap;
@end

@implementation NEFilterControlProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLAppendStringMap, 0);

  objc_storeStrong((id *)&self->_remediationMap, 0);
}

- (void)setURLAppendStringMap:(NSDictionary *)URLAppendStringMap
{
}

- (NSDictionary)URLAppendStringMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRemediationMap:(NSDictionary *)remediationMap
{
}

- (NSDictionary)remediationMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)notifyRulesChanged
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@: Notify rules changed", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(NEProvider *)self context];
  [v4 notifyRulesChanged];
}

- (void)handleRemediationForFlow:(NEFilterFlow *)flow completionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6 = flow;
  uint64_t v7 = completionHandler;
  v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "%@: Handle remediation for flow: %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0);
}

- (void)handleNewFlow:(NEFilterFlow *)flow completionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6 = flow;
  uint64_t v7 = completionHandler;
  v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "%@: Handle new flow: %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0);
}

@end