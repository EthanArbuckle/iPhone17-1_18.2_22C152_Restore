@interface MCMCommandStageSharedContent
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandStageSharedContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (NSString)destinationRelativePath;
- (NSString)identifier;
- (NSString)sourceRelativePath;
- (void)execute;
@end

@implementation MCMCommandStageSharedContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationRelativePath, 0);
  objc_storeStrong((id *)&self->_sourceRelativePath, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)destinationRelativePath
{
  return self->_destinationRelativePath;
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)execute
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9478DF0](self, a2);
  v3 = [(MCMCommand *)self context];
  v4 = [v3 userIdentityCache];
  uint64_t v5 = [v4 defaultUserIdentity];

  uint64_t v90 = 1;
  v6 = [(MCMCommand *)self context];
  v7 = [v6 globalConfiguration];
  v8 = [v7 staticConfig];
  v9 = [v8 configForContainerClass:13];

  v10 = [(MCMCommandStageSharedContent *)self identifier];
  v11 = [(MCMCommand *)self context];
  v12 = [v11 userIdentityCache];
  v85 = (void *)v5;
  v13 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v5 identifier:v10 containerConfig:v9 platform:0 userIdentityCache:v12 error:&v90];

  if (!v13)
  {
    v17 = [MCMError alloc];
    v18 = [(MCMError *)v17 initWithErrorType:v90];
LABEL_12:
    id v22 = 0;
    v23 = 0;
    v84 = 0;
LABEL_13:
    v24 = 0;
    v25 = 0;
    v83 = 0;
LABEL_14:
    id v26 = 0;
    goto LABEL_15;
  }
  id v14 = containermanager_copy_global_configuration();
  int v15 = [v14 systemContainerMode];

  if (!v15)
  {
    v18 = [[MCMError alloc] initWithErrorType:72];
    v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "System containers are not supported", buf, 2u);
    }
    goto LABEL_11;
  }
  v16 = [(MCMCommandStageSharedContent *)self sourceRelativePath];
  if ([v16 containsDotDotPathComponents])
  {

    goto LABEL_9;
  }
  v20 = [(MCMCommandStageSharedContent *)self destinationRelativePath];
  int v21 = [v20 containsDotDotPathComponents];

  if (v21)
  {
LABEL_9:
    v18 = [[MCMError alloc] initWithErrorType:38];
    v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v64 = [(MCMCommandStageSharedContent *)self sourceRelativePath];
      v65 = [(MCMCommandStageSharedContent *)self destinationRelativePath];
      *(_DWORD *)buf = 138412546;
      id v92 = v64;
      __int16 v93 = 2112;
      uint64_t v94 = (uint64_t)v65;
      _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Paths can't contain dots. source: %@, dest: %@", buf, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
  v32 = [(MCMCommand *)self context];
  uint64_t v33 = [v32 clientIdentity];
  v34 = [(id)v33 codeSignInfo];
  v35 = [v34 entitlements];
  v36 = [v35 systemGroupIdentifiers];

  v37 = [v13 identifier];
  v84 = v36;
  LOBYTE(v33) = [v36 containsObject:v37];

  if ((v33 & 1) == 0)
  {
    v18 = [[MCMError alloc] initWithErrorType:55];
    v62 = container_log_handle_for_category();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v73 = [(MCMCommand *)self context];
      v74 = [v73 clientIdentity];
      v75 = [v13 identifier];
      *(_DWORD *)buf = 138412546;
      id v92 = v74;
      __int16 v93 = 2112;
      uint64_t v94 = (uint64_t)v75;
      _os_log_error_impl(&dword_1D7739000, v62, OS_LOG_TYPE_ERROR, "%@ not entitled for system group container %@", buf, 0x16u);
    }
    id v22 = 0;
    v23 = 0;
    goto LABEL_13;
  }
  v38 = [(MCMCommand *)self context];
  v39 = [v38 containerCache];
  id v89 = 0;
  v40 = [v39 entryForContainerIdentity:v13 error:&v89];
  v41 = (MCMError *)v89;

  v83 = v40;
  v42 = [v40 metadataMinimal];
  if (!v42)
  {
    v18 = [[MCMError alloc] initWithErrorType:21];

    v63 = container_log_handle_for_category();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v76 = [v13 identifier];
      *(_DWORD *)buf = 138412546;
      id v92 = v76;
      __int16 v93 = 2112;
      uint64_t v94 = (uint64_t)v18;
      _os_log_error_impl(&dword_1D7739000, v63, OS_LOG_TYPE_ERROR, "System group container with identifier %@ not found: %@", buf, 0x16u);
    }
    id v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    goto LABEL_14;
  }
  v25 = v42;
  v80 = v41;
  v43 = [v42 containerPath];
  v44 = [v43 containerDataURL];
  v45 = [(MCMCommandStageSharedContent *)self sourceRelativePath];
  v23 = [v44 URLByAppendingPathComponent:v45 isDirectory:0];

  v46 = [v25 containerPath];
  v47 = [v46 containerDataURL];
  v48 = [(MCMCommandStageSharedContent *)self destinationRelativePath];
  id v22 = [v47 URLByAppendingPathComponent:v48 isDirectory:0];

  v49 = +[MCMFileManager defaultManager];
  v50 = [v25 containerPath];
  v51 = [v50 containerDataURL];
  v52 = [v49 realPathForURL:v23 ifChildOfURL:v51];

  if (!v52)
  {
    v18 = [[MCMError alloc] initWithErrorType:10];

    v66 = container_log_handle_for_category();
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
LABEL_37:

      v24 = 0;
      goto LABEL_14;
    }
    v67 = [v13 identifier];
    v81 = [v25 containerPath];
    v68 = [v81 containerDataURL];
    *(_DWORD *)buf = 138412802;
    id v92 = v23;
    __int16 v93 = 2112;
    uint64_t v94 = (uint64_t)v67;
    __int16 v95 = 2112;
    uint64_t v96 = (uint64_t)v68;
    v69 = "Invalid source URL %@ for %@ at %@";
