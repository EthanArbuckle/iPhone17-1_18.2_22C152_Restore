@interface DataConnectionNetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)allowStartAgentForOptions:(id)a3;
- (BOOL)assertAgentWithOptions:(id)a3;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isPersistent;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)startAgentWithOptions:(id)a3;
- (BOOL)updateClientsImmediately;
- (DataConnectionAgentData)getAgentData;
- (DataConnectionNetworkAgent)initWithType:(int)a3;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id).cxx_construct;
- (id)copyAgentData;
- (int)connectionType;
- (void)dataAgent;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setDataAgent:(void *)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setNetworkProvider:(BOOL)a3;
- (void)setSpecificUseOnly:(BOOL)a3;
- (void)setUpdateClientsImmediately:(BOOL)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation DataConnectionNetworkAgent

- (void)dealloc
{
  agentUUID = self->agentUUID;
  self->agentUUID = 0;

  agentDescription = self->agentDescription;
  self->agentDescription = 0;

  v5.receiver = self;
  v5.super_class = (Class)DataConnectionNetworkAgent;
  [(DataConnectionNetworkAgent *)&v5 dealloc];
}

- (DataConnectionNetworkAgent)initWithType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DataConnectionNetworkAgent;
  result = [(DataConnectionNetworkAgent *)&v5 init];
  if (result)
  {
    result->_connectionType = a3;
    *(void *)&result->_agentData.common.regStatus = 0;
    result->_agentData.type = a3;
  }
  return result;
}

+ (id)agentDomain
{
  return @"Cellular";
}

+ (id)agentType
{
  return @"ThisShouldNotExist";
}

+ (id)agentFromData:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 0xC) {
    v4 = -[DataConnectionNetworkAgent initWithType:]([DataConnectionNetworkAgent alloc], "initWithType:", *((unsigned int *)[v3 bytes] + 2));
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)copyAgentData
{
  p_agentData = &self->_agentData;
  self->_agentData.type = self->_connectionType;
  id v3 = objc_alloc((Class)NSData);

  return [v3 initWithBytes:p_agentData length:12];
}

- (NSString)agentDescription
{
  int v3 = capabilities::ct::supportsGemini((capabilities::ct *)self);
  uint64_t v4 = [(id)objc_opt_class() agentType];
  objc_super v5 = (void *)v4;
  if (v3)
  {
    PersonalitySpecificImpl::simSlot((PersonalitySpecificImpl *)self->_dataAgent);
    +[NSString stringWithFormat:@"%@: %@.%u", @"CommCenter", v5, subscriber::simSlotAsInstance()];
  }
  else
  {
    +[NSString stringWithFormat:@"%@: %@", @"CommCenter", v4];
  v6 = };

  return (NSString *)v6;
}

- (BOOL)isPersistent
{
  return 0;
}

- (BOOL)allowStartAgentForOptions:(id)a3
{
  return 1;
}

- (BOOL)startAgentWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DataConnectionNetworkAgent *)self allowStartAgentForOptions:v4];
  if (v5)
  {
    dataAgent = (char *)self->_dataAgent;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1008B5A54;
    v10[3] = &unk_101A15638;
    v7 = (id *)(dataAgent + 32);
    id v11 = v4;
    v12 = dataAgent;
    id v8 = v11;
    sub_1008BEED4(v7, v10);
  }
  return v5;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
}

- (DataConnectionAgentData)getAgentData
{
  return &self->_agentData;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (void)setAgentDescription:(id)a3
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

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (BOOL)isNetworkProvider
{
  return self->networkProvider;
}

- (void)setNetworkProvider:(BOOL)a3
{
  self->networkProvider = a3;
}

- (BOOL)isSpecificUseOnly
{
  return self->specificUseOnly;
}

- (void)setSpecificUseOnly:(BOOL)a3
{
  self->specificUseOnly = a3;
}

- (BOOL)updateClientsImmediately
{
  return self->updateClientsImmediately;
}

- (void)setUpdateClientsImmediately:(BOOL)a3
{
  self->updateClientsImmediately = a3;
}

- (int)connectionType
{
  return self->_connectionType;
}

- (void)dataAgent
{
  return self->_dataAgent;
}

- (void)setDataAgent:(void *)a3
{
  self->_dataAgent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->agentDescription, 0);

  objc_storeStrong((id *)&self->agentUUID, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 12) = 0;
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end