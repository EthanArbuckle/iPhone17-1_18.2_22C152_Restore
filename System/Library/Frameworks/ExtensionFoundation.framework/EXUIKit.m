@interface EXUIKit
@end

@implementation EXUIKit

void __43__EXUIKit_Subsystem_beginUsing_withBundle___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    v2 = [*(id *)(a1 + 40) bundleInfoDictionary];
    [*(id *)(a1 + 32) setInfoDictionary:v2];

    v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"NSExtension"];
    v4 = (void *)[v3 mutableCopy];

    v5 = [v4 objectForKey:@"NSExtensionMainStoryboard"];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v4 objectForKey:@"NSExtensionMainStoryboard~ipad"];
    }
    v8 = v7;

    v9 = [v4 objectForKey:@"NSExtensionPrincipalClass"];
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v12 = [MEMORY[0x1E4F28B50] mainBundle];
      v13 = [v12 infoDictionary];
      v11 = [v13 objectForKey:@"NSExtensionPrincipalClass"];
    }
    if (v8) {
      goto LABEL_9;
    }
    Class v14 = NSClassFromString(v11);
    if (!v14)
    {
      v15 = _EXLegacyLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __43__EXUIKit_Subsystem_beginUsing_withBundle___block_invoke_cold_1(v15);
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(objc_class *)v14 _initializedByViewServices])
    {
LABEL_9:
      [NSClassFromString(&cfstr_Uiviewservices.isa) startViewServiceSessionManagerAsPlugin:1];
    }
    +[EXConcreteExtensionContextVendor _startListening];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
}

uint64_t __35__EXUIKit_Subsystem_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

void __43__EXUIKit_Subsystem_beginUsing_withBundle___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_191F29000, log, OS_LOG_TYPE_FAULT, "NSExtensionPrincipalClass could not be resolved to class!", v1, 2u);
}

@end