@interface MCMCommandDeletePluginDataContainerContent
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandDeletePluginDataContainerContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (void)execute;
@end

@implementation MCMCommandDeletePluginDataContainerContent

- (void).cxx_destruct
{
  p_containerIdentity = &self->_containerIdentity;

  objc_storeStrong((id *)p_containerIdentity, 0);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void)execute
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = [MCMCommandDeleteContainerContent alloc];
  v5 = [(MCMCommandDeletePluginDataContainerContent *)self containerIdentity];
  v6 = [(MCMCommand *)self context];
  v7 = [(MCMCommand *)self resultPromise];
  v8 = [(MCMCommandDeleteContainerContent *)v4 initWithContainerIdentity:v5 context:v6 resultPromise:v7];

  [(MCMCommandDeleteContainerContent *)v8 execute];
  v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(MCMCommand *)self resultPromise];
    v11 = [v10 result];
    v12 = [v11 error];
    int v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEFAULT, "Wipe plugin data container; error = %@",
      (uint8_t *)&v13,
      0xCu);
  }
}

- (BOOL)preflightClientAllowed
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(MCMCommand *)self context];
  v4 = [v3 clientIdentity];
  v5 = [(MCMCommandDeletePluginDataContainerContent *)self containerIdentity];
  v6 = [v5 identifier];
  int v7 = [v4 isAllowedToWipePlugInDataContainerWithIdentifier:v6];

  if (!v7) {
    return 0;
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
  }
  if (MCMRequirePersona_result)
  {
    v8 = [(MCMCommandDeletePluginDataContainerContent *)self containerIdentity];
    unint64_t v9 = [v8 containerClass];
    if (v9 <= 0xE && ((1 << v9) & 0x4ED4) != 0)
    {
      v10 = [(MCMCommandDeletePluginDataContainerContent *)self containerIdentity];
      v11 = [v10 userIdentity];
      int v12 = [v11 isNoSpecificPersona];

      if (v12)
      {
        int v13 = container_log_handle_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          uint64_t v15 = [(MCMCommand *)self context];
          v16 = [v15 clientIdentity];
          v17 = [v16 codeSignInfo];
          v18 = [v17 identifier];
          v19 = [(MCMCommandDeletePluginDataContainerContent *)self containerIdentity];
          uint64_t v20 = [v19 containerClass];
          v21 = [(MCMCommandDeletePluginDataContainerContent *)self containerIdentity];
          v22 = [v21 identifier];
          int v23 = 138543874;
          v24 = v18;
          __int16 v25 = 2048;
          uint64_t v26 = v20;
          __int16 v27 = 2114;
          v28 = v22;
          _os_log_fault_impl(&dword_1D7739000, v13, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona", (uint8_t *)&v23, 0x20u);
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

- (MCMCommandDeletePluginDataContainerContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MCMCommandDeletePluginDataContainerContent;
  v10 = [(MCMCommand *)&v34 initWithMessage:v8 context:v9 reply:a5];
  if (v10)
  {
    uint64_t v11 = [v8 containerIdentity];
    containerIdentity = v10->_containerIdentity;
    v10->_containerIdentity = (MCMContainerIdentity *)v11;

    int v13 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity userIdentity];
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
    }
    if (MCMRequirePersonaTelemetryOnly_result && [v13 isNoSpecificPersona])
    {
      p_super = container_log_handle_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        v32 = [(MCMCommand *)v10 context];
        v30 = [v32 clientIdentity];
        uint64_t v29 = [v30 codeSignInfo];
        uint64_t v15 = [v29 identifier];
        uint64_t v16 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity containerClass];
        v17 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity identifier];
        v18 = [v9 clientIdentity];
        *(_DWORD *)buf = 138544130;
        v36 = v15;
        __int16 v37 = 2048;
        uint64_t v38 = v16;
        __int16 v39 = 2114;
        v40 = v17;
        __int16 v41 = 2114;
        v42 = v18;
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
        v33 = [(MCMCommand *)v10 context];
        v31 = [v33 clientIdentity];
        __int16 v25 = [v31 codeSignInfo];
        uint64_t v26 = [v25 identifier];
        uint64_t v27 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity containerClass];
        v28 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity identifier];
        *(_DWORD *)buf = 138543874;
        v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = v27;
        __int16 v39 = 2114;
        v40 = v28;
        _os_log_fault_impl(&dword_1D7739000, v19, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);
      }
      uint64_t v20 = [v9 userIdentityCache];
      v21 = [v13 posixUser];
      uint64_t v22 = [v20 userIdentityForPersonalPersonaWithPOSIXUser:v21];

      uint64_t v23 = [(MCMContainerIdentity *)v10->_containerIdentity identityByChangingUserIdentity:v22];
      p_super = &v10->_containerIdentity->super.super;
      v10->_containerIdentity = (MCMContainerIdentity *)v23;
      int v13 = (void *)v22;
    }

LABEL_16:
  }

  return v10;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 11;
}

@end