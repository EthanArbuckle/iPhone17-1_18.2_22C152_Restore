@interface EFIdealTimerObservable
@end

@implementation EFIdealTimerObservable

void __37___EFIdealTimerObservable_subscribe___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CA98] null];
  objc_msgSend(v1, "observerDidReceiveResult:");
}

uint64_t __37___EFIdealTimerObservable_subscribe___block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2;
  [*(id *)(a1 + 32) lock];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  double v5 = *(double *)(a1 + 64);
  if (v3 - *(double *)(v4 + 24) >= v5)
  {
    double v6 = fmod(v3 - *(double *)(a1 + 72), *(long double *)(a1 + 64));
    if (v6 >= 2.22044605e-16)
    {
      *(double *)(v4 + 24) = v3 + v5 - v6;
      id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "afterDelay:performBlock:", *(void *)(a1 + 48));
    }
    else
    {
      *(double *)(v4 + 24) = v3;
      [*(id *)(a1 + 40) performBlock:*(void *)(a1 + 48)];
    }
  }
  v8 = *(void **)(a1 + 32);
  return [v8 unlock];
}

uint64_t __37___EFIdealTimerObservable_subscribe___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __37___EFIdealTimerObservable_subscribe___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __37___EFIdealTimerObservable_subscribe___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

uint64_t __37___EFIdealTimerObservable_subscribe___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

@end