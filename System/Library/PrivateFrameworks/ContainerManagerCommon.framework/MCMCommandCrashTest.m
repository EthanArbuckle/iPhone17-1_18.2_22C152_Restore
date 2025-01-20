@interface MCMCommandCrashTest
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandCrashTest)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (unint64_t)crashCount;
- (unint64_t)setTestLocks;
- (void)execute;
@end

@implementation MCMCommandCrashTest

- (unint64_t)setTestLocks
{
  return self->_setTestLocks;
}

- (unint64_t)crashCount
{
  return self->_crashCount;
}

- (void)execute
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v63 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v3 = (const char *)container_codesign_copy_current_identifier();
  uint64_t v4 = objc_msgSend([NSString alloc], "initWithBytesNoCopy:length:encoding:deallocator:", v3, strnlen(v3, 0x400uLL), 4, &__block_literal_global_1244);
  v5 = [(MCMCommand *)self context];
  uint64_t v67 = 1;
  id v6 = containermanager_copy_global_configuration();
  uint64_t v7 = 12;
  int v8 = [v6 dispositionForContainerClass:12];

  if (v8 != 1)
  {
    id v9 = containermanager_copy_global_configuration();
    uint64_t v7 = 10;
    [v9 dispositionForContainerClass:10];
  }
  v10 = [(MCMCommand *)self context];
  v11 = [v10 globalConfiguration];
  v12 = [v11 staticConfig];
  uint64_t v13 = [v12 configForContainerClass:v7];

  v14 = [v5 userIdentityCache];
  v15 = [v14 userIdentityForPersonalPersona];
  uint64_t active_platform = dyld_get_active_platform();
  v17 = [(MCMCommand *)self context];
  v18 = [v17 userIdentityCache];
  v64 = (void *)v4;
  v62 = (void *)v13;
  v19 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v15 identifier:v4 containerConfig:v13 platform:active_platform userIdentityCache:v18 error:&v67];

  v20 = [v5 containerFactory];
  id v66 = 0;
  v21 = [v20 containerForContainerIdentity:v19 createIfNecessary:1 error:&v66];
  id v22 = v66;

  id v65 = v22;
  v23 = [v21 metadataWithError:&v65];
  id v24 = v65;

  if (!v23)
  {
    v26 = container_log_handle_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v64;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v24;
      _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "Failed to create or lookup lookup existing container for retry test: %@; error = %@",
        buf,
        0x16u);
    }
    goto LABEL_19;
  }
  v60 = v21;
  v61 = v19;
  if (![(MCMCommandCrashTest *)self crashCount])
  {
    v26 = 0;
    v31 = 0;
LABEL_14:
    v36 = objc_alloc_init(MCMResultPromise);
    v37 = [v23 containerIdentity];
    v68 = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    v39 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:v38 removeAllCodeSignInfo:0 context:v5 resultPromise:v36];

    [v39 execute];
    v40 = [(MCMResultPromise *)v36 result];
    v41 = [v40 error];

    if (v41)
    {
      v42 = container_log_handle_for_category();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v59 = [v23 containerPath];
        v58 = [v59 containerRootURL];
        v56 = [v58 path];
        v57 = [(MCMResultPromise *)v36 result];
        uint64_t v48 = [v57 error];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v56;
        __int16 v72 = 2112;
        uint64_t v73 = v48;
        v49 = (void *)v48;
        _os_log_error_impl(&dword_1D7739000, v42, OS_LOG_TYPE_ERROR, "Failed to delete retry container at [%@]; error = %@",
          buf,
          0x16u);
      }
      v43 = [(MCMResultPromise *)v36 result];
      uint64_t v44 = [v43 error];

      id v24 = (id)v44;
    }
    v21 = v60;
    v19 = v61;

LABEL_19:
    v45 = container_log_handle_for_category();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = 0;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v24;
      _os_log_impl(&dword_1D7739000, v45, OS_LOG_TYPE_DEFAULT, "Restart result: %llu, error = %@", buf, 0x16u);
    }

    v46 = [(MCMCommand *)self resultPromise];
    v47 = [[MCMResultBase alloc] initWithError:v24];
    [v46 completeWithResult:v47];

    return;
  }
  v25 = [v23 info];
  v26 = [v25 objectForKeyedSubscript:@"CrashCounter"];

  if (v26)
  {
    v27 = [v23 info];
    v28 = [v27 objectForKeyedSubscript:@"CrashCounter"];
    uint64_t v29 = [v28 unsignedIntValue];

    unint64_t v30 = v29 - 1;
  }
  else
  {
    unint64_t v30 = [(MCMCommandCrashTest *)self crashCount];
  }
  v32 = container_log_handle_for_category();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v30;
    _os_log_error_impl(&dword_1D7739000, v32, OS_LOG_TYPE_ERROR, "Restarts remaining in retry test: %llu", buf, 0xCu);
  }

  v33 = [MCMCommandSetInfoValue alloc];
  v34 = [NSNumber numberWithUnsignedLongLong:v30];
  v35 = [v23 containerIdentity];
  v31 = [(MCMCommandSetInfoValue *)v33 initWithKey:@"CrashCounter" value:v34 containerIdentity:v35 context:v5 resultPromise:0];

  [(MCMCommandSetInfoValue *)v31 execute];
  if (!v30) {
    goto LABEL_14;
  }
  if ([(MCMCommandCrashTest *)self setTestLocks])
  {
    v50 = +[MCMTestLocks sharedInstance];
    [v50 setEnabled:1];
    objc_msgSend(v50, "acquireLock:", -[MCMCommandCrashTest setTestLocks](self, "setTestLocks"));
  }
  [objc_alloc_init(MCMRuntimeState) persist];
  v51 = container_log_handle_for_category();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7739000, v51, OS_LOG_TYPE_DEFAULT, "Restarting", buf, 2u);
  }

  *(void *)buf = 1;
  if (sysctlbyname("kern.crash_behavior_test_mode", 0, 0, buf, 8uLL) < 0)
  {
    int v52 = *__error();
    v53 = container_log_handle_for_category();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v69 = 67109120;
      int v70 = v52;
      _os_log_error_impl(&dword_1D7739000, v53, OS_LOG_TYPE_ERROR, "Could not enable crash test mode, error = %{darwin.errno}d", v69, 8u);
    }
  }
  usleep(0x7A120u);
  int v54 = abort_with_reason();
  __30__MCMCommandCrashTest_execute__block_invoke(v54, v55);
}

uint64_t __30__MCMCommandCrashTest_execute__block_invoke(int a1, void *a2)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a2;
  if (a2)
  {
    free(a2);
    return memset_s(v3, 8uLL, 0, 8uLL);
  }
  return result;
}

- (BOOL)preflightClientAllowed
{
  id v3 = containermanager_copy_global_configuration();
  int v4 = [v3 isInternalImage];

  if (!v4) {
    return 0;
  }
  v5 = [(MCMCommand *)self context];
  id v6 = [v5 clientIdentity];
  char v7 = [v6 isAllowedToTest];

  return v7;
}

- (MCMCommandCrashTest)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMCommandCrashTest;
  id v9 = [(MCMCommand *)&v11 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    v9->_crashCount = [v8 crashCount];
    v9->_setTestLocks = [v8 setTestLocks];
  }

  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 25;
}

@end