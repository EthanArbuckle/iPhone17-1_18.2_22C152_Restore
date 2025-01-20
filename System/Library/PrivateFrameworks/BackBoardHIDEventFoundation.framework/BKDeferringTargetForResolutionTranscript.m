@interface BKDeferringTargetForResolutionTranscript
@end

@implementation BKDeferringTargetForResolutionTranscript

void ___BKDeferringTargetForResolutionTranscript_block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) pid];
  v3 = BSProcessDescriptionForPID();
  [v2 appendString:v3 withName:0];

  v4 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) token];
  id v5 = (id)[v4 appendObject:v6 withName:0];
}

@end