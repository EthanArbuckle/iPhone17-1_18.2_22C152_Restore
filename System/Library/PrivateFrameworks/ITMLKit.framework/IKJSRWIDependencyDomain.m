@interface IKJSRWIDependencyDomain
+ (id)allDomains;
+ (id)allowedDomains;
+ (id)domainAgentClassMap;
+ (void)processDomains:(id)a3;
- (BOOL)isValidForAgentWithError:(id *)a3;
- (BOOL)isValidForEventsWithError:(id *)a3;
- (BOOL)isValidForTypesWithError:(id *)a3;
- (BOOL)isValidWithError:(id *)a3;
- (Class)agentClass;
- (IKJSRWIDependencyDomain)initWithDomainDictionary:(id)a3 agentClass:(Class)a4;
- (NSDictionary)commands;
- (NSDictionary)events;
- (NSDictionary)types;
- (NSString)dispatcherClassString;
- (NSString)identifier;
- (void)setAgentClass:(Class)a3;
@end

@implementation IKJSRWIDependencyDomain

+ (id)allowedDomains
{
  return &unk_1F3E3DAA0;
}

+ (id)domainAgentClassMap
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CSS";
  v5[0] = objc_opt_class();
  v4[1] = @"DOM";
  v5[1] = objc_opt_class();
  v4[2] = @"DOMStorage";
  v5[2] = objc_opt_class();
  v4[3] = @"Network";
  v5[3] = objc_opt_class();
  v4[4] = @"Page";
  v5[4] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (id)allDomains
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__IKJSRWIDependencyDomain_allDomains__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allDomains_onceToken != -1) {
    dispatch_once(&allDomains_onceToken, block);
  }
  v2 = (void *)allDomains__domains;
  return v2;
}

void __37__IKJSRWIDependencyDomain_allDomains__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CA60];
  id v3 = [(id)objc_opt_class() allowedDomains];
  uint64_t v1 = objc_msgSend(v0, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v2 = (void *)allDomains__domains;
  allDomains__domains = v1;
}

+ (void)processDomains:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [[IKJSRWIDependencyDomain alloc] initWithDomainDictionary:*(void *)(*((void *)&v14 + 1) + 8 * v7) agentClass:0];
        if (v8)
        {
          v9 = [(id)objc_opt_class() domainAgentClassMap];
          v10 = [(IKJSRWIDependencyDomain *)v8 identifier];
          uint64_t v11 = [v9 objectForKey:v10];

          [(IKJSRWIDependencyDomain *)v8 setAgentClass:v11];
          v12 = [(id)objc_opt_class() allDomains];
          v13 = [(IKJSRWIDependencyDomain *)v8 identifier];
          [v12 setObject:v8 forKey:v13];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (IKJSRWIDependencyDomain)initWithDomainDictionary:(id)a3 agentClass:(Class)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v53.receiver = self;
  v53.super_class = (Class)IKJSRWIDependencyDomain;
  uint64_t v7 = [(IKJSRWIDependencyDomain *)&v53 init];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKey:@"domain"];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    types = v7->_types;
    v7->_types = (NSDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    commands = v7->_commands;
    v7->_commands = (NSDictionary *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    events = v7->_events;
    v7->_events = (NSDictionary *)v14;

    objc_storeStrong((id *)&v7->_agentClass, a4);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v16 = [v6 objectForKey:@"types"];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v50;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[IKJSRWIDependencyDomainType alloc] initWithTypeDictionary:*(void *)(*((void *)&v49 + 1) + 8 * v20) forDomain:v7];
          v22 = v7->_types;
          v23 = [(IKJSRWIDependencyDomainType *)v21 identifier];
          [(NSDictionary *)v22 setObject:v21 forKey:v23];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v18);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v24 = [v6 objectForKey:@"commands"];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v46;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v46 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[IKJSRWIDependencyDomainCommand alloc] initWithCommandDictionary:*(void *)(*((void *)&v45 + 1) + 8 * v28) forDomain:v7];
          v30 = v7->_commands;
          v31 = [(IKJSRWIDependencyDomainCommand *)v29 name];
          [(NSDictionary *)v30 setObject:v29 forKey:v31];

          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v26);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v32 = objc_msgSend(v6, "objectForKey:", @"events", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v42;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v42 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[IKJSRWIDependencyDomainEvent alloc] initWithEventDictionary:*(void *)(*((void *)&v41 + 1) + 8 * v36) forDomain:v7];
          v38 = v7->_events;
          v39 = [(IKJSRWIDependencyDomainEvent *)v37 name];
          [(NSDictionary *)v38 setObject:v37 forKey:v39];

          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v34);
    }
  }
  return v7;
}

- (NSString)dispatcherClassString
{
  v2 = NSString;
  id v3 = [(IKJSRWIDependencyDomain *)self identifier];
  uint64_t v4 = [v2 stringWithFormat:@"RWIProtocol%@DomainEventDispatcher", v3];

  return (NSString *)v4;
}

