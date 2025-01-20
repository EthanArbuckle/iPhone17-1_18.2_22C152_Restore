@interface PostInspectSampleBuffer
@end

@implementation PostInspectSampleBuffer

void __bapspManager_PostInspectSampleBuffer_block_invoke(uint64_t a1)
{
  bapspManager_subPipeFinishedProcessingData(a1, *(const void **)(a1 + 32), *MEMORY[0x1E4F21A28]);
  uint64_t v2 = *(void *)(a1 + 32);

  bapspManager_releaseAsync(v2);
}

void __bapspManager_PostInspectSampleBuffer_block_invoke_2(uint64_t a1)
{
  bapspManager_subPipeFinishedProcessingData(a1, *(const void **)(a1 + 32), *MEMORY[0x1E4F21A28]);
  uint64_t v2 = *(void *)(a1 + 32);

  bapspManager_releaseAsync(v2);
}

@end