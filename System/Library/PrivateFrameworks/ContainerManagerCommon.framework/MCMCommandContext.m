@interface MCMCommandContext
+ (id)privileged;
+ (id)privilegedWithUserIdentity:(id)a3 userIdentityCache:(id)a4;
- (MCMClientIdentity)clientIdentity;
- (MCMCommandContext)initWithClientIdentity:(id)a3 containerCache:(id)a4 containerFactory:(id)a5 userIdentityCache:(id)a6 kernelPersonaID:(unsigned int)a7 globalConfiguration:(id)a8;
- (MCMCommandContext)initWithClientIdentity:(id)a3 containerCache:(id)a4 containerFactory:(id)a5 userIdentityCache:(id)a6 kernelPersonaID:(unsigned int)a7 globalConfiguration:(id)a8 classIterator:(id)a9;
- (MCMContainerCache)containerCache;
- (MCMContainerClassUserIdentityIterator)classIterator;
- (MCMContainerFactory)containerFactory;
- (MCMGlobalConfiguration)globalConfiguration;
- (MCMUserIdentityCache)userIdentityCache;
- (unsigned)kernelPersonaID;
@end

@implementation MCMCommandContext

- (MCMCommandContext)initWithClientIdentity:(id)a3 containerCache:(id)a4 containerFactory:(id)a5 userIdentityCache:(id)a6 kernelPersonaID:(unsigned int)a7 globalConfiguration:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [MCMContainerClassIterator alloc];
  v20 = [v14 staticConfig];
  v21 = [(MCMContainerClassIterator *)v19 initWithStaticConfig:v20 userIdentityCache:v15];

  v22 = [(MCMCommandContext *)self initWithClientIdentity:v18 containerCache:v17 containerFactory:v16 userIdentityCache:v15 kernelPersonaID:v8 globalConfiguration:v14 classIterator:v21];
  return v22;
}

- (MCMCommandContext)initWithClientIdentity:(id)a3 containerCache:(id)a4 containerFactory:(id)a5 userIdentityCache:(id)a6 kernelPersonaID:(unsigned int)a7 globalConfiguration:(id)a8 classIterator:(id)a9
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)MCMCommandContext;
  id v18 = [(MCMCommandContext *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientIdentity, a3);
    objc_storeStrong((id *)&v19->_containerCache, a4);
    objc_storeStrong((id *)&v19->_containerFactory, a5);
    objc_storeStrong((id *)&v19->_userIdentityCache, a6);
    v19->_kernelPersonaID = a7;
    objc_storeStrong((id *)&v19->_globalConfiguration, a8);
    objc_storeStrong((id *)&v19->_classIterator, a9);
  }

  return v19;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (MCMContainerFactory)containerFactory
{
  return self->_containerFactory;
}

- (MCMGlobalConfiguration)globalConfiguration
{
  return self->_globalConfiguration;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (unsigned)kernelPersonaID
{
  return self->_kernelPersonaID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classIterator, 0);
  objc_storeStrong((id *)&self->_globalConfiguration, 0);
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_containerFactory, 0);
  objc_storeStrong((id *)&self->_containerCache, 0);

  objc_storeStrong((id *)&self->_clientIdentity, 0);
}

- (MCMContainerCache)containerCache
{
  return self->_containerCache;
}

- (MCMContainerClassUserIdentityIterator)classIterator
{
  return self->_classIterator;
}

+ (id)privilegedWithUserIdentity:(id)a3 userIdentityCache:(id)a4
{
  id v5 = a4;
  v6 = +[MCMClientIdentity anonymousPrivilegedClientIdentityWithUserIdentity:a3];
  v7 = [MCMContainerFactory alloc];
  uint64_t v8 = [(MCMContainerFactory *)v7 initWithContainerCache:gContainerCache clientIdentity:v6 userIdentityCache:v5];
  v9 = [MCMContainerClassIterator alloc];
  id v10 = containermanager_copy_global_configuration();
  v11 = [v10 staticConfig];
  v12 = [(MCMContainerClassIterator *)v9 initWithStaticConfig:v11 userIdentityCache:v5];

  v13 = [MCMCommandContext alloc];
  uint64_t v14 = gContainerCache;
  id v15 = containermanager_copy_global_configuration();
  id v16 = [(MCMCommandContext *)v13 initWithClientIdentity:v6 containerCache:v14 containerFactory:v8 userIdentityCache:v5 kernelPersonaID:0 globalConfiguration:v15 classIterator:v12];

  return v16;
}

+ (id)privileged
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__MCMCommandContext_privileged__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a1;
  if (privileged_token != -1) {
    dispatch_once(&privileged_token, v4);
  }
  v2 = (void *)privileged_privilegedContext;

  return v2;
}

void __31__MCMCommandContext_privileged__block_invoke(uint64_t a1)
{
  id v6 = +[MCMUserIdentitySharedCache sharedInstance];
  v2 = *(void **)(a1 + 32);
  v3 = [v6 defaultUserIdentity];
  uint64_t v4 = [v2 privilegedWithUserIdentity:v3 userIdentityCache:v6];
  id v5 = (void *)privileged_privilegedContext;
  privileged_privilegedContext = v4;
}

@end