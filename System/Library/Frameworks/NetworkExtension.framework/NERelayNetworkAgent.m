@interface NERelayNetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (OS_nw_proxy_config)proxyConfig;
- (id)agentDescription;
- (id)copyAgentData;
- (void)setProxyConfig:(id)a3;
@end

@implementation NERelayNetworkAgent

- (void).cxx_destruct
{
}

- (void)setProxyConfig:(id)a3
{
}

- (OS_nw_proxy_config)proxyConfig
{
  return (OS_nw_proxy_config *)objc_getProperty(self, a2, 80, 1);
}

- (id)copyAgentData
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = [(NERelayNetworkAgent *)self proxyConfig];

  if (!v3) {
    return 0;
  }
  v9[0] = 0;
  v9[1] = 0;
  v4 = [(NENetworkAgent *)self configurationUUID];
  [v4 getUUIDBytes:v9];

  v5 = [(NERelayNetworkAgent *)self proxyConfig];
  nw_proxy_config_set_identifier();

  v6 = [(NERelayNetworkAgent *)self proxyConfig];
  v7 = (void *)nw_proxy_config_copy_agent_data();

  return v7;
}

- (id)agentDescription
{
  v4.receiver = self;
  v4.super_class = (Class)NERelayNetworkAgent;
  v2 = [(NENetworkAgent *)&v4 agentDescription];

  return v2;
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

+ (id)agentType
{
  v2 = NSString;
  uint64_t agent_type = nw_proxy_config_get_agent_type();

  return (id)[v2 stringWithUTF8String:agent_type];
}

+ (id)agentDomain
{
  v2 = NSString;
  uint64_t agent_domain = nw_proxy_config_get_agent_domain();

  return (id)[v2 stringWithUTF8String:agent_domain];
}

@end