- (BOOL)isValidWithError:(id *)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v24 = 0;
  BOOL v6 = [(IKJSRWIDependencyDomain *)self isValidForTypesWithError:&v24];
  id v7 = v24;
  uint64_t v8 = v7;
  if (!v6)
  {
    v9 = [v7 userInfo];
    uint64_t v10 = [v9 objectForKey:@"IKJSRWIDependencyErrorSelectorsKey"];

    [v5 setObject:v10 forKey:@"IKJSRWIDependencyErrorSelectorsKey"];
  }
  id v23 = 0;
  BOOL v11 = [(IKJSRWIDependencyDomain *)self isValidForAgentWithError:&v23];
  id v12 = v23;
  v13 = v12;
  if (!v11)
  {
    uint64_t v14 = [v12 userInfo];
    long long v15 = [v14 objectForKey:@"IKJSRWIDependencyErrorSelectorsKey"];

    [v5 setObject:v15 forKey:@"IKJSRWIDependencyErrorAgentSelectorsKey"];
    BOOL v6 = 0;
  }
  id v22 = 0;
  BOOL v16 = [(IKJSRWIDependencyDomain *)self isValidForEventsWithError:&v22];
  id v17 = v22;
  uint64_t v18 = v17;
  if (!v16)
  {
    uint64_t v19 = [v17 userInfo];
    uint64_t v20 = [v19 objectForKey:@"IKJSRWIDependencyErrorSelectorsKey"];

    [v5 setObject:v20 forKey:@"IKJSRWIDependencyErrorAgentSelectorsKey"];
    BOOL v6 = 0;
  }
  if (a3 && !v6 && [v5 count])
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IKJSRWIDependencyErrorDomain" code:1 userInfo:v5];
  }

  return v6;
}

- (BOOL)isValidForAgentWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![(IKJSRWIDependencyDomain *)self agentClass]) {
    return 1;
  }
  id v24 = a3;
  uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = [(IKJSRWIDependencyDomain *)self commands];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        BOOL v11 = [(IKJSRWIDependencyDomain *)self commands];
        id v12 = [v11 objectForKey:v10];

        id v26 = 0;
        char v13 = [v12 isValidWithError:&v26];
        id v14 = v26;
        long long v15 = v14;
        if ((v13 & 1) == 0)
        {
          BOOL v16 = [v14 userInfo];
          id v17 = [v16 objectForKey:@"IKJSRWIDependencyErrorSelectorsKey"];

          if (v17)
          {
            uint64_t v18 = [v12 name];
            [v25 setObject:v17 forKey:v18];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v7);
  }

  if (v24)
  {
    uint64_t v19 = v25;
    if ([v25 count])
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      v31 = @"IKJSRWIDependencyErrorSelectorsKey";
      v32 = v25;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id *v24 = [v20 errorWithDomain:@"IKJSRWIDependencyErrorDomain" code:1 userInfo:v21];

      BOOL v22 = 0;
    }
    else
    {
      BOOL v22 = 1;
    }
  }
  else
  {
    BOOL v22 = 1;
    uint64_t v19 = v25;
  }

  return v22;
}

- (BOOL)isValidForTypesWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v24 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = [(IKJSRWIDependencyDomain *)self types];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v10 = [(IKJSRWIDependencyDomain *)self types];
        BOOL v11 = [v10 objectForKey:v9];

        id v25 = 0;
        char v12 = [v11 isValidWithError:&v25];
        id v13 = v25;
        id v14 = v13;
        if ((v12 & 1) == 0)
        {
          long long v15 = [v13 userInfo];
          BOOL v16 = [v15 objectForKey:@"IKJSRWIDependencyErrorSelectorsKey"];

          if (v16)
          {
            id v17 = [v11 name];
            [v24 setObject:v16 forKey:v17];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v6);
  }

  if (a3)
  {
    uint64_t v18 = v24;
    if ([v24 count])
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      long long v30 = @"IKJSRWIDependencyErrorSelectorsKey";
      v31 = v24;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *a3 = [v19 errorWithDomain:@"IKJSRWIDependencyErrorDomain" code:1 userInfo:v20];

      BOOL v21 = 0;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 1;
    uint64_t v18 = v24;
  }

  return v21;
}

- (BOOL)isValidForEventsWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v24 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = [(IKJSRWIDependencyDomain *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v10 = [(IKJSRWIDependencyDomain *)self events];
        BOOL v11 = [v10 objectForKey:v9];

        id v25 = 0;
        char v12 = [v11 isValidWithError:&v25];
        id v13 = v25;
        id v14 = v13;
        if ((v12 & 1) == 0)
        {
          long long v15 = [v13 userInfo];
          BOOL v16 = [v15 objectForKey:@"IKJSRWIDependencyErrorSelectorsKey"];

          if (v16)
          {
            id v17 = [v11 name];
            [v24 setObject:v16 forKey:v17];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v6);
  }

  if (a3)
  {
    uint64_t v18 = v24;
    if ([v24 count])
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      long long v30 = @"IKJSRWIDependencyErrorSelectorsKey";
      v31 = v24;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *a3 = [v19 errorWithDomain:@"IKJSRWIDependencyErrorDomain" code:1 userInfo:v20];

      BOOL v21 = 0;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 1;
    uint64_t v18 = v24;
  }

  return v21;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (Class)agentClass
{
  return self->_agentClass;
}

- (void)setAgentClass:(Class)a3
{
}

- (NSDictionary)types
{
  return self->_types;
}

- (NSDictionary)commands
{
  return self->_commands;
}

- (NSDictionary)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_agentClass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end