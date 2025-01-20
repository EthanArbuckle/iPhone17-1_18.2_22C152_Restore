@interface NEAppPushProvider
- (NEAppPushProvider)init;
- (NSDictionary)providerConfiguration;
- (void)reportIncomingCallWithUserInfo:(NSDictionary *)userInfo;
- (void)reportPushToTalkMessageWithUserInfo:(NSDictionary *)userInfo;
- (void)setProviderConfiguration:(id)a3;
- (void)stopWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler;
@end

@implementation NEAppPushProvider

- (void).cxx_destruct
{
}

- (void)setProviderConfiguration:(id)a3
{
}

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NEAppPushProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEAppPushProvider;
  return [(NEProvider *)&v3 init];
}

- (void)reportPushToTalkMessageWithUserInfo:(NSDictionary *)userInfo
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = userInfo;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@: reporting PushToTalk message", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(NEProvider *)self context];
  [v6 reportPushToTalkMessage:v4];
}

- (void)reportIncomingCallWithUserInfo:(NSDictionary *)userInfo
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = userInfo;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@: reporting incoming call", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(NEProvider *)self context];
  [v6 reportIncomingCall:v4];
}

- (void)stopWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
}

@end