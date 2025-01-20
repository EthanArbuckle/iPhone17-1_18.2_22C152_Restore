@interface CATILogisticsRegressionModel
- (id)getBestIntent:()vector<float numberOfModels:(std:(unint64_t)a4 :(void *)a5 allocator<float>> *)a3 weightMatrix:(id)a6 guids:(id)a7 usoEdgeKey:;
@end

@implementation CATILogisticsRegressionModel

- (id)getBestIntent:()vector<float numberOfModels:(std:(unint64_t)a4 :(void *)a5 allocator<float>> *)a3 weightMatrix:(id)a6 guids:(id)a7 usoEdgeKey:
{
  id v11 = a6;
  id v12 = a7;
  int64_t v13 = a3->var1 - a3->var0;
  vDSP_Length __P = v13 + 1;
  v15 = malloc_type_calloc(v13 + 1, 4uLL, 0x100004052888210uLL);
  v16 = (float *)v15;
  _DWORD *v15 = 1065353216;
  if ((unint64_t)(v13 + 1) >= 2)
  {
    var0 = a3->var0;
    v18 = v15 + 1;
    do
    {
      int v19 = *(_DWORD *)var0++;
      *v18++ = v19;
      --v13;
    }
    while (v13);
  }
  v20 = (float *)malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
  vDSP_mmul(*(const float **)a5, 1, v16, 1, v20, 1, a4, 1uLL, __P);
  v21 = (float *)malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
  v22 = v21;
  if (a4)
  {
    uint64_t v23 = 0;
    do
    {
      v22[v23] = 1.0 / (float)(expf(-v20[v23]) + 1.0);
      ++v23;
    }
    while (a4 != v23);
    uint64_t v24 = 0;
    int v25 = 0;
    float v26 = *v22;
    do
    {
      if (v22[v24] > v26)
      {
        float v26 = v22[v24];
        int v25 = v24;
      }
      ++v24;
    }
    while (a4 != v24);
    uint64_t v27 = v25;
  }
  else
  {
    uint64_t v27 = 0;
    float v26 = *v21;
  }
  v28 = [v11 objectAtIndex:v27];
  v29 = objc_opt_new();
  [v29 setValue:v28 forKey:v12];
  *(float *)&double v30 = v26;
  v31 = [NSNumber numberWithFloat:v30];
  [v29 setValue:v31 forKey:@"confidence_score"];

  free(v16);
  free(v22);
  free(v20);

  return v29;
}

@end