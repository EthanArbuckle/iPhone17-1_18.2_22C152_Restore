@interface IKJSRWIDependencyDomainCommand
- (BOOL)isValidWithError:(id *)a3;
- (IKJSRWIDependencyDomain)domain;
- (IKJSRWIDependencyDomainCommand)initWithCommandDictionary:(id)a3 forDomain:(id)a4;
- (NSArray)params;
- (NSArray)returns;
- (NSString)name;
- (NSString)purpose;
- (id)selectorString;
@end

@implementation IKJSRWIDependencyDomainCommand

- (IKJSRWIDependencyDomainCommand)initWithCommandDictionary:(id)a3 forDomain:(id)a4
{
  NSArray *returns;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  IKJSRWIDependencyDomainProperty *v30;
  uint64_t v31;
  NSArray *params;
  IKJSRWIDependencyDomainCommand *v34;
  void *v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  objc_super v44;
  unsigned char v45[128];
  unsigned char v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)IKJSRWIDependencyDomainCommand;
  v8 = [(IKJSRWIDependencyDomainCommand *)&v44 init];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKey:@"name"];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v6 objectForKey:@"description"];
    purpose = v8->_purpose;
    v8->_purpose = (NSString *)v11;

    objc_storeWeak((id *)&v8->_domain, v7);
    v35 = v6;
    v13 = [v6 objectForKey:@"returns"];
    v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v41;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [[IKJSRWIDependencyDomainProperty alloc] initWithPropertyDictionary:*(void *)(*((void *)&v40 + 1) + 8 * v19) forDomain:v7];
          if (v20) {
            [v14 addObject:v20];
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v17);
    }

    uint64_t v21 = [v14 copy];
    returns = v8->_returns;
    v34 = v8;
    v8->_returns = (NSArray *)v21;

    v23 = [v35 objectForKey:@"parameters"];
    v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v25 = v23;
    v26 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v26)
    {
      v27 = v26;
      v28 = *(void *)v37;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [[IKJSRWIDependencyDomainProperty alloc] initWithPropertyDictionary:*(void *)(*((void *)&v36 + 1) + 8 * v29) forDomain:v7];
          if (v30) {
            [v24 addObject:v30];
          }

          ++v29;
        }
        while (v27 != v29);
        v27 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v27);
    }

    v31 = [v24 copy];
    v8 = v34;
    params = v34->_params;
    v34->_params = (NSArray *)v31;

    id v6 = v35;
  }

  return v8;
}

- (id)selectorString
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(IKJSRWIDependencyDomainCommand *)self name];
  v5 = [v3 stringWithFormat:@"%@WithErrorCallback:", v4];

  [v5 appendString:@"successCallback:"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(IKJSRWIDependencyDomainCommand *)self params];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) name];
        [v5 appendFormat:@"%@:", v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isValidWithError:(id *)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v5 = [(IKJSRWIDependencyDomainCommand *)self domain];
  uint64_t v6 = [v5 agentClass];

  if (!v6) {
    return 1;
  }
  uint64_t v7 = [(IKJSRWIDependencyDomainCommand *)self selectorString];
  uint64_t v8 = [(IKJSRWIDependencyDomainCommand *)self domain];
  char v9 = objc_msgSend((id)objc_msgSend(v8, "agentClass"), "instancesRespondToSelector:", NSSelectorFromString(v7));

  if (a3 && (v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = @"IKJSRWIDependencyErrorSelectorsKey";
    uint64_t v17 = v7;
    uint64_t v11 = [(IKJSRWIDependencyDomainCommand *)self purpose];
    v12 = (void *)v11;
    long long v13 = @"undefined";
    if (v11) {
      long long v13 = (__CFString *)v11;
    }
    uint64_t v18 = v13;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v20[0] = v14;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a3 = [v10 errorWithDomain:@"IKJSRWIDependencyErrorDomain" code:0 userInfo:v15];
  }
  return v9;
}

- (NSString)name
{
  return self->_name;
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

- (NSArray)params
{
  return self->_params;
}

- (NSArray)returns
{
  return self->_returns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returns, 0);
  objc_storeStrong((id *)&self->_params, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end