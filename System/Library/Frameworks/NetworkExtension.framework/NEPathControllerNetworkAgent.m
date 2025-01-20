@interface NEPathControllerNetworkAgent
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)assertAgentWithOptions:(id)a3;
- (BOOL)isForcedAdvisory;
- (BOOL)noAdvisoryTimer;
- (BOOL)preferAdvisory;
- (BOOL)updateClientsImmediately;
- (BOOL)weakAdvisory;
- (NEPathControllerNetworkAgent)initWithAdvisoryAgentDomain:(id)a3 agentType:(id)a4 advisoryMode:(unint64_t)a5;
- (NEPathControllerNetworkAgent)initWithAdvisoryInterface:(id)a3 advisoryMode:(unint64_t)a4;
- (NSMutableArray)advisoryInterfaceArray;
- (NSMutableArray)predictedInterfaceArray;
- (NSString)advisoryAgentDomain;
- (NSString)advisoryAgentType;
- (id)copyAgentData;
- (void)setAdvisoryAgentDomain:(id)a3;
- (void)setAdvisoryAgentType:(id)a3;
- (void)setAdvisoryInterfaceArray:(id)a3;
- (void)setAssertHandler:(id)a3;
- (void)setIsForcedAdvisory:(BOOL)a3;
- (void)setNoAdvisoryTimer:(BOOL)a3;
- (void)setPredictedInterfaceArray:(id)a3;
- (void)setPreferAdvisory:(BOOL)a3;
- (void)setUnassertHandler:(id)a3;
- (void)setUpdateClientsImmediately:(BOOL)a3;
- (void)setWeakAdvisory:(BOOL)a3;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation NEPathControllerNetworkAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisoryAgentType, 0);
  objc_storeStrong((id *)&self->_advisoryAgentDomain, 0);
  objc_storeStrong((id *)&self->_advisoryInterfaceArray, 0);
  objc_storeStrong((id *)&self->_predictedInterfaceArray, 0);
  objc_storeStrong(&self->_internalUnassertHandler, 0);

  objc_storeStrong(&self->_internalAssertHandler, 0);
}

- (void)setPreferAdvisory:(BOOL)a3
{
  self->_preferAdvisory = a3;
}

- (BOOL)preferAdvisory
{
  return self->_preferAdvisory;
}

- (void)setNoAdvisoryTimer:(BOOL)a3
{
  self->_noAdvisoryTimer = a3;
}

- (BOOL)noAdvisoryTimer
{
  return self->_noAdvisoryTimer;
}

- (void)setWeakAdvisory:(BOOL)a3
{
  self->_weakAdvisory = a3;
}

- (BOOL)weakAdvisory
{
  return self->_weakAdvisory;
}

- (void)setAdvisoryAgentType:(id)a3
{
}

- (NSString)advisoryAgentType
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAdvisoryAgentDomain:(id)a3
{
}

- (NSString)advisoryAgentDomain
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAdvisoryInterfaceArray:(id)a3
{
}

- (NSMutableArray)advisoryInterfaceArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPredictedInterfaceArray:(id)a3
{
}

- (NSMutableArray)predictedInterfaceArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)isForcedAdvisory
{
  return self->_isForcedAdvisory;
}

- (void)setUpdateClientsImmediately:(BOOL)a3
{
  self->updateClientsImmediately = a3;
}

- (BOOL)updateClientsImmediately
{
  return self->updateClientsImmediately;
}

- (NEPathControllerNetworkAgent)initWithAdvisoryAgentDomain:(id)a3 agentType:(id)a4 advisoryMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [(NENetworkAgent *)self initWithConfigUUID:v10 sessionType:5 name:0];

  if (v11)
  {
    [(NEPathControllerNetworkAgent *)v11 setAdvisoryAgentDomain:v8];
    [(NEPathControllerNetworkAgent *)v11 setAdvisoryAgentType:v9];
    switch(a5)
    {
      case 4uLL:
        [(NEPathControllerNetworkAgent *)v11 setPreferAdvisory:1];
        break;
      case 3uLL:
        [(NEPathControllerNetworkAgent *)v11 setNoAdvisoryTimer:1];
        break;
      case 2uLL:
        [(NEPathControllerNetworkAgent *)v11 setWeakAdvisory:1];
        break;
    }
  }

  return v11;
}

