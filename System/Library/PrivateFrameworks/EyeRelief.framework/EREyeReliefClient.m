@interface EREyeReliefClient
- (BOOL)isDistanceSamplingEnabledWithError:(id *)a3;
- (BOOL)toggleDistanceSampling:(id *)a3;
@end

@implementation EREyeReliefClient

- (BOOL)toggleDistanceSampling:(id *)a3
{
  v4 = +[EREyeReliefConnection sharedConnection];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__EREyeReliefClient_toggleDistanceSampling___block_invoke;
  v8[3] = &unk_265303880;
  v8[4] = &v15;
  v8[5] = &v9;
  [v4 toggleDistanceSampling:v8];
  if (a3)
  {
    v5 = (void *)v10[5];
    if (v5) {
      *a3 = v5;
    }
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __44__EREyeReliefClient_toggleDistanceSampling___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isDistanceSamplingEnabledWithError:(id *)a3
{
  v4 = +[EREyeReliefConnection sharedConnection];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__EREyeReliefClient_isDistanceSamplingEnabledWithError___block_invoke;
  v8[3] = &unk_265303880;
  v8[4] = &v15;
  v8[5] = &v9;
  [v4 isDistanceSamplingEnabled:v8];
  if (a3)
  {
    v5 = (void *)v10[5];
    if (v5) {
      *a3 = v5;
    }
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __56__EREyeReliefClient_isDistanceSamplingEnabledWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

@end