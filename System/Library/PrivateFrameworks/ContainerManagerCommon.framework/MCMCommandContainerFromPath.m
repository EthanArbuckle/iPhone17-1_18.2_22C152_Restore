@interface MCMCommandContainerFromPath
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandContainerFromPath)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (NSURL)url;
- (container_object_s)_containerFromRelayToDaemonWithURL:(id)a3 relativePath:(char *)a4 error:(container_error_extended_s *)a5;
- (void)execute;
@end

@implementation MCMCommandContainerFromPath

- (void).cxx_destruct
{
  p_url = &self->_url;

  objc_storeStrong((id *)p_url, 0);
}

- (NSURL)url
{
  return self->_url;
}

- (container_object_s)_containerFromRelayToDaemonWithURL:(id)a3 relativePath:(char *)a4 error:(container_error_extended_s *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7166;
  v21 = __Block_byref_object_dispose__7167;
  id v22 = 0;
  v9 = [(MCMCommand *)self context];
  v10 = [v9 clientIdentity];
  [v10 createLibsystemClient];

  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "Command", 0x2CuLL);
  id v12 = v8;
  xpc_dictionary_set_string(v11, "Path", (const char *)[v12 fileSystemRepresentation]);
  id v13 = v11;
  container_perform_with_client_context();
  if (v18[5])
  {
    v14 = (container_object_s *)container_xpc_decode_container_object();
    if (v14)
    {
      string = xpc_dictionary_get_string((xpc_object_t)v18[5], "ReplyRelativePath");
      if (a4)
      {
        if (string) {
          *a4 = strndup(string, 0x400uLL);
        }
      }
    }
  }
  else
  {
    v14 = 0;
  }
  container_free_client();
  if (!a5 || v14)
  {
    if (!a5) {
      container_error_free();
    }
  }
  else
  {
    *a5 = (container_error_extended_s *)v24[3];
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

uint64_t __85__MCMCommandContainerFromPath__containerFromRelayToDaemonWithURL_relativePath_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = container_xpc_send_sync_message();

  return MEMORY[0x1F41817F8]();
}

- (void)execute
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v71 = 0;
  id v3 = containermanager_copy_global_configuration();
  v4 = [v3 classPathCache];

  v5 = [(MCMCommand *)self context];
  v6 = [v5 clientIdentity];
  v7 = [v6 posixUser];

  if ([v7 isRoleUser])
  {
    id v8 = containermanager_copy_global_configuration();
    uint64_t v9 = [v8 defaultUser];

    v7 = (void *)v9;
  }
  uint64_t v10 = [v4 referenceForPOSIXUser:v7];
  xpc_object_t v11 = [(MCMCommandContainerFromPath *)self url];
  v65 = (void *)v10;
  uint64_t v12 = [v4 containerClassPathWithURL:v11 reference:v10];

  v70 = 0;
  v64 = (void *)v12;
  v66 = v7;
  v67 = v4;
  if (v12)
  {
    id v13 = [(MCMCommandContainerFromPath *)self url];
    [v13 fileSystemRepresentation];
    v14 = (container_object_s *)container_paths_copy_container_from_path();
  }
  else
  {
    id v15 = containermanager_copy_global_configuration();
    int v16 = [v15 dispositionForContainerClass:12];

    if (v16 != 2)
    {
      v33 = container_log_handle_for_category();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v53 = [(MCMCommandContainerFromPath *)self url];
        v54 = [v53 path];
        *(_DWORD *)buf = 138412290;
        v73 = v54;
        _os_log_error_impl(&dword_1D7739000, v33, OS_LOG_TYPE_ERROR, "[%@] is not a path that container manager recognizes among its prefixes.", buf, 0xCu);
      }
      uint64_t v27 = [[MCMError alloc] initWithErrorType:21];
      goto LABEL_23;
    }
    id v13 = [(MCMCommandContainerFromPath *)self url];
    v14 = [(MCMCommandContainerFromPath *)self _containerFromRelayToDaemonWithURL:v13 relativePath:&v70 error:&v71];
  }
  uint64_t v17 = v14;

  if (!v17)
  {
    uint64_t v27 = [[MCMError alloc] initWithErrorType:21];
    v28 = (void *)container_error_copy_unlocalized_description();
    __s = v28;
    v29 = container_log_handle_for_category();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v49 = [(MCMCommandContainerFromPath *)self url];
      v50 = [v49 path];
      *(_DWORD *)buf = 138412546;
      v73 = v50;
      __int16 v74 = 2080;
      uint64_t v75 = (uint64_t)v28;
      _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Error obtaining container during reverse lookup of [%@]: %s", buf, 0x16u);
    }
    if (v28)
    {
      free(v28);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
LABEL_23:
    uint64_t v31 = 0;
    v24 = 0;
    uint64_t v26 = 0;
    BOOL v32 = 0;
    uint64_t v17 = 0;
    v62 = 0;
    v63 = 0;
    uint64_t v19 = 0;
LABEL_28:
    int v35 = 0;
    goto LABEL_29;
  }
  uint64_t identifier = container_get_identifier();
  if (!identifier)
  {
    v30 = container_log_handle_for_category();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      v51 = [(MCMCommandContainerFromPath *)self url];
      v52 = [v51 path];
      *(_DWORD *)buf = 138412290;
      v73 = v52;
      _os_log_fault_impl(&dword_1D7739000, v30, OS_LOG_TYPE_FAULT, "[%@] produced a container object with a NULL identifier.", buf, 0xCu);
    }
    uint64_t v31 = 0;
    v24 = 0;
    uint64_t v26 = 0;
    BOOL v32 = 0;
    v62 = 0;
    v63 = 0;
    uint64_t v19 = 0;
    goto LABEL_27;
  }
  uint64_t v19 = [NSString stringWithUTF8String:identifier];
  uint64_t v20 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:container_object_get_uuid()];
  uint64_t path = container_object_get_path();
  v62 = (void *)v20;
  if (!path)
  {
    v34 = container_log_handle_for_category();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      v55 = [(MCMCommandContainerFromPath *)self url];
      v56 = [v55 path];
      *(_DWORD *)buf = 138412290;
      v73 = v56;
      _os_log_fault_impl(&dword_1D7739000, v34, OS_LOG_TYPE_FAULT, "[%@] produced a container object with a NULL path.", buf, 0xCu);
    }
    uint64_t v31 = 0;
    v24 = 0;
    uint64_t v26 = 0;
    BOOL v32 = 0;
    v63 = 0;
