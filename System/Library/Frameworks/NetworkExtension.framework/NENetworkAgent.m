@interface NENetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)matchesFileHandle:(id)a3;
- (BOOL)reportError:(int)a3 withOptions:(id)a4;
- (BOOL)startAgentWithOptions:(id)a3;
- (NENetworkAgent)initWithConfigUUID:(id)a3 sessionType:(int)a4 name:(id)a5;
- (NENetworkAgent)initWithDelegate:(id)a3 configUUID:(id)a4 sessionType:(int)a5 name:(id)a6;
- (NSString)agentDescription;
- (NSString)configurationName;
- (NSUUID)agentUUID;
- (NSUUID)configurationUUID;
- (id)copyAgentData;
- (int)lastStatus;
- (int)sessionType;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setConfigurationName:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setLastStatus:(int)a3;
- (void)setStartHandler:(id)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
@end

@implementation NENetworkAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_internalStartHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_internalUUID, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);

  objc_storeStrong((id *)&self->agentUUID, 0);
}

- (void)setLastStatus:(int)a3
{
  self->_lastStatus = a3;
}

- (int)lastStatus
{
  return self->_lastStatus;
}

- (void)setConfigurationName:(id)a3
{
}

- (NSString)configurationName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setAgentDescription:(id)a3
{
}

- (void)setAgentUUID:(id)a3
{
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (BOOL)startAgentWithOptions:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self && objc_getProperty(self, v4, 56, 1))
  {
    memset(uu, 0, sizeof(uu));
    uuid_clear(uu);
    uint64_t v6 = *MEMORY[0x1E4F38B90];
    v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F38B90]];
    int v8 = isa_nsuuid(v7);

    if (!v8)
    {
      uint64_t v20 = *MEMORY[0x1E4F38B98];
      v21 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F38B98]];
      int v22 = isa_nsnumber(v21);

      if (v22)
      {
        v23 = [v5 objectForKeyedSubscript:v20];
        uint64_t v13 = [v23 intValue];
      }
      else
      {
        uint64_t v13 = 0;
      }
      uint64_t v24 = *MEMORY[0x1E4F38BA0];
      v25 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F38BA0]];
      int v26 = isa_nsuuid(v25);

      if (!v26)
      {
        v18 = 0;
LABEL_21:
        BOOL v19 = 1;
        id Property = objc_getProperty(self, v27, 56, 1);
        id v29 = v18;
        id v30 = Property;
        (*((void (**)(id, uint64_t, unsigned __int8 *, uint64_t))Property + 2))(v30, v13, uu, [v29 UTF8String]);

        goto LABEL_22;
      }
      v9 = [v5 objectForKeyedSubscript:v24];
      [v9 getUUIDBytes:uu];
      v18 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v9 = [v5 objectForKeyedSubscript:v6];
    v10 = [MEMORY[0x1E4F38C18] pathForClientID:v9];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 parameters];
      uint64_t v13 = [v12 pid];

      v14 = [v11 parameters];
      uint64_t v15 = [v14 effectiveProcessUUID];
      [(id)v15 getUUIDBytes:uu];

      v16 = [v11 endpoint];
      objc_opt_class();
      LOBYTE(v15) = objc_opt_isKindOfClass();

      if ((v15 & 1) == 0)
      {
        v18 = 0;
        goto LABEL_19;
      }
      v17 = [v11 endpoint];
      v18 = [v17 hostname];
    }
    else
    {
      v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v32 = [v9 UUIDString];
        int v33 = 138412290;
        v34 = v32;
        _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "Could not fetch path for unassert message (client %@)", (uint8_t *)&v33, 0xCu);
      }
      v18 = 0;
      uint64_t v13 = 0;
    }

LABEL_19:
    goto LABEL_20;
  }
  BOOL v19 = 0;
LABEL_22:

  return v19;
}

- (void)setStartHandler:(id)a3
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, a3, 56);
  }
}

- (int)sessionType
{
  if (self) {
    LODWORD(self) = self->_internalSessionType;
  }
  return (int)self;
}

