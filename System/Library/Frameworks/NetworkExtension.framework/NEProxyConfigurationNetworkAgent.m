@interface NEProxyConfigurationNetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (NEProxyConfigurationNetworkAgent)initWithProxyConfiguration:(id)a3;
- (id)agentDescription;
- (id)copyAgentData;
@end

@implementation NEProxyConfigurationNetworkAgent

- (void).cxx_destruct
{
}

- (id)copyAgentData
{
  if (self)
  {
    self = (NEProxyConfigurationNetworkAgent *)objc_getProperty(self, a2, 80, 1);
    uint64_t v2 = vars8;
  }
  return (id)[(NEProxyConfigurationNetworkAgent *)self copy];
}

- (NEProxyConfigurationNetworkAgent)initWithProxyConfiguration:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEProxyConfigurationNetworkAgent;
  v5 = [(NEProxyConfigurationNetworkAgent *)&v11 init];
  if (!v5)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  uint64_t ProxyAgentData = SCNetworkProxiesCreateProxyAgentData();
  if (!ProxyAgentData)
  {
    v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "Failed to turn proxy configuration into agent data: %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  agentData = v5->_agentData;
  v5->_agentData = (NSData *)ProxyAgentData;

  v8 = v5;
LABEL_8:

  return v8;
}

- (id)agentDescription
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 agentType];
}

+ (id)agentFromData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NEProxyConfigurationNetworkAgent);
  v6 = v4;
  if (v4) {
    objc_setProperty_atomic(v4, v5, v3, 80);
  }

  return v6;
}

+ (id)agentType
{
  return @"ProxyAgent";
}

+ (id)agentDomain
{
  return @"SystemConfig";
}

@end