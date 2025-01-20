@interface IKJSRWIDependencyDomainType
- (BOOL)isInitializerValid;
- (BOOL)isValidWithError:(id *)a3;
- (IKJSRWIDependencyDomain)domain;
- (IKJSRWIDependencyDomainType)initWithTypeDictionary:(id)a3 forDomain:(id)a4;
- (NSArray)initializationParameters;
- (NSDictionary)properties;
- (NSString)domainType;
- (NSString)identifier;
- (NSString)name;
- (NSString)purpose;
- (id)initializationSelectorString;
- (id)initializationString;
- (id)invalidProperties;
- (id)typeImplementationStringWithSoftLinking:(BOOL)a3;
- (id)typeInterfaceString;
@end

@implementation IKJSRWIDependencyDomainType

- (IKJSRWIDependencyDomainType)initWithTypeDictionary:(id)a3 forDomain:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)IKJSRWIDependencyDomainType;
  v8 = [(IKJSRWIDependencyDomainType *)&v42 init];
  if (v8)
  {
    v9 = [v6 objectForKey:@"id"];
    objc_storeWeak((id *)&v8->_domain, v7);
    objc_storeStrong((id *)&v8->_identifier, v9);
    v10 = NSString;
    v11 = [v7 identifier];
    char v12 = [v9 hasPrefix:v11];
    if (v12)
    {
      v13 = &stru_1F3E09950;
    }
    else
    {
      v13 = [v7 identifier];
    }
    uint64_t v14 = [v10 stringWithFormat:@"RWIProtocol%@%@", v13, v9];
    name = v8->_name;
    v8->_name = (NSString *)v14;

    if ((v12 & 1) == 0) {
    v16 = [v6 objectForKey:@"enum"];
    }
    if (v16)
    {
      domainType = v8->_domainType;
      v8->_domainType = (NSString *)@"enum";
    }
    else
    {
      uint64_t v18 = [v6 objectForKey:@"type"];
      domainType = v8->_domainType;
      v8->_domainType = (NSString *)v18;
    }

    uint64_t v19 = [v6 objectForKey:@"description"];
    purpose = v8->_purpose;
    v8->_purpose = (NSString *)v19;

    if ([(NSString *)v8->_domainType isEqualToString:@"object"])
    {
      id v37 = v7;
      uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
      initializationParameters = v8->_initializationParameters;
      v8->_initializationParameters = (NSArray *)v21;

      v23 = (void *)MEMORY[0x1E4F1CA60];
      v24 = [v6 objectForKey:@"properties"];
      uint64_t v25 = objc_msgSend(v23, "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      properties = v8->_properties;
      v8->_properties = (NSDictionary *)v25;

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v27 = [v6 objectForKey:@"properties"];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v39 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = [[IKJSRWIDependencyDomainProperty alloc] initWithPropertyDictionary:*(void *)(*((void *)&v38 + 1) + 8 * i) forType:v8];
            v33 = v32;
            if (v32)
            {
              if ([(IKJSRWIDependencyDomainProperty *)v32 isRequired]) {
                [(NSArray *)v8->_initializationParameters addObject:v33];
              }
              v34 = v8->_properties;
              v35 = [(IKJSRWIDependencyDomainProperty *)v33 name];
              [(NSDictionary *)v34 setObject:v33 forKey:v35];
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v29);
      }

      id v7 = v37;
    }
  }
  return v8;
}