LABEL_43:
    _os_log_error_impl(&dword_1D7739000, v66, OS_LOG_TYPE_ERROR, v69, buf, 0x20u);

    goto LABEL_37;
  }
  v53 = +[MCMFileManager defaultManager];
  v54 = [v25 containerPath];
  v55 = [v54 containerDataURL];
  v56 = [v53 realPathForURL:v22 ifChildOfURL:v55];

  if (!v56)
  {
    v18 = [[MCMError alloc] initWithErrorType:10];

    v66 = container_log_handle_for_category();
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    v67 = [v13 identifier];
    v81 = [v25 containerPath];
    v68 = [v81 containerDataURL];
    *(_DWORD *)buf = 138412802;
    id v92 = v22;
    __int16 v93 = 2112;
    uint64_t v94 = (uint64_t)v67;
    __int16 v95 = 2112;
    uint64_t v96 = (uint64_t)v68;
    v69 = "Invalid dest URL %@ for %@ at %@";
    goto LABEL_43;
  }
  v57 = +[MCMFileManager defaultManager];
  id v88 = 0;
  char v58 = [v57 standardizeACLsAtURL:v23 isSystemContainer:0 error:&v88];
  id v26 = v88;

  if ((v58 & 1) == 0)
  {
    v18 = [[MCMError alloc] initWithErrorType:63];

    v70 = container_log_handle_for_category();
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    v82 = [v13 identifier];
    uint64_t v71 = [v23 path];
    *(_DWORD *)buf = 138412802;
    id v92 = v82;
    __int16 v93 = 2112;
    uint64_t v94 = v71;
    v72 = (void *)v71;
    __int16 v95 = 2112;
    uint64_t v96 = (uint64_t)v26;
    _os_log_error_impl(&dword_1D7739000, v70, OS_LOG_TYPE_ERROR, "Failed to standardize ACLs for %@ at %@: %@", buf, 0x20u);

LABEL_45:
    goto LABEL_41;
  }
  v59 = +[MCMFileManager defaultManager];
  id v87 = v26;
  char v60 = [v59 moveItemAtURL:v23 toURL:v22 error:&v87];
  id v61 = v87;

  if (v60)
  {
    id v22 = v22;
    v24 = v22;
    id v26 = v61;
    v18 = v80;
    goto LABEL_15;
  }
  id v26 = v61;
  v18 = [[MCMError alloc] initWithErrorType:64];

  v70 = container_log_handle_for_category();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    v82 = [v13 identifier];
    v79 = [v23 path];
    uint64_t v77 = [v22 path];
    *(_DWORD *)buf = 138413058;
    id v92 = v82;
    __int16 v93 = 2112;
    uint64_t v94 = (uint64_t)v79;
    __int16 v95 = 2112;
    uint64_t v96 = v77;
    v78 = (void *)v77;
    __int16 v97 = 2112;
    id v98 = v26;
    _os_log_error_impl(&dword_1D7739000, v70, OS_LOG_TYPE_ERROR, "Failed move for %@ from %@ to: %@: %@", buf, 0x2Au);

    goto LABEL_45;
  }
LABEL_41:

  v24 = 0;
LABEL_15:
  v27 = container_log_handle_for_category();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v92 = v24;
    __int16 v93 = 2112;
    uint64_t v94 = (uint64_t)v18;
    _os_log_impl(&dword_1D7739000, v27, OS_LOG_TYPE_DEFAULT, "Stage shared content result: %@, error = %@", buf, 0x16u);
  }

  v28 = [MCMResultWithURLBase alloc];
  if (v24) {
    uint64_t v29 = [(MCMResultWithURLBase *)v28 initWithURL:v24 existed:1 sandboxToken:0];
  }
  else {
    uint64_t v29 = [(MCMResultBase *)v28 initWithError:v18];
  }
  v30 = (void *)v29;
  v31 = [(MCMCommand *)self resultPromise];
  [v31 completeWithResult:v30];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToStageSharedContent];

  return v4;
}

- (MCMCommandStageSharedContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMCommandStageSharedContent;
  v9 = [(MCMCommand *)&v17 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 identifier];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    uint64_t v12 = [v8 sourceRelativePath];
    sourceRelativePath = v9->_sourceRelativePath;
    v9->_sourceRelativePath = (NSString *)v12;

    uint64_t v14 = [v8 destinationRelativePath];
    destinationRelativePath = v9->_destinationRelativePath;
    v9->_destinationRelativePath = (NSString *)v14;
  }
  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 26;
}

@end