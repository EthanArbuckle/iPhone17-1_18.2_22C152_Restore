@interface SGRandomization
+ (id)shuffledSamplingWithoutReplacementForK:(unint64_t)a3 fromN:(unint64_t)a4 withRng:(id)a5;
+ (void)shuffleMutableArray:(id)a3 inApproxEqualEpsilon:(double)a4 withValueBlock:(id)a5 withRng:(id)a6;
+ (void)shuffleMutableArray:(id)a3 inRange:(_NSRange)a4 withRng:(id)a5;
+ (void)shuffleMutableArray:(id)a3 withRng:(id)a4;
@end

@implementation SGRandomization

+ (id)shuffledSamplingWithoutReplacementForK:(unint64_t)a3 fromN:(unint64_t)a4 withRng:(id)a5
{
  id v9 = a5;
  if (a3 > a4)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"SGRandomization.m", 60, @"Invalid parameter not satisfying: %@", @"k <= n" object file lineNumber description];

    v10 = objc_opt_new();
  }
  else
  {
    v10 = objc_opt_new();
    if (!a3) {
      goto LABEL_5;
    }
  }
  uint64_t v11 = 0;
  do
  {
    v12 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v11];
    [v10 addObject:v12];

    ++v11;
  }
  while (a3 != v11);
LABEL_5:
  [a1 shuffleMutableArray:v10 withRng:v9];
  unint64_t v13 = a3;
  if (a3 < a4)
  {
    uint32_t v14 = a3 + 1;
    do
    {
      if (v9) {
        unint64_t v15 = [v9 next] % (unint64_t)v14;
      }
      else {
        unint64_t v15 = arc4random_uniform(v14);
      }
      if (v15 < a3)
      {
        v16 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v13];
        [v10 setObject:v16 atIndexedSubscript:v15];
      }
      unint64_t v13 = v14++;
    }
    while (v13 < a4);
  }

  return v10;
}

+ (void)shuffleMutableArray:(id)a3 inApproxEqualEpsilon:(double)a4 withValueBlock:(id)a5 withRng:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"SGRandomization.m", 40, @"Invalid parameter not satisfying: %@", @"valueBlock" object file lineNumber description];
  }
  if ((unint64_t)[v11 count] >= 2)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v26[3] = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __83__SGRandomization_shuffleMutableArray_inApproxEqualEpsilon_withValueBlock_withRng___block_invoke;
    v19[3] = &unk_2647EB1D8;
    id v22 = v12;
    v23 = v26;
    double v25 = a4;
    v24 = &v27;
    id v14 = v11;
    id v20 = v14;
    id v15 = v13;
    id v21 = v15;
    [v14 enumerateObjectsUsingBlock:v19];
    uint64_t v16 = v28[3];
    uint64_t v17 = [v14 count];
    +[SGRandomization shuffleMutableArray:inRange:withRng:](SGRandomization, "shuffleMutableArray:inRange:withRng:", v14, v16, v17 - v28[3], v15);

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(&v27, 8);
  }
}

void __83__SGRandomization_shuffleMutableArray_inApproxEqualEpsilon_withValueBlock_withRng___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5 = (*(double (**)(void))(*(void *)(a1 + 48) + 16))();
  double v6 = v5;
  if (a3 && vabdd_f64(v5, *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) >= *(double *)(a1 + 72))
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    +[SGRandomization shuffleMutableArray:inRange:withRng:](SGRandomization, "shuffleMutableArray:inRange:withRng:", *(void *)(a1 + 32), v7, a3 - v7, *(void *)(a1 + 40));
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
}

+ (void)shuffleMutableArray:(id)a3 inRange:(_NSRange)a4 withRng:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = a3;
  id v10 = a5;
  if (location + length > [v14 count])
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"SGRandomization.m", 23, @"Invalid parameter not satisfying: %@", @"NSMaxRange(range) <= mutableArray.count" object file lineNumber description];
  }
  if (length >= 2)
  {
    for (uint64_t i = (location + length - 1); i > location; LODWORD(length) = length - 1)
    {
      if (v10) {
        unint64_t v12 = [v10 next] % (unint64_t)length;
      }
      else {
        unint64_t v12 = arc4random_uniform(length);
      }
      [v14 exchangeObjectAtIndex:i-- withObjectAtIndex:v12 + location];
    }
  }
}

+ (void)shuffleMutableArray:(id)a3 withRng:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[SGRandomization shuffleMutableArray:inRange:withRng:](SGRandomization, "shuffleMutableArray:inRange:withRng:", v6, 0, [v6 count], v5);
}

@end