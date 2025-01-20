@interface NENexusAgent
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
- (BOOL)supportsBrowseRequests;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
- (void)closeNexusWithOptions:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setNexusProvider:(BOOL)a3;
- (void)setSupportsBrowseRequests:(BOOL)a3;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation NENexusAgent

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);

  objc_storeStrong((id *)&self->agentUUID, 0);
}

- (void)setNexusProvider:(BOOL)a3
{
  self->nexusProvider = a3;
}

- (BOOL)isNexusProvider
{
  return self->nexusProvider;
}

- (void)setSupportsBrowseRequests:(BOOL)a3
{
  self->supportsBrowseRequests = a3;
}

- (BOOL)supportsBrowseRequests
{
  return self->supportsBrowseRequests;
}

- (void)setAgentDescription:(id)a3
{
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setAgentUUID:(id)a3
{
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F38B90]];
  if (self) {
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  [(NENexusAgent *)self handleUnassertFromClient:v4];
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F38B90]];
  if (self) {
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  [(NENexusAgent *)self handleAssertFromClient:v4];

  return 1;
}

- (BOOL)startAgentWithOptions:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F38B90]];
  if (self) {
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  [(NENexusAgent *)self handleStartFromClient:v4];

  return 1;
}

- (void)closeNexusWithOptions:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F38B90]];
  if (self) {
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  [(NENexusAgent *)self closeFlowWithClientIdentifier:v4];
}

- (BOOL)requestNexusWithOptions:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F38B90]];
  if (self) {
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  char v5 = [(NENexusAgent *)self handleRequestNexusFromClient:v4];

  return v5;
}

- (BOOL)isNetworkProvider
{
  return 1;
}

- (BOOL)isSpecificUseOnly
{
  return 0;
}

- (BOOL)isUserActivated
{
  return 1;
}

- (BOOL)isKernelActivated
{
  return 0;
}

- (BOOL)isVoluntary
{
  return 0;
}

- (id)copyAgentData
{
  long long v13 = 0u;
  memset(v14, 0, sizeof(v14));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  if (!self)
  {
    DWORD1(v3) = 1;
    goto LABEL_5;
  }
  LODWORD(v3) = self->_frameType;
  DWORD1(v3) = 1;
  if (v3 != 2)
  {
LABEL_5:
    *((void *)&v3 + 1) = 0x100000002;
    LODWORD(v4) = 3;
    goto LABEL_6;
  }
  DWORD2(v3) = 1;
  *((void *)&v7 + 1) = 0x100000002;
LABEL_6:
  [MEMORY[0x1E4F1C9B8] dataWithBytes:&v3 length:204];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)agentFromData:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v4 = objc_alloc_init(NENexusAgent);
  if ((unint64_t)[v3 length] < 0xCC)
  {
    long long v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 134217984;
      uint64_t v9 = [v3 length];
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "data.length is invalid (%lu)", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    long long v5 = (unsigned int *)[v3 bytes];
    if (v5 && v4) {
      v4->_frameType = *v5;
    }
  }

  return v4;
}

+ (id)agentType
{
  return @"Nexus";
}

+ (id)agentDomain
{
  return @"NENexus";
}

@end