LABEL_27:
    uint64_t v27 = 0;
    goto LABEL_28;
  }
  uint64_t v22 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:path isDirectory:1 relativeToURL:0];
  uint64_t v61 = container_get_class();
  uint64_t v23 = MEMORY[0x1D9478630](v17);
  v63 = (void *)v22;
  if (v23)
  {
    v24 = [NSString stringWithUTF8String:v23];
    uint64_t persona_unique_string = container_get_persona_unique_string();
    if (persona_unique_string)
    {
      uint64_t v26 = [NSString stringWithUTF8String:persona_unique_string];
    }
    else
    {
      uint64_t v26 = 0;
    }
    uint64_t v31 = v61;
    buf[0] = 0;
    container_is_transient();
    uint64_t v27 = 0;
    BOOL v32 = buf[0] != 0;
    int v35 = 1;
  }
  else
  {
    v48 = container_log_handle_for_category();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      v57 = [(MCMCommandContainerFromPath *)self url];
      v58 = [v57 path];
      *(_DWORD *)buf = 138412290;
      v73 = v58;
      _os_log_fault_impl(&dword_1D7739000, v48, OS_LOG_TYPE_FAULT, "[%@] produced a container object with a NULL path identifier.", buf, 0xCu);
    }
    v24 = 0;
    uint64_t v26 = 0;
    BOOL v32 = 0;
    uint64_t v27 = 0;
    int v35 = 0;
    uint64_t v31 = v61;
  }
LABEL_29:
  v36 = self;
  MEMORY[0x1D94785B0](v17);
  if (v71)
  {
    v37 = [MCMError alloc];
    uint64_t v38 = [(MCMError *)v37 initWithLibsystemError:v71];

    container_error_free();
    uint64_t v27 = (MCMError *)v38;
  }
  if (v70)
  {
    v39 = objc_msgSend(NSString, "stringWithUTF8String:");
    if (v70)
    {
      free(v70);
      memset_s(&v70, 8uLL, 0, 8uLL);
    }
  }
  else
  {
    v39 = 0;
  }
  v40 = container_log_handle_for_category();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v73 = v19;
    __int16 v74 = 2048;
    uint64_t v75 = v31;
    __int16 v76 = 2112;
    v77 = v27;
    _os_log_impl(&dword_1D7739000, v40, OS_LOG_TYPE_DEFAULT, "Container from path result: %@(%llu), error = %@", buf, 0x20u);
  }

  v41 = [MCMResultContainerFromPath alloc];
  if (v35)
  {
    LOBYTE(v60) = v32;
    uint64_t v42 = v31;
    v44 = v62;
    v43 = v63;
    LOBYTE(v59) = 1;
    v45 = v66;
    v46 = [(MCMResultContainerFromPath *)v41 initWithUUID:v62 containerPathIdentifier:v24 identifier:v19 containerClass:v42 POSIXUser:v66 personaUniqueString:v26 sandboxToken:0 existed:v59 url:v63 info:0 transient:v60 userManagedAssetsRelPath:0 creator:0 relativePath:v39];
  }
  else
  {
    v46 = [(MCMResultBase *)v41 initWithError:v27];
    v45 = v66;
    v44 = v62;
    v43 = v63;
  }
  v47 = [(MCMCommand *)v36 resultPromise];
  [v47 completeWithResult:v46];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  id v3 = [v2 clientIdentity];
  v4 = [v3 codeSignInfo];
  v5 = [v4 entitlements];

  if ([v5 allowed]) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 otherIDLookup];
  }

  return v6;
}

- (MCMCommandContainerFromPath)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandContainerFromPath;
  uint64_t v9 = [(MCMCommand *)&v13 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 url];
    url = v9->_url;
    v9->_url = (NSURL *)v10;
  }
  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 44;
}

@end