@interface MCMCommandReplaceContainer
+ (BOOL)recoverFromReplaceOperationsWithContext:(id)a3 error:(id *)a4;
+ (Class)incomingMessageClass;
+ (id)_readAndValidateReplaceFileAtUrl:(id)a3 error:(id *)a4;
+ (unint64_t)command;
- (BOOL)_writeToDiskReplaceAt:(id)a3 old:(id)a4 withNew:(id)a5 usingStaging:(id)a6 toDestination:(id)a7 error:(id *)a8;
- (BOOL)asyncReclaim;
- (BOOL)preflightClientAllowed;
- (BOOL)preserveOldInternalUUID;
- (BOOL)preserveOldPathIdentifier;
- (MCMCommandReplaceContainer)initWithConcreteContainerIdentityOld:(id)a3 concreteContainerIdentityNew:(id)a4 preserveOldPathIdentifier:(BOOL)a5 preserveOldInternalUUID:(BOOL)a6 asyncReclaim:(BOOL)a7 context:(id)a8 resultPromise:(id)a9;
- (MCMCommandReplaceContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)containerIdentityNew;
- (MCMConcreteContainerIdentity)containerIdentityOld;
- (void)execute;
@end

@implementation MCMCommandReplaceContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentityNew, 0);

  objc_storeStrong((id *)&self->_containerIdentityOld, 0);
}

- (BOOL)asyncReclaim
{
  return self->_asyncReclaim;
}

- (BOOL)preserveOldInternalUUID
{
  return self->_preserveOldInternalUUID;
}

- (BOOL)preserveOldPathIdentifier
{
  return self->_preserveOldPathIdentifier;
}

- (MCMConcreteContainerIdentity)containerIdentityNew
{
  return self->_containerIdentityNew;
}

- (MCMConcreteContainerIdentity)containerIdentityOld
{
  return self->_containerIdentityOld;
}

- (BOOL)_writeToDiskReplaceAt:(id)a3 old:(id)a4 withNew:(id)a5 usingStaging:(id)a6 toDestination:(id)a7 error:(id *)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = +[MCMFileManager defaultManager];
  uint64_t v19 = [v18 dataWritingOptionsForFileAtURL:v13];

  if (v14 && v15 && v16 && v17)
  {
    v33 = a8;
    id v35 = v14;
    v38[0] = @"MCMReplaceOperationOldURL";
    v20 = [v14 path];
    v39[0] = v20;
    v38[1] = @"MCMReplaceOperationNewURL";
    v21 = [v15 path];
    v39[1] = v21;
    v38[2] = @"MCMReplaceOperationStagingURL";
    v22 = [v16 path];
    v39[2] = v22;
    v38[3] = @"MCMReplaceOperationDestURL";
    uint64_t v23 = [v17 path];
    v39[3] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];

    id v37 = 0;
    LOBYTE(v23) = objc_msgSend(v24, "MCM_writeToURL:withOptions:error:", v13, v19, &v37);
    id v25 = v37;
    if (v23)
    {
      v26 = 0;
      BOOL v27 = 1;
      id v14 = v35;
      goto LABEL_16;
    }
    v26 = [[MCMError alloc] initWithNSError:v25 url:v13 defaultErrorType:86];
    v28 = container_log_handle_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v32 = [v13 path];
      *(_DWORD *)buf = 138412546;
      v41 = v32;
      __int16 v42 = 2112;
      id v43 = v25;
      _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, "Failed to write replace dictionary to URL %@; error = %@",
        buf,
        0x16u);
    }
    a8 = v33;
    id v14 = v35;
  }
  else
  {
    v26 = [[MCMError alloc] initWithErrorType:33 category:4];
    v28 = container_log_handle_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v36 = [v14 path];
      v34 = [v15 path];
      v30 = [v16 path];
      [v17 path];
      *(_DWORD *)buf = 138413058;
      v41 = v36;
      __int16 v42 = 2112;
      id v43 = v34;
      __int16 v44 = 2112;
      v45 = v30;
      v47 = __int16 v46 = 2112;
      v31 = (void *)v47;
      _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, "Invalid Replace File Info: old: %@, new: %@, staging: %@, dest: %@", buf, 0x2Au);
    }
    v24 = 0;
    id v25 = 0;
  }

  if (a8)
  {
    v26 = v26;
    BOOL v27 = 0;
    *a8 = v26;
  }
  else
  {
    BOOL v27 = 0;
  }
LABEL_16:

  return v27;
}

- (void)execute
{
  v2 = self;
  uint64_t v260 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1D9478DF0](self, a2);
  v4 = [(MCMCommandReplaceContainer *)v2 containerIdentityNew];
  v5 = [(MCMCommandReplaceContainer *)v2 containerIdentityOld];
  v6 = [(MCMError *)v5 uuid];
  uint64_t v211 = [(MCMError *)v4 containerClass];
  uint64_t v7 = [(MCMError *)v5 containerClass];
  v218 = [(MCMError *)v4 identifier];
  v217 = [(MCMError *)v5 identifier];
  v226 = [(MCMError *)v4 userIdentity];
  v227 = [(MCMError *)v5 userIdentity];
  if (v6)
  {
    BOOL v8 = [(MCMCommandReplaceContainer *)v2 preserveOldPathIdentifier];
    BOOL v209 = [(MCMCommandReplaceContainer *)v2 preserveOldInternalUUID];
  }
  else
  {
    BOOL v8 = 0;
    BOOL v209 = 0;
  }
  id v9 = containermanager_copy_global_configuration();
  v10 = [v9 managedPathRegistry];
  v11 = [v10 containermanagerReplaceOperations];

  v216 = v11;
  v219 = [v11 url];
  context = (void *)v3;
  if (!v219)
  {
    uint64_t v204 = v7;
    id v15 = [[MCMError alloc] initWithErrorType:84];
    uint64_t v23 = container_log_handle_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Failed to get url for storing replace operations.", buf, 2u);
    }
    v24 = 0;
    v221 = 0;
    v225 = 0;
    v220 = 0;
    v228 = 0;
    v229 = 0;
    id v25 = 0;
    v26 = 0;