- (NEPathControllerNetworkAgent)initWithAdvisoryInterface:(id)a3 advisoryMode:(unint64_t)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [(NENetworkAgent *)self initWithConfigUUID:v7 sessionType:5 name:0];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NEPathControllerNetworkAgent *)v8 setAdvisoryInterfaceArray:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NEPathControllerNetworkAgent *)v8 setPredictedInterfaceArray:v10];

    v11 = [(NEPathControllerNetworkAgent *)v8 advisoryInterfaceArray];
    v12 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLong:", objc_msgSend(v6, "interfaceIndex"));
    [v11 addObject:v12];

    v13 = [(NEPathControllerNetworkAgent *)v8 predictedInterfaceArray];
    [v13 addObject:&unk_1EF08D168];

    switch(a4)
    {
      case 4uLL:
        [(NEPathControllerNetworkAgent *)v8 setPreferAdvisory:1];
        break;
      case 3uLL:
        [(NEPathControllerNetworkAgent *)v8 setNoAdvisoryTimer:1];
        break;
      case 2uLL:
        [(NEPathControllerNetworkAgent *)v8 setWeakAdvisory:1];
        break;
    }
  }

  return v8;
}

- (void)setUnassertHandler:(id)a3
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, a3, 96);
  }
}

- (void)setAssertHandler:(id)a3
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, a3, 88);
  }
}

- (void)unassertAgentWithOptions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F38B90]];
  v5 = ne_log_obj();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [(NENetworkAgent *)self agentDescription];
      v11 = [v4 UUIDString];
      int v12 = 138412546;
      v13 = v10;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%@ unasserted by: client=%@", (uint8_t *)&v12, 0x16u);
    }
    if (self && objc_getProperty(self, v7, 96, 1))
    {
      Property = (void (**)(id, void *))objc_getProperty(self, v8, 96, 1);
      Property[2](Property, v4);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "Unassert message did not contain client UUID", (uint8_t *)&v12, 2u);
    }
  }
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F38B90]];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F38C18] pathForClientID:v4];
    BOOL v6 = v5 != 0;
    v7 = ne_log_obj();
    id v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v15 = [(NENetworkAgent *)self agentDescription];
        uint64_t v16 = [v4 UUIDString];
        v17 = [v5 parameters];
        v18 = [v17 effectiveProcessUUID];
        v19 = [v18 UUIDString];
        int v21 = 138412802;
        v22 = v15;
        __int16 v23 = 2112;
        v24 = v16;
        __int16 v25 = 2112;
        v26 = v19;
        _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, "%@ asserted by: client=%@ process=%@", (uint8_t *)&v21, 0x20u);
      }
      if (!self || !objc_getProperty(self, v9, 88, 1))
      {
        BOOL v6 = 1;
        goto LABEL_15;
      }
      id Property = objc_getProperty(self, v10, 88, 1);
      id v12 = Property;
      id v8 = [v5 parameters];
      v13 = [v8 effectiveProcessUUID];
      (*((void (**)(id, void *, void *))Property + 2))(v12, v4, v13);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v20 = [v4 UUIDString];
      int v21 = 138412290;
      v22 = v20;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "Could not fetch path for assert message (client %@)", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Assert message did not contain client UUID", (uint8_t *)&v21, 2u);
    }
    BOOL v6 = 0;
  }
LABEL_15:

  return v6;
}

