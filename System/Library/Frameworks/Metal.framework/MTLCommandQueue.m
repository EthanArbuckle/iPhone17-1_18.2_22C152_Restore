@interface MTLCommandQueue
@end

@implementation MTLCommandQueue

uint64_t __46___MTLCommandQueue_initWithDevice_descriptor___block_invoke_2()
{
  uint64_t result = MTLGetEnvDefault("METAL_FORCE_IMMEDIATE_SUBMISSION", initWithDevice_descriptor__force_immediate_submission_on_commit_thread);
  initWithDevice_descriptor__force_immediate_submission_on_commit_thread = result != 0;
  return result;
}

uint64_t __40___MTLCommandQueue_submitCommandBuffer___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _submitAvailableCommandBuffers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __46___MTLCommandQueue_initWithDevice_descriptor___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _submitAvailableCommandBuffers];
}

uint64_t __39___MTLCommandQueue_setSubmissionQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _submitAvailableCommandBuffers];
}

uint64_t __49___MTLCommandQueue_completeCommandBuffers_count___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didScheduleWithStartTime:*(void *)(a1 + 40) endTime:*(void *)(a1 + 40) error:0];
}

uint64_t __49___MTLCommandQueue_completeCommandBuffers_count___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) commandBufferDidComplete:*(void *)(a1 + 40) startTime:*(void *)(a1 + 48) completionTime:*(void *)(a1 + 48) error:0];
}

@end