LABEL_37:

    if (!v6) {
      goto LABEL_75;
    }
    goto LABEL_38;
  }
  if (v6)
  {
    if (v7 == v211)
    {
      if ([(MCMError *)v227 isEqual:v226])
      {
        v205 = v6;
        v12 = [(MCMCommand *)v2 context];
        id v13 = [v12 containerCache];
        id v247 = 0;
        id v14 = [v13 entryForContainerIdentity:v5 error:&v247];
        id v15 = (MCMError *)v247;

        if (v14)
        {
          uint64_t v204 = v7;
          id v16 = v2;
          id v17 = [v14 uuid];
          v18 = [(MCMError *)v5 uuid];
          char v19 = [v17 isEqual:v18];

          if (v19)
          {
            v246 = v15;
            uint64_t v20 = [v14 metadataWithError:&v246];
            v21 = v246;

            v6 = v205;
            v207 = (void *)v20;
            if (v20)
            {

              v2 = v16;
              v22 = v4;
              goto LABEL_22;
            }
            id v15 = v21;
          }
          else
          {
            v55 = [[MCMError alloc] initWithErrorType:21 category:3];

            id v14 = 0;
            id v15 = v55;
            v6 = v205;
          }
          v2 = v16;
        }
        else
        {
          v6 = v205;
        }
        v65 = container_log_handle_for_category();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v249 = v5;
          __int16 v250 = 2112;
          v251 = v15;
          _os_log_error_impl(&dword_1D7739000, v65, OS_LOG_TYPE_ERROR, "No Container with identity: %@; error = %@",
            buf,
            0x16u);
        }

        v220 = 0;
        v221 = 0;
        v26 = 0;
        v213 = 0;
        v228 = 0;
        v229 = 0;
        v225 = 0;
        v24 = 0;
        goto LABEL_70;
      }
      id v15 = [[MCMError alloc] initWithErrorType:76];
      id v14 = container_log_handle_for_category();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_31:
        v220 = 0;
        v221 = 0;
        v26 = 0;
        v213 = 0;
        v228 = 0;
        v229 = 0;
        v225 = 0;
        v24 = 0;
LABEL_70:

        goto LABEL_71;
      }
      *(_DWORD *)buf = 138412546;
      v249 = v227;
      __int16 v250 = 2112;
      v251 = v226;
      v28 = "Can't replace containers of different personas: %@ and %@";
    }
    else
    {
      id v15 = [[MCMError alloc] initWithErrorType:23];
      id v14 = container_log_handle_for_category();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 134218240;
      v249 = (MCMError *)v7;
      __int16 v250 = 2048;
      v251 = (MCMError *)v211;
      v28 = "Can't replace containers of different class types: %ld and %ld";
    }
    _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
    goto LABEL_31;
  }
  if (v8)
  {
    id v15 = [[MCMError alloc] initWithErrorType:11];
    BOOL v27 = container_log_handle_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, "Can't have a nil oldContainerUUID when preserving the UUID", buf, 2u);
    }
    v220 = 0;
    v221 = 0;
    v26 = 0;
    id v25 = 0;
    v228 = 0;
    v229 = 0;
    v225 = 0;
    v24 = 0;
    goto LABEL_73;
  }
  uint64_t v204 = v7;
  v205 = 0;
  v22 = v4;
  v207 = 0;
  v21 = 0;
