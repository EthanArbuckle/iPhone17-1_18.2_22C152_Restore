@interface MTLCommandBuffer
@end

@implementation MTLCommandBuffer

void __45___MTLCommandBuffer_presentDrawable_options___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 error])
  {
    if (!*(unsigned char *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      if (*(unsigned char *)(v3 + 504)) {
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(v3 + 32) + 352));
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) presentWithOptions:*(void *)(a1 + 40)];
  }
  v4 = *(void **)(a1 + 40);
}

intptr_t __45___MTLCommandBuffer_presentDrawable_options___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 32) + 352));
}

intptr_t __37___MTLCommandBuffer_presentDrawable___block_invoke(uint64_t a1, void *a2)
{
  intptr_t result = [a2 error];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v4 + 504))
    {
      v5 = *(NSObject **)(*(void *)(v4 + 32) + 352);
      return dispatch_semaphore_signal(v5);
    }
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    return [v6 present];
  }
  return result;
}

intptr_t __37___MTLCommandBuffer_presentDrawable___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 32) + 352));
}

intptr_t __44___MTLCommandBuffer_presentDrawable_atTime___block_invoke(double *a1, void *a2)
{
  intptr_t result = [a2 error];
  if (result)
  {
    uint64_t v4 = *((void *)a1 + 5);
    if (*(unsigned char *)(v4 + 504))
    {
      v5 = *(NSObject **)(*(void *)(v4 + 32) + 352);
      return dispatch_semaphore_signal(v5);
    }
  }
  else
  {
    v6 = (void *)*((void *)a1 + 4);
    double v7 = a1[6];
    return [v6 presentAtTime:v7];
  }
  return result;
}

intptr_t __44___MTLCommandBuffer_presentDrawable_atTime___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 32) + 352));
}

intptr_t __58___MTLCommandBuffer_presentDrawable_afterMinimumDuration___block_invoke(double *a1, void *a2)
{
  intptr_t result = [a2 error];
  if (result)
  {
    uint64_t v4 = *((void *)a1 + 5);
    if (*(unsigned char *)(v4 + 504))
    {
      v5 = *(NSObject **)(*(void *)(v4 + 32) + 352);
      return dispatch_semaphore_signal(v5);
    }
  }
  else
  {
    v6 = (void *)*((void *)a1 + 4);
    double v7 = a1[6];
    return [v6 presentAfterMinimumDuration:v7];
  }
  return result;
}

intptr_t __58___MTLCommandBuffer_presentDrawable_afterMinimumDuration___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 32) + 352));
}

@end