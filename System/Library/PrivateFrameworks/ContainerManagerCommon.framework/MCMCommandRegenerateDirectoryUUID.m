@interface MCMCommandRegenerateDirectoryUUID
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandRegenerateDirectoryUUID)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5;
- (MCMCommandRegenerateDirectoryUUID)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (id)regenerateDirectoryUUIDNoCacheUpdateWithMetadata:(id)a3 error:(id *)a4;
- (void)execute;
@end

@implementation MCMCommandRegenerateDirectoryUUID

- (void).cxx_destruct
{
  p_concreteContainerIdentity = &self->_concreteContainerIdentity;

  objc_storeStrong((id *)p_concreteContainerIdentity, 0);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (id)regenerateDirectoryUUIDNoCacheUpdateWithMetadata:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(MCMCommand *)self context];
  v8 = [v7 clientIdentity];
  [v8 platform];
  [v6 containerClass];
  [v6 transient];
  char v9 = container_class_supports_randomized_path();

  if ((v9 & 1) == 0)
  {
    v29 = [[MCMError alloc] initWithErrorType:72];
    v30 = container_log_handle_for_category();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v18 = 0;
      v13 = 0;
      id v20 = 0;
LABEL_13:

      if (a4)
      {
        v29 = v29;
        v28 = 0;
        *a4 = v29;
      }
      else
      {
        v28 = 0;
      }
      id v26 = v20;
      goto LABEL_17;
    }
    v31 = [(MCMCommand *)self context];
    v32 = [v31 clientIdentity];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v47 = [v32 platform];
    *(_WORD *)&v47[4] = 2112;
    *(void *)&v47[6] = v6;
    v33 = "UUID container paths are unsupported on (%d) for: %@";
    v34 = v30;
    uint32_t v35 = 18;
LABEL_28:
    _os_log_error_impl(&dword_1D7739000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);

    goto LABEL_12;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  v11 = [v6 containerPath];
  v12 = [v11 containerPathIdentifier];
  v13 = (void *)[v10 initWithUUIDString:v12];

  if (!v13)
  {
    v29 = [[MCMError alloc] initWithErrorType:11];
    v30 = container_log_handle_for_category();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v31 = [v6 containerPath];
    v32 = [v31 containerPathIdentifier];
    *(_DWORD *)buf = 138412546;
    *(void *)v47 = v32;
    *(_WORD *)&v47[8] = 2112;
    *(void *)&v47[10] = v6;
    v33 = "Non-UUID last path component: %@ for %@";
    v34 = v30;
    uint32_t v35 = 22;
    goto LABEL_28;
  }
  v14 = objc_opt_class();
  if ([v6 transient]) {
    v14 = objc_opt_class();
  }
  v15 = [v6 containerIdentity];
  uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
  v17 = [(id)v16 UUIDString];
  v18 = [v14 containerPathForContainerIdentity:v15 containerPathIdentifier:v17];

  v19 = [v18 containerClassPath];
  id v45 = 0;
  LOBYTE(v16) = [v19 createIfNecessaryWithError:&v45];
  id v20 = v45;

  if ((v16 & 1) == 0)
  {
    v29 = [[MCMError alloc] initWithErrorType:48];
    v30 = container_log_handle_for_category();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v37 = [v18 containerClassPath];
      *(_DWORD *)buf = 138412546;
      *(void *)v47 = v37;
      *(_WORD *)&v47[8] = 2112;
      *(void *)&v47[10] = v20;
      _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, "Failed to create class path at: %@; error = %@",
        buf,
        0x16u);
    }
    goto LABEL_13;
  }
  v43 = a4;
  v21 = +[MCMFileManager defaultManager];
  v22 = [v6 containerPath];
  v23 = [v22 containerRootURL];
  v24 = [v18 containerRootURL];
  id v44 = v20;
  char v25 = [v21 moveItemAtURL:v23 toURL:v24 error:&v44];
  id v26 = v44;

  if ((v25 & 1) == 0)
  {
    v29 = [[MCMError alloc] initWithErrorType:48];
    v30 = container_log_handle_for_category();
    a4 = v43;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v42 = [v6 containerPath];
      v38 = [v42 containerRootURL];
      v39 = [v38 path];
      v40 = [v18 containerRootURL];
      v41 = [v40 path];
      *(_DWORD *)buf = 138412802;
      *(void *)v47 = v39;
      *(_WORD *)&v47[8] = 2112;
      *(void *)&v47[10] = v41;
      __int16 v48 = 2112;
      id v49 = v26;
      _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, "Failed to move dir: %@ to new UUID dir: %@; error = %@",
        buf,
        0x20u);

      a4 = v43;
    }
    goto LABEL_26;
  }
  uint64_t v27 = [v6 metadataByChangingContainerPath:v18];
  a4 = v43;
  if (!v27)
  {
    v29 = [[MCMError alloc] initWithErrorType:73];
    v30 = container_log_handle_for_category();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v47 = v29;
      _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, "Failed to update metadata for regenerate: %@", buf, 0xCu);
    }
LABEL_26:
    id v20 = v26;
    goto LABEL_13;
  }
  v28 = (void *)v27;
  v29 = 0;
LABEL_17:

  return v28;
}

- (void)execute
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = [(MCMCommand *)self context];
  v5 = [v4 containerCache];
  id v6 = [(MCMCommandRegenerateDirectoryUUID *)self concreteContainerIdentity];
  id v24 = 0;
  v7 = [v5 entryForContainerIdentity:v6 error:&v24];
  id v8 = v24;

  char v9 = [v7 metadataMinimal];
  if (v9)
  {
    id v23 = v8;
    id v10 = [(MCMCommandRegenerateDirectoryUUID *)self regenerateDirectoryUUIDNoCacheUpdateWithMetadata:v9 error:&v23];
    id v11 = v23;

    if (v10)
    {
      v12 = [(MCMCommand *)self context];
      v13 = [v12 containerCache];
      id v22 = 0;
      v14 = [v13 addContainerMetadata:v10 error:&v22];
      id v15 = v22;

      if (!v14)
      {
        uint64_t v16 = container_log_handle_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v15;
          _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Failed to update container cache for regenerate: %@", buf, 0xCu);
        }

        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
      id v15 = 0;
    }
  }
  else
  {
    id v10 = 0;
    v14 = 0;
    id v15 = 0;
    id v11 = v8;
  }
  v17 = container_log_handle_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl(&dword_1D7739000, v17, OS_LOG_TYPE_DEFAULT, "Roll UUID result: %@, error = %@", buf, 0x16u);
  }

  v18 = [MCMResultWithContainerBase alloc];
  if (v10) {
    uint64_t v19 = [(MCMResultWithContainerBase *)v18 initWithMetadata:v10 sandboxToken:0 includePath:1 includeInfo:0 includeUserManagedAssetsRelPath:0 includeCreator:0];
  }
  else {
    uint64_t v19 = [(MCMResultBase *)v18 initWithError:v11];
  }
  id v20 = (void *)v19;
  v21 = [(MCMCommand *)self resultPromise];
  [v21 completeWithResult:v20];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];

  LOBYTE(v2) = [v3 isAllowedToRegenerateDirectoryUUIDs];
  return (char)v2;
}

- (MCMCommandRegenerateDirectoryUUID)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandRegenerateDirectoryUUID;
  char v9 = [(MCMCommand *)&v13 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;
  }
  return v9;
}

- (MCMCommandRegenerateDirectoryUUID)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandRegenerateDirectoryUUID;
  uint64_t v10 = [(MCMCommand *)&v13 initWithContext:a4 resultPromise:a5];
  id v11 = v10;
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
  return 9;
}

@end