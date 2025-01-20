@interface MCMCommandReferencesAdd
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)createDuringReconciliation;
- (BOOL)deleteDuringReconciliation;
- (BOOL)preflightClientAllowed;
- (BOOL)yesReallyApplyToAll;
- (MCMCommandReferencesAdd)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMUserIdentity)userIdentity;
- (NSSet)groupIdentifiers;
- (NSSet)ownerIdentifiers;
- (id)_resolveUserIdentity;
- (unint64_t)containerClass;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)uid;
- (void)execute;
@end

@implementation MCMCommandReferencesAdd

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);

  objc_storeStrong((id *)&self->_ownerIdentifiers, 0);
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (BOOL)yesReallyApplyToAll
{
  return self->_yesReallyApplyToAll;
}

- (BOOL)deleteDuringReconciliation
{
  return self->_deleteDuringReconciliation;
}

- (BOOL)createDuringReconciliation
{
  return self->_createDuringReconciliation;
}

- (unint64_t)privateFlags
{
  return self->_privateFlags;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)explicitFlags
{
  return self->_explicitFlags;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (NSSet)ownerIdentifiers
{
  return self->_ownerIdentifiers;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (id)_resolveUserIdentity
{
  v3 = [(MCMCommand *)self context];
  v4 = [v3 clientIdentity];
  v5 = [v4 userIdentity];

  v6 = [(MCMCommandReferencesAdd *)self userIdentity];

  if (v6)
  {
    id v7 = [(MCMCommandReferencesAdd *)self userIdentity];
  }
  else
  {
    if ([v5 isNoSpecificPersona])
    {
      v8 = 0;
      goto LABEL_7;
    }
    id v7 = v5;
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (void)execute
{
  v2 = self;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = [MEMORY[0x1E4F1CA80] set];
  v66 = [MEMORY[0x1E4F1CA48] array];
  v65 = [(MCMCommandReferencesAdd *)v2 _resolveUserIdentity];
  BOOL v63 = +[MCMUserIdentity isUserIdentityRequiredForContainerClass:[(MCMCommandReferencesAdd *)v2 containerClass]];
  uint64_t v5 = [(MCMCommandReferencesAdd *)v2 ownerIdentifiers];
  p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
  if (!v5) {
    goto LABEL_35;
  }
  id v7 = (void *)v5;
  uint64_t v8 = [(MCMCommandReferencesAdd *)v2 groupIdentifiers];
  if (!v8) {
    goto LABEL_34;
  }
  v9 = (void *)v8;
  v10 = [(MCMCommandReferencesAdd *)v2 ownerIdentifiers];
  if (![v10 count])
  {

LABEL_34:
    p_info = MCMContainerSchemaActionMkdir.info;
    goto LABEL_35;
  }
  [(MCMCommandReferencesAdd *)v2 groupIdentifiers];
  v11 = v67 = v2;
  uint64_t v12 = [v11 count];

  v2 = v67;
  p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
  if (!v12)
  {
LABEL_35:
    v40 = container_log_handle_for_category();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v47 = [(MCMCommandReferencesAdd *)v2 ownerIdentifiers];
      uint64_t v48 = [v47 count];
      [(MCMCommandReferencesAdd *)v2 groupIdentifiers];
      v50 = v49 = p_info;
      uint64_t v51 = [v50 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v90 = v48;
      __int16 v91 = 2048;
      uint64_t v92 = v51;
      _os_log_error_impl(&dword_1D7739000, v40, OS_LOG_TYPE_ERROR, "Owner and group identifiers must be specified; owner cnt = %lu, group cnt = %lu",
        buf,
        0x16u);

      p_info = v49;
    }

    v15 = [[MCMError alloc] initWithErrorType:38 category:3];
    v41 = 0;
LABEL_38:
    uint64_t v42 = [objc_alloc((Class)(p_info + 151)) initWithError:v15];

    v41 = (void *)v42;
    goto LABEL_39;
  }
  v62 = v4;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v13 = [(MCMCommandReferencesAdd *)v67 ownerIdentifiers];
  uint64_t v58 = [v13 countByEnumeratingWithState:&v85 objects:v84 count:16];
  char v14 = 0;
  v15 = 0;
  if (v58)
  {
    uint64_t v16 = *(void *)v86;
    v60 = v3;
    uint64_t v56 = *(void *)v86;
    v57 = v13;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v86 != v16)
        {
          uint64_t v18 = v17;
          objc_enumerationMutation(v13);
          uint64_t v17 = v18;
        }
        uint64_t v59 = v17;
        uint64_t v19 = *(void *)(*((void *)&v85 + 1) + 8 * v17);
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        v20 = [(MCMCommandReferencesAdd *)v2 groupIdentifiers];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v80 objects:v79 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v81;
          while (2)
          {
            uint64_t v24 = 0;
            v25 = v15;
            do
            {
              if (*(void *)v81 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v26 = *(void *)(*((void *)&v80 + 1) + 8 * v24);
              v27 = (void *)gCodeSigningMapping;
              uint64_t v28 = [(MCMCommandReferencesAdd *)v67 containerClass];
              v73 = v25;
              v69[0] = MEMORY[0x1E4F143A8];
              v69[1] = 3221225472;
              v69[2] = __34__MCMCommandReferencesAdd_execute__block_invoke;
              v69[3] = &unk_1E6A7F288;
              id v70 = v65;
              BOOL v72 = v63;
              id v71 = v4;
              LODWORD(v26) = [v27 addGroupIdentifier:v26 forIdentifier:v19 containerClass:v28 error:&v73 reconcileHandler:v69];
              v15 = v73;

              if (!v26)
              {

                v41 = 0;
                v3 = v60;
                v2 = v67;
                p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
                goto LABEL_38;
              }
              ++v24;
              v25 = v15;
            }
            while (v22 != v24);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v80 objects:v79 count:16];
            if (v22) {
              continue;
            }
            break;
          }
          char v14 = 1;
          v3 = v60;
          uint64_t v16 = v56;
          v13 = v57;
        }

        uint64_t v17 = v59 + 1;
        v2 = v67;
        p_info = MCMContainerSchemaActionMkdir.info;
      }
      while (v59 + 1 != v58);
      uint64_t v58 = [v13 countByEnumeratingWithState:&v85 objects:v84 count:16];
    }
    while (v58);
  }

  if ([(MCMCommandReferencesAdd *)v2 createDuringReconciliation]
    && [v4 count])
  {
    char v64 = v14;
    v61 = v3;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v29 = v4;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v75 objects:v74 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v76;
      do
      {
        uint64_t v33 = 0;
        v34 = v15;
        do
        {
          if (*(void *)v76 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v35 = *(void *)(*((void *)&v75 + 1) + 8 * v33);
          v36 = [(MCMCommand *)v2 context];
          v37 = [v36 containerFactory];
          v68 = v34;
          v38 = [v37 containerForContainerIdentity:v35 createIfNecessary:1 error:&v68];
          v15 = v68;

          v39 = [v38 metadataMinimal];
          if (([v39 existed] & 1) == 0) {
            [v66 addObject:v39];
          }

          ++v33;
          v34 = v15;
          v2 = v67;
        }
        while (v31 != v33);
        uint64_t v31 = [v29 countByEnumeratingWithState:&v75 objects:v74 count:16];
      }
      while (v31);
    }

    v3 = v61;
    v4 = v62;
    p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
    char v14 = v64;
  }
  id v52 = objc_alloc((Class)(p_info + 151));
  v53 = [(MCMCommand *)v2 context];
  v54 = [v53 clientIdentity];
  LOBYTE(v55) = 1;
  v41 = (void *)[v52 initWithContainers:v66 includePath:1 includeInfo:0 includeUserManagedAssetsRelPath:0 includeCreator:0 clientIdentity:v54 skipSandboxExtensions:v55];

  p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
  if ((v14 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_39:
  v43 = container_log_handle_for_category();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = [v66 count];
    v45 = [v41 error];
    *(_DWORD *)buf = 134218242;
    uint64_t v90 = v44;
    __int16 v91 = 2112;
    uint64_t v92 = (uint64_t)v45;
    _os_log_impl(&dword_1D7739000, v43, OS_LOG_TYPE_DEFAULT, "References add; created containers count = %lu, error = %@",
      buf,
      0x16u);
  }
  v46 = [(MCMCommand *)v2 resultPromise];
  [v46 completeWithResult:v41];
}

void __34__MCMCommandReferencesAdd_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*(void *)(a1 + 32) && *(unsigned char *)(a1 + 48))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v11 = [v10 userIdentity];
          int v12 = [v11 isEqual:*(void *)(a1 + 32)];

          if (v12) {
            [*(id *)(a1 + 40) addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [*(id *)(a1 + 40) unionSet:v4];
  }
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToChangeReferences];

  return v4;
}

- (MCMCommandReferencesAdd)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMCommandReferencesAdd;
  v9 = [(MCMCommand *)&v17 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    v9->_containerClass = [v8 containerClass];
    uint64_t v10 = [v8 ownerIdentifiers];
    ownerIdentifiers = v9->_ownerIdentifiers;
    v9->_ownerIdentifiers = (NSSet *)v10;

    uint64_t v12 = [v8 groupIdentifiers];
    groupIdentifiers = v9->_groupIdentifiers;
    v9->_groupIdentifiers = (NSSet *)v12;

    v9->_createDuringReconciliation = [v8 createDuringReconciliation];
    uint64_t v14 = [v8 userIdentity];
    userIdentity = v9->_userIdentity;
    v9->_userIdentity = (MCMUserIdentity *)v14;
  }
  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 48;
}

@end