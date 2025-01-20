@interface DASSystemContext
@end

@implementation DASSystemContext

uint64_t __35___DASSystemContext_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

void __41___DASSystemContext_defaultPathEvaluator__block_invoke()
{
  if (!defaultPathEvaluator_defaultPathEvaluator)
  {
    defaultPathEvaluator_defaultPathEvaluator = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
    MEMORY[0x1F41817F8]();
  }
}

void __52___DASSystemContext_defaultInexpensivePathEvaluator__block_invoke()
{
  if (!defaultInexpensivePathEvaluator_defaultInexpensivePathEvaluator)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F38C10]);
    [v2 setProhibitExpensivePaths:1];
    uint64_t v0 = [objc_alloc(MEMORY[0x1E4F38C20]) initWithEndpoint:0 parameters:v2];
    v1 = (void *)defaultInexpensivePathEvaluator_defaultInexpensivePathEvaluator;
    defaultInexpensivePathEvaluator_defaultInexpensivePathEvaluator = v0;
  }
}

BOOL __95___DASSystemContext_addNotificationHandlerForTaskName_withPriority_withParameters_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 56));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = objc_loadWeakRetained(&to);
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, [v6 allowsDiscretionaryWorkForTask:*(void *)(a1 + 32) withPriority:*(void *)(a1 + 64) withParameters:*(void *)(a1 + 40)]);
  }
  objc_destroyWeak(&to);

  return v4 != 0;
}

@end