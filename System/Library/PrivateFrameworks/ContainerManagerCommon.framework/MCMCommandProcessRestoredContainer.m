@interface MCMCommandProcessRestoredContainer
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandProcessRestoredContainer)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5;
- (MCMCommandProcessRestoredContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (void)execute;
@end

@implementation MCMCommandProcessRestoredContainer

- (void).cxx_destruct
{
  p_concreteContainerIdentity = &self->_concreteContainerIdentity;

  objc_storeStrong((id *)p_concreteContainerIdentity, 0);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void)execute
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = [MCMCommandRecreateContainerStructure alloc];
  v5 = [(MCMCommandProcessRestoredContainer *)self concreteContainerIdentity];
  v6 = [(MCMCommand *)self context];
  v7 = [(MCMCommand *)self resultPromise];
  v8 = [(MCMCommandRecreateContainerStructure *)v4 initWithConcreteContainerIdentity:v5 context:v6 resultPromise:v7];

  [(MCMCommandRecreateContainerStructure *)v8 execute];
  v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(MCMCommand *)self resultPromise];
    v11 = [v10 result];
    v12 = [v11 error];
    int v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEFAULT, "Process restored container result; error = %@",
      (uint8_t *)&v13,
      0xCu);
  }
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToRestoreContainer];

  return v4;
}

- (MCMCommandProcessRestoredContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandProcessRestoredContainer;
  v9 = [(MCMCommand *)&v13 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;
  }
  return v9;
}

- (MCMCommandProcessRestoredContainer)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandProcessRestoredContainer;
  uint64_t v10 = [(MCMCommand *)&v13 initWithContext:a4 resultPromise:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_concreteContainerIdentity, a3);
  }

  return v11;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 22;
}

@end