LABEL_22:
  v29 = [(MCMCommand *)v2 context];
  v30 = [v29 containerCache];
  v245 = v21;
  v24 = [v30 entryForContainerIdentity:v22 error:&v245];
  id v15 = v245;

  if (!v24)
  {
LABEL_34:
    v6 = v205;
    uint64_t v23 = container_log_handle_for_category();
    v26 = v207;
    v4 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v249 = v22;
      __int16 v250 = 2112;
      v251 = v15;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "No Container with identity: %@; error = %@",
        buf,
        0x16u);
    }
    v221 = 0;
    v225 = 0;
    v220 = 0;
    v228 = 0;
    v229 = 0;
    id v25 = 0;
    goto LABEL_37;
  }
  v31 = [v24 uuid];
  v32 = [(MCMError *)v22 uuid];
  char v33 = [v31 isEqual:v32];

  if ((v33 & 1) == 0)
  {
    id v35 = [[MCMError alloc] initWithErrorType:21 category:3];

    v24 = 0;
    goto LABEL_33;
  }
  v244 = v15;
  v34 = [v24 metadataWithError:&v244];
  id v35 = v244;

  if (!v34)
  {
LABEL_33:
    id v15 = v35;
    goto LABEL_34;
  }
  v190 = v35;
  v202 = v5;
  v203 = v24;
  v198 = v22;
  unsigned int v36 = [(MCMError *)v34 transient];
  v6 = v205;
  if (v207)
  {
    id v37 = [(MCMError *)v34 containerPath];
    v38 = [v207 containerPath];
    int v39 = [v37 isEqual:v38];

    if (v39)
    {
      id v25 = v34;
      id v15 = [[MCMError alloc] initWithErrorType:22];

      uint64_t v23 = container_log_handle_for_category();
      v4 = v198;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v147 = v25;
        v148 = [(MCMError *)v25 containerPath];
        *(_DWORD *)buf = 138412290;
        v249 = v148;
        _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Can't replace the same container at %@", buf, 0xCu);

        id v25 = v147;
      }
      v221 = 0;
      v225 = 0;
      v220 = 0;
      v228 = 0;
      v229 = 0;
      v26 = v207;
      v24 = v203;
      goto LABEL_37;
    }
  }
  v196 = v2;
  v56 = [(MCMCommand *)v2 context];
  v57 = [v56 clientIdentity];
  [v57 platform];
  [(MCMError *)v34 containerClass];
  [(MCMError *)v34 transient];
  char v58 = container_class_supports_randomized_path();

  char v59 = v58 ^ 1;
  if (v205) {
    char v60 = v58 ^ 1 | v8;
  }
  else {
    char v60 = v8;
  }
  v214 = v34;
  v61 = [(MCMError *)v34 containerPath];
  v62 = [v61 containerRootURL];
  v220 = [v62 lastPathComponent];

  v26 = v207;
  v4 = v198;
  if ((v59 & 1) == 0)
  {
    v63 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v220];
    if (!v63)
    {
      id v15 = [[MCMError alloc] initWithErrorType:10];

      uint64_t v23 = container_log_handle_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v166 = [(MCMError *)v214 containerPath];
        v167 = [v166 containerRootURL];
        v168 = [v167 path];
        *(_DWORD *)buf = 138412290;
        v249 = v168;
        _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Invalid URL (last path component not UUID): %@", buf, 0xCu);

        v26 = v207;
        id v25 = v214;
        v221 = 0;
        v225 = 0;
        v228 = 0;
        v229 = 0;
        v2 = v196;
        goto LABEL_37;
      }
      v221 = 0;
      v225 = 0;
      v228 = 0;
      v229 = 0;
      v2 = v196;
      goto LABEL_97;
    }
  }
  uint64_t v64 = [v207 containerPath];
  if (v60)
  {
    v221 = 0;
    v2 = v196;
    goto LABEL_100;
  }
  v225 = (MCMError *)v64;
  v74 = objc_opt_class();
  v2 = v196;
  unsigned int v75 = v36;
  if ([v207 transient]) {
    v74 = objc_opt_class();
  }
  v76 = [v74 containerPathForUserIdentity:v226 containerClass:v211 containerPathIdentifier:v220];
  v77 = [v76 containerClassPath];
  id v243 = 0;
  char v78 = [v77 createIfNecessaryWithError:&v243];
  v79 = (MCMError *)v243;

  v221 = v79;
  if ((v78 & 1) == 0)
  {
    v86 = [MCMError alloc];
    [v76 containerClassPath];
    v88 = v87 = v76;
    v89 = [v88 classURL];
    id v15 = [(MCMError *)v86 initWithNSError:v79 url:v89 defaultErrorType:3];

    v90 = container_log_handle_for_category();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v249 = (MCMError *)v87;
      __int16 v250 = 2112;
      v251 = v79;
      _os_log_error_impl(&dword_1D7739000, v90, OS_LOG_TYPE_ERROR, "Failed to create class path dir for %@: %@", buf, 0x16u);
    }

    v228 = 0;
    v229 = 0;
    uint64_t v23 = v87;
    v26 = v207;
    goto LABEL_97;
  }

  v80 = +[MCMFileManager defaultManager];
  v81 = [v76 containerRootURL];
  v82 = (MCMError *)v76;
  int v83 = [v80 itemExistsAtURL:v81];

  if (v83)
  {
    id v15 = [[MCMError alloc] initWithErrorType:27];

    uint64_t v23 = container_log_handle_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v171 = [(MCMError *)v82 containerRootURL];
      v172 = [v171 path];
      *(_DWORD *)buf = 138412290;
      v249 = v172;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Container already exists at %@", buf, 0xCu);

      v26 = v207;
    }
    v228 = 0;
    v229 = 0;
    v225 = v82;
LABEL_97:
    v24 = v203;
    goto LABEL_98;
  }
  uint64_t v64 = (uint64_t)v82;
  unsigned int v36 = v75;
