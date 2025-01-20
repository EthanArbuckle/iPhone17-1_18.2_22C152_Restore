@interface AXUIReachabilityHelper
+ (id)sharedHelper;
- (double)reachabilityOffsetForPayload:(id)a3;
- (void)animateForReachability:(id)a3 payload:(id)a4 completion:(id)a5;
@end

@implementation AXUIReachabilityHelper

+ (id)sharedHelper
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AXUIReachabilityHelper_sharedHelper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHelper_onceToken != -1) {
    dispatch_once(&sharedHelper_onceToken, block);
  }
  v2 = (void *)sharedHelper_SharedHelper;
  return v2;
}

uint64_t __38__AXUIReachabilityHelper_sharedHelper__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedHelper_SharedHelper;
  sharedHelper_SharedHelper = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (double)reachabilityOffsetForPayload:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"offset"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)animateForReachability:(id)a3 payload:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4FB1EB0];
  v12 = [[AXUIReachabilityAnimationBehaviorSettings alloc] initWithPayload:v9];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__AXUIReachabilityHelper_animateForReachability_payload_completion___block_invoke;
  v18[3] = &unk_1E649C988;
  v18[4] = self;
  id v19 = v9;
  id v20 = v8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__AXUIReachabilityHelper_animateForReachability_payload_completion___block_invoke_2;
  v16[3] = &unk_1E649C9B0;
  id v17 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  [v11 _animateUsingSpringBehavior:v12 tracking:0 animations:v18 completion:v16];
}

uint64_t __68__AXUIReachabilityHelper_animateForReachability_payload_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reachabilityOffsetForPayload:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __68__AXUIReachabilityHelper_animateForReachability_payload_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end