@interface HMFActivity
@end

@implementation HMFActivity

void __49__HMFActivity_HMMTaggedLogging__tagProcessorList__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _associatedObjectForKey:@"HMMTagSessionProcessors"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = [HMMTagSessionProcessorList alloc];
    v6 = +[HMMTagManager sharedInstance];
    v7 = [v6 workQueue];
    uint64_t v8 = [(HMMTagSessionProcessorList *)v5 initWithWorkQueue:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v11 _setAssociatedObject:v12 forKey:@"HMMTagSessionProcessors"];
  }
}

@end