LABEL_100:
  v225 = (MCMError *)v64;
  if (!v205)
  {
    v109 = [(MCMError *)v198 identityByChangingTransient:0];
    BOOL v27 = [v109 containerIdentity];

    v110 = [(MCMCommand *)v2 context];
    v111 = [v110 containerCache];
    v242 = v190;
    v112 = [v111 entryForContainerIdentity:v27 error:&v242];
    id v15 = v242;

    if (v112)
    {
      v113 = [[MCMError alloc] initWithErrorType:27];

      v114 = container_log_handle_for_category();
      v24 = v203;
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      {
        v169 = [(MCMError *)v214 identifier];
        int v170 = [v207 transient];
        *(_DWORD *)buf = 138412802;
        v249 = v169;
        __int16 v250 = 2048;
        v251 = (MCMError *)v211;
        __int16 v252 = 1024;
        LODWORD(v253) = v170;
        _os_log_error_impl(&dword_1D7739000, v114, OS_LOG_TYPE_ERROR, "Container with identifier: %@, class: %ld, transient: %d already exists", buf, 0x1Cu);
      }
      id v15 = v113;
    }
    else
    {
      v24 = v203;
      if ([(MCMError *)v15 type] == 21)
      {

        v120 = container_log_handle_for_category();
        v2 = v196;
        id v25 = v214;
        if (os_signpost_enabled(v120))
        {
          v121 = [(MCMError *)v214 containerPath];
          v122 = [v121 containerPathIdentifier];
          v123 = [(MCMError *)v214 identifier];
          uint64_t v124 = [(MCMError *)v214 containerClass];
          *(_DWORD *)buf = 138478339;
          v249 = v122;
          __int16 v250 = 2113;
          v251 = v123;
          __int16 v252 = 2050;
          uint64_t v253 = v124;
          _os_signpost_emit_with_name_impl(&dword_1D7739000, v120, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PromotingTransientContainer", " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu ", buf, 0x20u);

          id v25 = v214;
        }

        v228 = 0;
        v229 = 0;
        id v15 = 0;
        v26 = v207;
        goto LABEL_141;
      }
    }
    v2 = v196;
    id v25 = v214;

    v228 = 0;
    v229 = 0;
    v26 = v207;
    goto LABEL_73;
  }
  unsigned int v186 = v36;
  v91 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v92 = [v91 UUIDString];

  v93 = [v207 containerPath];
  v185 = [v93 containerRootURL];

  v94 = [(MCMError *)v214 containerPath];
  v187 = [v94 containerRootURL];

  v95 = (void *)MEMORY[0x1E4F1CB10];
  v96 = [NSString stringWithFormat:@"%@.plist", v92];
  v228 = [v95 URLWithString:v96 relativeToURL:v219];

  v97 = +[MCMContainerStagingPath stagingContainerPathForDestinationContainerPath:v225 stagingPathIdentifier:v92];
  v98 = [(MCMError *)v97 containerClassPath];
  v241 = v221;
  char v99 = [v98 createIfNecessaryWithError:&v241];
  v100 = v241;

  v182 = v97;
  v183 = (void *)v92;
  if (v99)
  {
    v222 = v100;
    v229 = [(MCMError *)v97 containerRootURL];
    uint64_t v101 = +[MCMContainerCacheEntry birthtimeForURL:v185];
    if (v101 | v102)
    {
      uint64_t v106 = v101;
      uint64_t v108 = v102;
    }
    else
    {
      v103 = +[MCMFileManager defaultManager];
      id v240 = 0;
      v104 = [v103 fsNodeOfURL:v185 followSymlinks:0 error:&v240];
      v105 = (MCMError *)v240;

      if (v104)
      {
        uint64_t v106 = [v104 birthtime];
        uint64_t v108 = v107;
      }
      else
      {
        v125 = container_log_handle_for_category();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v249 = v185;
          __int16 v250 = 2112;
          v251 = v105;
          _os_log_error_impl(&dword_1D7739000, v125, OS_LOG_TYPE_ERROR, "Could not read fs node for old container at [%@] (non-fatal); error = %@",
            buf,
            0x16u);
        }

        uint64_t v106 = 0;
        uint64_t v108 = 0;
      }
    }
    if (v106 | v108) {
      +[MCMContainerCacheEntry setBirthtime:forURL:](MCMContainerCacheEntry, "setBirthtime:forURL:", v106, v108, v187);
    }
    v126 = [(MCMError *)v225 containerRootURL];
    v239 = v190;
    BOOL v127 = [(MCMCommandReplaceContainer *)v2 _writeToDiskReplaceAt:v228 old:v185 withNew:v187 usingStaging:v229 toDestination:v126 error:&v239];
    v128 = v239;

    v184 = v128;
    if (v127)
    {
      v129 = container_log_handle_for_category();
      if (os_signpost_enabled(v129))
      {
        v130 = [v207 containerPath];
        v131 = [v130 containerPathIdentifier];
        v132 = [v207 identifier];
        uint64_t v191 = [v207 containerClass];
        v133 = [(MCMError *)v214 containerPath];
        v134 = [v133 containerPathIdentifier];
        v135 = [(MCMError *)v214 identifier];
        uint64_t v136 = [(MCMError *)v214 containerClass];
        *(_DWORD *)buf = 138479107;
        v249 = v131;
        __int16 v250 = 2113;
        v251 = v132;
        __int16 v252 = 2050;
        uint64_t v253 = v191;
        __int16 v254 = 2113;
        v255 = v134;
        __int16 v256 = 2113;
        v257 = v135;
        __int16 v258 = 2050;
        uint64_t v259 = v136;
        _os_signpost_emit_with_name_impl(&dword_1D7739000, v129, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReplacingContainer", " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu  -->  uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu ", buf, 0x3Eu);
      }
      v137 = +[MCMFileManager defaultManager];
      v138 = [v207 containerPath];
      v139 = [v138 containerRootURL];
      v238 = v222;
      char v140 = [v137 moveItemAtURL:v139 toURL:v229 error:&v238];
      v141 = v238;

      unsigned int v36 = v186;
      if (v140)
      {
        v221 = v141;
        v142 = [(MCMCommand *)v2 context];
        v143 = [v142 containerCache];
        v237 = v184;
        char v144 = objc_msgSend(v143, "removeContainerForUserIdentity:contentClass:identifier:transient:error:", v227, v204, v217, objc_msgSend(v207, "transient"), &v237);
        id v15 = v237;

        v26 = v207;
        if (v144)
        {
          char v145 = 1;
          v4 = v198;
          v5 = v202;
          v24 = v203;
          goto LABEL_140;
        }
        v184 = [[MCMError alloc] initWithErrorType:46];

        v118 = container_log_handle_for_category();
        v4 = v198;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          int v180 = [v207 transient];
          *(_DWORD *)buf = 138412802;
          v249 = v217;
          __int16 v250 = 2048;
          v251 = (MCMError *)v204;
          __int16 v252 = 1024;
          LODWORD(v253) = v180;
          _os_log_error_impl(&dword_1D7739000, v118, OS_LOG_TYPE_ERROR, "Failed to remove from cache id: %@, class: %ld, transient: %d", buf, 0x1Cu);
        }
        v119 = v221;
      }
      else
      {
        v146 = [[MCMError alloc] initWithErrorType:14];

        v118 = container_log_handle_for_category();
        v4 = v198;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          v224 = v141;
          v26 = v207;
          v194 = [v207 containerPath];
          v176 = [v194 containerRootURL];
          v177 = [v176 path];
          v178 = [v229 path];
          *(_DWORD *)buf = 138412546;
          v249 = v177;
          __int16 v250 = 2112;
          v251 = v178;
          _os_log_error_impl(&dword_1D7739000, v118, OS_LOG_TYPE_ERROR, "Failed to move old %@ to staging %@", buf, 0x16u);

          v119 = v224;
          v184 = v146;
        }
        else
        {
          v119 = v141;
          v184 = v146;
          v26 = v207;
        }
      }
      v5 = v202;
      v24 = v203;
    }
    else
    {
      v118 = container_log_handle_for_category();
      unsigned int v36 = v186;
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v249 = v128;
        _os_log_error_impl(&dword_1D7739000, v118, OS_LOG_TYPE_ERROR, "Failed to write replace file: %@", buf, 0xCu);
      }
      v26 = v207;
      v24 = v203;
      v119 = v100;
    }
  }
  else
  {
    v115 = [MCMError alloc];
    v116 = [(MCMError *)v97 containerClassPath];
    v117 = [v116 classURL];
    v184 = [(MCMError *)v115 initWithNSError:v100 url:v117 defaultErrorType:7];

    v118 = container_log_handle_for_category();
    v119 = v100;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v249 = v97;
      __int16 v250 = 2112;
      v251 = v100;
      _os_log_error_impl(&dword_1D7739000, v118, OS_LOG_TYPE_ERROR, "Failed to create class path dir for %@: %@", buf, 0x16u);
    }
    v229 = 0;
    v26 = v207;
    v24 = v203;
    unsigned int v36 = v186;
  }

  char v145 = 0;
  v221 = v119;
  id v15 = v184;
