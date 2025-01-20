@interface LWCRExecutor
@end

@implementation LWCRExecutor

void __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v5 = *(void **)(a1 + 32);
  v6 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  v7 = [v5 valueForKey:v6];

  if (v7)
  {
    *(_OWORD *)a4 = *(_OWORD *)(v7 + 8);
    *(void *)(a4 + 16) = *((void *)v7 + 3);
  }
  else
  {
    *(_DWORD *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
  }
}

void __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v5 = *(void **)(a1 + 32);
  v6 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  v8 = [v5 valueForKey:v6];

  if (v8)
  {
    long long v7 = *(_OWORD *)(v8 + 24);
    *(_OWORD *)a4 = *(_OWORD *)(v8 + 8);
    *(_OWORD *)(a4 + 16) = v7;
    *(void *)(a4 + 32) = *((void *)v8 + 5);
  }
  else
  {
    *(_DWORD *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
  }
}

BOOL __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  v4 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  v5 = [v3 valueForKey:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

@end