- (NSUUID)configurationUUID
{
  if (self)
  {
    self = (NENetworkAgent *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return (NSUUID *)self;
}

- (id)copyAgentData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  if (self)
  {
    objc_msgSend(objc_getProperty(self, a2, 40, 1), "getUUIDBytes:", &v7);
    LODWORD(v8) = self->_internalSessionType;
    if (objc_getProperty(self, v3, 48, 1))
    {
      id v5 = objc_getProperty(self, v4, 48, 1);
      objc_msgSend(v5, "UTF8String", v7);
      __strlcpy_chk();
    }
  }
  else
  {
    [0 getUUIDBytes:&v7];
    LODWORD(v8) = 0;
  }
  [MEMORY[0x1E4F1C9B8] dataWithBytes:&v7 length:40];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)agentDescription
{
  SEL v3 = NSString;
  v4 = [(id)objc_opt_class() agentType];
  uint64_t v6 = [(NENetworkAgent *)self configurationName];
  long long v7 = &stru_1EF054CB8;
  if (self)
  {
    char v8 = 1;
    id v10 = objc_getProperty(self, v5, 48, 1);
    if (v10) {
      v11 = @" ";
    }
    else {
      v11 = &stru_1EF054CB8;
    }
    id v12 = objc_getProperty(self, v9, 48, 1);
    if (v12)
    {
      v14 = v12;
      long long v7 = (__CFString *)objc_getProperty(self, v13, 48, 1);

      char v8 = 0;
    }
  }
  else
  {
    id v10 = 0;
    char v8 = 1;
    v11 = &stru_1EF054CB8;
  }
  uint64_t v15 = [v3 stringWithFormat:@"%@: %@%@%@", v4, v6, v11, v7];
  agentDescription = self->agentDescription;
  self->agentDescription = v15;

  if ((v8 & 1) == 0) {
  v17 = self->agentDescription;
  }

  return v17;
}

- (BOOL)matchesFileHandle:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 sessionType];
  int v7 = [v6 intValue];
  if (v7 != [(NENetworkAgent *)self sessionType])
  {
    char v15 = 0;
    goto LABEL_21;
  }
  char v8 = [(NENetworkAgent *)self configurationUUID];
  uint64_t v9 = [v5 configurationIdentifier];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    if (self && (id v12 = objc_getProperty(self, v11, 48, 1)) != 0)
    {
      uint64_t v6 = v12;
      int v14 = 0;
    }
    else
    {
      uint64_t v16 = [v5 name];
      uint64_t v6 = 0;
      if (v16) {
        SEL v3 = (void *)v16;
      }
      else {
        SEL v3 = 0;
      }
      if (v16) {
        char v15 = 0;
      }
      else {
        char v15 = -1;
      }
      if (!v16 || !self) {
        goto LABEL_20;
      }
      int v14 = 1;
      SEL v3 = (void *)v16;
    }
    id v17 = objc_getProperty(self, v13, 48, 1);
    if (!v17)
    {
      char v15 = 0;
      if (!v14) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    v18 = v17;
    uint64_t v19 = [v5 name];
    if (!v19)
    {

      char v15 = 0;
      if ((v14 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    v21 = (void *)v19;
    id v22 = objc_getProperty(self, v20, 48, 1);
    v23 = [v5 name];
    char v15 = [v22 isEqualToString:v23];

    if (v14) {
LABEL_20:
    }

LABEL_21:
    goto LABEL_22;
  }
  char v15 = 0;
LABEL_22:

  return v15 & 1;
}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained reportError:v4 withOptions:v6];
  }

  return 1;
}

- (NENetworkAgent)initWithDelegate:(id)a3 configUUID:(id)a4 sessionType:(int)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NENetworkAgent;
  uint64_t v13 = [(NENetworkAgent *)&v16 init];
  int v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_internalUUID, a4);
    v14->_internalSessionType = a5;
    objc_storeStrong((id *)&v14->_name, a6);
    objc_storeWeak((id *)&v14->_delegate, v10);
  }

  return v14;
}

- (NENetworkAgent)initWithConfigUUID:(id)a3 sessionType:(int)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NENetworkAgent;
  id v11 = [(NENetworkAgent *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_internalUUID, a3);
    v12->_internalSessionType = a4;
    objc_storeStrong((id *)&v12->_name, a5);
  }

  return v12;
}

+ (id)agentFromData:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 40)
  {
    uint64_t v4 = [v3 bytes];
    id v5 = [NENetworkAgent alloc];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v4];
    uint64_t v7 = *(unsigned int *)(v4 + 16);
    char v8 = [NSString stringWithUTF8String:v4 + 20];
    id v9 = [(NENetworkAgent *)v5 initWithConfigUUID:v6 sessionType:v7 name:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)agentType
{
  return @"Generic";
}

+ (id)agentDomain
{
  return @"NetworkExtension";
}

@end