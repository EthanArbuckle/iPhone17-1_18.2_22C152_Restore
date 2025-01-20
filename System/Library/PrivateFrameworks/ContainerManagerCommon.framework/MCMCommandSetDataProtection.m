@interface MCMCommandSetDataProtection
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)_updateMetadataForContainerIdentity:(id)a3 dataProtectionClass:(int)a4 error:(id *)a5;
- (BOOL)isThirdParty;
- (BOOL)preflightClientAllowed;
- (BOOL)retryIfLocked;
- (BOOL)skipIfUnchanged;
- (MCMCommandSetDataProtection)initWithContainerIdentity:(id)a3 thirdParty:(BOOL)a4 dataProtectionClass:(int)a5 retryIfLocked:(BOOL)a6 skipIfUnchanged:(BOOL)a7 context:(id)a8 resultPromise:(id)a9;
- (MCMCommandSetDataProtection)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (int)dataProtectionClass;
- (void)execute;
@end

@implementation MCMCommandSetDataProtection

- (void).cxx_destruct
{
  p_containerIdentity = &self->_containerIdentity;

  objc_storeStrong((id *)p_containerIdentity, 0);
}

- (BOOL)skipIfUnchanged
{
  return self->_skipIfUnchanged;
}

- (BOOL)retryIfLocked
{
  return self->_retryIfLocked;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (BOOL)isThirdParty
{
  return self->_thirdParty;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (BOOL)_updateMetadataForContainerIdentity:(id)a3 dataProtectionClass:(int)a4 error:(id *)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [(MCMCommand *)self context];
  v9 = [v8 containerCache];
  id v33 = 0;
  v10 = [v9 entryForContainerIdentity:v7 error:&v33];

  id v11 = v33;
  if (!v10)
  {
    v12 = 0;
    v14 = 0;
    BOOL v20 = 0;
    goto LABEL_17;
  }
  id v32 = v11;
  v12 = [v10 metadataWithError:&v32];
  id v13 = v32;

  if (!v12)
  {
    v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = [v10 identifier];
      v24 = [v10 containerPath];
      uint64_t v25 = [v24 containerClass];
      *(_DWORD *)buf = 138412802;
      v35 = v23;
      __int16 v36 = 2048;
      uint64_t v37 = v25;
      __int16 v38 = 2112;
      id v39 = v13;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Could not fetch metadata after data protection change on [%@(%llu)]: %@", buf, 0x20u);
    }
    v12 = 0;
    v14 = 0;
    goto LABEL_16;
  }
  v14 = [v12 metadataByChangingDataProtectionClass:v5];
  id v31 = v13;
  char v15 = [v14 writeMetadataToDiskWithError:&v31];
  id v16 = v31;

  if ((v15 & 1) == 0)
  {
    v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v26 = [v12 identifier];
      uint64_t v27 = [v12 containerClass];
      *(_DWORD *)buf = 138412802;
      v35 = v26;
      __int16 v36 = 2048;
      uint64_t v37 = v27;
      __int16 v38 = 2112;
      id v39 = v16;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Could not save metadata after data protection change on [%@(%llu)]: %@", buf, 0x20u);
    }
    id v13 = v16;
    goto LABEL_16;
  }
  v17 = [(MCMCommand *)self context];
  v18 = [v17 containerCache];
  id v30 = v16;
  uint64_t v19 = [v18 addContainerMetadata:v14 error:&v30];
  id v11 = v30;

  if (!v19)
  {
    v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v28 = [v14 identifier];
      uint64_t v29 = [v14 containerClass];
      *(_DWORD *)buf = 138412802;
      v35 = v28;
      __int16 v36 = 2048;
      uint64_t v37 = v29;
      __int16 v38 = 2112;
      id v39 = v11;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Could not update metadata in cache after data protection change on [%@(%llu)]: %@", buf, 0x20u);
    }
    v10 = 0;
    id v13 = v11;
LABEL_16:

    BOOL v20 = 0;
    id v11 = v13;
    goto LABEL_17;
  }
  BOOL v20 = 1;
  v10 = (void *)v19;
LABEL_17:

  return v20;
}

