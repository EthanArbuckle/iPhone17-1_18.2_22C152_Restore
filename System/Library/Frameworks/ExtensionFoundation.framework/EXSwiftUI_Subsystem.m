@interface EXSwiftUI_Subsystem
+ (BOOL)initialized;
+ (id)initForPlugInKit;
+ (id)sharedInstance;
- (EXSwiftUI_Subsystem)init;
- (void)beginUsing:(id)a3 withBundle:(id)a4;
- (void)init;
@end

@implementation EXSwiftUI_Subsystem

+ (BOOL)initialized
{
  return __instance != 0;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EXSwiftUI_Subsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  v2 = (void *)__instance;

  return v2;
}

+ (id)initForPlugInKit
{
  return +[EXSwiftUI_Subsystem sharedInstance];
}

- (EXSwiftUI_Subsystem)init
{
  v19.receiver = self;
  v19.super_class = (Class)EXSwiftUI_Subsystem;
  v2 = [(EXSwiftUI_Subsystem *)&v19 init];
  if (!v2) {
    return v2;
  }
  v3 = _EXLegacyLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(EXSwiftUI_Subsystem *)(uint64_t)v2 init];
  }

  unint64_t size = 0;
  prog_image_header = (const mach_header_64 *)_dyld_get_prog_image_header();
  if (!prog_image_header)
  {
    v8 = _EXLegacyLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[EXSwiftUI_Subsystem init].cold.7();
    }

    goto LABEL_13;
  }
  v5 = getsectiondata(prog_image_header, "__TEXT", "__swift5_entry", &size);
  if (!v5 || size <= 3)
  {
LABEL_13:
    v9 = _EXLegacyLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __41___EXRunningExtension_entryPointFunction__block_invoke_cold_2();
    }

    goto LABEL_16;
  }
  uint64_t v6 = *(int *)v5;
  if (v6)
  {
    v7 = &v5[v6];
    if (&v5[v6]) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
LABEL_16:
  v10 = _EXLegacyLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __41___EXRunningExtension_entryPointFunction__block_invoke_cold_1();
  }

LABEL_19:
  v11 = _EXLegacyLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[EXSwiftUI_Subsystem init].cold.4();
  }

  v7 = (uint8_t *)dlsym((void *)0xFFFFFFFFFFFFFFFBLL, "main");
  if (!v7)
  {
    v17 = _EXLegacyLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[EXSwiftUI_Subsystem init]();
    }
    goto LABEL_34;
  }
LABEL_22:
  v12 = _EXLegacyLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    [(EXSwiftUI_Subsystem *)(uint64_t)v7 init];
  }

  v13 = _NSGetArgc();
  v14 = _NSGetArgv();
  if (v13)
  {
    uint64_t v15 = *v13;
    if (v14)
    {
LABEL_26:
      v16 = *v14;
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (v14) {
      goto LABEL_26;
    }
  }
  v16 = 0;
LABEL_31:
  if (((unsigned int (*)(uint64_t, char **))v7)(v15, v16) == 1)
  {
    v17 = _EXLegacyLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[EXSwiftUI_Subsystem init]();
    }
LABEL_34:
  }
  return v2;
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _EXLegacyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138543874;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_debug_impl(&dword_191F29000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ - Begin using bunde %@ with personality: %@ personality.", (uint8_t *)&v9, 0x20u);
  }

  +[EXConcreteExtensionContextVendor _startListening];
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_191F29000, a2, OS_LOG_TYPE_DEBUG, "Initializing %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end