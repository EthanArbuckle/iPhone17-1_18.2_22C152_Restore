@interface FigRemoteQueueProcessAssertion
@end

@implementation FigRemoteQueueProcessAssertion

void __FigRemoteQueueProcessAssertion_awakeClientAndRunCallback_block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1A6272C70]();
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"RemoteQueue.%d.isReleasingResourcesProcessAssertion", *(unsigned int *)(a1 + 40), 0);
  id v4 = objc_alloc(MEMORY[0x1E4F96318]);
  uint64_t v5 = [MEMORY[0x1E4F96478] targetWithPid:*(unsigned int *)(a1 + 40)];
  v8[0] = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.cameracapture" name:@"HoldingBuffer"];
  v6 = objc_msgSend(v4, "initWithExplanation:target:attributes:", v3, v5, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 1));
  [v6 acquireWithError:&v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v6 invalidate];
}

@end