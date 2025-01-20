@interface CDPModelTuning
@end

@implementation CDPModelTuning

float __34___CDPModelTuning_fScoreWithBeta___block_invoke(uint64_t a1, float a2, float a3)
{
  return (float)((float)(a2 * a3) * (float)((float)(*(float *)(a1 + 32) * *(float *)(a1 + 32)) + 1.0))
       / (float)(a3 + (float)((float)(*(float *)(a1 + 32) * *(float *)(a1 + 32)) * a2));
}

float __43___CDPModelTuning__testModelWithThreshold___block_invoke(uint64_t a1, int a2)
{
  return *(float *)(a1 + 32) + (float)((float)a2 * *(float *)(a1 + 36));
}

uint64_t __43___CDPModelTuning__testModelWithThreshold___block_invoke_2(uint64_t a1, float a2)
{
  unint64_t v2 = vcvtms_s32_f32((float)(a2 - *(float *)(a1 + 40)) / *(float *)(a1 + 44));
  if (*(void *)(a1 + 32) - 1 >= v2) {
    return v2;
  }
  else {
    return *(void *)(a1 + 32) - 1;
  }
}

void __43___CDPModelTuning__testModelWithThreshold___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  [*(id *)(*(void *)(a1 + 32) + 40) getEmail:&v22 emailLength:&v21 atIndex:a2];
  v4 = objc_opt_class();
  uint64_t v6 = v21;
  uint64_t v5 = v22;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43___CDPModelTuning__testModelWithThreshold___block_invoke_4;
  v11[3] = &unk_1E560E718;
  v7 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  uint64_t v14 = a2;
  uint64_t v15 = v21;
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v16 = v22;
  uint64_t v17 = v8;
  id v9 = v7;
  long long v18 = *(_OWORD *)(a1 + 64);
  int v20 = *(_DWORD *)(a1 + 88);
  uint64_t v19 = *(void *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 48);
  id v12 = v9;
  uint64_t v13 = v10;
  [v4 _enumerateSubsetsOfSet:v5 setLength:v6 withSize:2 callback:v11];
}

void __43___CDPModelTuning__testModelWithThreshold___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (float *)[*(id *)(*(void *)(a1 + 32) + 40) _newPredictionResultWithSeed:a2 seedLength:a3 realSeedLength:a3 maxTrainingEmailID:(*(_DWORD *)(a1 + 56) - 1)];
  uint64_t v7 = *(void *)(a1 + 64) - a3;
  uint64_t v8 = (int *)[(id)objc_opt_class() _newSetDifference:*(void *)(a1 + 72) setLength:*(void *)(a1 + 64) subset:a2 subsetLength:a3];
  id v9 = (float *)malloc_type_calloc(*(void *)(a1 + 80), 4uLL, 0x100004052888210uLL);
  if (v7 >= 1)
  {
    uint64_t v10 = v8;
    do
    {
      int v11 = *v10++;
      uint64_t v12 = (*(uint64_t (**)(float))(*(void *)(a1 + 40) + 16))(v6[4 * v11 + 1]);
      v9[v12] = v9[v12] + 1.0;
    }
    while (v10 < &v8[v7]);
  }
  [(id)objc_opt_class() _cumulativeSumOfArray:v9 size:*(void *)(a1 + 80) reverse:1];
  [(id)objc_opt_class() _addArray:v9 size:*(void *)(a1 + 80) inArray:*(void *)(a1 + 88)];
  free(v9);
  free(v8);
  uint64_t v13 = (float *)malloc_type_calloc(*(void *)(a1 + 80), 4uLL, 0x100004052888210uLL);
  unint64_t v14 = *(void *)(a1 + 96);
  if (v14)
  {
    unint64_t v15 = 0;
    uint64_t v16 = v6 + 1;
    do
    {
      if (*v16 >= 0.0)
      {
        if (*v16 >= *(float *)(a1 + 112))
        {
          uint64_t v17 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
          v13[v17] = v13[v17] + 1.0;
          unint64_t v14 = *(void *)(a1 + 96);
        }
        else
        {
          *uint64_t v13 = *v13 + 1.0;
        }
      }
      ++v15;
      v16 += 4;
    }
    while (v14 > v15);
  }
  [(id)objc_opt_class() _cumulativeSumOfArray:v13 size:*(void *)(a1 + 80) reverse:1];
  [(id)objc_opt_class() _addArray:v13 size:*(void *)(a1 + 80) inArray:*(void *)(a1 + 104)];
  free(v13);
  free(v6);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v7;
}

@end