- (id)initializationSelectorString
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(IKJSRWIDependencyDomainType *)self initializationParameters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v3 length];
        v11 = [v9 name];
        char v12 = v11;
        if (v10)
        {
          [v3 appendFormat:@"%@:", v11];
        }
        else
        {
          v13 = objc_msgSend(v11, "ikrwi_camelCase");
          [v3 appendFormat:@"initWith%@:", v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)initializationString
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(IKJSRWIDependencyDomainType *)self initializationParameters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v3 length];
        v11 = [v9 name];
        char v12 = v11;
        if (v10)
        {
          v13 = [v9 methodParameterString];
          [v3 appendFormat:@" %@:%@", v12, v13];
        }
        else
        {
          v13 = objc_msgSend(v11, "ikrwi_camelCase");
          uint64_t v14 = [v9 methodParameterString];
          [v3 appendFormat:@"initWith%@:%@", v13, v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isInitializerValid
{
  v3 = [(IKJSRWIDependencyDomainType *)self domainType];
  int v4 = [v3 isEqualToString:@"object"];

  if (!v4) {
    return 1;
  }
  uint64_t v5 = [(IKJSRWIDependencyDomainType *)self initializationSelectorString];
  if ([v5 length])
  {
    uint64_t v6 = [(IKJSRWIDependencyDomainType *)self name];
    Class v7 = NSClassFromString(v6);
    v8 = [(IKJSRWIDependencyDomainType *)self initializationSelectorString];
    char v9 = [(objc_class *)v7 instancesRespondToSelector:NSSelectorFromString(v8)];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (id)invalidProperties
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  int v4 = [(IKJSRWIDependencyDomainType *)self domainType];
  int v5 = [v4 isEqualToString:@"object"];

  if (v5)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [(IKJSRWIDependencyDomainType *)self properties];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(NSString **)(*((void *)&v20 + 1) + 8 * i);
          char v12 = [(IKJSRWIDependencyDomainType *)self name];
          Class v13 = NSClassFromString(v12);
          LOBYTE(v13) = [(objc_class *)v13 instancesRespondToSelector:NSSelectorFromString(v11)];

          if ((v13 & 1) == 0)
          {
            uint64_t v14 = [(IKJSRWIDependencyDomainType *)self properties];
            long long v15 = [v14 objectForKey:v11];
            uint64_t v16 = [v15 purpose];
            long long v17 = (void *)v16;
            if (v16) {
              long long v18 = (__CFString *)v16;
            }
            else {
              long long v18 = @"undefined";
            }
            [v3 setObject:v18 forKey:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
  }
  return v3;
}

- (BOOL)isValidWithError:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v5 = [(IKJSRWIDependencyDomainType *)self domainType];
  int v6 = [v5 isEqualToString:@"object"];

  if (!v6) {
    return 1;
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  if (![(IKJSRWIDependencyDomainType *)self isInitializerValid])
  {
    uint64_t v8 = [(IKJSRWIDependencyDomainType *)self initializationSelectorString];
    [v7 setObject:@"Initializer" forKey:v8];
  }
  uint64_t v9 = [(IKJSRWIDependencyDomainType *)self invalidProperties];
  [v7 addEntriesFromDictionary:v9];

  if (a3 && [v7 count])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = @"IKJSRWIDependencyErrorSelectorsKey";
    v15[0] = v7;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a3 = [v10 errorWithDomain:@"IKJSRWIDependencyErrorDomain" code:0 userInfo:v11];

    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (id)typeInterfaceString
{
  v3 = [MEMORY[0x1E4F28E78] string];
  int v4 = [(IKJSRWIDependencyDomainType *)self domainType];
  int v5 = [v4 isEqualToString:@"object"];

  if (v5)
  {
    int v6 = [(IKJSRWIDependencyDomainType *)self name];
    [v3 appendFormat:@"@interface %@ (IKJSDependency)\n", v6];

    uint64_t v7 = [(IKJSRWIDependencyDomainType *)self initializationString];
    if ([v7 length]) {
      [v3 appendFormat:@"+ (instancetype)safe_%@;\n", v7];
    }
    [v3 appendString:@"@end\n\n"];
  }
  return v3;
}

- (id)typeImplementationStringWithSoftLinking:(BOOL)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v5 = [MEMORY[0x1E4F28E78] string];
  int v6 = [(IKJSRWIDependencyDomainType *)self domainType];
  int v7 = [v6 isEqualToString:@"object"];

  if (v7)
  {
    uint64_t v8 = [(IKJSRWIDependencyDomainType *)self name];
    [v5 appendFormat:@"@implementation %@ (IKJSDependency)\n", v8];

    uint64_t v9 = [(IKJSRWIDependencyDomainType *)self initializationString];
    if ([v9 length])
    {
      BOOL v28 = a3;
      [v5 appendFormat:@"+ (instancetype)safe_%@\n{\n", v9];
      [v5 appendString:@"\tvoid *arguments[] = {"];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = [(IKJSRWIDependencyDomainType *)self initializationParameters];
      uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            uint64_t v14 = v5;
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(obj);
            }
            long long v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v16 = [(IKJSRWIDependencyDomainType *)self initializationParameters];
            [v16 firstObject];
            long long v18 = v17 = self;

            BOOL v19 = v18 == v15;
            self = v17;
            if (v19) {
              long long v20 = &stru_1F3E09950;
            }
            else {
              long long v20 = @", ";
            }
            long long v21 = [v15 name];
            v27 = v20;
            int v5 = v14;
            [v14 appendFormat:@"%@&%@", v27, v21];
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v11);
      }

      [v5 appendString:@"};\n"];
      if (v28)
      {
        long long v22 = NSString;
        long long v23 = [(IKJSRWIDependencyDomainType *)self name];
        v24 = [v22 stringWithFormat:@"get%@Class()", v23];
      }
      else
      {
        v24 = [(IKJSRWIDependencyDomainType *)self name];
      }
      uint64_t v25 = [(IKJSRWIDependencyDomainType *)self initializationSelectorString];
      objc_msgSend(v5, "appendFormat:", @"\treturn [[%@ alloc] ik_initWithSelectorString:@\"%@\" arguments:arguments];\n",
        v24,
        v25);

      [v5 appendString:@"}\n"];
    }
    [v5 appendString:@"@end\n\n"];
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)domainType
{
  return self->_domainType;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (IKJSRWIDependencyDomain)domain
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  return (IKJSRWIDependencyDomain *)WeakRetained;
}

- (NSArray)initializationParameters
{
  return self->_initializationParameters;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_initializationParameters, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_domainType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end