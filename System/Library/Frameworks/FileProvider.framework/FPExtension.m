@interface FPExtension
@end

@implementation FPExtension

void __47__FPExtension_subsystem_beginUsing_withBundle___block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) bundleInfoDictionary];
  v2 = [v12 objectForKey:@"NSExtension"];
  v3 = (void *)[v2 mutableCopy];

  v4 = [v3 objectForKey:@"NSExtensionPrincipalClass"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B50] mainBundle];
    v8 = [v7 infoDictionary];
    id v6 = [v8 objectForKey:@"NSExtensionPrincipalClass"];
  }
  id v9 = v6;
  Class Class = objc_getClass((const char *)[v9 UTF8String]);
  if (!Class)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"FPExtension_subsystem.m", 25, @"NSExtensionPrincipalClass %@ could not be resolved to class!", v9 object file lineNumber description];
  }
  +[FPXPlugInKitExtensionContext setPrincipalClass:Class];
  [MEMORY[0x1E4F292B0] _startListening:1];
}

uint64_t __39__FPExtension_subsystem_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

@end