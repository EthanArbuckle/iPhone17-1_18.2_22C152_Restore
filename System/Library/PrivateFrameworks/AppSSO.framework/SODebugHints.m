@interface SODebugHints
+ (id)sharedInstance;
- (SODebugHints)debugHintsWithCompletion:(id)a3;
@end

@implementation SODebugHints

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __30__SODebugHints_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(SODebugHints);
  return MEMORY[0x270F9A758]();
}

- (SODebugHints)debugHintsWithCompletion:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void, id))a3;
  if (SO_LOG_SODebugConfiguration_once != -1) {
    dispatch_once(&SO_LOG_SODebugConfiguration_once, &__block_literal_global_48);
  }
  v5 = SO_LOG_SODebugConfiguration_log;
  if (os_log_type_enabled((os_log_t)SO_LOG_SODebugConfiguration_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[SODebugHints debugHintsWithCompletion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }
  if (v4)
  {
    if ([getSOUtilsClass() isInternalBuild])
    {
      v6 = +[SOConfigurationHost defaultManager];
      id v32 = 0;
      v7 = [v6 configurationForClientWithError:&v32];
      id v8 = v32;

      if (v8)
      {
        v4[2](v4, 0, v8);
      }
      else
      {
        id SOUtilsClass = getSOUtilsClass();
        v12 = +[SOExtensionManager sharedInstance];
        v13 = [v12 loadedExtensions];
        v31 = [SOUtilsClass mapArray:v13 usingBlock:&__block_literal_global_27];

        v14 = +[SOConfigurationHost defaultManager];
        v15 = [v14 realms];

        v37[0] = @"Configuration";
        uint64_t v16 = [v7 description];
        v17 = (void *)v16;
        if (v16) {
          v18 = (__CFString *)v16;
        }
        else {
          v18 = @"(null)";
        }
        v19 = v31;
        if (!v31) {
          v19 = @"(null)";
        }
        v38[0] = v18;
        v38[1] = v19;
        v37[1] = @"Plugins";
        v37[2] = @"Realms";
        if (v15) {
          v20 = v15;
        }
        else {
          v20 = @"(null)";
        }
        v38[2] = v20;
        v37[3] = @"Signature Validated";
        if (+[SOPreferences isExtensionSignatureValidated])
        {
          v21 = @"YES";
        }
        else
        {
          v21 = @"NO";
        }
        v38[3] = v21;
        v37[4] = @"Associated Domains Validated";
        if (+[SOPreferences isAssociatedDomainValidated]) {
          v22 = @"YES";
        }
        else {
          v22 = @"NO";
        }
        v38[4] = v22;
        v37[5] = @"Requests";
        uint64_t v23 = +[SORequestQueue debugDescription];
        v24 = (void *)v23;
        if (v23) {
          v25 = (__CFString *)v23;
        }
        else {
          v25 = @"(null)";
        }
        v38[5] = v25;
        v37[6] = @"Config Version";
        v26 = NSString;
        v27 = +[SOConfigurationHost defaultManager];
        v28 = objc_msgSend(v26, "stringWithFormat:", @"0x%016llX", objc_msgSend(v27, "configVersion"));
        v38[6] = v28;
        v29 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:7];

        ((void (**)(id, void *, id))v4)[2](v4, v29, 0);
      }
    }
    else
    {
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2050000000;
      v9 = (void *)getSOErrorHelperClass_softClass_3;
      uint64_t v36 = getSOErrorHelperClass_softClass_3;
      if (!getSOErrorHelperClass_softClass_3)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getSOErrorHelperClass_block_invoke_3;
        v40 = &unk_26432A2A8;
        v41 = &v33;
        __getSOErrorHelperClass_block_invoke_3((uint64_t)buf);
        v9 = (void *)v34[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v33, 8);
      id v8 = [v10 internalErrorWithMessage:@"not internal build"];
      v4[2](v4, 0, v8);
    }
  }
  return result;
}

uint64_t __41__SODebugHints_debugHintsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

@end