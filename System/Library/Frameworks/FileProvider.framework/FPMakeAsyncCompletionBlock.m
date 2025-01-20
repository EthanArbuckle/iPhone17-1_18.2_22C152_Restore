@interface FPMakeAsyncCompletionBlock
@end

@implementation FPMakeAsyncCompletionBlock

uint64_t ____FPMakeAsyncCompletionBlock_block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

void ____FPMakeAsyncCompletionBlock_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1A6248B00](*(void *)(a1 + 40));
  [v3 setTarget:v4];

  [v3 retainArguments];
  v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ____FPMakeAsyncCompletionBlock_block_invoke_2;
  block[3] = &unk_1E5AF0FF0;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

@end