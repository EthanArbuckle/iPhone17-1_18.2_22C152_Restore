@interface VNImageRegistration
+ (BOOL)computeTransform:(CGAffineTransform *)a3 forRegisteringImageSignature:(id)a4 withSignature:(id)a5 minimumOverlap:(float)a6 error:(id *)a7;
@end

@implementation VNImageRegistration

+ (BOOL)computeTransform:(CGAffineTransform *)a3 forRegisteringImageSignature:(id)a4 withSignature:(id)a5 minimumOverlap:(float)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v11 signature];
  uint64_t v14 = [v12 signature];
  uint64_t v15 = v14;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  unint64_t v16 = *(void *)(v13 + 8);
  if (v16 >= *(void *)(v14 + 8)) {
    unint64_t v16 = *(void *)(v14 + 8);
  }
  int v17 = (int)(float)((float)v16 * a6);
  v28.a = 0.0;
  *(void *)&v28.b = &v28;
  *(void *)&v28.c = 0x2000000000;
  *(void *)&v28.d = 4736;
  v33 = &v32;
  uint64_t v34 = 0x2000000000;
  uint64_t v18 = *(void *)(v13 + 32);
  unint64_t v19 = *(void *)(v13 + 40);
  uint64_t v20 = *(void *)(v15 + 32);
  unint64_t v21 = *(void *)(v15 + 40);
  if (v19 >= v21) {
    unint64_t v22 = *(void *)(v15 + 40);
  }
  else {
    unint64_t v22 = *(void *)(v13 + 40);
  }
  uint64_t v35 = 4736;
  Projections_computeShiftBruteForce(v18, v19, (void *)(v13 + 48), v20, v21, (void *)(v15 + 48), (int)(float)((float)v22 * a6), (float *)&v31 + 1, &v30);
  *(void *)(*(void *)&v28.b + 24) = 4736;
  Projections_computeShiftBruteForce(*(void *)v13, *(_DWORD *)(v13 + 8), (void *)(v13 + 16), *(void *)v15, *(_DWORD *)(v15 + 8), (void *)(v15 + 16), v17, (float *)&v31, &v29);
  v33[3] = 4736;
  uint64_t v23 = v31;
  uint64_t v24 = *(void *)(*(void *)&v28.b + 24);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v28, 8);
  if (v24 == 4736) {
    uint64_t v25 = 4736;
  }
  else {
    uint64_t v25 = 4710;
  }
  if (v24 == 4736)
  {
    if (a3)
    {
      CGAffineTransformMakeTranslation(&v28, (float)-*((float *)&v23 + 1), *(float *)&v23);
      long long v26 = *(_OWORD *)&v28.c;
      *(_OWORD *)&a3->a = *(_OWORD *)&v28.a;
      *(_OWORD *)&a3->c = v26;
      *(_OWORD *)&a3->tx = *(_OWORD *)&v28.tx;
    }
  }
  else if (a7)
  {
    VNErrorForCVMLStatus((id)v25);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24 == 4736;
}

@end