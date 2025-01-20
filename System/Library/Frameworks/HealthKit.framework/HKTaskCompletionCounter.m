@interface HKTaskCompletionCounter
@end

@implementation HKTaskCompletionCounter

void *__44___HKTaskCompletionCounter_decrementCounter__block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 24);
  result = *(void **)(a1 + 32);
  if (!result[3])
  {
    uint64_t v3 = result[1];
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))(result[1]);
      result = *(void **)(a1 + 32);
    }
    return (void *)[result _invalidate];
  }
  return result;
}

uint64_t __44___HKTaskCompletionCounter_incrementCounter__block_invoke(uint64_t result)
{
  return result;
}

void *__44___HKTaskCompletionCounter_allTasksEnqueued__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[3])
  {
    uint64_t v3 = result[1];
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))(result[1]);
      result = *(void **)(a1 + 32);
    }
    return (void *)[result _invalidate];
  }
  return result;
}

@end