LABEL_140:

  id v25 = v214;
  if ((v145 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_141:
  if (v36)
  {
    uint64_t v149 = [(MCMError *)v25 metadataBySettingTransient:0];

    id v25 = (MCMError *)v149;
  }
  if (v209)
  {
    uint64_t v150 = [(MCMError *)v25 metadataByChangingUUID:v205];

    id v25 = (MCMError *)v150;
  }
  else if (((v26 == 0) & ~v36) != 0)
  {
    goto LABEL_148;
  }
  id v236 = 0;
  int v151 = [(MCMError *)v25 writeMetadataToDiskWithError:&v236];
  id v152 = v236;
  if (!v151)
  {
    v234[0] = MEMORY[0x1E4F143A8];
    v234[1] = 3221225472;
    v234[2] = __37__MCMCommandReplaceContainer_execute__block_invoke;
    v234[3] = &unk_1E6A80A30;
    id v235 = v152;
    uint64_t v23 = v152;
    id v163 = __37__MCMCommandReplaceContainer_execute__block_invoke((uint64_t)v234);

    goto LABEL_37;
  }

LABEL_148:
  v188 = +[MCMFileManager defaultManager];
  v214 = v25;
  v200 = [(MCMError *)v25 containerPath];
  v153 = [v200 containerRootURL];
  [(MCMError *)v225 containerRootURL];
  v154 = v233[1] = v221;
  char v192 = objc_msgSend(v188, "moveItemAtURL:toURL:error:", v153);
  v210 = v221;

  if ((v192 & 1) == 0)
  {
    v164 = [MCMError alloc];
    v165 = [(MCMError *)v225 containerRootURL];
    uint64_t v212 = [(MCMError *)v164 initWithNSError:v210 url:v165 defaultErrorType:15];

    uint64_t v23 = container_log_handle_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v223 = [v26 containerPath];
      v201 = [v223 containerRootURL];
      v189 = [v201 path];
      v197 = [(MCMError *)v214 containerPath];
      v193 = [v197 containerRootURL];
      v173 = [v193 path];
      v174 = [(MCMError *)v225 containerRootURL];
      v175 = [v174 path];
      *(_DWORD *)buf = 138412802;
      v249 = v189;
      __int16 v250 = 2112;
      v251 = v173;
      __int16 v252 = 2112;
      uint64_t v253 = (uint64_t)v175;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Failed to replace: %@ with: %@ at: %@", buf, 0x20u);

      v24 = v203;
      v26 = v207;

      id v25 = v214;
      v221 = v210;
      id v15 = (MCMError *)v212;
    }
    else
    {
      v221 = v210;
      id v15 = (MCMError *)v212;
      id v25 = v214;
    }
    goto LABEL_37;
  }
  v155 = [(MCMCommand *)v2 context];
  v156 = [v155 containerCache];
  v233[0] = v15;
  char v157 = [v156 removeContainerForUserIdentity:v226 contentClass:v211 identifier:v218 transient:v36 error:v233];
  id v158 = v233[0];

  if ((v157 & 1) == 0)
  {
    id v15 = [[MCMError alloc] initWithErrorType:46];

    uint64_t v23 = container_log_handle_for_category();
    v24 = v203;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v25 = v214;
      int v179 = [(MCMError *)v214 transient];
      *(_DWORD *)buf = 138412802;
      v249 = v218;
      __int16 v250 = 2048;
      v251 = (MCMError *)v211;
      __int16 v252 = 1024;
      LODWORD(v253) = v179;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Failed to remove from cache id: %@, class: %ld, transient: %d", buf, 0x1Cu);
      v221 = v210;
      v26 = v207;
      goto LABEL_37;
    }
    v221 = v210;
    v26 = v207;
LABEL_98:
    id v25 = v214;
    goto LABEL_37;
  }
  id v25 = [(MCMError *)v214 metadataByChangingContainerPath:v225];

  v159 = [(MCMCommand *)v2 context];
  v160 = [v159 containerCache];
  id v232 = v158;
  v161 = [v160 addContainerMetadata:v25 error:&v232];
  v162 = (MCMError *)v232;

  v24 = v203;
  if (!v161)
  {
    id v15 = [[MCMError alloc] initWithErrorType:45];

    uint64_t v23 = container_log_handle_for_category();
    v26 = v207;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v181 = [v207 transient];
      *(_DWORD *)buf = 138412802;
      v249 = v25;
      __int16 v250 = 2112;
      v251 = v225;
      __int16 v252 = 1024;
      LODWORD(v253) = v181;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, url: %@, transient: %d", buf, 0x1Cu);
    }
    v221 = v210;
    v6 = v205;
    v2 = v196;
    goto LABEL_37;
  }
  id v15 = v162;
  v221 = v210;
  v6 = v205;
  v26 = v207;
  v2 = v196;
  if (!v205) {
    goto LABEL_75;
  }
