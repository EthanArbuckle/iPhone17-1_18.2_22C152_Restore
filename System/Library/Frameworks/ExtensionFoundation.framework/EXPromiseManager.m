@interface EXPromiseManager
@end

@implementation EXPromiseManager

uint64_t __35___EXPromiseManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

void __73___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_error___block_invoke(uint64_t a1, void *a2)
{
}

void __73___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_error___block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t __78___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.extensionKit.errorDomain" code:9 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
}

@end