@interface CTXPCSubscriptionContextRequest
+ (id)allowedClassesForArguments;
- (CTServiceDescriptor)descriptor;
- (CTXPCServiceSubscriptionContext)context;
- (CTXPCSubscriptionContextRequest)initWithContext:(id)a3;
- (CTXPCSubscriptionContextRequest)initWithContext:(id)a3 namedArguments:(id)a4;
- (CTXPCSubscriptionContextRequest)initWithDescriptor:(id)a3;
- (CTXPCSubscriptionContextRequest)initWithDescriptor:(id)a3 namedArguments:(id)a4;
@end

@implementation CTXPCSubscriptionContextRequest

- (CTXPCSubscriptionContextRequest)initWithContext:(id)a3
{
  return [(CTXPCSubscriptionContextRequest *)self initWithContext:a3 namedArguments:MEMORY[0x1E4F1CC08]];
}

- (CTXPCSubscriptionContextRequest)initWithDescriptor:(id)a3 namedArguments:(id)a4
{
  id v6 = a4;
  v7 = +[CTXPCServiceSubscriptionContext contextWithServiceDescriptor:a3];
  v8 = [(CTXPCSubscriptionContextRequest *)self initWithContext:v7 namedArguments:v6];

  return v8;
}

- (CTXPCSubscriptionContextRequest)initWithContext:(id)a3 namedArguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v8 = CTLogClientXPC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](v8);
    }
  }
  v9 = objc_opt_new();
  [v9 setObject:v6 forKeyedSubscript:@"context"];
  [v9 addEntriesFromDictionary:v7];
  v10 = (void *)[v9 copy];
  v13.receiver = self;
  v13.super_class = (Class)CTXPCSubscriptionContextRequest;
  v11 = [(CTXPCMessage *)&v13 initWithNamedArguments:v10];

  return v11;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSubscriptionContextRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (CTServiceDescriptor)descriptor
{
  v2 = [(CTXPCSubscriptionContextRequest *)self context];
  if (v2)
  {
    v3 = +[CTServiceDescriptor descriptorWithSubscriptionContext:v2];
  }
  else
  {
    v3 = 0;
  }

  return (CTServiceDescriptor *)v3;
}

- (CTXPCServiceSubscriptionContext)context
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"context"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CTXPCServiceSubscriptionContext *)v4;
}

- (CTXPCSubscriptionContextRequest)initWithDescriptor:(id)a3
{
  return [(CTXPCSubscriptionContextRequest *)self initWithDescriptor:a3 namedArguments:MEMORY[0x1E4F1CC08]];
}

- (void)initWithContext:(os_log_t)log namedArguments:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18444A000, log, OS_LOG_TYPE_FAULT, "CTXPCSubscriptionContextRequest was initialized with a nil context", v1, 2u);
}

@end