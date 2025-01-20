@interface MCMCommandAcquireSandboxExtensionWithUUID
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandAcquireSandboxExtensionWithUUID)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (void)execute;
@end

@implementation MCMCommandAcquireSandboxExtensionWithUUID

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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v3 = [(MCMCommandAcquireSandboxExtensionWithUUID *)self concreteContainerIdentity];
  __s = 0;
  v4 = [(MCMCommand *)self context];
  v5 = [v4 containerCache];
  id v30 = 0;
  v27 = (void *)v3;
  v6 = [v5 entryForContainerIdentity:v3 error:&v30];
  v7 = (MCMError *)v30;

  v26 = v6;
  if (v6)
  {
    v8 = [v6 metadataMinimal];
    v9 = [(MCMCommand *)self context];
    v10 = [v9 clientIdentity];
    v11 = [v8 containerIdentity];
    v12 = [v8 containerPath];
    v29 = v7;
    char v13 = 1;
    v14 = (void *)[v10 issueSandboxExtensionWithIdentity:v11 containerPath:v12 legacyExtensionPolicy:0 extensionsUseProxiedClient:1 extensionsPolicyUsesProxiedClient:1 error:&v29];
    v15 = v29;

    __s = v14;
    if (v14)
    {
LABEL_5:
      v7 = v15;
      goto LABEL_8;
    }
    if (v15)
    {
      v14 = 0;
      char v13 = 0;
      goto LABEL_5;
    }
    v7 = [[MCMError alloc] initWithErrorType:72 category:3];
    v14 = 0;
  }
  else
  {
    v14 = 0;
    v8 = 0;
  }
  char v13 = 0;
LABEL_8:
  v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v33 = v14 != 0;
    __int16 v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_DEFAULT, "Acquire sandbox extension result: %d, error = %@", buf, 0x12u);
  }

  v17 = [MCMResultAcquireSandboxExtensionWithUUID alloc];
  v18 = v17;
  if (v13)
  {
    v19 = [v8 userIdentity];
    v20 = [v19 personaUniqueString];
    v21 = [v8 containerPath];
    v22 = [v21 containerDataURL];
    v23 = [(MCMResultAcquireSandboxExtensionWithUUID *)v18 initWithSandboxToken:v14 personaUniqueString:v20 url:v22];
  }
  else
  {
    v23 = [(MCMResultBase *)v17 initWithError:v7];
  }
  v24 = v26;
  if (v14)
  {
    free(v14);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  v25 = [(MCMCommand *)self resultPromise];
  [v25 completeWithResult:v23];
}

- (BOOL)preflightClientAllowed
{
  v2 = self;
  uint64_t v3 = [(MCMCommand *)self context];
  v4 = [v3 clientIdentity];

  v5 = [(MCMCommandAcquireSandboxExtensionWithUUID *)v2 concreteContainerIdentity];
  LOBYTE(v2) = [v4 isAllowedToLookupContainerIdentity:v5];

  return (char)v2;
}

- (MCMCommandAcquireSandboxExtensionWithUUID)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandAcquireSandboxExtensionWithUUID;
  v9 = [(MCMCommand *)&v13 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;
  }
  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 35;
}

@end