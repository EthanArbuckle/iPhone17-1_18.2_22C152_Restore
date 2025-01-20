@interface HFItemManagerDebugStateDumpController
@end

@implementation HFItemManagerDebugStateDumpController

uint64_t __56___HFItemManagerDebugStateDumpController_sharedInstance__block_invoke_2()
{
  qword_26AB2EC28 = objc_alloc_init(_HFItemManagerDebugStateDumpController);
  return MEMORY[0x270F9A758]();
}

id __46___HFItemManagerDebugStateDumpController_init__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _performStateDump];
  v2 = v1;
  if (!v1) {
    v1 = (void *)MEMORY[0x263EFFA78];
  }
  id v3 = v1;

  return v3;
}

id __59___HFItemManagerDebugStateDumpController__performStateDump__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFStateDumpBuilderContext contextWithDetailLevel:2];
  v4 = objc_msgSend(v2, "hf_stateDumpBuilderWithContext:", v3);
  v5 = [v4 buildPropertyListRepresentation];

  return v5;
}

@end