LABEL_38:
  v213 = v25;
  v40 = v6;
  v41 = v5;
  v208 = v26;
  if (v229)
  {
    v199 = v4;
    v206 = v40;
    id v42 = containermanager_copy_global_configuration();
    char v43 = [v42 isGlobalContainerClass:v204];

    if (v43) {
      __int16 v44 = 0;
    }
    else {
      __int16 v44 = v227;
    }
    v45 = v2;
    __int16 v46 = [(MCMCommand *)v2 context];
    uint64_t v47 = [v46 containerFactory];
    v231 = v15;
    char v48 = [v47 deleteURL:v229 forUserIdentity:v44 error:&v231];
    v49 = v231;

    if ((v48 & 1) == 0)
    {
      v50 = container_log_handle_for_category();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v84 = [v229 path];
        *(_DWORD *)buf = 138412546;
        v249 = v84;
        __int16 v250 = 2112;
        v251 = v49;
        _os_log_error_impl(&dword_1D7739000, v50, OS_LOG_TYPE_ERROR, "Failed to remove staging dir: %@; error = %@",
          buf,
          0x16u);
      }
      v49 = 0;
    }
    v2 = v45;

    id v15 = v49;
    v40 = v206;
    v4 = v199;
    v41 = v5;
  }
  if (!v228)
  {
    v228 = 0;
    goto LABEL_51;
  }
  v195 = v2;
  v51 = [(MCMCommand *)v2 context];
  v52 = [v51 containerFactory];
  v230 = v15;
  char v53 = [v52 deleteURL:v228 forUserIdentity:0 error:&v230];
  id v14 = v230;

  if ((v53 & 1) == 0)
  {
    v54 = container_log_handle_for_category();
    v26 = v208;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v85 = [v228 path];
      *(_DWORD *)buf = 138412546;
      v249 = v85;
      __int16 v250 = 2112;
      v251 = (MCMError *)v14;
      _os_log_error_impl(&dword_1D7739000, v54, OS_LOG_TYPE_ERROR, "Failed to remove replace file: %@; error = %@",
        buf,
        0x16u);
    }
    id v15 = 0;
    v2 = v195;
    v5 = v41;
    v6 = v40;
    goto LABEL_70;
  }
  id v15 = (MCMError *)v14;
  v2 = v195;
LABEL_51:
  v26 = v208;
  v5 = v41;
  v6 = v40;
LABEL_71:
  if ([(MCMCommandReplaceContainer *)v2 asyncReclaim])
  {
    v66 = [MCMCommandOperationReclaimDiskSpace alloc];
    v67 = [(MCMCommand *)v2 context];
    BOOL v27 = [(MCMCommandOperationReclaimDiskSpace *)v66 initWithAsynchronously:1 context:v67 resultPromise:0];

    [v27 execute];
    id v25 = v213;
LABEL_73:

    goto LABEL_75;
  }
  id v25 = v213;
LABEL_75:
  if (v15)
  {

    id v25 = 0;
  }
  v68 = container_log_handle_for_category();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v249 = v15;
    _os_log_impl(&dword_1D7739000, v68, OS_LOG_TYPE_DEFAULT, "Replace; error = %@", buf, 0xCu);
  }

  v69 = [MCMResultWithContainerBase alloc];
  if (v15) {
    uint64_t v70 = [(MCMResultBase *)v69 initWithError:v15];
  }
  else {
    uint64_t v70 = [(MCMResultWithContainerBase *)v69 initWithMetadata:v25 sandboxToken:0 includePath:1 includeInfo:0 includeUserManagedAssetsRelPath:0 includeCreator:0];
  }
  v71 = (void *)v70;
  v72 = v25;
  v73 = [(MCMCommand *)v2 resultPromise];
  [v73 completeWithResult:v71];
}

id __37__MCMCommandReplaceContainer_execute__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[[NSString alloc] initWithFormat:@"Failed to write metadata during replace: %@", *(void *)(a1 + 32)];
  v11[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMCommandReplaceContainer execute]_block_invoke"];
  v12[0] = v3;
  v12[1] = &unk_1F2F123B0;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v4;
  v12[2] = v2;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  v6 = container_log_handle_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v2;
    _os_log_error_impl(&dword_1D7739000, v6, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"MCMErrorDomain", objc_msgSend(*(id *)(a1 + 32), "type"), v5);

  return v7;
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  uint64_t v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToReplaceContainers];

  return v4;
}

- (MCMCommandReplaceContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandReplaceContainer;
  id v9 = [(MCMCommand *)&v15 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 containerIdentityOld];
    containerIdentityOld = v9->_containerIdentityOld;
    v9->_containerIdentityOld = (MCMConcreteContainerIdentity *)v10;

    uint64_t v12 = [v8 containerIdentityNew];
    containerIdentityNew = v9->_containerIdentityNew;
    v9->_containerIdentityNew = (MCMConcreteContainerIdentity *)v12;

    v9->_preserveOldPathIdentifier = 0;
    v9->_preserveOldInternalUUID = 0;
    v9->_asyncReclaim = 1;
  }

  return v9;
}

- (MCMCommandReplaceContainer)initWithConcreteContainerIdentityOld:(id)a3 concreteContainerIdentityNew:(id)a4 preserveOldPathIdentifier:(BOOL)a5 preserveOldInternalUUID:(BOOL)a6 asyncReclaim:(BOOL)a7 context:(id)a8 resultPromise:(id)a9
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MCMCommandReplaceContainer;
  v18 = [(MCMCommand *)&v21 initWithContext:a8 resultPromise:a9];
  char v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_containerIdentityOld, a3);
    objc_storeStrong((id *)&v19->_containerIdentityNew, a4);
    v19->_preserveOldPathIdentifier = a5;
    v19->_preserveOldInternalUUID = a6;
    v19->_asyncReclaim = a7;
  }

  return v19;
}

+ (id)_readAndValidateReplaceFileAtUrl:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v52 = 0;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "MCM_dictionaryWithContentsOfURL:options:error:", v5, 1, &v52);
  id v7 = v52;
  v50 = v7;
  v51 = v5;
  if (!v6)
  {
    uint64_t v10 = [[MCMError alloc] initWithNSError:v7 url:v5 defaultErrorType:35];
    v11 = container_log_handle_for_category();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_23:
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      v24 = 0;
      id v25 = 0;
LABEL_24:

      if (a4)
      {
        uint64_t v10 = v10;
        id v8 = 0;
        *a4 = v10;
      }
      else
      {
        id v8 = 0;
      }
      id v26 = v22;
      id v27 = v23;
      id v28 = v24;
      goto LABEL_28;
    }
    uint64_t v12 = [v5 path];
    *(_DWORD *)buf = 138412290;
    id v54 = v12;
    _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Failed to read replace file at URL %@", buf, 0xCu);
