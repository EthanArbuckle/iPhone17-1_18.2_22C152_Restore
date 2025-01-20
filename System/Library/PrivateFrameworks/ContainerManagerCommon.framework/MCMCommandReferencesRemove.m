@interface MCMCommandReferencesRemove
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)createDuringReconciliation;
- (BOOL)deleteDuringReconciliation;
- (BOOL)preflightClientAllowed;
- (BOOL)yesReallyApplyToAll;
- (MCMCommandReferencesRemove)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMUserIdentity)userIdentity;
- (NSSet)groupIdentifiers;
- (NSSet)ownerIdentifiers;
- (unint64_t)containerClass;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)uid;
- (void)execute;
@end

@implementation MCMCommandReferencesRemove

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

- (void)execute
{
  v2 = self;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v48 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(MCMCommandReferencesRemove *)v2 ownerIdentifiers];
  if (v4) {
    goto LABEL_2;
  }
  if (![(MCMCommandReferencesRemove *)v2 yesReallyApplyToAll])
  {
    v38 = container_log_handle_for_category();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v38, OS_LOG_TYPE_ERROR, "Owner identifiers must be specified", buf, 2u);
    }

    v7 = [[MCMError alloc] initWithErrorType:38 category:3];
    id v4 = 0;
    goto LABEL_37;
  }
  id v52 = 0;
  id v4 = [(id)gCodeSigningMapping identifiersWithError:&v52];
  id v28 = v52;
  v29 = v28;
  if (!v4)
  {
    v7 = [[MCMError alloc] initWithNSError:v28 url:0 defaultErrorType:66];

LABEL_37:
    v34 = [(MCMResultBase *)[MCMResultWithContainersArrayBase alloc] initWithError:v7];
    goto LABEL_38;
  }

LABEL_2:
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v4 = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v61 objects:v60 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v62;
    v46 = v4;
    v47 = v3;
    uint64_t v45 = *(void *)v62;
    do
    {
      uint64_t v9 = 0;
      uint64_t v44 = v6;
      do
      {
        if (*(void *)v62 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v61 + 1) + 8 * v9);
        v11 = [(MCMCommandReferencesRemove *)v2 groupIdentifiers];

        if (v11)
        {
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          v12 = [(MCMCommandReferencesRemove *)v2 groupIdentifiers];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v55 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v43 = v9;
            v15 = v2;
            uint64_t v16 = *(void *)v57;
            while (2)
            {
              uint64_t v17 = 0;
              v18 = v7;
              do
              {
                if (*(void *)v57 != v16) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v19 = *(void *)(*((void *)&v56 + 1) + 8 * v17);
                v20 = (void *)gCodeSigningMapping;
                uint64_t v21 = [(MCMCommandReferencesRemove *)v15 containerClass];
                v51 = v18;
                v49[0] = MEMORY[0x1E4F143A8];
                v49[1] = 3221225472;
                v49[2] = __37__MCMCommandReferencesRemove_execute__block_invoke;
                v49[3] = &unk_1E6A7F778;
                id v50 = v48;
                LODWORD(v21) = [v20 removeGroupIdentifier:v19 forIdentifier:v10 containerClass:v21 error:&v51 reconcileHandler:v49];
                v7 = v51;

                if (!v21)
                {

                  id v4 = v46;
                  v3 = v47;
                  v2 = v15;
                  goto LABEL_37;
                }
                ++v17;
                v18 = v7;
              }
              while (v14 != v17);
              uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v55 count:16];
              if (v14) {
                continue;
              }
              break;
            }
            id v4 = v46;
            v3 = v47;
            v2 = v15;
            uint64_t v6 = v44;
            uint64_t v8 = v45;
            uint64_t v9 = v43;
          }
          else
          {
            uint64_t v6 = v44;
          }
        }
        else
        {
          v22 = v2;
          id v23 = v4;
          v24 = v3;
          uint64_t v25 = v9;
          v26 = (void *)gCodeSigningMapping;
          v27 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
          v12 = [v26 removeCodeSigningDictionaryForIdentifiers:v27];

          if (v12) {
            [v48 unionSet:v12];
          }
          uint64_t v9 = v25;
          v3 = v24;
          id v4 = v23;
          v2 = v22;
          uint64_t v8 = v45;
        }

        ++v9;
      }
      while (v9 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v61 objects:v60 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if (![(MCMCommandReferencesRemove *)v2 deleteDuringReconciliation]) {
    goto LABEL_32;
  }
  if (![v48 count]) {
    goto LABEL_32;
  }
  v30 = objc_alloc_init(MCMResultPromise);
  v31 = [v48 allObjects];
  v32 = [(MCMCommand *)v2 context];
  v33 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:v31 removeAllCodeSignInfo:0 context:v32 resultPromise:v30];

  [v33 execute];
  v34 = [(MCMResultPromise *)v30 result];

  if (!v34)
  {
LABEL_32:
    v35 = [MCMResultWithContainersArrayBase alloc];
    v36 = [(MCMCommand *)v2 context];
    v37 = [v36 clientIdentity];
    LOBYTE(v42) = 1;
    v34 = [(MCMResultWithContainersArrayBase *)v35 initWithContainers:MEMORY[0x1E4F1CBF0] includePath:1 includeInfo:0 includeUserManagedAssetsRelPath:0 includeCreator:0 clientIdentity:v37 skipSandboxExtensions:v42];
  }
LABEL_38:
  v39 = container_log_handle_for_category();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = [(MCMResultBase *)v34 error];
    *(_DWORD *)buf = 138412290;
    v54 = v40;
    _os_log_impl(&dword_1D7739000, v39, OS_LOG_TYPE_DEFAULT, "References remove; error = %@", buf, 0xCu);
  }
  v41 = [(MCMCommand *)v2 resultPromise];
  [v41 completeWithResult:v34];
}

uint64_t __37__MCMCommandReferencesRemove_execute__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);

  return [v2 unionSet:a2];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToChangeReferences];

  return v4;
}

- (MCMCommandReferencesRemove)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandReferencesRemove;
  uint64_t v9 = [(MCMCommand *)&v15 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    v9->_containerClass = [v8 containerClass];
    uint64_t v10 = [v8 ownerIdentifiers];
    ownerIdentifiers = v9->_ownerIdentifiers;
    v9->_ownerIdentifiers = (NSSet *)v10;

    uint64_t v12 = [v8 groupIdentifiers];
    groupIdentifiers = v9->_groupIdentifiers;
    v9->_groupIdentifiers = (NSSet *)v12;

    v9->_deleteDuringReconciliation = [v8 deleteDuringReconciliation];
    v9->_yesReallyApplyToAll = [v8 yesReallyApplyToAll];
  }

  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 49;
}

@end