- (id)copyAgentData
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = [(NEPathControllerNetworkAgent *)self advisoryInterfaceArray];
  if ([v3 count]) {
    goto LABEL_4;
  }
  v4 = [(NEPathControllerNetworkAgent *)self advisoryAgentDomain];
  if ([v4 length])
  {

LABEL_4:
    goto LABEL_5;
  }
  uint64_t v27 = [(NEPathControllerNetworkAgent *)self advisoryAgentType];
  uint64_t v28 = [v27 length];

  if (!v28)
  {
    *(void *)&long long v32 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    if (self)
    {
      objc_msgSend(objc_getProperty(self, v5, 40, 1), "getUUIDBytes:", &v30);
      int internalSessionType = self->super._internalSessionType;
    }
    else
    {
      [0 getUUIDBytes:&v30];
      int internalSessionType = 0;
    }
    LODWORD(v31) = internalSessionType;
    [MEMORY[0x1E4F1C9B8] dataWithBytes:&v30 length:40];
    return (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_5:
  long long v36 = 0u;
  memset(v37, 0, sizeof(v37));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v5, 40, 1), "getUUIDBytes:", &v30);
    int v6 = self->super._internalSessionType;
  }
  else
  {
    [0 getUUIDBytes:&v30];
    int v6 = 0;
  }
  LODWORD(v31) = v6;
  v7 = [(NEPathControllerNetworkAgent *)self advisoryInterfaceArray];
  unint64_t v8 = [v7 count];

  if (v8 >= 4) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = v8;
  }
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v11 = [(NEPathControllerNetworkAgent *)self advisoryInterfaceArray];
      id v12 = [v11 objectAtIndexedSubscript:i];
      uint64_t v13 = [v12 unsignedIntegerValue];

      if (v13)
      {
        __int16 v14 = [(NEPathControllerNetworkAgent *)self advisoryInterfaceArray];
        v15 = [v14 objectAtIndexedSubscript:i];
        uint64_t v16 = (char *)&v30 + 4 * i;
        *((_DWORD *)v16 + 10) = [v15 unsignedIntegerValue];

        v17 = [(NEPathControllerNetworkAgent *)self predictedInterfaceArray];
        v18 = [v17 objectAtIndexedSubscript:i];
        *((_DWORD *)v16 + 14) = [v18 unsignedIntegerValue];
      }
    }
  }
  BOOL v19 = [(NEPathControllerNetworkAgent *)self weakAdvisory];
  BYTE8(v34) = BYTE8(v34) & 0xFE | v19;
  if ([(NEPathControllerNetworkAgent *)self noAdvisoryTimer]) {
    char v20 = 2;
  }
  else {
    char v20 = 0;
  }
  BYTE8(v34) = BYTE8(v34) & 0xFD | v20;
  if ([(NEPathControllerNetworkAgent *)self preferAdvisory]) {
    char v21 = 8;
  }
  else {
    char v21 = 0;
  }
  BYTE8(v34) = BYTE8(v34) & 0xF7 | v21;
  if ([(NEPathControllerNetworkAgent *)self isForcedAdvisory]) {
    char v22 = 4;
  }
  else {
    char v22 = 0;
  }
  BYTE8(v34) = BYTE8(v34) & 0xFB | v22;
  __int16 v23 = [(NEPathControllerNetworkAgent *)self advisoryAgentDomain];
  v24 = [(NEPathControllerNetworkAgent *)self advisoryAgentType];
  if (v23 && (unint64_t)[v23 length] <= 0x1F)
  {
    [v23 UTF8String];
    __strlcpy_chk();
  }
  if (v24 && (unint64_t)[v24 length] <= 0x1F)
  {
    [v24 UTF8String];
    __strlcpy_chk();
  }
  __int16 v25 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v30 length:140];

  return v25;
}

- (void)setIsForcedAdvisory:(BOOL)a3
{
  self->_isForcedAdvisory = a3;
  -[NEPathControllerNetworkAgent setUpdateClientsImmediately:](self, "setUpdateClientsImmediately:");
}

+ (id)agentFromData:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 140)
  {
    uint64_t v4 = [v3 bytes];
    v5 = [NEPathControllerNetworkAgent alloc];
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v4];
    uint64_t v7 = *(unsigned int *)(v4 + 16);
    unint64_t v8 = [NSString stringWithUTF8String:v4 + 20];
    uint64_t v9 = [(NENetworkAgent *)v5 initWithConfigUUID:v6 sessionType:v7 name:v8];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NEPathControllerNetworkAgent *)v9 setAdvisoryInterfaceArray:v10];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NEPathControllerNetworkAgent *)v9 setPredictedInterfaceArray:v11];

    for (uint64_t i = 0; i != 16; i += 4)
    {
      uint64_t v13 = v4 + i;
      if (*(_DWORD *)(v4 + i + 40))
      {
        __int16 v14 = [(NEPathControllerNetworkAgent *)v9 advisoryInterfaceArray];
        v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedLong:*(unsigned int *)(v13 + 40)];
        [v14 addObject:v15];

        uint64_t v16 = [(NEPathControllerNetworkAgent *)v9 predictedInterfaceArray];
        v17 = (void *)[objc_alloc(NSNumber) initWithUnsignedLong:*(unsigned int *)(v13 + 56)];
        [v16 addObject:v17];
      }
    }
    [(NEPathControllerNetworkAgent *)v9 setWeakAdvisory:*(unsigned char *)(v4 + 72) & 1];
    [(NEPathControllerNetworkAgent *)v9 setNoAdvisoryTimer:(*(unsigned __int8 *)(v4 + 72) >> 1) & 1];
    [(NEPathControllerNetworkAgent *)v9 setIsForcedAdvisory:(*(unsigned __int8 *)(v4 + 72) >> 2) & 1];
    [(NEPathControllerNetworkAgent *)v9 setPreferAdvisory:(*(unsigned __int8 *)(v4 + 72) >> 3) & 1];
    if (*(unsigned char *)(v4 + 73))
    {
      v18 = [NSString stringWithUTF8String:v4 + 73];
      [(NEPathControllerNetworkAgent *)v9 setAdvisoryAgentDomain:v18];
    }
    int v20 = *(unsigned __int8 *)(v4 + 105);
    uint64_t v19 = v4 + 105;
    if (v20)
    {
      char v21 = [NSString stringWithUTF8String:v19];
      [(NEPathControllerNetworkAgent *)v9 setAdvisoryAgentType:v21];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)agentType
{
  return @"PathController";
}

@end