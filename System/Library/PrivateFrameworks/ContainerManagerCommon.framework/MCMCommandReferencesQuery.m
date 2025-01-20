@interface MCMCommandReferencesQuery
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)createDuringReconciliation;
- (BOOL)deleteDuringReconciliation;
- (BOOL)preflightClientAllowed;
- (BOOL)yesReallyApplyToAll;
- (MCMCommandReferencesQuery)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMUserIdentity)userIdentity;
- (NSSet)groupIdentifiers;
- (NSSet)ownerIdentifiers;
- (unint64_t)containerClass;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)uid;
- (void)execute;
@end

@implementation MCMCommandReferencesQuery

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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = objc_alloc_init(MCMResultWithOwnersAndGroupsBase);
  v5 = [(MCMCommandReferencesQuery *)self ownerIdentifiers];
  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [(MCMCommandReferencesQuery *)self groupIdentifiers];
    BOOL v6 = v7 == 0;
  }
  v8 = (void *)gCodeSigningMapping;
  unint64_t v9 = [(MCMCommandReferencesQuery *)self containerClass];
  id v27 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __36__MCMCommandReferencesQuery_execute__block_invoke;
  v23 = &unk_1E6A7FEC8;
  BOOL v26 = v6;
  v24 = self;
  v10 = v4;
  v25 = v10;
  LOBYTE(v9) = [v8 enumerateOwnersAndGroupsWithGroupClass:v9 error:&v27 block:&v20];
  id v11 = v27;
  if ((v9 & 1) == 0)
  {
    v12 = [MCMResultWithOwnersAndGroupsBase alloc];
    uint64_t v13 = -[MCMResultBase initWithError:](v12, "initWithError:", v11, v20, v21, v22, v23, v24);

    v10 = (MCMResultWithOwnersAndGroupsBase *)v13;
  }
  v14 = container_log_handle_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(MCMResultWithOwnersAndGroupsBase *)v10 ownerIdentifiers];
    uint64_t v16 = [v15 count];
    v17 = [(MCMResultWithOwnersAndGroupsBase *)v10 groupIdentifiers];
    uint64_t v18 = [v17 count];
    *(_DWORD *)buf = 134218498;
    uint64_t v29 = v16;
    __int16 v30 = 2048;
    uint64_t v31 = v18;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_1D7739000, v14, OS_LOG_TYPE_DEFAULT, "References query; owners count = %lu, groups count = %lu, error = %@",
      buf,
      0x20u);
  }
  v19 = [(MCMCommand *)self resultPromise];
  [v19 completeWithResult:v10];
}

uint64_t __36__MCMCommandReferencesQuery_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (*(unsigned char *)(a1 + 48)) {
    goto LABEL_2;
  }
  unint64_t v9 = [*(id *)(a1 + 32) ownerIdentifiers];
  if (v9)
  {
    v3 = [*(id *)(a1 + 32) ownerIdentifiers];
    if ([v3 containsObject:v6])
    {

LABEL_2:
      [*(id *)(a1 + 40) addOwner:v6 group:v7];
      goto LABEL_3;
    }
  }
  uint64_t v10 = [*(id *)(a1 + 32) groupIdentifiers];
  if (v10)
  {
    id v11 = (void *)v10;
    v12 = [*(id *)(a1 + 32) groupIdentifiers];
    int v13 = [v12 containsObject:v7];

    if (v9)
    {

      if ((v13 & 1) == 0) {
        goto LABEL_3;
      }
    }
    else if (!v13)
    {
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  if (v9)
  {
  }
LABEL_3:

  return 1;
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToReadReferences];

  return v4;
}

- (MCMCommandReferencesQuery)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandReferencesQuery;
  unint64_t v9 = [(MCMCommand *)&v15 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    v9->_containerClass = [v8 containerClass];
    uint64_t v10 = [v8 ownerIdentifiers];
    ownerIdentifiers = v9->_ownerIdentifiers;
    v9->_ownerIdentifiers = (NSSet *)v10;

    uint64_t v12 = [v8 groupIdentifiers];
    groupIdentifiers = v9->_groupIdentifiers;
    v9->_groupIdentifiers = (NSSet *)v12;

    v9->_uid = [v8 uid];
  }

  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 47;
}

@end