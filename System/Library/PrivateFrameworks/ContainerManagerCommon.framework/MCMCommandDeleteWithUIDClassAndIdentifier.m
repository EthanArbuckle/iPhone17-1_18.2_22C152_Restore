@interface MCMCommandDeleteWithUIDClassAndIdentifier
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandDeleteWithUIDClassAndIdentifier)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMCommandOperationDelete)deleteCommand;
- (MCMContainerIdentity)containerIdentity;
- (void)execute;
@end

@implementation MCMCommandDeleteWithUIDClassAndIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteCommand, 0);

  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

- (MCMCommandOperationDelete)deleteCommand
{
  return self->_deleteCommand;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void)execute
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = [(MCMCommandDeleteWithUIDClassAndIdentifier *)self deleteCommand];
  [v4 execute];

  v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(MCMCommand *)self resultPromise];
    v7 = [v6 result];
    v8 = [v7 error];
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Delete with uid_t, container_class_t, and identifier result; error = %@",
      (uint8_t *)&v9,
      0xCu);
  }
}

- (BOOL)preflightClientAllowed
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(MCMCommandDeleteWithUIDClassAndIdentifier *)self deleteCommand];
  int v4 = [v3 preflightClientAllowed];

  if (!v4) {
    return 0;
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
  }
  if (MCMRequirePersona_result)
  {
    v5 = [(MCMCommandDeleteWithUIDClassAndIdentifier *)self containerIdentity];
    unint64_t v6 = [v5 containerClass];
    if (v6 <= 0xE && ((1 << v6) & 0x4ED4) != 0)
    {
      v7 = [(MCMCommandDeleteWithUIDClassAndIdentifier *)self containerIdentity];
      v8 = [v7 userIdentity];
      int v9 = [v8 isNoSpecificPersona];

      if (v9)
      {
        v10 = container_log_handle_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [(MCMCommand *)self context];
          v12 = [v11 clientIdentity];
          v13 = [v12 codeSignInfo];
          v14 = [v13 identifier];
          v15 = [(MCMCommandDeleteWithUIDClassAndIdentifier *)self containerIdentity];
          uint64_t v16 = [v15 containerClass];
          v17 = [(MCMCommandDeleteWithUIDClassAndIdentifier *)self containerIdentity];
          v18 = [v17 identifier];
          int v20 = 138543874;
          v21 = v14;
          __int16 v22 = 2048;
          uint64_t v23 = v16;
          __int16 v24 = 2114;
          v25 = v18;
          _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEFAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona", (uint8_t *)&v20, 0x20u);
        }
        if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
          dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
        }
        if (!MCMRequirePersonaTelemetryOnly_result) {
          return 0;
        }
      }
    }
    else
    {
    }
  }
  return 1;
}

- (MCMCommandDeleteWithUIDClassAndIdentifier)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)MCMCommandDeleteWithUIDClassAndIdentifier;
  v10 = [(MCMCommand *)&v39 initWithMessage:v8 context:v9 reply:a5];
  if (v10)
  {
    uint64_t v11 = [v8 containerIdentity];
    containerIdentity = v10->_containerIdentity;
    v10->_containerIdentity = (MCMContainerIdentity *)v11;

    v13 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity userIdentity];
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
    }
    if (MCMRequirePersonaTelemetryOnly_result && [v13 isNoSpecificPersona])
    {
      p_super = container_log_handle_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        v37 = [(MCMCommand *)v10 context];
        v35 = [v37 clientIdentity];
        v34 = [v35 codeSignInfo];
        v15 = [v34 identifier];
        uint64_t v16 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity containerClass];
        v17 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity identifier];
        v18 = [v9 clientIdentity];
        *(_DWORD *)buf = 138544130;
        v42 = v15;
        __int16 v43 = 2048;
        uint64_t v44 = v16;
        __int16 v45 = 2114;
        v46 = v17;
        __int16 v47 = 2114;
        v48 = v18;
        _os_log_fault_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);
      }
    }
    else
    {
      if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
        dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_18);
      }
      if (!MCMRequirePersonaAndConvertSystemToPersonal_result
        || ![v13 isNoSpecificPersona])
      {
        goto LABEL_16;
      }
      v19 = container_log_handle_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v38 = [(MCMCommand *)v10 context];
        v36 = [v38 clientIdentity];
        v30 = [v36 codeSignInfo];
        v31 = [v30 identifier];
        uint64_t v32 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity containerClass];
        v33 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity identifier];
        *(_DWORD *)buf = 138543874;
        v42 = v31;
        __int16 v43 = 2048;
        uint64_t v44 = v32;
        __int16 v45 = 2114;
        v46 = v33;
        _os_log_fault_impl(&dword_1D7739000, v19, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);
      }
      int v20 = [v9 userIdentityCache];
      v21 = [v13 posixUser];
      uint64_t v22 = [v20 userIdentityForPersonalPersonaWithPOSIXUser:v21];

      uint64_t v23 = [(MCMContainerIdentity *)v10->_containerIdentity identityByChangingUserIdentity:v22];
      p_super = &v10->_containerIdentity->super.super;
      v10->_containerIdentity = (MCMContainerIdentity *)v23;
      v13 = (void *)v22;
    }

LABEL_16:
    v40 = v10->_containerIdentity;
    __int16 v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    v25 = [(MCMCommand *)v10 context];
    uint64_t v26 = [(MCMCommand *)v10 resultPromise];
    uint64_t v27 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:v24 removeAllCodeSignInfo:0 context:v25 resultPromise:v26];
    deleteCommand = v10->_deleteCommand;
    v10->_deleteCommand = (MCMCommandOperationDelete *)v27;
  }
  return v10;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 10;
}

@end