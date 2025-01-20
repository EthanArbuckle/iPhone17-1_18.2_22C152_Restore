@interface IDSNexusAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)assertAgentWithOptions:(id)a3;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isNexusProvider;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)requestNexusWithOptions:(id)a3;
- (BOOL)startAgentWithOptions:(id)a3;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
- (void)closeNexusWithOptions:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAgentUUID:(id)a3;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation IDSNexusAgent

+ (id)agentDomain
{
  return +[NSString stringWithFormat:@"%@%u", IDSNetworkAgentDomain, getuid()];
}

+ (id)agentType
{
  return IDSNetworkAgentClientChannelType;
}

+ (id)agentFromData:(id)a3
{
  v3 = objc_alloc_init(IDSNexusAgent);

  return v3;
}

- (id)copyAgentData
{
  long long v4 = 0u;
  uint64_t v16 = 0;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  int v3 = 4;
  DWORD1(v4) = 2;
  +[NSData dataWithBytes:&v3 length:204];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)agentDescription
{
  v2 = [(id)objc_opt_class() agentDomain];
  int v3 = [(id)objc_opt_class() agentType];
  long long v4 = +[NSString stringWithFormat:@"IDSNexusAgent %@ : %@", v2, v3];

  return (NSString *)v4;
}

- (BOOL)isVoluntary
{
  return 0;
}

- (BOOL)isKernelActivated
{
  return 0;
}

- (BOOL)isUserActivated
{
  return 0;
}

- (BOOL)isSpecificUseOnly
{
  return 0;
}

- (BOOL)isNetworkProvider
{
  return 1;
}

- (BOOL)isNexusProvider
{
  return 1;
}

- (BOOL)requestNexusWithOptions:(id)a3
{
  int v3 = [a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  long long v4 = +[IDSFoundationLog ClientChannelAgent];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    long long v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client requested nexus: %@\n", (uint8_t *)&v8, 0xCu);
  }

  long long v5 = +[IDSClientChannelManager sharedInstance];
  unsigned __int8 v6 = [v5 addClient:v3];

  return v6;
}

- (void)closeNexusWithOptions:(id)a3
{
  int v3 = [a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  long long v4 = +[IDSFoundationLog ClientChannelAgent];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    long long v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client closed nexus: %@\n", (uint8_t *)&v6, 0xCu);
  }

  long long v5 = +[IDSClientChannelManager sharedInstance];
  [v5 removeClient:v3];
}

- (BOOL)startAgentWithOptions:(id)a3
{
  int v3 = [a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  long long v4 = +[IDSFoundationLog ClientChannelAgent];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    long long v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client triggered agent: %@\n", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  int v3 = [a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  long long v4 = +[IDSFoundationLog ClientChannelAgent];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    long long v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client asserted agent: %@\n", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  int v3 = [a3 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  long long v4 = +[IDSFoundationLog ClientChannelAgent];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client unasserted agent: %@\n", (uint8_t *)&v5, 0xCu);
  }
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->agentUUID, 0);

  objc_storeStrong((id *)&self->_registration, 0);
}

@end