- (void)execute
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = [(MCMCommandSetDataProtection *)self containerIdentity];
  uint64_t v5 = [(MCMCommand *)self resultPromise];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __38__MCMCommandSetDataProtection_execute__block_invoke;
  v43[3] = &unk_1E6A80398;
  v43[4] = self;
  id v6 = v4;
  id v44 = v6;
  id v7 = v5;
  id v45 = v7;
  v34 = (void *)MEMORY[0x1D9479020](v43);
  unint64_t v8 = [v6 containerClass];
  if (v8 > 0xB || ((1 << v8) & 0xED4) == 0 || (uint64_t v9 = [v6 containerClass], v9 == 13) || v9 == 7)
  {
    v10 = [[MCMError alloc] initWithErrorType:11 category:3];
    id v11 = [[MCMResultBase alloc] initWithError:v10];
    v12 = 0;
LABEL_6:
    id v13 = 0;
    id v14 = 0;
    goto LABEL_7;
  }
  v17 = [(MCMCommand *)self context];
  v18 = [v17 containerCache];
  id v42 = 0;
  v12 = [v18 entryForContainerIdentity:v6 error:&v42];
  v10 = (MCMError *)v42;

  if (!v12)
  {
    id v11 = [[MCMResultBase alloc] initWithError:v10];
    goto LABEL_6;
  }
  v41 = v10;
  id v14 = [v12 metadataWithError:&v41];
  uint64_t v19 = v41;

  if (!v14)
  {
    id v11 = [[MCMResultBase alloc] initWithError:v19];
    id v13 = 0;
    goto LABEL_19;
  }
  BOOL v20 = objc_msgSend(NSNumber, "numberWithInt:", -[MCMCommandSetDataProtection dataProtectionClass](self, "dataProtectionClass"));
  id v13 = [v14 metadataBySettingInfoValue:v20 forKey:@"com.apple.MobileInstallation.ContentProtectionClass"];

  if ([(MCMCommandSetDataProtection *)self skipIfUnchanged] && v13 == v14)
  {
    id v11 = 0;
    id v13 = v14;
LABEL_19:
    v10 = v19;
    goto LABEL_7;
  }
  uint64_t v40 = v19;
  char v21 = [v13 writeMetadataToDiskWithError:&v40];
  v10 = v40;

  if (v21)
  {
    id v32 = [(MCMCommand *)self context];
    v22 = [v32 containerCache];
    id v39 = v10;
    uint64_t v23 = [v22 addContainerMetadata:v13 error:&v39];
    id v33 = v39;

    v24 = (void *)v23;
    if (!v23)
    {
      uint64_t v25 = container_log_handle_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v30 = [v13 identifier];
        uint64_t v31 = [v13 containerClass];
        *(_DWORD *)buf = 138412802;
        v47 = v30;
        __int16 v48 = 2048;
        uint64_t v49 = v31;
        __int16 v50 = 2112;
        v51 = v33;
        _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Could not update metadata in cache when asked to change data protection on [%@(%llu)]: %@", buf, 0x20u);
      }
    }
    v26 = MCMDataProtectionQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__MCMCommandSetDataProtection_execute__block_invoke_8;
    block[3] = &unk_1E6A803C0;
    id v13 = v13;
    id v36 = v13;
    uint64_t v37 = self;
    id v38 = v34;
    dispatch_async(v26, block);

    id v11 = 0;
    v12 = v24;
    v10 = v33;
  }
  else
  {
    uint64_t v27 = container_log_handle_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = [v13 identifier];
      uint64_t v29 = [v13 containerClass];
      *(_DWORD *)buf = 138412802;
      v47 = v28;
      __int16 v48 = 2048;
      uint64_t v49 = v29;
      __int16 v50 = 2112;
      v51 = v10;
      _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, "Could not save metadata when asked to change data protection on [%@(%llu)]: %@", buf, 0x20u);
    }
    id v11 = [[MCMResultBase alloc] initWithError:v10];
  }
LABEL_7:
  char v15 = container_log_handle_for_category();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v10;
    _os_log_impl(&dword_1D7739000, v15, OS_LOG_TYPE_DEFAULT, "Set data protection (start); error = %@", buf, 0xCu);
  }

  if (v11)
  {
    id v16 = [(MCMCommand *)self resultPromise];
    [v16 completeWithResult:v11];
  }
}

void __38__MCMCommandSetDataProtection_execute__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__11440;
  char v15 = __Block_byref_object_dispose__11441;
  id v16 = [[MCMError alloc] initWithErrorType:a2];
  if (!v12[5])
  {
    v3 = MCMSharedFastWorkloop();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__MCMCommandSetDataProtection_execute__block_invoke_4;
    v8[3] = &unk_1E6A806E0;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v4;
    v10 = &v11;
    dispatch_async_and_wait(v3, v8);
  }
  uint64_t v5 = [MCMResultBase alloc];
  id v6 = [(MCMResultBase *)v5 initWithError:v12[5]];
  [*(id *)(a1 + 48) completeWithResult:v6];
  id v7 = [*(id *)(a1 + 32) reply];
  [v7 send];

  _Block_object_dispose(&v11, 8);
}

void __38__MCMCommandSetDataProtection_execute__block_invoke_8(uint64_t a1)
{
  id v2 = +[MCMDataProtectionManager defaultManager];
  objc_msgSend(v2, "setDataProtectionOnDataContainerForMetadata:isSecondOrThirdPartyApp:retryIfLocked:deferUntilNextLaunch:withCompletion:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "isThirdParty"), objc_msgSend(*(id *)(a1 + 40), "retryIfLocked"), 0, *(void *)(a1 + 48));
}

void __38__MCMCommandSetDataProtection_execute__block_invoke_4(void *a1)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = [v2 dataProtectionClass];
  uint64_t v5 = *(void *)(a1[6] + 8);
  obj[0] = *(id *)(v5 + 40);
  [v2 _updateMetadataForContainerIdentity:v3 dataProtectionClass:v4 error:obj];
  objc_storeStrong((id *)(v5 + 40), obj[0]);
}

