@interface MCMResultWithContainersArrayBase
- (BOOL)encodeResultOntoReply:(id)a3;
- (BOOL)includeCreator;
- (BOOL)includeInfo;
- (BOOL)includePath;
- (BOOL)includeUserManagedAssetsRelPath;
- (BOOL)skipSandboxExtensions;
- (MCMClientIdentity)clientIdentity;
- (MCMResultWithContainersArrayBase)initWithContainerPaths:(id)a3 containerIdentities:(id)a4 includePath:(BOOL)a5 clientIdentity:(id)a6 skipSandboxExtensions:(BOOL)a7;
- (MCMResultWithContainersArrayBase)initWithContainers:(id)a3 includePath:(BOOL)a4 includeInfo:(BOOL)a5 includeUserManagedAssetsRelPath:(BOOL)a6 includeCreator:(BOOL)a7 clientIdentity:(id)a8 skipSandboxExtensions:(BOOL)a9;
- (NSArray)containerIdentities;
- (NSArray)containerPaths;
- (NSArray)containers;
- (void)_encodeContainerIdentitiesAndPathsOnXPCContainers:(id)a3;
- (void)_encodeContainersOnXPCContainers:(id)a3;
@end

@implementation MCMResultWithContainersArrayBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_containerIdentities, 0);

  objc_storeStrong((id *)&self->_containerPaths, 0);
}

- (BOOL)skipSandboxExtensions
{
  return self->_skipSandboxExtensions;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (BOOL)includeInfo
{
  return self->_includeInfo;
}

- (BOOL)includePath
{
  return self->_includePath;
}

- (NSArray)containers
{
  return self->_containers;
}

- (NSArray)containerIdentities
{
  return self->_containerIdentities;
}

- (NSArray)containerPaths
{
  return self->_containerPaths;
}

- (void)_encodeContainerIdentitiesAndPathsOnXPCContainers:(id)a3
{
  v20[1] = *(void **)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MCMResultWithContainersArrayBase *)self containerIdentities];

  if (v5)
  {
    v6 = [(MCMResultWithContainersArrayBase *)self containerIdentities];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [(MCMResultWithContainersArrayBase *)self containerIdentities];
        v10 = [v9 objectAtIndexedSubscript:v8];

        v11 = [(MCMResultWithContainersArrayBase *)self containerPaths];
        v12 = [v11 objectAtIndexedSubscript:v8];

        xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
        v20[0] = 0;
        if (![(MCMResultWithContainersArrayBase *)self skipSandboxExtensions])
        {
          v14 = [(MCMResultWithContainersArrayBase *)self clientIdentity];
          v20[0] = (void *)[v14 issueSandboxExtensionWithIdentity:v10 containerPath:v12 legacyExtensionPolicy:1 extensionsUseProxiedClient:1 extensionsPolicyUsesProxiedClient:1 error:0];
        }
        v15 = [MCMResultWithContainerBase alloc];
        v16 = [v10 uuid];
        v17 = [(MCMResultWithContainerBase *)v15 initWithContainerPath:v12 containerIdentity:v10 uuid:v16 sandboxToken:v20[0] includePath:[(MCMResultWithContainersArrayBase *)self includePath]];

        [(MCMResultWithContainerBase *)v17 encodeResultOntoReply:v13];
        xpc_array_append_value(v4, v13);
        if (v20[0])
        {
          free(v20[0]);
          memset_s(v20, 8uLL, 0, 8uLL);
        }

        ++v8;
        v18 = [(MCMResultWithContainersArrayBase *)self containerIdentities];
        unint64_t v19 = [v18 count];
      }
      while (v8 < v19);
    }
  }
}