LABEL_32:

    goto LABEL_23;
  }
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (!v9)
  {
    uint64_t v10 = [[MCMError alloc] initWithErrorType:35 category:5];
    v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v8;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Bad Data in replace file: %@", buf, 0xCu);
    }
    goto LABEL_23;
  }
  id v13 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
  objc_opt_class();
  id v14 = v13;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  if (!v14)
  {
LABEL_21:

LABEL_22:
    uint64_t v10 = [[MCMError alloc] initWithErrorType:35 category:5];
    v11 = container_log_handle_for_category();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    uint64_t v12 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
    v31 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationNewURL"];
    v32 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationStagingURL"];
    char v33 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationDestURL"];
    *(_DWORD *)buf = 138413058;
    id v54 = v12;
    __int16 v55 = 2112;
    v56 = v31;
    __int16 v57 = 2112;
    char v58 = v32;
    __int16 v59 = 2112;
    uint64_t v60 = (uint64_t)v33;
    _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Invalid replace data: Old: %@, New: %@, Staging: %@, Dest: %@", buf, 0x2Au);

    goto LABEL_32;
  }
  objc_super v15 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationNewURL"];
  objc_opt_class();
  id v16 = v15;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  if (!v16)
  {
LABEL_20:

    goto LABEL_21;
  }
  id v17 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationStagingURL"];
  objc_opt_class();
  id v18 = v17;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_19;
  }
  if (!v18)
  {
LABEL_19:

    goto LABEL_20;
  }
  char v19 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationDestURL"];
  objc_opt_class();
  id v20 = v19;
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }

  if (!v21) {
    goto LABEL_22;
  }
  v49 = a4;
  v34 = (void *)MEMORY[0x1E4F1CB10];
  id v35 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
  unsigned int v36 = [v34 fileURLWithPath:v35 isDirectory:1];

  id v37 = (void *)MEMORY[0x1E4F1CB10];
  v38 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationNewURL"];
  uint64_t v22 = [v37 fileURLWithPath:v38 isDirectory:1];

  int v39 = (void *)MEMORY[0x1E4F1CB10];
  v40 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationStagingURL"];
  uint64_t v23 = [v39 fileURLWithPath:v40 isDirectory:1];

  v41 = (void *)MEMORY[0x1E4F1CB10];
  id v42 = [v8 objectForKeyedSubscript:@"MCMReplaceOperationDestURL"];
  v24 = [v41 fileURLWithPath:v42 isDirectory:1];

  objc_opt_class();
  id v25 = v36;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_45;
  }
  if (!v25)
  {
LABEL_46:
    uint64_t v10 = [[MCMError alloc] initWithErrorType:35 category:5];
    v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v48 = [v25 path];
      __int16 v44 = [v22 path];
      v45 = [v23 path];
      uint64_t v46 = [v24 path];
      *(_DWORD *)buf = 138413058;
      id v54 = v48;
      __int16 v55 = 2112;
      v56 = v44;
      __int16 v57 = 2112;
      char v58 = v45;
      __int16 v59 = 2112;
      uint64_t v60 = v46;
      uint64_t v47 = (void *)v46;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Invalid replace data: Old: %@, New: %@, Staging: %@, Dest: %@", buf, 0x2Au);
    }
    a4 = v49;
    goto LABEL_24;
  }
  objc_opt_class();
  id v26 = v22;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_44;
  }
  if (!v26)
  {
LABEL_45:

    goto LABEL_46;
  }
  objc_opt_class();
  id v27 = v23;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_44;
  }
  if (!v27)
  {
LABEL_44:

    goto LABEL_45;
  }
  objc_opt_class();
  id v28 = v24;
  if (objc_opt_isKindOfClass()) {
    id v43 = v28;
  }
  else {
    id v43 = 0;
  }

  if (!v43) {
    goto LABEL_46;
  }
  [v8 setObject:v25 forKeyedSubscript:@"MCMReplaceOperationOldURL"];
  [v8 setObject:v26 forKeyedSubscript:@"MCMReplaceOperationNewURL"];
  [v8 setObject:v27 forKeyedSubscript:@"MCMReplaceOperationStagingURL"];
  [v8 setObject:v28 forKeyedSubscript:@"MCMReplaceOperationDestURL"];
  uint64_t v10 = 0;
LABEL_28:
  v29 = (void *)[v8 copy];

  return v29;
}

