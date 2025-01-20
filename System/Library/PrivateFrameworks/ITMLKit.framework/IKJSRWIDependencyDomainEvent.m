@interface IKJSRWIDependencyDomainEvent
- (BOOL)isValidWithError:(id *)a3;
- (IKJSRWIDependencyDomain)domain;
- (IKJSRWIDependencyDomainEvent)initWithEventDictionary:(id)a3 forDomain:(id)a4;
- (NSArray)params;
- (NSString)name;
- (NSString)purpose;
- (id)_eventInterfaceStringForImplementation:(BOOL)a3;
- (id)eventImplementationStringWithSoftLinking:(BOOL)a3;
- (id)eventInterfaceString;
- (id)selectorString;
@end

@implementation IKJSRWIDependencyDomainEvent

- (IKJSRWIDependencyDomainEvent)initWithEventDictionary:(id)a3 forDomain:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)IKJSRWIDependencyDomainEvent;
  v8 = [(IKJSRWIDependencyDomainEvent *)&v30 init];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKey:@"name"];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v6 objectForKey:@"description"];
    purpose = v8->_purpose;
    v8->_purpose = (NSString *)v11;

    objc_storeWeak((id *)&v8->_domain, v7);
    v13 = [v6 objectForKey:@"parameters"];
    v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * v19);
          v21 = [IKJSRWIDependencyDomainProperty alloc];
          v22 = -[IKJSRWIDependencyDomainProperty initWithPropertyDictionary:forDomain:](v21, "initWithPropertyDictionary:forDomain:", v20, v7, (void)v26);
          if (v22) {
            [v14 addObject:v22];
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v17);
    }

    uint64_t v23 = [v14 copy];
    params = v8->_params;
    v8->_params = (NSArray *)v23;
  }
  return v8;
}

- (id)selectorString
{
  v3 = [(IKJSRWIDependencyDomainEvent *)self name];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(IKJSRWIDependencyDomainEvent *)self params];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(IKJSRWIDependencyDomainEvent *)self params];
      uint64_t v9 = [v8 objectAtIndex:v7];

      v10 = [v9 name];
      uint64_t v11 = v10;
      if (v7)
      {
        [v4 appendFormat:@"%@:", v10];
      }
      else
      {
        v12 = objc_msgSend(v10, "ikrwi_camelCase");
        [v4 appendFormat:@"With%@:", v12];
      }
      ++v7;
      v13 = [(IKJSRWIDependencyDomainEvent *)self params];
      unint64_t v14 = [v13 count];
    }
    while (v7 < v14);
  }
  return v4;
}

- (id)eventInterfaceString
{
  return [(IKJSRWIDependencyDomainEvent *)self _eventInterfaceStringForImplementation:0];
}

- (id)_eventInterfaceStringForImplementation:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v6 = [(IKJSRWIDependencyDomainEvent *)self name];
  unint64_t v7 = [v5 stringWithFormat:@"- (void)safe_%@", v6];

  v8 = [(IKJSRWIDependencyDomainEvent *)self params];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = [(IKJSRWIDependencyDomainEvent *)self params];
      v12 = [v11 objectAtIndex:v10];

      v13 = [v12 name];
      unint64_t v14 = v13;
      if (v10)
      {
        id v15 = [v12 methodParameterString];
        [v7 appendFormat:@" %@:%@", v14, v15];
      }
      else
      {
        id v15 = objc_msgSend(v13, "ikrwi_camelCase");
        uint64_t v16 = [v12 methodParameterString];
        [v7 appendFormat:@"With%@:%@", v15, v16];
      }
      ++v10;
      uint64_t v17 = [(IKJSRWIDependencyDomainEvent *)self params];
      unint64_t v18 = [v17 count];
    }
    while (v10 < v18);
  }
  if (v3) {
    uint64_t v19 = @"\n{\n";
  }
  else {
    uint64_t v19 = @";\n";
  }
  [v7 appendFormat:v19];
  return v7;
}

- (id)eventImplementationStringWithSoftLinking:(BOOL)a3
{
  v4 = [(IKJSRWIDependencyDomainEvent *)self _eventInterfaceStringForImplementation:1];
  [v4 appendString:@"\tvoid *arguments[] = {"];
  v5 = [(IKJSRWIDependencyDomainEvent *)self params];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(IKJSRWIDependencyDomainEvent *)self params];
      uint64_t v9 = [v8 objectAtIndex:v7];

      if (v7) {
        unint64_t v10 = @", ";
      }
      else {
        unint64_t v10 = &stru_1F3E09950;
      }
      uint64_t v11 = [v9 name];
      [v4 appendFormat:@"%@&%@", v10, v11];

      ++v7;
      v12 = [(IKJSRWIDependencyDomainEvent *)self params];
      unint64_t v13 = [v12 count];
    }
    while (v7 < v13);
  }
  [v4 appendString:@"};\n"];
  unint64_t v14 = [(IKJSRWIDependencyDomainEvent *)self selectorString];
  objc_msgSend(v4, "appendFormat:", @"\tNSInvocation *invocation = [[self class] ik_invocationforSelectorString:@\"%@\" argumentsPointerValue:[NSValue valueWithPointer:arguments]];\n",
    v14);

  [v4 appendFormat:@"\t[invocation retainArguments];\n"];
  [v4 appendFormat:@"\t[invocation invokeWithTarget:self];"];
  [v4 appendFormat:@"\n}\n"];
  return v4;
}

- (BOOL)isValidWithError:(id *)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v5 = [(IKJSRWIDependencyDomainEvent *)self domain];
  uint64_t v6 = [v5 dispatcherClassString];
  Class v7 = NSClassFromString(v6);

  if (!v7) {
    return 1;
  }
  v8 = [(IKJSRWIDependencyDomainEvent *)self selectorString];
  char v9 = [(objc_class *)v7 instancesRespondToSelector:NSSelectorFromString(v8)];
  BOOL v10 = v9;
  if (a3 && (v9 & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = @"IKJSRWIDependencyErrorSelectorsKey";
    unint64_t v18 = v8;
    uint64_t v12 = [(IKJSRWIDependencyDomainEvent *)self purpose];
    unint64_t v13 = (void *)v12;
    unint64_t v14 = @"undefined";
    if (v12) {
      unint64_t v14 = (__CFString *)v12;
    }
    uint64_t v19 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v21[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    *a3 = [v11 errorWithDomain:@"IKJSRWIDependencyErrorDomain" code:0 userInfo:v16];
  }
  return v10;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end