- (void)_encodeContainersOnXPCContainers:(id)a3
{
  v19[1] = *(void **)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MCMResultWithContainersArrayBase *)self containers];

  if (v5)
  {
    v6 = [(MCMResultWithContainersArrayBase *)self containers];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [(MCMResultWithContainersArrayBase *)self containers];
        v10 = [v9 objectAtIndexedSubscript:v8];

        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        v19[0] = 0;
        if (![(MCMResultWithContainersArrayBase *)self skipSandboxExtensions])
        {
          v12 = [(MCMResultWithContainersArrayBase *)self clientIdentity];
          xpc_object_t v13 = [v10 containerIdentity];
          v14 = [v10 containerPath];
          v19[0] = (void *)[v12 issueSandboxExtensionWithIdentity:v13 containerPath:v14 legacyExtensionPolicy:1 extensionsUseProxiedClient:1 extensionsPolicyUsesProxiedClient:1 error:0];
        }
        v15 = [MCMResultWithContainerBase alloc];
        v16 = [(MCMResultWithContainerBase *)v15 initWithMetadata:v10 sandboxToken:v19[0] includePath:[(MCMResultWithContainersArrayBase *)self includePath] includeInfo:[(MCMResultWithContainersArrayBase *)self includeInfo] includeUserManagedAssetsRelPath:[(MCMResultWithContainersArrayBase *)self includeUserManagedAssetsRelPath] includeCreator:[(MCMResultWithContainersArrayBase *)self includeCreator]];
        [(MCMResultWithContainerBase *)v16 encodeResultOntoReply:v11];
        xpc_array_append_value(v4, v11);
        if (v19[0])
        {
          free(v19[0]);
          memset_s(v19, 8uLL, 0, 8uLL);
        }

        ++v8;
        v17 = [(MCMResultWithContainersArrayBase *)self containers];
        unint64_t v18 = [v17 count];
      }
      while (v8 < v18);
    }
  }
}

- (MCMResultWithContainersArrayBase)initWithContainers:(id)a3 includePath:(BOOL)a4 includeInfo:(BOOL)a5 includeUserManagedAssetsRelPath:(BOOL)a6 includeCreator:(BOOL)a7 clientIdentity:(id)a8 skipSandboxExtensions:(BOOL)a9
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MCMResultWithContainersArrayBase;
  unint64_t v18 = [(MCMResultBase *)&v23 init];
  unint64_t v19 = v18;
  if (v18)
  {
    containerPaths = v18->_containerPaths;
    v18->_containerPaths = 0;

    containerIdentities = v19->_containerIdentities;
    v19->_containerIdentities = 0;

    objc_storeStrong((id *)&v19->_containers, a3);
    v19->_includePath = a4;
    v19->_includeInfo = a5;
    v19->_includeUserManagedAssetsRelPath = a6;
    v19->_includeCreator = a7;
    objc_storeStrong((id *)&v19->_clientIdentity, a8);
    v19->_skipSandboxExtensions = a9;
  }

  return v19;
}

- (MCMResultWithContainersArrayBase)initWithContainerPaths:(id)a3 containerIdentities:(id)a4 includePath:(BOOL)a5 clientIdentity:(id)a6 skipSandboxExtensions:(BOOL)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MCMResultWithContainersArrayBase;
  id v16 = [(MCMResultBase *)&v20 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_containerPaths, a3);
    objc_storeStrong((id *)&v17->_containerIdentities, a4);
    containers = v17->_containers;
    v17->_containers = 0;

    v17->_includePath = a5;
    v17->_includeInfo = 0;
    v17->_includeUserManagedAssetsRelPath = 0;
    v17->_includeCreator = 0;
    objc_storeStrong((id *)&v17->_clientIdentity, a6);
    v17->_skipSandboxExtensions = a7;
  }

  return v17;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultWithContainersArrayBase;
  BOOL v5 = [(MCMResultBase *)&v9 encodeResultOntoReply:v4];
  if (v5)
  {
    v6 = [(MCMResultBase *)self error];

    if (!v6)
    {
      xpc_object_t v7 = xpc_array_create(0, 0);
      [(MCMResultWithContainersArrayBase *)self _encodeContainersOnXPCContainers:v7];
      [(MCMResultWithContainersArrayBase *)self _encodeContainerIdentitiesAndPathsOnXPCContainers:v7];
      xpc_dictionary_set_value(v4, "ReplyContainersArray", v7);
    }
  }

  return v5;
}

@end