+ (BOOL)recoverFromReplaceOperationsWithContext:(id)a3 error:(id *)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = containermanager_copy_global_configuration();
  id v7 = [v6 managedPathRegistry];
  id v8 = [v7 containermanagerReplaceOperations];

  id v9 = [v8 url];
  if (!v9)
  {
    id v14 = [[MCMError alloc] initWithErrorType:84 category:1];
    int v39 = container_log_handle_for_category();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v39, OS_LOG_TYPE_ERROR, "Failed to get url for storing replace operations.", buf, 2u);
    }

    uint64_t v12 = 0;
    BOOL v40 = 0;
    id v13 = 0;
    goto LABEL_47;
  }
  uint64_t v10 = +[MCMFileManager defaultManager];
  id v66 = 0;
  v11 = [v10 urlsForItemsInDirectoryAtURL:v9 error:&v66];
  uint64_t v12 = (MCMError *)v66;

  if (!v11)
  {
    v41 = [(MCMError *)v12 domain];
    if ([v41 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v42 = [(MCMError *)v12 code];

      if (v42 == 2)
      {
        id v14 = 0;
        if (!a4) {
          goto LABEL_46;
        }
LABEL_45:
        id v14 = v14;
        *a4 = v14;
        goto LABEL_46;
      }
    }
    else
    {
    }
    id v13 = container_log_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v50 = [v8 url];
      v51 = [v50 path];
      *(_DWORD *)buf = 138412546;
      v68 = v51;
      __int16 v69 = 2112;
      uint64_t v70 = v12;
      _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Failed to get items at replace URL %@ : %@", buf, 0x16u);
    }
    goto LABEL_43;
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v13 = v11;
  uint64_t v62 = [v13 countByEnumeratingWithState:&v74 objects:v73 count:16];
  if (!v62)
  {
LABEL_43:
    id v14 = 0;
    goto LABEL_44;
  }
  id v52 = v11;
  char v53 = a4;
  uint64_t v60 = v12;
  id v54 = v9;
  __int16 v55 = v8;
  v56 = v5;
  char v57 = 0;
  id v14 = 0;
  uint64_t v61 = *(void *)v75;
  id v15 = a1;
  __int16 v59 = v13;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v75 != v61) {
        objc_enumerationMutation(v13);
      }
      id v17 = *(void **)(*((void *)&v74 + 1) + 8 * v16);
      v65 = v14;
      id v18 = [v15 _readAndValidateReplaceFileAtUrl:v17 error:&v65];
      char v19 = v65;

      id v20 = container_log_handle_for_category();
      id v21 = v20;
      if (!v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v37 = [v17 path];
          *(_DWORD *)buf = 138412546;
          v68 = v37;
          __int16 v69 = 2112;
          uint64_t v70 = v19;
          _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Pending replace operation found, but not valid at [%@], ignoring: %@", buf, 0x16u);
        }
        goto LABEL_15;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = [v17 path];
        *(_DWORD *)buf = 138412546;
        v68 = v22;
        __int16 v69 = 2112;
        uint64_t v70 = v18;
        _os_log_impl(&dword_1D7739000, v21, OS_LOG_TYPE_INFO, "Doing a replace of %@ with info: %@", buf, 0x16u);
      }
      id v21 = +[MCMFileManager defaultManager];
      uint64_t v23 = [(MCMError *)v18 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
      if ([v21 itemExistsAtURL:v23])
      {

LABEL_15:
        goto LABEL_16;
      }
      id v27 = +[MCMFileManager defaultManager];
      id v28 = [(MCMError *)v18 objectForKeyedSubscript:@"MCMReplaceOperationDestURL"];
      char v29 = [v27 itemExistsAtURL:v28];

      if (v29)
      {
        id v13 = v59;
      }
      else
      {
        v30 = container_log_handle_for_category();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = [(MCMError *)v18 objectForKeyedSubscript:@"MCMReplaceOperationStagingURL"];
          v32 = [(MCMError *)v18 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
          *(_DWORD *)buf = 138412546;
          v68 = v31;
          __int16 v69 = 2112;
          uint64_t v70 = v32;
          _os_log_impl(&dword_1D7739000, v30, OS_LOG_TYPE_INFO, "Recovering from failed replace by moving: %@ to %@", buf, 0x16u);
        }
        char v33 = +[MCMFileManager defaultManager];
        v34 = [(MCMError *)v18 objectForKeyedSubscript:@"MCMReplaceOperationStagingURL"];
        id v35 = [(MCMError *)v18 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
        uint64_t v64 = v60;
        char v36 = [v33 moveItemAtURL:v34 toURL:v35 error:&v64];
        uint64_t v12 = v64;

        if ((v36 & 1) == 0)
        {
          v45 = [MCMError alloc];
          uint64_t v46 = [(MCMError *)v18 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
          id v14 = [(MCMError *)v45 initWithNSError:v12 url:v46 defaultErrorType:35];

          id v43 = container_log_handle_for_category();
          id v13 = v59;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            uint64_t v47 = [(MCMError *)v18 objectForKeyedSubscript:@"MCMReplaceOperationStagingURL"];
            char v48 = [(MCMError *)v18 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
            *(_DWORD *)buf = 138412802;
            v68 = v47;
            __int16 v69 = 2112;
            uint64_t v70 = v48;
            __int16 v71 = 2112;
            v72 = v12;
            _os_log_error_impl(&dword_1D7739000, v43, OS_LOG_TYPE_ERROR, "Failed to recover replace move: %@ to %@; error = %@",
              buf,
              0x20u);
          }
          goto LABEL_39;
        }
        char v57 = 1;
        uint64_t v60 = v12;
        id v15 = a1;
        id v13 = v59;
      }
LABEL_16:
      v24 = +[MCMCommandContext privileged];
      id v25 = [v24 containerFactory];
      v63 = v19;
      char v26 = [v25 deleteURL:v17 forUserIdentity:0 error:&v63];
      id v14 = v63;

      if ((v26 & 1) == 0)
      {
        id v43 = container_log_handle_for_category();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v49 = [v17 path];
          *(_DWORD *)buf = 138412546;
          v68 = v49;
          __int16 v69 = 2112;
          uint64_t v70 = v14;
          _os_log_error_impl(&dword_1D7739000, v43, OS_LOG_TYPE_ERROR, "Failed to remove replace file at %@; error = %@",
            buf,
            0x16u);
        }
        uint64_t v12 = v60;
LABEL_39:
        id v8 = v55;
        id v5 = v56;
        id v9 = v54;

        BOOL v40 = 0;
        goto LABEL_47;
      }

      ++v16;
    }
    while (v62 != v16);
    uint64_t v38 = [v13 countByEnumeratingWithState:&v74 objects:v73 count:16];
    uint64_t v62 = v38;
  }
  while (v38);

  if (v57)
  {
    id v5 = v56;
    id v13 = [v56 containerCache];
    [v13 flush];
    id v9 = v54;
    id v8 = v55;
    uint64_t v12 = v60;
    v11 = v52;
    a4 = v53;
LABEL_44:

    if (!a4) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  id v8 = v55;
  id v5 = v56;
  a4 = v53;
  id v9 = v54;
  uint64_t v12 = v60;
  v11 = v52;
  if (v53) {
    goto LABEL_45;
  }
LABEL_46:
  BOOL v40 = 1;
  id v13 = v11;
LABEL_47:

  return v40;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 2;
}

@end