- (BOOL)preflightClientAllowed
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCMCommand *)self context];
  uint64_t v4 = [v3 clientIdentity];
  int v5 = [v4 isAllowedToSetDataProtection];

  if (!v5) {
    return 0;
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
  }
  if (MCMRequirePersona_result)
  {
    id v6 = [(MCMCommandSetDataProtection *)self containerIdentity];
    unint64_t v7 = [v6 containerClass];
    if (v7 <= 0xE && ((1 << v7) & 0x4ED4) != 0)
    {
      unint64_t v8 = [(MCMCommandSetDataProtection *)self containerIdentity];
      id v9 = [v8 userIdentity];
      int v10 = [v9 isNoSpecificPersona];

      if (v10)
      {
        uint64_t v11 = container_log_handle_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          uint64_t v13 = [(MCMCommand *)self context];
          id v14 = [v13 clientIdentity];
          char v15 = [v14 codeSignInfo];
          id v16 = [v15 identifier];
          uint64_t v17 = [(MCMCommandSetDataProtection *)self containerIdentity];
          uint64_t v18 = [v17 containerClass];
          uint64_t v19 = [(MCMCommandSetDataProtection *)self containerIdentity];
          BOOL v20 = [v19 identifier];
          int v21 = 138543874;
          v22 = v16;
          __int16 v23 = 2048;
          uint64_t v24 = v18;
          __int16 v25 = 2114;
          v26 = v20;
          _os_log_fault_impl(&dword_1D7739000, v11, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona", (uint8_t *)&v21, 0x20u);
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

- (MCMCommandSetDataProtection)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MCMCommandSetDataProtection;
  int v10 = [(MCMCommand *)&v34 initWithMessage:v8 context:v9 reply:a5];
  if (v10)
  {
    uint64_t v11 = [v8 containerIdentity];
    containerIdentity = v10->_containerIdentity;
    v10->_containerIdentity = (MCMContainerIdentity *)v11;

    uint64_t v13 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity userIdentity];
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
    }
    if (MCMRequirePersonaTelemetryOnly_result && [v13 isNoSpecificPersona])
    {
      p_super = container_log_handle_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        id v32 = [(MCMCommand *)v10 context];
        id v30 = [v32 clientIdentity];
        uint64_t v29 = [v30 codeSignInfo];
        char v15 = [v29 identifier];
        uint64_t v16 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity containerClass];
        uint64_t v17 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity identifier];
        uint64_t v18 = [v9 clientIdentity];
        *(_DWORD *)buf = 138544130;
        id v36 = v15;
        __int16 v37 = 2048;
        uint64_t v38 = v16;
        __int16 v39 = 2114;
        uint64_t v40 = v17;
        __int16 v41 = 2114;
        id v42 = v18;
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
      uint64_t v19 = container_log_handle_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        id v33 = [(MCMCommand *)v10 context];
        uint64_t v31 = [v33 clientIdentity];
        __int16 v25 = [v31 codeSignInfo];
        v26 = [v25 identifier];
        uint64_t v27 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity containerClass];
        v28 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity identifier];
        *(_DWORD *)buf = 138543874;
        id v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = v27;
        __int16 v39 = 2114;
        uint64_t v40 = v28;
        _os_log_fault_impl(&dword_1D7739000, v19, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);
      }
      BOOL v20 = [v9 userIdentityCache];
      int v21 = [v13 posixUser];
      uint64_t v22 = [v20 userIdentityForPersonalPersonaWithPOSIXUser:v21];

      uint64_t v23 = [(MCMContainerIdentity *)v10->_containerIdentity identityByChangingUserIdentity:v22];
      p_super = &v10->_containerIdentity->super.super;
      v10->_containerIdentity = (MCMContainerIdentity *)v23;
      uint64_t v13 = (void *)v22;
    }

LABEL_16:
    v10->_thirdParty = [v8 isThirdParty];
    v10->_dataProtectionClass = [v8 dataProtectionClass];
    v10->_retryIfLocked = [v8 retryIfLocked];
    v10->_skipIfUnchanged = 0;
  }
  return v10;
}

- (MCMCommandSetDataProtection)initWithContainerIdentity:(id)a3 thirdParty:(BOOL)a4 dataProtectionClass:(int)a5 retryIfLocked:(BOOL)a6 skipIfUnchanged:(BOOL)a7 context:(id)a8 resultPromise:(id)a9
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MCMCommandSetDataProtection;
  uint64_t v17 = [(MCMCommand *)&v20 initWithContext:a8 resultPromise:a9];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_containerIdentity, a3);
    v18->_thirdParty = a4;
    v18->_dataProtectionClass = a5;
    v18->_retryIfLocked = a6;
    v18->_skipIfUnchanged = a7;
  }

  return v18;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 21;
}

@end